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
int current_line = 2;


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
		0x00, 0x00,          // packet ID
		0x00,                // flags
		0x00,                // fragment offset
		0x80,                // time-to-live
		0x11,                // protocol: 11 = UDP
		0x00,0x00,           // header checksum
		0xc0,0xa8,0x01,0x01, // source IP address
		0xc0,0xa8,0x01,0xff, // destination IP address

		// UDP Header
		// 8 bytes for UDP header + 128 bytes for payload
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
	int j;
	int k;
	int termination;
	int byte14;
	int byte15;
	int byte16;
	int byte17;
	int byte18;
	int byte19;
	int byte20;
	int byte21;
	int byte22;
	int byte23;
	int byte24;
	int byte25;
	int byte26;
	int byte27;
	int byte28;
	int byte29;
	int byte30;
	int byte31;
	int byte32;
	int byte33;
	int ip_header0;
	int ip_header1;
	int ip_header2;
	int ip_header3;
	int ip_header4;
	int ip_header5;
	int ip_header6;
	int ip_header7;
	int ip_header8;
	int ip_header9;
	int long crc_twos;
	int crc_carry;
	int crc_ones;
	unsigned int long checksum;
	alt_u32 checksum_32;



	receive_status = ReceivePacket(receive_buffer, &receive_buffer_length);

	if (receive_status == DMFE_SUCCESS) {

#if 1
		printf("\n\nReceive Packet Length = %d", receive_buffer_length);
		for (i = 411; i < 435; i++)
		{
			for (j = 0; j < 640; j++)
			{
				Vga_Clr_Pixel(VGA_0_BASE, j, i);
			}
		}
		for(i=0;i<receive_buffer_length;i++) {
			if (i%8==0) printf("\n");
			printf("0x%.2X,", receive_buffer[i]);
		}
		//put_vga_char(' ', i,2);
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



						byte14 = receive_buffer[14] << 8;
						byte15 = receive_buffer[15];
						byte16 = receive_buffer[16] << 8;
						byte17 = receive_buffer[17];
						byte18 = receive_buffer[18] << 8;
						byte19 = receive_buffer[19];
						byte20 = receive_buffer[20] << 8;
						byte21 = receive_buffer[21];
						byte22 = receive_buffer[22] << 8;
						byte23 = receive_buffer[23];
						byte24 = receive_buffer[24] << 8;
						byte25 = receive_buffer[25];
						byte26 = receive_buffer[26] << 8;
						byte27 = receive_buffer[27];
						byte28 = receive_buffer[28] << 8;
						byte29 = receive_buffer[29];
						byte30 = receive_buffer[30] << 8;
						byte31 = receive_buffer[31];
						byte32 = receive_buffer[32] << 8;
						byte33 = receive_buffer[33];

						ip_header0 = byte14 + byte15;
						ip_header1 = byte16 + byte17;
						ip_header2 = byte18 + byte19;
						ip_header3 = byte20 + byte21;
						ip_header4 = byte22 + byte23;
						ip_header5 = byte24 + byte25;
						ip_header6 = byte26 + byte27;
						ip_header7 = byte28 + byte29;
						ip_header8 = byte30 + byte31;
						ip_header9 = byte32 + byte33;

						crc_twos = ip_header0+ip_header1+ip_header2+ip_header3+ip_header4+ip_header5+ip_header6+ip_header7+ip_header8+ip_header9;
						printf("\n %hx twos: ", crc_twos);
						crc_carry = crc_twos >> 16;
						printf("\n %hx carry: ", crc_carry);
						crc_ones = crc_twos + crc_carry;
						printf("\n ones: %hx", crc_ones);
						checksum = (crc_ones ^ 0xFFFF) & 0xFFFF; // invert bits
						printf("\n %hx checksum: ", checksum);
						if (!checksum)
						{
							put_vga_string("Message received.", 0, 26);
							printf("Received: %s\n",receive_buffer + UDP_PACKET_PAYLOAD_OFFSET);
							if (current_line < 25 && receive_buffer_length < 79)
							{
								for (i = UDP_PACKET_PAYLOAD_OFFSET; receive_buffer[i] != 0; i++)
									put_vga_char(receive_buffer[i], i-UDP_PACKET_PAYLOAD_OFFSET, current_line);
								current_line++;
							}
							else if (current_line < 24 && receive_buffer_length > 78)
							{
								for (i = UDP_PACKET_PAYLOAD_OFFSET; i < 79+UDP_PACKET_PAYLOAD_OFFSET; i++)
									put_vga_char(receive_buffer[i], i-UDP_PACKET_PAYLOAD_OFFSET, current_line);
								for (i = UDP_PACKET_PAYLOAD_OFFSET+79; receive_buffer[i] != 0; i++)
									put_vga_char(receive_buffer[i], i-UDP_PACKET_PAYLOAD_OFFSET-79, current_line+1);
								current_line++;
								current_line++;
							}
							else if (current_line == 25 && receive_buffer_length < 79)
							{
								for (k = 26; k < 409; k++)
								{
									for (j = 0; j < 640; j++)
									{
										Vga_Clr_Pixel(VGA_0_BASE, j, k);
									}
								}
								current_line = 2;
								for (i = UDP_PACKET_PAYLOAD_OFFSET; receive_buffer[i] != 0; i++)
									put_vga_char(receive_buffer[i], i-UDP_PACKET_PAYLOAD_OFFSET, current_line);
								current_line++;
							}
							else if (current_line = 24 && receive_buffer_length > 78)
							{
								for (k = 26; k < 409; k++)
								{
									for (j = 0; j < 640; j++)
									{
										Vga_Clr_Pixel(VGA_0_BASE, j, k);
									}
								}
								current_line = 2;
								for (i = UDP_PACKET_PAYLOAD_OFFSET; i < 79+UDP_PACKET_PAYLOAD_OFFSET; i++)
									put_vga_char(receive_buffer[i], i-UDP_PACKET_PAYLOAD_OFFSET, current_line);
								for (i = UDP_PACKET_PAYLOAD_OFFSET+79; receive_buffer[i] != 0; i++)
									put_vga_char(receive_buffer[i], i-UDP_PACKET_PAYLOAD_OFFSET-79, current_line+1);
								current_line++;
								current_line++;
							}
							printf("\n rcvd correct checksum: %hx", checksum);
						}
						else
							put_vga_string("Some slob tried to send you a message but his checksum was wrong.", 0, 26);
							printf("\n rcvd incorrect checksum: %hx", checksum);
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
	int username_input = 1;
	int userChar = 0;
	char username[10];
	int MAX_MSG_LENGTH_USER = 0;
	char PAYLOAD_TEMP[128];
	int shift = 0;
	int cursor_x = 0;
	int cursor_x_char = 10;
	int cursor_y = 0;
	int cursor_y_char = 10;
	int at_beginning = 1;
	int at_end = 1;
	int byte14;
	int byte15;
	int byte16;
	int byte17;
	int byte18;
	int byte19;
	int byte20;
	int byte21;
	int byte22;
	int byte23;
	int byte24;
	int byte25;
	int byte26;
	int byte27;
	int byte28;
	int byte29;
	int byte30;
	int byte31;
	int byte32;
	int byte33;
	int ip_header0;
	int ip_header1;
	int ip_header2;
	int ip_header3;
	int ip_header4;
	int ip_header5;
	int ip_header6;
	int ip_header7;
	int ip_header8;
	int ip_header9;
	int long crc_twos;
	int crc_carry;
	int crc_ones;
	unsigned int long checksum;

	//	unsigned char packet_id[];

	VGA_Ctrl_Reg vga_ctrl_set;

	vga_ctrl_set.VGA_Ctrl_Flags.RED_ON    = 1;
	vga_ctrl_set.VGA_Ctrl_Flags.GREEN_ON  = 1;
	vga_ctrl_set.VGA_Ctrl_Flags.BLUE_ON   = 1;
	vga_ctrl_set.VGA_Ctrl_Flags.CURSOR_ON = 0;

	Vga_Write_Ctrl(VGA_0_BASE, vga_ctrl_set.Value);
	Set_Pixel_On_Color(900,1000,1000);
	Set_Pixel_Off_Color(0,300,300);
	Set_Cursor_Color(900,1000,1000);

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
	cursor_x_char = 26;
	cursor_y_char = 28;
	cursor_x = (cursor_x_char*8)-1;
	cursor_y = cursor_y_char*16;
	for (j = cursor_y; j < cursor_y+16; j++)
	{
		Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
	}

	//___________________________________________________________________________________
	//User Input...
	//___________________________________________________________________________________
	for (;;)
	{
		status = read_make_code(&decode_mode, &key);
		if (status == PS2_SUCCESS)
		{
			//___________________________________________________________________________________
			//Display user input...
			//___________________________________________________________________________________
			switch ( decode_mode )
			{
			case KB_ASCII_MAKE_CODE :
				printf(" MAKE CODE :\t%X\n", key ); //print other unknown breakcode
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
						for (i = 411; i < 435; i++)
						{
							for (j = 0; j < 640; j++)
							{
								Vga_Clr_Pixel(VGA_0_BASE, j, i);
							}
						}
						for (i = userChar+1; i > cursor_x_char-26; i--)
						{
							username[i] = username[i-1];
						}
						username[cursor_x_char-26] = key;
						for (j = cursor_y; j < cursor_y+16; j++)
							Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
						for (i = cursor_x_char-26; i < userChar+1; i++)
							put_vga_char(username[i], i+26, 28);
						cursor_x_char++;
						cursor_x = (cursor_x_char*8)-1;
						cursor_y = cursor_y_char*16;
						for (j = cursor_y; j < cursor_y+16; j++)
						{
							Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
						}
						userChar++;
					}
					else
						put_vga_string("Cannot exceed maximum of 10 characters for username.", 0, 26);
				}
				else
				{
					if (curMsgChar < MAX_MSG_LENGTH_USER) {
						if (cursor_y_char == 28)
						{
							for (i = curMsgChar+1; i > cursor_x_char-25; i--)
							{
								UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i-1];
							}
							UDP_PACKET_PAYLOAD[cursor_x_char-25] = key;

						}
						else if (cursor_y_char == 29)
						{
							for (i = curMsgChar+1; i > cursor_x_char+52; i--)
							{
								UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i-1];
							}
							UDP_PACKET_PAYLOAD[cursor_x_char+53] = key;
						}
						for (j = cursor_y; j < cursor_y+16; j++)
							Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
						if (curMsgLine == 28 && cursor_y_char == 28)
						{
							for (i = cursor_x_char-25; i < curMsgChar+1; i++)
								put_vga_char(UDP_PACKET_PAYLOAD[i], i+25, cursor_y_char);
							if (curMsgChar > 53)
								for (i = 0; i < curMsgChar+1-53; i++)
									put_vga_char(UDP_PACKET_PAYLOAD[i+53], i, curMsgLine);
						}
						if (curMsgLine == 29 && cursor_y_char == 28)
						{
							for (i = cursor_x_char-25; i < 53; i++)
								put_vga_char(UDP_PACKET_PAYLOAD[i], i+25, cursor_y_char);
							for (i = 0; i < curMsgChar+1-53; i++)
								put_vga_char(UDP_PACKET_PAYLOAD[i+53], i, curMsgLine);
						}
						else if (curMsgLine == 29 && cursor_y_char == 29)
						{
							for (i = cursor_x_char; i < curMsgChar+1-53; i++)
								put_vga_char(UDP_PACKET_PAYLOAD[i+53], i, cursor_y_char);
						}
						else if (curMsgLine == 28 && cursor_y_char == 29)
						{
							for (i = cursor_x_char; i < curMsgChar+1-53; i++)
								put_vga_char(UDP_PACKET_PAYLOAD[i+53], i, cursor_y_char);
							curMsgLine = 29;
						}
						cursor_x_char++;
						cursor_x = (cursor_x_char*8)-1;
						cursor_y = cursor_y_char*16;
						//						put_vga_char(key, curLineChar, curMsgLine );
						for (j = cursor_y; j < cursor_y+16; j++)
						{
							Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
						}
						curMsgChar++;
						curLineChar++;
						if (cursor_x_char == 78 && cursor_y_char == 28)
						{
							cursor_x_char = 0;
							cursor_y_char = 29;
						}
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
				printf(" MAKE CODE :\t%X\n", key ); //print other unknown breakcode
				switch (key ) {
				//___________________________________________________________________________________
				//Enter Key...
				//___________________________________________________________________________________
				case  0x5a:
					if (username_input == 1)
					{
						if (userChar == 0)
							put_vga_string("Username must be at least 1 character.", 0, 26);
						else
						{
							username[userChar++] = 0; // Terminate the string
							for (i = 441; i < 480; i++)
							{
								for (j = 26; j < 640; j++)
								{
									Vga_Clr_Pixel(VGA_0_BASE, j, i);
								}
							}
							for (i = 411; i < 435; i++)
							{
								for (j = 0; j < 640; j++)
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
							//
							for (j = cursor_y; j < cursor_y+16; j++)
							{
								for (i = cursor_x+1; i < cursor_x+8; i++)
									Vga_Clr_Pixel(VGA_0_BASE, i, j);
							}
							cursor_x_char = 25;
							cursor_y_char = 28;
							cursor_x = (cursor_x_char*8)-1;
							cursor_y = cursor_y_char*16;
							for (j = cursor_y; j < cursor_y+16; j++)
							{
								Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
							}
							//
							username_input = 0;
							MAX_MSG_LENGTH_USER = MAX_MSG_LENGTH - userChar + 1 - 2;
						}
					}
					else
					{
						//___________________________________________________________________________________
						//Checksum Calculator... (checksum hole = transmit_buffer[25] & transmit_buffer[26]
						//___________________________________________________________________________________
						byte14 = transmit_buffer[14] << 8;
						byte15 = transmit_buffer[15];
						byte16 = transmit_buffer[16] << 8;
						byte17 = transmit_buffer[17];
						byte18 = transmit_buffer[18] << 8;
						byte19 = transmit_buffer[19];
						byte20 = transmit_buffer[20] << 8;
						byte21 = transmit_buffer[21];
						byte22 = transmit_buffer[22] << 8;
						byte23 = transmit_buffer[23];
						byte26 = transmit_buffer[26] << 8;
						byte27 = transmit_buffer[27];
						byte28 = transmit_buffer[28] << 8;
						byte29 = transmit_buffer[29];
						byte30 = transmit_buffer[30] << 8;
						byte31 = transmit_buffer[31];
						byte32 = transmit_buffer[32] << 8;
						byte33 = transmit_buffer[33];

						ip_header0 = byte14 + byte15;
						ip_header1 = byte16 + byte17;
						ip_header2 = byte18 + byte19;
						ip_header3 = byte20 + byte21;
						ip_header4 = byte22 + byte23;
						ip_header6 = byte26 + byte27;
						ip_header7 = byte28 + byte29;
						ip_header8 = byte30 + byte31;
						ip_header9 = byte32 + byte33;

						crc_twos = ip_header0+ip_header1+ip_header2+ip_header3+ip_header4+ip_header6+ip_header7+ip_header8+ip_header9;
						printf("\n %hx twos: ", crc_twos);
						crc_carry = crc_twos >> 16;
						printf("\n %hx carry: ", crc_carry);
						crc_ones = crc_twos + crc_carry;
						printf("\n ones: %hx", crc_ones);
						//						checksum = ~crc_ones;
						checksum = (crc_ones ^ 0xFFFF); // invert bits
						printf("\n %hx checksum: ", checksum);

						transmit_buffer[24] = checksum >> 8;
						transmit_buffer[25] = checksum;
						printf("\n %hx checksum_stored: ", transmit_buffer[24]);
						printf("\n %hx checksum_stored: ", transmit_buffer[25]);



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
						for (j = cursor_y; j < cursor_y+16; j++)
						{
							for (i = cursor_x+1; i < cursor_x+8; i++) Vga_Clr_Pixel(VGA_0_BASE, i, j);
						}
						cursor_x_char = 25;
						cursor_y_char = 28;
						cursor_x = (cursor_x_char*8)-1;
						cursor_y = cursor_y_char*16;
						for (j = cursor_y; j < cursor_y+16; j++)
						{
							Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
						}
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





						//						byte14 = transmit_buffer[14] << 8;
						//						byte15 = transmit_buffer[15];
						//						byte16 = transmit_buffer[16] << 8;
						//						byte17 = transmit_buffer[17];
						//						byte18 = transmit_buffer[18] << 8;
						//						byte19 = transmit_buffer[19];
						//						byte20 = transmit_buffer[20] << 8;
						//						byte21 = transmit_buffer[21];
						//						byte22 = transmit_buffer[22] << 8;
						//						byte23 = transmit_buffer[23];
						//						byte24 = transmit_buffer[24] << 8;
						//						byte25 = transmit_buffer[25];
						//						byte26 = transmit_buffer[26] << 8;
						//						byte27 = transmit_buffer[27];
						//						byte28 = transmit_buffer[28] << 8;
						//						byte29 = transmit_buffer[29];
						//						byte30 = transmit_buffer[30] << 8;
						//						byte31 = transmit_buffer[31];
						//						byte32 = transmit_buffer[32] << 8;
						//						byte33 = transmit_buffer[33];
						//
						//						ip_header0 = byte14 + byte15;
						//						ip_header1 = byte16 + byte17;
						//						ip_header2 = byte18 + byte19;
						//						ip_header3 = byte20 + byte21;
						//						ip_header4 = byte22 + byte23;
						//						ip_header5 = byte24 + byte25;
						//						ip_header6 = byte26 + byte27;
						//						ip_header7 = byte28 + byte29;
						//						ip_header8 = byte30 + byte31;
						//						ip_header9 = byte32 + byte33;
						//
						//						crc_twos = ip_header0+ip_header1+ip_header2+ip_header3+ip_header4+ip_header5+ip_header6+ip_header7+ip_header8+ip_header9;
						//						printf("\n %hx twos: ", crc_twos);
						//						crc_carry = crc_twos >> 16;
						//						printf("\n %hx carry: ", crc_carry);
						//						crc_ones = crc_twos + crc_carry;
						//						printf("\n ones: %hx", crc_ones);
						//						checksum = (crc_ones ^ 0xFFFF); // invert bits
						//						printf("\n %hx checksum: ", checksum);


						//___________________________________________________________________________________
						//Packet ID Counter...
						//___________________________________________________________________________________
						if (transmit_buffer[19] != 0xff)
						{
							transmit_buffer[19]++;
						}
						else
						{
							transmit_buffer[18]++;
							transmit_buffer[19] = 0x00;
						}
						printf ("\n %hX", transmit_buffer[18]);
						printf ("\n %hX \n", transmit_buffer[19]);
						//
						//
						//
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
							for (i = 411; i < 435; i++)
							{
								for (j = 0; j < 640; j++)
								{
									Vga_Clr_Pixel(VGA_0_BASE, j, i);
								}
							}
							for (i = userChar+1; i > cursor_x_char-26; i--)
							{
								username[i] = username[i-1];
							}
							username[cursor_x_char-26] = ' ';
							for (j = cursor_y; j < cursor_y+16; j++)
								Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
							for (i = cursor_x_char-26; i < userChar+1; i++)
								put_vga_char(username[i], i+26, 28);
							cursor_x_char++;
							cursor_x = (cursor_x_char*8)-1;
							cursor_y = cursor_y_char*16;
							for (j = cursor_y; j < cursor_y+16; j++)
							{
								Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
							}
							userChar++;
						}
					}
					else
					{
						if (curMsgChar < MAX_MSG_LENGTH_USER)
						{
							if (cursor_y_char == 28)
							{
								for (i = curMsgChar+1; i > cursor_x_char-25; i--)
								{
									UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i-1];
								}
								UDP_PACKET_PAYLOAD[cursor_x_char-25] = ' ';
							}
							else if (cursor_y_char == 29)
							{
								for (i = curMsgChar+1; i > cursor_x_char+52; i--)
								{
									UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i-1];
								}
								UDP_PACKET_PAYLOAD[cursor_x_char+53] = ' ';
							}
							for (j = cursor_y; j < cursor_y+16; j++)
								Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
							if (curMsgLine == 28 && cursor_y_char == 28)
							{
								for (i = cursor_x_char-25; i < curMsgChar+1; i++)
									put_vga_char(UDP_PACKET_PAYLOAD[i], i+25, cursor_y_char);
							}
							if (curMsgLine == 29 && cursor_y_char == 28)
							{
								for (i = cursor_x_char-25; i < 53; i++)
									put_vga_char(UDP_PACKET_PAYLOAD[i], i+25, cursor_y_char);
								for (i = 0; i < curMsgChar+1-53; i++)
									put_vga_char(UDP_PACKET_PAYLOAD[i+53], i, curMsgLine);
							}
							else if (curMsgLine == 29 && cursor_y_char == 29)
							{
								for (i = cursor_x_char; i < curMsgChar+1-53; i++)
									put_vga_char(UDP_PACKET_PAYLOAD[i+53], i, cursor_y_char);
							}
							cursor_x_char++;
							cursor_x = (cursor_x_char*8)-1;
							cursor_y = cursor_y_char*16;
							for (j = cursor_y; j < cursor_y+16; j++)
							{
								Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
							}
							curMsgChar++;
							curLineChar++;
							if (cursor_x_char == 78 && cursor_y_char == 28)
							{
								cursor_x_char = 0;
								cursor_y_char = 29;
							}
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


							//
							//
							//							if (curLineChar == 77)
							//							{
							//								curMsgLine = curMsgLine + 1;
							//								curLineChar = 0;
							//								for (j = cursor_y; j < cursor_y+16; j++)
							//									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
							//								cursor_x_char = 0;
							//								cursor_y_char = 29;
							//								cursor_x = (cursor_x_char*8)-1-1+1;
							//								cursor_y = cursor_y_char*16;
							//								for (j = cursor_y; j < cursor_y+16; j++)
							//								{
							//									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
							//								}
							//
							//							}
							//							else
							//							{
							//								curLineChar++;
							//								for (j = cursor_y; j < cursor_y+16; j++)
							//									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
							//								cursor_x_char++;
							//								cursor_x = (cursor_x_char*8)-1;
							//								cursor_y = cursor_y_char*16;
							//								put_vga_char(' ', curLineChar, curMsgLine);
							//								for (j = cursor_y; j < cursor_y+16; j++)
							//								{
							//									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
							//								}
							//							}
						}
					}






					//
					//						curMsgChar++;
					//						curLineChar++;
					//						if (cursor_x_char == 78 && cursor_y_char == 28)
					//						{
					//							cursor_x_char = 0;
					//							cursor_y_char = 29;
					//						}
					//						if (curLineChar == 78) {
					//							curLineChar = 0;
					//							curMsgLine = curMsgLine + 1;
					//						}
					//						if (curMsgChar == 1) {
					//							for (i = 411; i < 435; i++)
					//							{
					//								for (j = 0; j < 640; j++)
					//								{
					//									Vga_Clr_Pixel(VGA_0_BASE, j, i);
					//								}
					//							}
					//						}
					//					}

					//
					//
					break;
					//___________________________________________________________________________________
					//Backspace Key...
					//___________________________________________________________________________________
				case 0x66:
					if (username_input == 1)
					{
						if (userChar != 0)
						{
							for (i = 411; i < 435; i++)
							{
								for (j = 0; j < 640; j++)
								{
									Vga_Clr_Pixel(VGA_0_BASE, j, i);
								}
							}
							for (i = cursor_x_char-27; i < userChar; i++)
							{
								username[i] = username[i+1];
							}
							put_vga_char(' ', userChar+26-1, 28);
							userChar--;
							for (j = cursor_y; j < cursor_y+16; j++)
								Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
							for (i = cursor_x_char-27; i < userChar; i++)
								put_vga_char(username[i], i+26, 28);
							cursor_x_char--;
							cursor_x = (cursor_x_char*8)-1;
							cursor_y = cursor_y_char*16;
							for (j = cursor_y; j < cursor_y+16; j++)
							{
								Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
							}
						}
					}
					else
					{
						if (curMsgChar != 0)
						{
							if (cursor_y_char == 28)
							{
								if (cursor_x_char != 25)
								{
									for (i = cursor_x_char-26; i < curMsgChar-1; i++)
									{
										UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i+1];
									}
									if (curMsgLine == 28)
									{
										for (i = cursor_x_char-26; i < curMsgChar; i++)
											put_vga_char(UDP_PACKET_PAYLOAD[i], i+25, 28);
										put_vga_char(' ', curMsgChar+25-1, 28);
										put_vga_char(' ', 0, 29);//ok
										for (i = 78; i < 80; i++)//ok
											put_vga_char(' ', i, 28);//ok
									}
									if (curMsgLine == 29)
									{
										//										for (i = cursor_x_char-26; i < 53; i++)
										//											put_vga_char(UDP_PACKET_PAYLOAD[i], i+25, 28);
										for (i = cursor_x_char-25-1; i < 53; i++)
											put_vga_char(UDP_PACKET_PAYLOAD[i], i+25, 28);
										for (i = 0; i < curMsgChar-53; i++)//ok
											put_vga_char(UDP_PACKET_PAYLOAD[i+53], i, 29);//ok
										for (i = curMsgChar-53-1; i < 78; i++)//ok
											put_vga_char(' ', i, 29);
										if (curMsgChar == 53)
											curMsgLine = 28;
										for (i = 78; i < 80; i++)
											put_vga_char(' ', i, 28);
									}
									curMsgChar--;
									curLineChar--;
									cursor_x_char--;
									for (j = cursor_y; j < cursor_y+16; j++)
										Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
									//									for (i = cursor_x_char-26; i < curMsgChar; i++)
									//										put_vga_char(UDP_PACKET_PAYLOAD[i], i+25, 28);
									cursor_x = (cursor_x_char*8)-1;
									cursor_y = cursor_y_char*16;
									for (j = cursor_y; j < cursor_y+16; j++)
									{
										Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
									}
								}
							}
							else
							{
								if (cursor_x_char != 0)
								{
									for (i = cursor_x_char+52; i < curMsgChar; i++)
									{
										UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i+1];
									}
									put_vga_char(' ', curMsgChar-54, 29);
									for (j = cursor_y; j < cursor_y+16; j++)
										Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
									for (i = cursor_x_char; i < curMsgChar-53; i++)//debugged
										put_vga_char(UDP_PACKET_PAYLOAD[i+53-1],i-1,29);
									curMsgChar--;
									curLineChar--;
									cursor_x_char--;
									cursor_x = (cursor_x_char*8)-1;
									cursor_y = cursor_y_char*16;
									for (j = cursor_y; j < cursor_y+16; j++)
									{
										Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
									}
								}
								else //need to add insert case.
								{
									if (cursor_x_char == curLineChar)
									{
										for (i = cursor_x_char+52; i < curMsgChar; i++)
										{
											UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i+1];
										}
										curMsgChar--;
										curMsgLine--;
										curLineChar = 77;
										put_vga_char(' ', curMsgChar+25, 28);
										for (j = cursor_y; j < cursor_y+16; j++)
											Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
										for (i = cursor_x_char+53; i < curMsgChar; i++)
											put_vga_char(UDP_PACKET_PAYLOAD[i], i-53, 29);
										cursor_x_char = 77;
										cursor_y_char--;
										cursor_x = (cursor_x_char*8)-1;
										cursor_y = cursor_y_char*16;
										for (j = cursor_y; j < cursor_y+16; j++)
										{
											Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
										}
									}
									if (cursor_x_char < curLineChar)
									{
										for (i = cursor_x_char+52; i < curMsgChar; i++)
										{
											UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i+1];
										}
										curMsgChar--;
										put_vga_char(' ', curMsgChar-53, 29);
										for (j = cursor_y; j < cursor_y+16; j++)
											Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
										for (i = cursor_x_char+53; i < curMsgChar; i++)
											put_vga_char(UDP_PACKET_PAYLOAD[i], i-53, 29);
										put_vga_char(UDP_PACKET_PAYLOAD[52], 77, 28);
										cursor_x_char = 77;
										cursor_y_char--;
										cursor_x = (cursor_x_char*8)-1;
										cursor_y = cursor_y_char*16;
										for (j = cursor_y; j < cursor_y+16; j++)
										{
											Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
										}
									}
								}
							}
						}
					}




					//							if (cursor_y_char == 28 && cursor_x_char != 26)
					//							{
					//								for (i = cursor_x_char-26; i < curMsgChar; i++)
					//								{
					//									UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i+1];
					//								}
					//							}
					//							else if (cursor_y_char == 29)
					//							{
					//								for (i = cursor_x_char+1; i < curMsgChar+53; i++)
					//								{
					//									UDP_PACKET_PAYLOAD[i] = UDP_PACKET_PAYLOAD[i+1];
					//								}
					//							}
					//							curMsgChar--;
					//							curLineChar--;
					//							//
					//							for (i = cursor_x_char-25; i < curMsgChar+1; i++)
					//								put_vga_char(UDP_PACKET_PAYLOAD[i], i+25-1, 14);
					//							//
					//							for (j = cursor_y; j < cursor_y+16; j++)
					//								Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
					//							if (curMsgLine == 28 && cursor_y_char == 28)
					//							{
					//								for (i = cursor_x_char-25; i < curMsgChar+1; i++)
					//									put_vga_char(UDP_PACKET_PAYLOAD[i], i+25-1, cursor_y_char);
					//							}
					//							if (curMsgLine == 29 && cursor_y_char == 28)
					//							{
					//								for (i = cursor_x_char-25; i < 53; i++)
					//									put_vga_char(UDP_PACKET_PAYLOAD[i], i+25-1, cursor_y_char);
					//								for (i = 0; i < curMsgChar+1-53; i++)
					//									put_vga_char(UDP_PACKET_PAYLOAD[i+53], i, curMsgLine);
					//							}
					//							else if (curMsgLine == 29 && cursor_y_char == 29)
					//							{
					//								for (i = cursor_x_char; i < curMsgChar+1-53; i++)
					//									put_vga_char(UDP_PACKET_PAYLOAD[i+53], i-1, cursor_y_char);
					//							}
					//							cursor_x_char--;
					//							cursor_x = (cursor_x_char*8)-1;
					//							cursor_y = cursor_y_char*16;
					//							for (j = cursor_y; j < cursor_y+16; j++)
					//							{
					//								Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
					//							}
					////							if (cursor_x_char == 78 && cursor_y_char == 28)
					////							{
					////								cursor_x_char = 0;
					////								cursor_y_char = 29;
					////							}
					//							if (curLineChar == 1) {
					//								curLineChar = 77;
					//								curMsgLine--;
					//							}





					//							else if (curLineChar == 1)
					//							{
					//								curLineChar--;
					//								for (j = cursor_y; j < cursor_y+16; j++)
					//									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
					//								cursor_x_char--;
					//								cursor_x = (cursor_x_char*8)-1-1+1;
					//								cursor_y = cursor_y_char*16;
					//								put_vga_char(' ', curLineChar, curMsgLine);
					//								for (j = cursor_y; j < cursor_y+16; j++)
					//								{
					//									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
					//								}
					//							}
					//							else
					//							{
					//								curLineChar--;
					//								for (j = cursor_y; j < cursor_y+16; j++)
					//									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
					//								cursor_x_char--;
					//								cursor_x = (cursor_x_char*8)-1;
					//								cursor_y = cursor_y_char*16;
					//								put_vga_char(' ', curLineChar, curMsgLine);
					//								for (j = cursor_y; j < cursor_y+16; j++)
					//								{
					//									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
					//								}
					//							}


					//
					//
					//							if (cursor_x_char == 78 && cursor_y_char == 28)
					//							{
					//								cursor_x_char = 0;
					//								cursor_y_char = 29;
					//							}
					//							if (curLineChar == 78) {
					//								curLineChar = 0;
					//								curMsgLine = curMsgLine + 1;
					//							}
					//							if (curMsgChar == 1) {
					//								for (i = 411; i < 435; i++)
					//								{
					//									for (j = 0; j < 640; j++)
					//									{
					//										Vga_Clr_Pixel(VGA_0_BASE, j, i);
					//									}
					//								}
					//							}







					break;
				default:
					printf(" MAKE CODE :\t%X\n", key ); //print other unknown breakcode
				}
				break ;
				case KB_BREAK_CODE :
					printf(" MAKE CODE :\t%X\n", key ); //print other unknown breakcode

					switch (key)
					{
					case 0x12:
					case 0x59:
						shift = 0;
						break;
					case 0x6b:
						if (username_input == 1)
						{
							if (cursor_x_char != 26)
							{
								for (j = cursor_y; j < cursor_y+16; j++)
									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
								cursor_x_char--;
								cursor_x = (cursor_x_char*8)-1;
								cursor_y = cursor_y_char*16;
								for (j = cursor_y; j < cursor_y+16; j++)
								{
									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
								}
							}
						}
						else
						{
							if (cursor_x_char != 25 && cursor_y_char == 28)
							{
								for (j = cursor_y; j < cursor_y+16; j++)
									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
								cursor_x_char--;
								cursor_x = (cursor_x_char*8)-1;
								cursor_y = cursor_y_char*16;
								for (j = cursor_y; j < cursor_y+16; j++)
								{
									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
								}
							}
							else if (cursor_x_char == 25 && cursor_y_char == 28)
							{
							}
							else if (cursor_x_char == 0 && cursor_y_char == 29)
							{
								for (j = cursor_y; j < cursor_y+16; j++)
									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
								cursor_x_char = 77;
								cursor_y_char--;
								cursor_x = (cursor_x_char*8)-1;
								cursor_y = cursor_y_char*16;
								for (j = cursor_y; j < cursor_y+16; j++)
								{
									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
								}
							}
							else
							{
								for (j = cursor_y; j < cursor_y+16; j++)
									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
								cursor_x_char--;
								cursor_x = (cursor_x_char*8)-1;
								cursor_y = cursor_y_char*16;
								for (j = cursor_y; j < cursor_y+16; j++)
								{
									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
								}

							}
						}

						break;
					case 0x74:
						if (username_input == 1)
						{
							if (cursor_x_char-26 < userChar)
							{
								for (j = cursor_y; j < cursor_y+16; j++)
									Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
								cursor_x_char++;
								cursor_x = (cursor_x_char*8)-1;
								cursor_y = cursor_y_char*16;
								for (j = cursor_y; j < cursor_y+16; j++)
								{
									Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
								}
							}
						}
						else
						{
							if (cursor_x_char != 77)
							{
								if (curMsgLine == 29 && cursor_y_char == 28)
								{
									for (j = cursor_y; j < cursor_y+16; j++)
										Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
									cursor_x_char++;
									cursor_x = (cursor_x_char*8)-1;
									cursor_y = cursor_y_char*16;
									for (j = cursor_y; j < cursor_y+16; j++)
									{
										Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
									}
								}
								else
								{
									if (cursor_x_char < curLineChar)
									{
										for (j = cursor_y; j < cursor_y+16; j++)
											Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
										cursor_x_char++;
										cursor_x = (cursor_x_char*8)-1;
										cursor_y = cursor_y_char*16;
										for (j = cursor_y; j < cursor_y+16; j++)
										{
											Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
										}
									}
								}
							}
							else
							{
								if (curMsgLine == 29 && cursor_y_char == 28)
								{
									for (j = cursor_y; j < cursor_y+16; j++)
										Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
									cursor_x_char = 0;
									cursor_y_char++;
									cursor_x = (cursor_x_char*8)-1;
									cursor_y = cursor_y_char*16;
									for (j = cursor_y; j < cursor_y+16; j++)
									{
										Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
									}
								}
								//								else
								//								{
								//									if (cursor_x_char < curLineChar)
								//									{
								//										for (j = cursor_y; j < cursor_y+16; j++)
								//											Vga_Clr_Pixel(VGA_0_BASE, cursor_x, j);
								//										cursor_x_char = 0;
								//										cursor_y_char++;
								//										cursor_x = (cursor_x_char*8)-1;
								//										cursor_y = cursor_y_char*16;
								//										for (j = cursor_y; j < cursor_y+16; j++)
								//										{
								//											Vga_Set_Pixel(VGA_0_BASE, cursor_x, j);
								//										}
								//									}
								//								}
							}
						}
						break;
					default :
						break ;
					}
			}
		}
		else
		{
			printf(" Keyboard error ....\n");
		}
	}
	printf("Program terminated normally\n");
	return 0;

	ErrorExit:
	printf("Program terminated with an error condition\n");
	return 1;
}
