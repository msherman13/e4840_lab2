/*
 * CSEE 4840 Lab 2: Ethernet packet send and receive
 *
 * Stephen A. Edwards et al.
 *
 */

#include "basic_io.h"
#include "DM9000A.h"
#include <alt_types.h>
#include "alt_up_ps2_port.h"
#include "ps2_keyboard.h"
#include "ps2_mouse.h"
#include "LCD.h"
#include "VGA.h"

typedef char * string;

#define MAX_MSG_LENGTH 128

// Ethernet MAC address.  Choose the last three bytes yourself
unsigned char mac_address[6] = { 0x01, 0x60, 0x6E, 0x2B, 0x00, 0xB5  };

unsigned int interrupt_number;

unsigned int receive_buffer_length;
unsigned char receive_buffer[1600];

KB_CODE_TYPE decode_mode;

#define UDP_PACKET_PAYLOAD_OFFSET 42
#define UDP_PACKET_LENGTH_OFFSET 38

#define UDP_PACKET_PAYLOAD (transmit_buffer + UDP_PACKET_PAYLOAD_OFFSET)

unsigned char transmit_buffer[] = {
		// Ethernet MAC header
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, // Destination MAC address
		0x01, 0x60, 0x6E, 0x2B, 0x00, 0xB5, // Source MAC address
		0x08, 0x00,                         // Packet Type: 0x800 = IP

		// IP Header
		0x45,                // version (IPv4), header length = 20 bytes
		0x00,                // differentiated services field
		0x00,0x9C,           // total length: 20 bytes for IP header +
		// 8 bytes for UDP header + 128 bytes for payload
		0x3d, 0x35,          // packet ID
		0x00,                // flags
		0x00,                // fragment offset
		0x80,                // time-to-live
		0x11,                // protocol: 11 = UDP
		0xa3,0x43,           // header checksum: incorrect
		0xc0,0xa8,0x01,0x01, // source IP address
		0xc0,0xa8,0x01,0xff, // destination IP address

		// UDP Header
		0x67,0xd9, // source port port (26585: garbage)
		0x27,0x2b, // destination port (10027: garbage)
		0x00,0x88, // length (136: 8 for UDP header + 128 for data)
		0x00,0x00, // checksum: 0 = none

		// UDP payload
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67,
		0x74, 0x65, 0x73, 0x74, 0x20, 0x6d, 0x73, 0x67
};   

static void ethernet_interrupt_handler() {
	unsigned int receive_status;
	int i;

	receive_status = ReceivePacket(receive_buffer, &receive_buffer_length);

	if (receive_status == DMFE_SUCCESS) {

#if 1
		printf("\n\nReceive Packet Length = %d", receive_buffer_length);
		for(i=0;i<receive_buffer_length;i++) {
			if (i%8==0) printf("\n");
			printf("0x%.2X,", receive_buffer[i]);
		}
		printf("\n");
#endif

		if (receive_buffer_length >= 14) {
			//  A real Ethernet packet
			if (receive_buffer[12] == 8 && receive_buffer[13] == 0 &&
					receive_buffer_length >= 34) {
				// An IP packet
				if (receive_buffer[23] == 0x11) {
					// A UDP packet
					if (receive_buffer_length >= UDP_PACKET_PAYLOAD_OFFSET) {
						printf("Received: %s\n",
								receive_buffer + UDP_PACKET_PAYLOAD_OFFSET);
					}
				} else {
					printf("Received non-UDP packet\n");
				}
			} else {
				printf("Received non-IP packet\n");
			}
		} else {
			printf("Malformed Ethernet packet\n");
		}

	} else {
		printf("Error receiving packet\n");
	}

	/* Display the number of interrupts on the LEDs */
	interrupt_number++;
	outport(SEG7_DISPLAY_BASE, interrupt_number);

	/* Clear the DM9000A ISR: PRS, PTS, ROS, ROOS 4 bits, by RW/C1 */
	dm9000a_iow(ISR, 0x3F);

	/* Re-enable DM9000A interrupts */
	dm9000a_iow(IMR, INTR_set);
}

int main()
{
	int i;
	int j;
	int k;
	int curMsgChar = 0;
	int curLineChar = 25;
	int curMsgLine = 28;
	alt_u8 key = 0;
	int status = 0;
	unsigned int packet_length;
	char line_tracker[24][78];
	int current_line = 2;
	int username_input = 1;
	int userChar = 0;
	char username[10];
	int MAX_MSG_LENGTH_USER = 0;
	char PAYLOAD_TEMP[128];
	int shift = 0;
	//unsigned int row, col;

	VGA_Ctrl_Reg vga_ctrl_set;

	vga_ctrl_set.VGA_Ctrl_Flags.RED_ON    = 1;
	vga_ctrl_set.VGA_Ctrl_Flags.GREEN_ON  = 1;
	vga_ctrl_set.VGA_Ctrl_Flags.BLUE_ON   = 1;
	vga_ctrl_set.VGA_Ctrl_Flags.CURSOR_ON = 0;

	Vga_Write_Ctrl(VGA_0_BASE, vga_ctrl_set.Value);
	Set_Pixel_On_Color(0,1023,0);
	Set_Pixel_Off_Color(400,0,600);
	Set_Cursor_Color(0,1023,0);

	// Initialize the LCD and display a welcome message
	LCD_Init();
	LCD_Show_Text("Sup y'all");

	// Clear the LEDs to zero (will display interrupt count)
	outport(SEG7_DISPLAY_BASE, 0);

	// Print a friendly welcome message
	printf("4840 Lab 2 started\n");

	// Initalize the DM9000 and the Ethernet interrupt handler
	DM9000_init(mac_address);
	interrupt_number = 0;
	alt_irq_register(DM9000A_IRQ, NULL, (void*)ethernet_interrupt_handler);

	// Initialize the keyboard
	printf("Please wait three seconds to initialize keyboard\n");
	clear_FIFO();
	switch (get_mode()) {
	case PS2_KEYBOARD:
		break;
	case PS2_MOUSE:
		printf("Error: Mouse detected on PS/2 port\n");
		goto ErrorExit;
	default:
		printf("Error: Unrecognized or no device on PS/2 port\n");
		goto ErrorExit;
	}
	//___________________________________________________________________________________
	// Initialize the VGA...
	//___________________________________________________________________________________
	for (i = 0; i < 480; i++)
	{
		for (j = 0; j < 640; j++)
		{
			Vga_Clr_Pixel(VGA_0_BASE, j, i);
		}
	}
	for(i = 0; i < 620; i++)
	{
		Vga_Set_Pixel(VGA_0_BASE, i, 410);
	}
	for(i = 0; i < 620; i++)
	{
		Vga_Set_Pixel(VGA_0_BASE, i, 435);
	}
	put_vga_string("Enter your username here: ", 0, 28);
	for (;;) {
		//___________________________________________________________________________________
		//User Input...
		//___________________________________________________________________________________
		status = read_make_code(&decode_mode, &key);
		if (status == PS2_SUCCESS) {
			//___________________________________________________________________________________
			//Display user input...
			//___________________________________________________________________________________
			switch ( decode_mode ) {
			case KB_ASCII_MAKE_CODE :
				printf ("%c", key);
				if (shift == 1)
				{
					switch (key)
					{
					case 97:
					case 98:
					case 99:
					case 100:
					case 101:
					case 102:
					case 103:
					case 104:
					case 105:
					case 106:
					case 107:
					case 108:
					case 109:
					case 110:
					case 111:
					case 112:
					case 113:
					case 114:
					case 115:
					case 116:
					case 117:
					case 118:
					case 119:
					case 120:
					case 121:
					case 122:
						key = key - 32;
						break;
					case 96:
						key = 126;
						break;
					case 48:
						key = 41;
						break;
					case 49:
						key = 33;
						break;
					case 50:
						key = 64;
						break;
					case 51:
						key = 35;
						break;
					case 52:
						key = 36;
						break;
					case 53:
						key = 37;
						break;
					case 54:
						key = 94;
						break;
					case 55:
						key = 38;
						break;
					case 56:
						key = 42;
						break;
					case 57:
						key = 40;
						break;
					case 45:
						key = 95;
						break;
					case 61:
						key = 43;
						break;
					case 91:
						key = 123;
						break;
					case 93:
						key = 125;
						break;
					case 92:
						key = 124;
						break;
					case 59:
						key = 58;
						break;
					case 39:
						key = 34;
						break;
					case 44:
						key = 60;
						break;
					case 46:
						key = 62;
						break;
					case 47:
						key = 63;
						break;
					}
				}
				if (username_input == 1)
				{
					if (userChar < 10)
					{
						username[userChar] = key;
						put_vga_char(key, 26+userChar, 28);
						userChar++;
					}
				}
				else
				{
					if (curMsgChar < MAX_MSG_LENGTH_USER) {
						UDP_PACKET_PAYLOAD[curMsgChar] = key;
						put_vga_char(key, curLineChar, curMsgLine );
						curMsgChar++;
						curLineChar++;
						if (curLineChar == 78) {
							curLineChar = 0;
							curMsgLine = curMsgLine + 1;
						}
						if (curMsgChar == 1) {
							for (i = 411; i < 435; i++)
							{
								for (j = 0; j < 640; j++)
								{
									Vga_Clr_Pixel(VGA_0_BASE, j, i);
								}
							}
						}
					}
				}
				break ;
			case KB_BINARY_MAKE_CODE :
				switch (key) {
				//___________________________________________________________________________________
				//Enter Key...
				//___________________________________________________________________________________
				case  0x5a:
					if (username_input == 1)
					{
						username[userChar++] = 0; // Terminate the string
						for (i = 441; i < 480; i++)
						{
							for (j = 26; j < 640; j++)
							{
								Vga_Clr_Pixel(VGA_0_BASE, j, i);
							}
						}
						for(i = 0; i < 620; i++)
						{
							Vga_Set_Pixel(VGA_0_BASE, i, 25);
						}
						put_vga_string("Username: ",0,0);
						for (j = 0; j < userChar-1; j++)
						{
							put_vga_char(username[j], j+10, 0);
						}
						put_vga_string("Enter your message here: ", 0, 28);
						username_input = 0;
						MAX_MSG_LENGTH_USER = MAX_MSG_LENGTH - userChar + 1 - 2;
					}
					else{
						for (i = 0; i < userChar-1; i++)
						{
							PAYLOAD_TEMP[i] = username[i];
						}
						PAYLOAD_TEMP[userChar-1] = ':';
						PAYLOAD_TEMP[userChar] = ' ';
						for (i = 0; i < curMsgChar; i++)
						{
							PAYLOAD_TEMP[i+userChar+1] = UDP_PACKET_PAYLOAD[i];
						}
						for (i = 0; i < userChar+curMsgChar+4; i++)
						{
							UDP_PACKET_PAYLOAD[i] = PAYLOAD_TEMP[i];
						}
						curMsgChar = curMsgChar + userChar + 1;
						UDP_PACKET_PAYLOAD[curMsgChar++] = 0; // Terminate the string
						packet_length = UDP_PACKET_PAYLOAD_OFFSET + curMsgChar + userChar;
						transmit_buffer[UDP_PACKET_LENGTH_OFFSET] = packet_length >> 8;
						transmit_buffer[UDP_PACKET_LENGTH_OFFSET + 1] = packet_length & 0xff;
						for (i = 441; i < 480; i++)
						{
							for (j = 0; j < 640; j++)
							{
								Vga_Clr_Pixel(VGA_0_BASE, j, i);
							}
						}
						curLineChar = 25;
						curMsgLine = 28;
						put_vga_string("Enter your message here: ", 0, 28);
						//___________________________________________________________________________________
						//Archive & Display Message; Update Status...
						//___________________________________________________________________________________
						if (TransmitPacket(transmit_buffer, UDP_PACKET_PAYLOAD_OFFSET + curMsgChar + 1)==DMFE_SUCCESS && curMsgChar > userChar+2) {
							if (curMsgChar < 81)
							{
								if (current_line == 25)
								{
									for (k = 26; k < 409; k++)
									{
										for (j = 0; j < 640; j++)
										{
											Vga_Clr_Pixel(VGA_0_BASE, j, k);
										}
									}
									current_line = 2;
								}
								for (j = 0; j < curMsgChar-1; j++)
								{
									put_vga_char(UDP_PACKET_PAYLOAD[j], j, current_line);
								}
								put_vga_string("Message sent successfully.", 0, 26);
								current_line++;
							}
							if (curMsgChar > 80)
							{
								if (current_line == 24)
								{
									for (k = 26; k < 409; k++)
									{
										for (j = 0; j < 640; j++)
										{
											Vga_Clr_Pixel(VGA_0_BASE, j, k);
										}
									}
									current_line = 2;
								}
								for (j = 0; j < 79; j++)
								{
									put_vga_char(UDP_PACKET_PAYLOAD[j], j, current_line);
								}
								current_line++;
								for (j = 0; j < curMsgChar-80; j++)
								{
									put_vga_char(UDP_PACKET_PAYLOAD[j+79], j, current_line);
								}
								put_vga_string("Message sent successfully.", 0, 26);
								current_line++;
							}

						} else {
							for (i = 411; i < 435; i++)
							{
								for (j = 0; j < 640; j++)
								{
									Vga_Clr_Pixel(VGA_0_BASE, j, i);
								}
							}
							put_vga_string("Failed to send message.", 0, 26);
						}
						// reset data
						for (curMsgChar=MAX_MSG_LENGTH_USER-1; curMsgChar>0; curMsgChar--) {
							UDP_PACKET_PAYLOAD[curMsgChar] = 0;
						}
					}
					break;
				case 0x12:
				case 0x59:
				{
					shift = 1;
				}
				break;
				//___________________________________________________________________________________
				//Space Key...
				//___________________________________________________________________________________
				case 0x29:
					if (username_input == 1)
					{
						if (userChar < 10)
						{
							username[userChar++] = ' ';
							put_vga_char(' ', userChar+26, 28);
						}
					}
					else
					{
						UDP_PACKET_PAYLOAD[curMsgChar++] = ' ';
						put_vga_char(' ', curLineChar, curMsgLine);
						if (curLineChar == 77)
						{
							curMsgLine = curMsgLine + 1;
							curLineChar = 0;
						}
						else
						{
							curLineChar++;
						}
					}
					break;
					//___________________________________________________________________________________
					//Backspace Key...
					//___________________________________________________________________________________
				case 0x66:
					if (username_input == 1)
					{
						if (userChar != 0)
						{
							username[userChar--] = ' ';
							put_vga_char(' ', userChar+26, 28);
						}
					}
					else{
						if (curMsgChar != 0)
						{
							UDP_PACKET_PAYLOAD[curMsgChar--] = ' ';
							if (curLineChar == 0)
							{
								curMsgLine = curMsgLine - 1;
								curLineChar = 77;
							}
							else if (curMsgLine == 30)
							{
								curMsgLine = curMsgLine - 1;
								curLineChar = curLineChar - 1;
							}
							else
							{
								curLineChar = curLineChar - 1;
							}
							put_vga_char(' ', curLineChar, curMsgLine);
						}
					}
					break;
				default:
					printf(" MAKE CODE :\t%X\n", key ); //print other unknown breakcode
				}


				break ;
				case KB_BREAK_CODE :
					switch (key)
					{
					case 0x12:
					case 0x59:
						shift = 0;
						break;
					}
					default :
						break ;
			}
		}
		else {
			printf(" Keyboard error ....\n");
		}
	}
	printf("Program terminated normally\n");
	return 0;

	ErrorExit:
	printf("Program terminated with an error condition\n");

	return 1;
}
