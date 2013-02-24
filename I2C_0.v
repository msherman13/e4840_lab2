//Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module I2C_0 (
               // inputs:
                arst_i,
                scl_pad_i,
                sda_pad_i,
                wb_adr_i,
                wb_clk_i,
                wb_cyc_i,
                wb_dat_i,
                wb_rst_i,
                wb_stb_i,
                wb_we_i,

               // outputs:
                scl_pad_o,
                scl_padoen_o,
                sda_pad_o,
                sda_padoen_o,
                wb_ack_o,
                wb_dat_o,
                wb_inta_o
             )
;

  output           scl_pad_o;
  output           scl_padoen_o;
  output           sda_pad_o;
  output           sda_padoen_o;
  output           wb_ack_o;
  output  [  7: 0] wb_dat_o;
  output           wb_inta_o;
  input            arst_i;
  input            scl_pad_i;
  input            sda_pad_i;
  input   [  2: 0] wb_adr_i;
  input            wb_clk_i;
  input            wb_cyc_i;
  input   [  7: 0] wb_dat_i;
  input            wb_rst_i;
  input            wb_stb_i;
  input            wb_we_i;

  wire             scl_pad_o;
  wire             scl_padoen_o;
  wire             sda_pad_o;
  wire             sda_padoen_o;
  wire             wb_ack_o;
  wire    [  7: 0] wb_dat_o;
  wire             wb_inta_o;
  i2c_master_top the_i2c_master_top
    (
      .arst_i       (arst_i),
      .scl_pad_i    (scl_pad_i),
      .scl_pad_o    (scl_pad_o),
      .scl_padoen_o (scl_padoen_o),
      .sda_pad_i    (sda_pad_i),
      .sda_pad_o    (sda_pad_o),
      .sda_padoen_o (sda_padoen_o),
      .wb_ack_o     (wb_ack_o),
      .wb_adr_i     (wb_adr_i),
      .wb_clk_i     (wb_clk_i),
      .wb_cyc_i     (wb_cyc_i),
      .wb_dat_i     (wb_dat_i),
      .wb_dat_o     (wb_dat_o),
      .wb_inta_o    (wb_inta_o),
      .wb_rst_i     (wb_rst_i),
      .wb_stb_i     (wb_stb_i),
      .wb_we_i      (wb_we_i)
    );


endmodule

