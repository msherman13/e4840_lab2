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

module ISP1362 (
                 // inputs:
                  OTG_DREQ0,
                  OTG_DREQ1,
                  OTG_INT0,
                  OTG_INT1,
                  iADDR,
                  iCS_N,
                  iDATA,
                  iFSPEED,
                  iLSPEED,
                  iRD_N,
                  iWR_N,

                 // outputs:
                  OTG_ADDR,
                  OTG_CS_N,
                  OTG_DACK0_N,
                  OTG_DACK1_N,
                  OTG_DATA,
                  OTG_FSPEED,
                  OTG_LSPEED,
                  OTG_RD_N,
                  OTG_RST_N,
                  OTG_WR_N,
                  oDATA,
                  oINT
               )
;

  output  [  1: 0] OTG_ADDR;
  output           OTG_CS_N;
  output           OTG_DACK0_N;
  output           OTG_DACK1_N;
  inout   [ 15: 0] OTG_DATA;
  output           OTG_FSPEED;
  output           OTG_LSPEED;
  output           OTG_RD_N;
  output           OTG_RST_N;
  output           OTG_WR_N;
  output  [ 15: 0] oDATA;
  output           oINT;
  input            OTG_DREQ0;
  input            OTG_DREQ1;
  input            OTG_INT0;
  input            OTG_INT1;
  input   [  1: 0] iADDR;
  input            iCS_N;
  input   [ 15: 0] iDATA;
  input            iFSPEED;
  input            iLSPEED;
  input            iRD_N;
  input            iWR_N;

  wire    [  1: 0] OTG_ADDR;
  wire             OTG_CS_N;
  wire             OTG_DACK0_N;
  wire             OTG_DACK1_N;
  wire    [ 15: 0] OTG_DATA;
  wire             OTG_FSPEED;
  wire             OTG_LSPEED;
  wire             OTG_RD_N;
  wire             OTG_RST_N;
  wire             OTG_WR_N;
  wire    [ 15: 0] oDATA;
  wire             oINT;
  //wrapper, which is an e_instance
  ISP1362_IF wrapper
    (
      .OTG_ADDR    (OTG_ADDR),
      .OTG_CS_N    (OTG_CS_N),
      .OTG_DACK0_N (OTG_DACK0_N),
      .OTG_DACK1_N (OTG_DACK1_N),
      .OTG_DATA    (OTG_DATA),
      .OTG_DREQ0   (OTG_DREQ0),
      .OTG_DREQ1   (OTG_DREQ1),
      .OTG_FSPEED  (OTG_FSPEED),
      .OTG_INT0    (OTG_INT0),
      .OTG_INT1    (OTG_INT1),
      .OTG_LSPEED  (OTG_LSPEED),
      .OTG_RD_N    (OTG_RD_N),
      .OTG_RST_N   (OTG_RST_N),
      .OTG_WR_N    (OTG_WR_N),
      .iADDR       (iADDR),
      .iCS_N       (iCS_N),
      .iDATA       (iDATA),
      .iFSPEED     (iFSPEED),
      .iLSPEED     (iLSPEED),
      .iRD_N       (iRD_N),
      .iWR_N       (iWR_N),
      .oDATA       (oDATA),
      .oINT        (oINT)
    );


endmodule

