//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


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

module DM9000A_avalonS_arbitrator (
                                    // inputs:
                                     DM9000A_avalonS_irq,
                                     DM9000A_avalonS_readdata,
                                     clk,
                                     cpu_0_data_master_address_to_slave,
                                     cpu_0_data_master_read,
                                     cpu_0_data_master_write,
                                     cpu_0_data_master_writedata,
                                     reset_n,

                                    // outputs:
                                     DM9000A_avalonS_address,
                                     DM9000A_avalonS_chipselect_n,
                                     DM9000A_avalonS_irq_from_sa,
                                     DM9000A_avalonS_read_n,
                                     DM9000A_avalonS_readdata_from_sa,
                                     DM9000A_avalonS_reset_n,
                                     DM9000A_avalonS_wait_counter_eq_0,
                                     DM9000A_avalonS_write_n,
                                     DM9000A_avalonS_writedata,
                                     cpu_0_data_master_granted_DM9000A_avalonS,
                                     cpu_0_data_master_qualified_request_DM9000A_avalonS,
                                     cpu_0_data_master_read_data_valid_DM9000A_avalonS,
                                     cpu_0_data_master_requests_DM9000A_avalonS,
                                     d1_DM9000A_avalonS_end_xfer
                                  )
;

  output           DM9000A_avalonS_address;
  output           DM9000A_avalonS_chipselect_n;
  output           DM9000A_avalonS_irq_from_sa;
  output           DM9000A_avalonS_read_n;
  output  [ 15: 0] DM9000A_avalonS_readdata_from_sa;
  output           DM9000A_avalonS_reset_n;
  output           DM9000A_avalonS_wait_counter_eq_0;
  output           DM9000A_avalonS_write_n;
  output  [ 15: 0] DM9000A_avalonS_writedata;
  output           cpu_0_data_master_granted_DM9000A_avalonS;
  output           cpu_0_data_master_qualified_request_DM9000A_avalonS;
  output           cpu_0_data_master_read_data_valid_DM9000A_avalonS;
  output           cpu_0_data_master_requests_DM9000A_avalonS;
  output           d1_DM9000A_avalonS_end_xfer;
  input            DM9000A_avalonS_irq;
  input   [ 15: 0] DM9000A_avalonS_readdata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire             DM9000A_avalonS_address;
  wire             DM9000A_avalonS_allgrants;
  wire             DM9000A_avalonS_allow_new_arb_cycle;
  wire             DM9000A_avalonS_any_bursting_master_saved_grant;
  wire             DM9000A_avalonS_any_continuerequest;
  wire             DM9000A_avalonS_arb_counter_enable;
  reg     [  2: 0] DM9000A_avalonS_arb_share_counter;
  wire    [  2: 0] DM9000A_avalonS_arb_share_counter_next_value;
  wire    [  2: 0] DM9000A_avalonS_arb_share_set_values;
  wire             DM9000A_avalonS_beginbursttransfer_internal;
  wire             DM9000A_avalonS_begins_xfer;
  wire             DM9000A_avalonS_chipselect_n;
  wire             DM9000A_avalonS_counter_load_value;
  wire             DM9000A_avalonS_end_xfer;
  wire             DM9000A_avalonS_firsttransfer;
  wire             DM9000A_avalonS_grant_vector;
  wire             DM9000A_avalonS_in_a_read_cycle;
  wire             DM9000A_avalonS_in_a_write_cycle;
  wire             DM9000A_avalonS_irq_from_sa;
  wire             DM9000A_avalonS_master_qreq_vector;
  wire             DM9000A_avalonS_non_bursting_master_requests;
  wire             DM9000A_avalonS_read_n;
  wire    [ 15: 0] DM9000A_avalonS_readdata_from_sa;
  reg              DM9000A_avalonS_reg_firsttransfer;
  wire             DM9000A_avalonS_reset_n;
  reg              DM9000A_avalonS_slavearbiterlockenable;
  wire             DM9000A_avalonS_slavearbiterlockenable2;
  wire             DM9000A_avalonS_unreg_firsttransfer;
  reg              DM9000A_avalonS_wait_counter;
  wire             DM9000A_avalonS_wait_counter_eq_0;
  wire             DM9000A_avalonS_waits_for_read;
  wire             DM9000A_avalonS_waits_for_write;
  wire             DM9000A_avalonS_write_n;
  wire    [ 15: 0] DM9000A_avalonS_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_DM9000A_avalonS;
  wire             cpu_0_data_master_qualified_request_DM9000A_avalonS;
  wire             cpu_0_data_master_read_data_valid_DM9000A_avalonS;
  wire             cpu_0_data_master_requests_DM9000A_avalonS;
  wire             cpu_0_data_master_saved_grant_DM9000A_avalonS;
  reg              d1_DM9000A_avalonS_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_DM9000A_avalonS;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_DM9000A_avalonS_from_cpu_0_data_master;
  wire             wait_for_DM9000A_avalonS_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~DM9000A_avalonS_end_xfer;
    end


  assign DM9000A_avalonS_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_DM9000A_avalonS));
  //assign DM9000A_avalonS_readdata_from_sa = DM9000A_avalonS_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DM9000A_avalonS_readdata_from_sa = DM9000A_avalonS_readdata;

  assign cpu_0_data_master_requests_DM9000A_avalonS = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h900090) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //DM9000A_avalonS_arb_share_counter set values, which is an e_mux
  assign DM9000A_avalonS_arb_share_set_values = 1;

  //DM9000A_avalonS_non_bursting_master_requests mux, which is an e_mux
  assign DM9000A_avalonS_non_bursting_master_requests = cpu_0_data_master_requests_DM9000A_avalonS;

  //DM9000A_avalonS_any_bursting_master_saved_grant mux, which is an e_mux
  assign DM9000A_avalonS_any_bursting_master_saved_grant = 0;

  //DM9000A_avalonS_arb_share_counter_next_value assignment, which is an e_assign
  assign DM9000A_avalonS_arb_share_counter_next_value = DM9000A_avalonS_firsttransfer ? (DM9000A_avalonS_arb_share_set_values - 1) : |DM9000A_avalonS_arb_share_counter ? (DM9000A_avalonS_arb_share_counter - 1) : 0;

  //DM9000A_avalonS_allgrants all slave grants, which is an e_mux
  assign DM9000A_avalonS_allgrants = |DM9000A_avalonS_grant_vector;

  //DM9000A_avalonS_end_xfer assignment, which is an e_assign
  assign DM9000A_avalonS_end_xfer = ~(DM9000A_avalonS_waits_for_read | DM9000A_avalonS_waits_for_write);

  //end_xfer_arb_share_counter_term_DM9000A_avalonS arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_DM9000A_avalonS = DM9000A_avalonS_end_xfer & (~DM9000A_avalonS_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //DM9000A_avalonS_arb_share_counter arbitration counter enable, which is an e_assign
  assign DM9000A_avalonS_arb_counter_enable = (end_xfer_arb_share_counter_term_DM9000A_avalonS & DM9000A_avalonS_allgrants) | (end_xfer_arb_share_counter_term_DM9000A_avalonS & ~DM9000A_avalonS_non_bursting_master_requests);

  //DM9000A_avalonS_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DM9000A_avalonS_arb_share_counter <= 0;
      else if (DM9000A_avalonS_arb_counter_enable)
          DM9000A_avalonS_arb_share_counter <= DM9000A_avalonS_arb_share_counter_next_value;
    end


  //DM9000A_avalonS_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DM9000A_avalonS_slavearbiterlockenable <= 0;
      else if ((|DM9000A_avalonS_master_qreq_vector & end_xfer_arb_share_counter_term_DM9000A_avalonS) | (end_xfer_arb_share_counter_term_DM9000A_avalonS & ~DM9000A_avalonS_non_bursting_master_requests))
          DM9000A_avalonS_slavearbiterlockenable <= |DM9000A_avalonS_arb_share_counter_next_value;
    end


  //cpu_0/data_master DM9000A/avalonS arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = DM9000A_avalonS_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //DM9000A_avalonS_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign DM9000A_avalonS_slavearbiterlockenable2 = |DM9000A_avalonS_arb_share_counter_next_value;

  //cpu_0/data_master DM9000A/avalonS arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = DM9000A_avalonS_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //DM9000A_avalonS_any_continuerequest at least one master continues requesting, which is an e_assign
  assign DM9000A_avalonS_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_DM9000A_avalonS = cpu_0_data_master_requests_DM9000A_avalonS;
  //DM9000A_avalonS_writedata mux, which is an e_mux
  assign DM9000A_avalonS_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_DM9000A_avalonS = cpu_0_data_master_qualified_request_DM9000A_avalonS;

  //cpu_0/data_master saved-grant DM9000A/avalonS, which is an e_assign
  assign cpu_0_data_master_saved_grant_DM9000A_avalonS = cpu_0_data_master_requests_DM9000A_avalonS;

  //allow new arb cycle for DM9000A/avalonS, which is an e_assign
  assign DM9000A_avalonS_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign DM9000A_avalonS_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign DM9000A_avalonS_master_qreq_vector = 1;

  //DM9000A_avalonS_reset_n assignment, which is an e_assign
  assign DM9000A_avalonS_reset_n = reset_n;

  assign DM9000A_avalonS_chipselect_n = ~cpu_0_data_master_granted_DM9000A_avalonS;
  //DM9000A_avalonS_firsttransfer first transaction, which is an e_assign
  assign DM9000A_avalonS_firsttransfer = DM9000A_avalonS_begins_xfer ? DM9000A_avalonS_unreg_firsttransfer : DM9000A_avalonS_reg_firsttransfer;

  //DM9000A_avalonS_unreg_firsttransfer first transaction, which is an e_assign
  assign DM9000A_avalonS_unreg_firsttransfer = ~(DM9000A_avalonS_slavearbiterlockenable & DM9000A_avalonS_any_continuerequest);

  //DM9000A_avalonS_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DM9000A_avalonS_reg_firsttransfer <= 1'b1;
      else if (DM9000A_avalonS_begins_xfer)
          DM9000A_avalonS_reg_firsttransfer <= DM9000A_avalonS_unreg_firsttransfer;
    end


  //DM9000A_avalonS_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign DM9000A_avalonS_beginbursttransfer_internal = DM9000A_avalonS_begins_xfer;

  //~DM9000A_avalonS_read_n assignment, which is an e_mux
  assign DM9000A_avalonS_read_n = ~(((cpu_0_data_master_granted_DM9000A_avalonS & cpu_0_data_master_read))& ~DM9000A_avalonS_begins_xfer);

  //~DM9000A_avalonS_write_n assignment, which is an e_mux
  assign DM9000A_avalonS_write_n = ~(((cpu_0_data_master_granted_DM9000A_avalonS & cpu_0_data_master_write)) & ~DM9000A_avalonS_begins_xfer & (DM9000A_avalonS_wait_counter >= 1));

  assign shifted_address_to_DM9000A_avalonS_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //DM9000A_avalonS_address mux, which is an e_mux
  assign DM9000A_avalonS_address = shifted_address_to_DM9000A_avalonS_from_cpu_0_data_master >> 2;

  //d1_DM9000A_avalonS_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_DM9000A_avalonS_end_xfer <= 1;
      else 
        d1_DM9000A_avalonS_end_xfer <= DM9000A_avalonS_end_xfer;
    end


  //DM9000A_avalonS_waits_for_read in a cycle, which is an e_mux
  assign DM9000A_avalonS_waits_for_read = DM9000A_avalonS_in_a_read_cycle & DM9000A_avalonS_begins_xfer;

  //DM9000A_avalonS_in_a_read_cycle assignment, which is an e_assign
  assign DM9000A_avalonS_in_a_read_cycle = cpu_0_data_master_granted_DM9000A_avalonS & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = DM9000A_avalonS_in_a_read_cycle;

  //DM9000A_avalonS_waits_for_write in a cycle, which is an e_mux
  assign DM9000A_avalonS_waits_for_write = DM9000A_avalonS_in_a_write_cycle & wait_for_DM9000A_avalonS_counter;

  //DM9000A_avalonS_in_a_write_cycle assignment, which is an e_assign
  assign DM9000A_avalonS_in_a_write_cycle = cpu_0_data_master_granted_DM9000A_avalonS & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = DM9000A_avalonS_in_a_write_cycle;

  assign DM9000A_avalonS_wait_counter_eq_0 = DM9000A_avalonS_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          DM9000A_avalonS_wait_counter <= 0;
      else 
        DM9000A_avalonS_wait_counter <= DM9000A_avalonS_counter_load_value;
    end


  assign DM9000A_avalonS_counter_load_value = ((DM9000A_avalonS_in_a_write_cycle & DM9000A_avalonS_begins_xfer))? 1 :
    (~DM9000A_avalonS_wait_counter_eq_0)? DM9000A_avalonS_wait_counter - 1 :
    0;

  assign wait_for_DM9000A_avalonS_counter = DM9000A_avalonS_begins_xfer | ~DM9000A_avalonS_wait_counter_eq_0;
  //assign DM9000A_avalonS_irq_from_sa = DM9000A_avalonS_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign DM9000A_avalonS_irq_from_sa = DM9000A_avalonS_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //DM9000A/avalonS enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module I2C_0_avalonS_arbitrator (
                                  // inputs:
                                   I2C_0_avalonS_irq,
                                   I2C_0_avalonS_readdata,
                                   I2C_0_avalonS_waitrequest_n,
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_byteenable,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_waitrequest,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   reset_n,

                                  // outputs:
                                   I2C_0_avalonS_address,
                                   I2C_0_avalonS_always0,
                                   I2C_0_avalonS_chipselect,
                                   I2C_0_avalonS_irq_from_sa,
                                   I2C_0_avalonS_readdata_from_sa,
                                   I2C_0_avalonS_reset_n,
                                   I2C_0_avalonS_waitrequest_n_from_sa,
                                   I2C_0_avalonS_write,
                                   I2C_0_avalonS_writedata,
                                   cpu_0_data_master_granted_I2C_0_avalonS,
                                   cpu_0_data_master_qualified_request_I2C_0_avalonS,
                                   cpu_0_data_master_read_data_valid_I2C_0_avalonS,
                                   cpu_0_data_master_requests_I2C_0_avalonS,
                                   d1_I2C_0_avalonS_end_xfer
                                )
;

  output  [  2: 0] I2C_0_avalonS_address;
  output           I2C_0_avalonS_always0;
  output           I2C_0_avalonS_chipselect;
  output           I2C_0_avalonS_irq_from_sa;
  output  [  7: 0] I2C_0_avalonS_readdata_from_sa;
  output           I2C_0_avalonS_reset_n;
  output           I2C_0_avalonS_waitrequest_n_from_sa;
  output           I2C_0_avalonS_write;
  output  [  7: 0] I2C_0_avalonS_writedata;
  output           cpu_0_data_master_granted_I2C_0_avalonS;
  output           cpu_0_data_master_qualified_request_I2C_0_avalonS;
  output           cpu_0_data_master_read_data_valid_I2C_0_avalonS;
  output           cpu_0_data_master_requests_I2C_0_avalonS;
  output           d1_I2C_0_avalonS_end_xfer;
  input            I2C_0_avalonS_irq;
  input   [  7: 0] I2C_0_avalonS_readdata;
  input            I2C_0_avalonS_waitrequest_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  2: 0] I2C_0_avalonS_address;
  wire             I2C_0_avalonS_allgrants;
  wire             I2C_0_avalonS_allow_new_arb_cycle;
  wire             I2C_0_avalonS_always0;
  wire             I2C_0_avalonS_any_bursting_master_saved_grant;
  wire             I2C_0_avalonS_any_continuerequest;
  wire             I2C_0_avalonS_arb_counter_enable;
  reg     [  2: 0] I2C_0_avalonS_arb_share_counter;
  wire    [  2: 0] I2C_0_avalonS_arb_share_counter_next_value;
  wire    [  2: 0] I2C_0_avalonS_arb_share_set_values;
  wire             I2C_0_avalonS_beginbursttransfer_internal;
  wire             I2C_0_avalonS_begins_xfer;
  wire             I2C_0_avalonS_chipselect;
  wire             I2C_0_avalonS_end_xfer;
  wire             I2C_0_avalonS_firsttransfer;
  wire             I2C_0_avalonS_grant_vector;
  wire             I2C_0_avalonS_in_a_read_cycle;
  wire             I2C_0_avalonS_in_a_write_cycle;
  wire             I2C_0_avalonS_irq_from_sa;
  wire             I2C_0_avalonS_master_qreq_vector;
  wire             I2C_0_avalonS_non_bursting_master_requests;
  wire             I2C_0_avalonS_pretend_byte_enable;
  wire    [  7: 0] I2C_0_avalonS_readdata_from_sa;
  reg              I2C_0_avalonS_reg_firsttransfer;
  wire             I2C_0_avalonS_reset_n;
  reg              I2C_0_avalonS_slavearbiterlockenable;
  wire             I2C_0_avalonS_slavearbiterlockenable2;
  wire             I2C_0_avalonS_unreg_firsttransfer;
  wire             I2C_0_avalonS_waitrequest_n_from_sa;
  wire             I2C_0_avalonS_waits_for_read;
  wire             I2C_0_avalonS_waits_for_write;
  wire             I2C_0_avalonS_write;
  wire    [  7: 0] I2C_0_avalonS_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_I2C_0_avalonS;
  wire             cpu_0_data_master_qualified_request_I2C_0_avalonS;
  wire             cpu_0_data_master_read_data_valid_I2C_0_avalonS;
  wire             cpu_0_data_master_requests_I2C_0_avalonS;
  wire             cpu_0_data_master_saved_grant_I2C_0_avalonS;
  reg              d1_I2C_0_avalonS_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_I2C_0_avalonS;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_I2C_0_avalonS_from_cpu_0_data_master;
  wire             wait_for_I2C_0_avalonS_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~I2C_0_avalonS_end_xfer;
    end


  assign I2C_0_avalonS_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_I2C_0_avalonS));
  //assign I2C_0_avalonS_readdata_from_sa = I2C_0_avalonS_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign I2C_0_avalonS_readdata_from_sa = I2C_0_avalonS_readdata;

  assign cpu_0_data_master_requests_I2C_0_avalonS = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h900100) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign I2C_0_avalonS_waitrequest_n_from_sa = I2C_0_avalonS_waitrequest_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign I2C_0_avalonS_waitrequest_n_from_sa = I2C_0_avalonS_waitrequest_n;

  //I2C_0_avalonS_arb_share_counter set values, which is an e_mux
  assign I2C_0_avalonS_arb_share_set_values = 1;

  //I2C_0_avalonS_non_bursting_master_requests mux, which is an e_mux
  assign I2C_0_avalonS_non_bursting_master_requests = cpu_0_data_master_requests_I2C_0_avalonS;

  //I2C_0_avalonS_any_bursting_master_saved_grant mux, which is an e_mux
  assign I2C_0_avalonS_any_bursting_master_saved_grant = 0;

  //I2C_0_avalonS_arb_share_counter_next_value assignment, which is an e_assign
  assign I2C_0_avalonS_arb_share_counter_next_value = I2C_0_avalonS_firsttransfer ? (I2C_0_avalonS_arb_share_set_values - 1) : |I2C_0_avalonS_arb_share_counter ? (I2C_0_avalonS_arb_share_counter - 1) : 0;

  //I2C_0_avalonS_allgrants all slave grants, which is an e_mux
  assign I2C_0_avalonS_allgrants = |I2C_0_avalonS_grant_vector;

  //I2C_0_avalonS_end_xfer assignment, which is an e_assign
  assign I2C_0_avalonS_end_xfer = ~(I2C_0_avalonS_waits_for_read | I2C_0_avalonS_waits_for_write);

  //end_xfer_arb_share_counter_term_I2C_0_avalonS arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_I2C_0_avalonS = I2C_0_avalonS_end_xfer & (~I2C_0_avalonS_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //I2C_0_avalonS_arb_share_counter arbitration counter enable, which is an e_assign
  assign I2C_0_avalonS_arb_counter_enable = (end_xfer_arb_share_counter_term_I2C_0_avalonS & I2C_0_avalonS_allgrants) | (end_xfer_arb_share_counter_term_I2C_0_avalonS & ~I2C_0_avalonS_non_bursting_master_requests);

  //I2C_0_avalonS_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          I2C_0_avalonS_arb_share_counter <= 0;
      else if (I2C_0_avalonS_arb_counter_enable)
          I2C_0_avalonS_arb_share_counter <= I2C_0_avalonS_arb_share_counter_next_value;
    end


  //I2C_0_avalonS_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          I2C_0_avalonS_slavearbiterlockenable <= 0;
      else if ((|I2C_0_avalonS_master_qreq_vector & end_xfer_arb_share_counter_term_I2C_0_avalonS) | (end_xfer_arb_share_counter_term_I2C_0_avalonS & ~I2C_0_avalonS_non_bursting_master_requests))
          I2C_0_avalonS_slavearbiterlockenable <= |I2C_0_avalonS_arb_share_counter_next_value;
    end


  //cpu_0/data_master I2C_0/avalonS arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = I2C_0_avalonS_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //I2C_0_avalonS_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign I2C_0_avalonS_slavearbiterlockenable2 = |I2C_0_avalonS_arb_share_counter_next_value;

  //cpu_0/data_master I2C_0/avalonS arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = I2C_0_avalonS_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //I2C_0_avalonS_any_continuerequest at least one master continues requesting, which is an e_assign
  assign I2C_0_avalonS_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_I2C_0_avalonS = cpu_0_data_master_requests_I2C_0_avalonS & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //I2C_0_avalonS_writedata mux, which is an e_mux
  assign I2C_0_avalonS_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_I2C_0_avalonS = cpu_0_data_master_qualified_request_I2C_0_avalonS;

  //cpu_0/data_master saved-grant I2C_0/avalonS, which is an e_assign
  assign cpu_0_data_master_saved_grant_I2C_0_avalonS = cpu_0_data_master_requests_I2C_0_avalonS;

  //allow new arb cycle for I2C_0/avalonS, which is an e_assign
  assign I2C_0_avalonS_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign I2C_0_avalonS_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign I2C_0_avalonS_master_qreq_vector = 1;

  //I2C_0_avalonS_reset_n assignment, which is an e_assign
  assign I2C_0_avalonS_reset_n = reset_n;

  assign I2C_0_avalonS_chipselect = cpu_0_data_master_granted_I2C_0_avalonS;
  //I2C_0_avalonS_firsttransfer first transaction, which is an e_assign
  assign I2C_0_avalonS_firsttransfer = I2C_0_avalonS_begins_xfer ? I2C_0_avalonS_unreg_firsttransfer : I2C_0_avalonS_reg_firsttransfer;

  //I2C_0_avalonS_unreg_firsttransfer first transaction, which is an e_assign
  assign I2C_0_avalonS_unreg_firsttransfer = ~(I2C_0_avalonS_slavearbiterlockenable & I2C_0_avalonS_any_continuerequest);

  //I2C_0_avalonS_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          I2C_0_avalonS_reg_firsttransfer <= 1'b1;
      else if (I2C_0_avalonS_begins_xfer)
          I2C_0_avalonS_reg_firsttransfer <= I2C_0_avalonS_unreg_firsttransfer;
    end


  //I2C_0_avalonS_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign I2C_0_avalonS_beginbursttransfer_internal = I2C_0_avalonS_begins_xfer;

  //I2C_0_avalonS_write assignment, which is an e_mux
  assign I2C_0_avalonS_write = ((cpu_0_data_master_granted_I2C_0_avalonS & cpu_0_data_master_write)) & I2C_0_avalonS_pretend_byte_enable;

  assign shifted_address_to_I2C_0_avalonS_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //I2C_0_avalonS_address mux, which is an e_mux
  assign I2C_0_avalonS_address = shifted_address_to_I2C_0_avalonS_from_cpu_0_data_master >> 2;

  //d1_I2C_0_avalonS_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_I2C_0_avalonS_end_xfer <= 1;
      else 
        d1_I2C_0_avalonS_end_xfer <= I2C_0_avalonS_end_xfer;
    end


  //I2C_0_avalonS_waits_for_read in a cycle, which is an e_mux
  assign I2C_0_avalonS_waits_for_read = I2C_0_avalonS_in_a_read_cycle & ~I2C_0_avalonS_waitrequest_n_from_sa;

  //I2C_0_avalonS_in_a_read_cycle assignment, which is an e_assign
  assign I2C_0_avalonS_in_a_read_cycle = cpu_0_data_master_granted_I2C_0_avalonS & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = I2C_0_avalonS_in_a_read_cycle;

  //I2C_0_avalonS_waits_for_write in a cycle, which is an e_mux
  assign I2C_0_avalonS_waits_for_write = I2C_0_avalonS_in_a_write_cycle & ~I2C_0_avalonS_waitrequest_n_from_sa;

  //I2C_0_avalonS_in_a_write_cycle assignment, which is an e_assign
  assign I2C_0_avalonS_in_a_write_cycle = cpu_0_data_master_granted_I2C_0_avalonS & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = I2C_0_avalonS_in_a_write_cycle;

  assign wait_for_I2C_0_avalonS_counter = 0;
  //I2C_0_avalonS_pretend_byte_enable byte enable port mux, which is an e_mux
  assign I2C_0_avalonS_pretend_byte_enable = (cpu_0_data_master_granted_I2C_0_avalonS)? cpu_0_data_master_byteenable :
    -1;

  //I2C_0_avalonS_always0 always signal, which is an e_assign
  assign I2C_0_avalonS_always0 = 0;

  //assign I2C_0_avalonS_irq_from_sa = I2C_0_avalonS_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign I2C_0_avalonS_irq_from_sa = I2C_0_avalonS_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //I2C_0/avalonS enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ISP1362_avalonS_arbitrator (
                                    // inputs:
                                     ISP1362_avalonS_irq_n,
                                     ISP1362_avalonS_readdata,
                                     clk,
                                     cpu_0_data_master_address_to_slave,
                                     cpu_0_data_master_read,
                                     cpu_0_data_master_write,
                                     cpu_0_data_master_writedata,
                                     reset_n,

                                    // outputs:
                                     ISP1362_avalonS_address,
                                     ISP1362_avalonS_chipselect_n,
                                     ISP1362_avalonS_irq_n_from_sa,
                                     ISP1362_avalonS_read_n,
                                     ISP1362_avalonS_readdata_from_sa,
                                     ISP1362_avalonS_wait_counter_eq_0,
                                     ISP1362_avalonS_wait_counter_eq_1,
                                     ISP1362_avalonS_write_n,
                                     ISP1362_avalonS_writedata,
                                     cpu_0_data_master_granted_ISP1362_avalonS,
                                     cpu_0_data_master_qualified_request_ISP1362_avalonS,
                                     cpu_0_data_master_read_data_valid_ISP1362_avalonS,
                                     cpu_0_data_master_requests_ISP1362_avalonS,
                                     d1_ISP1362_avalonS_end_xfer
                                  )
;

  output  [  1: 0] ISP1362_avalonS_address;
  output           ISP1362_avalonS_chipselect_n;
  output           ISP1362_avalonS_irq_n_from_sa;
  output           ISP1362_avalonS_read_n;
  output  [ 15: 0] ISP1362_avalonS_readdata_from_sa;
  output           ISP1362_avalonS_wait_counter_eq_0;
  output           ISP1362_avalonS_wait_counter_eq_1;
  output           ISP1362_avalonS_write_n;
  output  [ 15: 0] ISP1362_avalonS_writedata;
  output           cpu_0_data_master_granted_ISP1362_avalonS;
  output           cpu_0_data_master_qualified_request_ISP1362_avalonS;
  output           cpu_0_data_master_read_data_valid_ISP1362_avalonS;
  output           cpu_0_data_master_requests_ISP1362_avalonS;
  output           d1_ISP1362_avalonS_end_xfer;
  input            ISP1362_avalonS_irq_n;
  input   [ 15: 0] ISP1362_avalonS_readdata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] ISP1362_avalonS_address;
  wire             ISP1362_avalonS_allgrants;
  wire             ISP1362_avalonS_allow_new_arb_cycle;
  wire             ISP1362_avalonS_any_bursting_master_saved_grant;
  wire             ISP1362_avalonS_any_continuerequest;
  wire             ISP1362_avalonS_arb_counter_enable;
  reg     [  2: 0] ISP1362_avalonS_arb_share_counter;
  wire    [  2: 0] ISP1362_avalonS_arb_share_counter_next_value;
  wire    [  2: 0] ISP1362_avalonS_arb_share_set_values;
  wire             ISP1362_avalonS_beginbursttransfer_internal;
  wire             ISP1362_avalonS_begins_xfer;
  wire             ISP1362_avalonS_chipselect_n;
  wire    [  4: 0] ISP1362_avalonS_counter_load_value;
  wire             ISP1362_avalonS_end_xfer;
  wire             ISP1362_avalonS_firsttransfer;
  wire             ISP1362_avalonS_grant_vector;
  wire             ISP1362_avalonS_in_a_read_cycle;
  wire             ISP1362_avalonS_in_a_write_cycle;
  wire             ISP1362_avalonS_irq_n_from_sa;
  wire             ISP1362_avalonS_master_qreq_vector;
  wire             ISP1362_avalonS_non_bursting_master_requests;
  wire             ISP1362_avalonS_read_n;
  wire    [ 15: 0] ISP1362_avalonS_readdata_from_sa;
  reg              ISP1362_avalonS_reg_firsttransfer;
  reg              ISP1362_avalonS_slavearbiterlockenable;
  wire             ISP1362_avalonS_slavearbiterlockenable2;
  wire             ISP1362_avalonS_unreg_firsttransfer;
  reg     [  4: 0] ISP1362_avalonS_wait_counter;
  wire             ISP1362_avalonS_wait_counter_eq_0;
  wire             ISP1362_avalonS_wait_counter_eq_1;
  wire             ISP1362_avalonS_waits_for_read;
  wire             ISP1362_avalonS_waits_for_write;
  wire             ISP1362_avalonS_write_n;
  wire    [ 15: 0] ISP1362_avalonS_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_ISP1362_avalonS;
  wire             cpu_0_data_master_qualified_request_ISP1362_avalonS;
  wire             cpu_0_data_master_read_data_valid_ISP1362_avalonS;
  wire             cpu_0_data_master_requests_ISP1362_avalonS;
  wire             cpu_0_data_master_saved_grant_ISP1362_avalonS;
  reg              d1_ISP1362_avalonS_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ISP1362_avalonS;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_ISP1362_avalonS_from_cpu_0_data_master;
  wire             wait_for_ISP1362_avalonS_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ISP1362_avalonS_end_xfer;
    end


  assign ISP1362_avalonS_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_ISP1362_avalonS));
  //assign ISP1362_avalonS_readdata_from_sa = ISP1362_avalonS_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ISP1362_avalonS_readdata_from_sa = ISP1362_avalonS_readdata;

  assign cpu_0_data_master_requests_ISP1362_avalonS = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h900080) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //ISP1362_avalonS_arb_share_counter set values, which is an e_mux
  assign ISP1362_avalonS_arb_share_set_values = 1;

  //ISP1362_avalonS_non_bursting_master_requests mux, which is an e_mux
  assign ISP1362_avalonS_non_bursting_master_requests = cpu_0_data_master_requests_ISP1362_avalonS;

  //ISP1362_avalonS_any_bursting_master_saved_grant mux, which is an e_mux
  assign ISP1362_avalonS_any_bursting_master_saved_grant = 0;

  //ISP1362_avalonS_arb_share_counter_next_value assignment, which is an e_assign
  assign ISP1362_avalonS_arb_share_counter_next_value = ISP1362_avalonS_firsttransfer ? (ISP1362_avalonS_arb_share_set_values - 1) : |ISP1362_avalonS_arb_share_counter ? (ISP1362_avalonS_arb_share_counter - 1) : 0;

  //ISP1362_avalonS_allgrants all slave grants, which is an e_mux
  assign ISP1362_avalonS_allgrants = |ISP1362_avalonS_grant_vector;

  //ISP1362_avalonS_end_xfer assignment, which is an e_assign
  assign ISP1362_avalonS_end_xfer = ~(ISP1362_avalonS_waits_for_read | ISP1362_avalonS_waits_for_write);

  //end_xfer_arb_share_counter_term_ISP1362_avalonS arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ISP1362_avalonS = ISP1362_avalonS_end_xfer & (~ISP1362_avalonS_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ISP1362_avalonS_arb_share_counter arbitration counter enable, which is an e_assign
  assign ISP1362_avalonS_arb_counter_enable = (end_xfer_arb_share_counter_term_ISP1362_avalonS & ISP1362_avalonS_allgrants) | (end_xfer_arb_share_counter_term_ISP1362_avalonS & ~ISP1362_avalonS_non_bursting_master_requests);

  //ISP1362_avalonS_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ISP1362_avalonS_arb_share_counter <= 0;
      else if (ISP1362_avalonS_arb_counter_enable)
          ISP1362_avalonS_arb_share_counter <= ISP1362_avalonS_arb_share_counter_next_value;
    end


  //ISP1362_avalonS_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ISP1362_avalonS_slavearbiterlockenable <= 0;
      else if ((|ISP1362_avalonS_master_qreq_vector & end_xfer_arb_share_counter_term_ISP1362_avalonS) | (end_xfer_arb_share_counter_term_ISP1362_avalonS & ~ISP1362_avalonS_non_bursting_master_requests))
          ISP1362_avalonS_slavearbiterlockenable <= |ISP1362_avalonS_arb_share_counter_next_value;
    end


  //cpu_0/data_master ISP1362/avalonS arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = ISP1362_avalonS_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //ISP1362_avalonS_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ISP1362_avalonS_slavearbiterlockenable2 = |ISP1362_avalonS_arb_share_counter_next_value;

  //cpu_0/data_master ISP1362/avalonS arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = ISP1362_avalonS_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //ISP1362_avalonS_any_continuerequest at least one master continues requesting, which is an e_assign
  assign ISP1362_avalonS_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_ISP1362_avalonS = cpu_0_data_master_requests_ISP1362_avalonS;
  //ISP1362_avalonS_writedata mux, which is an e_mux
  assign ISP1362_avalonS_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_ISP1362_avalonS = cpu_0_data_master_qualified_request_ISP1362_avalonS;

  //cpu_0/data_master saved-grant ISP1362/avalonS, which is an e_assign
  assign cpu_0_data_master_saved_grant_ISP1362_avalonS = cpu_0_data_master_requests_ISP1362_avalonS;

  //allow new arb cycle for ISP1362/avalonS, which is an e_assign
  assign ISP1362_avalonS_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign ISP1362_avalonS_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign ISP1362_avalonS_master_qreq_vector = 1;

  assign ISP1362_avalonS_chipselect_n = ~cpu_0_data_master_granted_ISP1362_avalonS;
  //ISP1362_avalonS_firsttransfer first transaction, which is an e_assign
  assign ISP1362_avalonS_firsttransfer = ISP1362_avalonS_begins_xfer ? ISP1362_avalonS_unreg_firsttransfer : ISP1362_avalonS_reg_firsttransfer;

  //ISP1362_avalonS_unreg_firsttransfer first transaction, which is an e_assign
  assign ISP1362_avalonS_unreg_firsttransfer = ~(ISP1362_avalonS_slavearbiterlockenable & ISP1362_avalonS_any_continuerequest);

  //ISP1362_avalonS_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ISP1362_avalonS_reg_firsttransfer <= 1'b1;
      else if (ISP1362_avalonS_begins_xfer)
          ISP1362_avalonS_reg_firsttransfer <= ISP1362_avalonS_unreg_firsttransfer;
    end


  //ISP1362_avalonS_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ISP1362_avalonS_beginbursttransfer_internal = ISP1362_avalonS_begins_xfer;

  //~ISP1362_avalonS_read_n assignment, which is an e_mux
  assign ISP1362_avalonS_read_n = ~(((cpu_0_data_master_granted_ISP1362_avalonS & cpu_0_data_master_read))& ~ISP1362_avalonS_begins_xfer & (ISP1362_avalonS_wait_counter < 5));

  //~ISP1362_avalonS_write_n assignment, which is an e_mux
  assign ISP1362_avalonS_write_n = ~(((cpu_0_data_master_granted_ISP1362_avalonS & cpu_0_data_master_write)) & ~ISP1362_avalonS_begins_xfer & (ISP1362_avalonS_wait_counter >= 10) & (ISP1362_avalonS_wait_counter < 15));

  assign shifted_address_to_ISP1362_avalonS_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //ISP1362_avalonS_address mux, which is an e_mux
  assign ISP1362_avalonS_address = shifted_address_to_ISP1362_avalonS_from_cpu_0_data_master >> 2;

  //d1_ISP1362_avalonS_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ISP1362_avalonS_end_xfer <= 1;
      else 
        d1_ISP1362_avalonS_end_xfer <= ISP1362_avalonS_end_xfer;
    end


  //ISP1362_avalonS_wait_counter_eq_1 assignment, which is an e_assign
  assign ISP1362_avalonS_wait_counter_eq_1 = ISP1362_avalonS_wait_counter == 1;

  //ISP1362_avalonS_waits_for_read in a cycle, which is an e_mux
  assign ISP1362_avalonS_waits_for_read = ISP1362_avalonS_in_a_read_cycle & wait_for_ISP1362_avalonS_counter;

  //ISP1362_avalonS_in_a_read_cycle assignment, which is an e_assign
  assign ISP1362_avalonS_in_a_read_cycle = cpu_0_data_master_granted_ISP1362_avalonS & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ISP1362_avalonS_in_a_read_cycle;

  //ISP1362_avalonS_waits_for_write in a cycle, which is an e_mux
  assign ISP1362_avalonS_waits_for_write = ISP1362_avalonS_in_a_write_cycle & wait_for_ISP1362_avalonS_counter;

  //ISP1362_avalonS_in_a_write_cycle assignment, which is an e_assign
  assign ISP1362_avalonS_in_a_write_cycle = cpu_0_data_master_granted_ISP1362_avalonS & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ISP1362_avalonS_in_a_write_cycle;

  assign ISP1362_avalonS_wait_counter_eq_0 = ISP1362_avalonS_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ISP1362_avalonS_wait_counter <= 0;
      else 
        ISP1362_avalonS_wait_counter <= ISP1362_avalonS_counter_load_value;
    end


  assign ISP1362_avalonS_counter_load_value = ((ISP1362_avalonS_in_a_write_cycle & ISP1362_avalonS_begins_xfer))? 23 :
    ((ISP1362_avalonS_in_a_read_cycle & ISP1362_avalonS_begins_xfer))? 13 :
    (~ISP1362_avalonS_wait_counter_eq_0)? ISP1362_avalonS_wait_counter - 1 :
    0;

  assign wait_for_ISP1362_avalonS_counter = ISP1362_avalonS_begins_xfer | ~ISP1362_avalonS_wait_counter_eq_0;
  //assign ISP1362_avalonS_irq_n_from_sa = ISP1362_avalonS_irq_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ISP1362_avalonS_irq_n_from_sa = ISP1362_avalonS_irq_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ISP1362/avalonS enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SEG7_Display_avalonS_arbitrator (
                                         // inputs:
                                          clk,
                                          cpu_0_data_master_address_to_slave,
                                          cpu_0_data_master_read,
                                          cpu_0_data_master_waitrequest,
                                          cpu_0_data_master_write,
                                          cpu_0_data_master_writedata,
                                          reset_n,

                                         // outputs:
                                          SEG7_Display_avalonS_reset_n,
                                          SEG7_Display_avalonS_write,
                                          SEG7_Display_avalonS_writedata,
                                          cpu_0_data_master_granted_SEG7_Display_avalonS,
                                          cpu_0_data_master_qualified_request_SEG7_Display_avalonS,
                                          cpu_0_data_master_read_data_valid_SEG7_Display_avalonS,
                                          cpu_0_data_master_requests_SEG7_Display_avalonS,
                                          d1_SEG7_Display_avalonS_end_xfer
                                       )
;

  output           SEG7_Display_avalonS_reset_n;
  output           SEG7_Display_avalonS_write;
  output  [ 31: 0] SEG7_Display_avalonS_writedata;
  output           cpu_0_data_master_granted_SEG7_Display_avalonS;
  output           cpu_0_data_master_qualified_request_SEG7_Display_avalonS;
  output           cpu_0_data_master_read_data_valid_SEG7_Display_avalonS;
  output           cpu_0_data_master_requests_SEG7_Display_avalonS;
  output           d1_SEG7_Display_avalonS_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire             SEG7_Display_avalonS_allgrants;
  wire             SEG7_Display_avalonS_allow_new_arb_cycle;
  wire             SEG7_Display_avalonS_any_bursting_master_saved_grant;
  wire             SEG7_Display_avalonS_any_continuerequest;
  wire             SEG7_Display_avalonS_arb_counter_enable;
  reg     [  2: 0] SEG7_Display_avalonS_arb_share_counter;
  wire    [  2: 0] SEG7_Display_avalonS_arb_share_counter_next_value;
  wire    [  2: 0] SEG7_Display_avalonS_arb_share_set_values;
  wire             SEG7_Display_avalonS_beginbursttransfer_internal;
  wire             SEG7_Display_avalonS_begins_xfer;
  wire             SEG7_Display_avalonS_end_xfer;
  wire             SEG7_Display_avalonS_firsttransfer;
  wire             SEG7_Display_avalonS_grant_vector;
  wire             SEG7_Display_avalonS_in_a_read_cycle;
  wire             SEG7_Display_avalonS_in_a_write_cycle;
  wire             SEG7_Display_avalonS_master_qreq_vector;
  wire             SEG7_Display_avalonS_non_bursting_master_requests;
  reg              SEG7_Display_avalonS_reg_firsttransfer;
  wire             SEG7_Display_avalonS_reset_n;
  reg              SEG7_Display_avalonS_slavearbiterlockenable;
  wire             SEG7_Display_avalonS_slavearbiterlockenable2;
  wire             SEG7_Display_avalonS_unreg_firsttransfer;
  wire             SEG7_Display_avalonS_waits_for_read;
  wire             SEG7_Display_avalonS_waits_for_write;
  wire             SEG7_Display_avalonS_write;
  wire    [ 31: 0] SEG7_Display_avalonS_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_SEG7_Display_avalonS;
  wire             cpu_0_data_master_qualified_request_SEG7_Display_avalonS;
  wire             cpu_0_data_master_read_data_valid_SEG7_Display_avalonS;
  wire             cpu_0_data_master_requests_SEG7_Display_avalonS;
  wire             cpu_0_data_master_saved_grant_SEG7_Display_avalonS;
  reg              d1_SEG7_Display_avalonS_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SEG7_Display_avalonS;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_SEG7_Display_avalonS_from_cpu_0_data_master;
  wire             wait_for_SEG7_Display_avalonS_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SEG7_Display_avalonS_end_xfer;
    end


  assign SEG7_Display_avalonS_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_SEG7_Display_avalonS));
  assign cpu_0_data_master_requests_SEG7_Display_avalonS = (({cpu_0_data_master_address_to_slave[24 : 2] , 2'b0} == 25'h900028) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_write;
  //SEG7_Display_avalonS_arb_share_counter set values, which is an e_mux
  assign SEG7_Display_avalonS_arb_share_set_values = 1;

  //SEG7_Display_avalonS_non_bursting_master_requests mux, which is an e_mux
  assign SEG7_Display_avalonS_non_bursting_master_requests = cpu_0_data_master_requests_SEG7_Display_avalonS;

  //SEG7_Display_avalonS_any_bursting_master_saved_grant mux, which is an e_mux
  assign SEG7_Display_avalonS_any_bursting_master_saved_grant = 0;

  //SEG7_Display_avalonS_arb_share_counter_next_value assignment, which is an e_assign
  assign SEG7_Display_avalonS_arb_share_counter_next_value = SEG7_Display_avalonS_firsttransfer ? (SEG7_Display_avalonS_arb_share_set_values - 1) : |SEG7_Display_avalonS_arb_share_counter ? (SEG7_Display_avalonS_arb_share_counter - 1) : 0;

  //SEG7_Display_avalonS_allgrants all slave grants, which is an e_mux
  assign SEG7_Display_avalonS_allgrants = |SEG7_Display_avalonS_grant_vector;

  //SEG7_Display_avalonS_end_xfer assignment, which is an e_assign
  assign SEG7_Display_avalonS_end_xfer = ~(SEG7_Display_avalonS_waits_for_read | SEG7_Display_avalonS_waits_for_write);

  //end_xfer_arb_share_counter_term_SEG7_Display_avalonS arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SEG7_Display_avalonS = SEG7_Display_avalonS_end_xfer & (~SEG7_Display_avalonS_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SEG7_Display_avalonS_arb_share_counter arbitration counter enable, which is an e_assign
  assign SEG7_Display_avalonS_arb_counter_enable = (end_xfer_arb_share_counter_term_SEG7_Display_avalonS & SEG7_Display_avalonS_allgrants) | (end_xfer_arb_share_counter_term_SEG7_Display_avalonS & ~SEG7_Display_avalonS_non_bursting_master_requests);

  //SEG7_Display_avalonS_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SEG7_Display_avalonS_arb_share_counter <= 0;
      else if (SEG7_Display_avalonS_arb_counter_enable)
          SEG7_Display_avalonS_arb_share_counter <= SEG7_Display_avalonS_arb_share_counter_next_value;
    end


  //SEG7_Display_avalonS_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SEG7_Display_avalonS_slavearbiterlockenable <= 0;
      else if ((|SEG7_Display_avalonS_master_qreq_vector & end_xfer_arb_share_counter_term_SEG7_Display_avalonS) | (end_xfer_arb_share_counter_term_SEG7_Display_avalonS & ~SEG7_Display_avalonS_non_bursting_master_requests))
          SEG7_Display_avalonS_slavearbiterlockenable <= |SEG7_Display_avalonS_arb_share_counter_next_value;
    end


  //cpu_0/data_master SEG7_Display/avalonS arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = SEG7_Display_avalonS_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //SEG7_Display_avalonS_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SEG7_Display_avalonS_slavearbiterlockenable2 = |SEG7_Display_avalonS_arb_share_counter_next_value;

  //cpu_0/data_master SEG7_Display/avalonS arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = SEG7_Display_avalonS_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //SEG7_Display_avalonS_any_continuerequest at least one master continues requesting, which is an e_assign
  assign SEG7_Display_avalonS_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_SEG7_Display_avalonS = cpu_0_data_master_requests_SEG7_Display_avalonS & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //SEG7_Display_avalonS_writedata mux, which is an e_mux
  assign SEG7_Display_avalonS_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_SEG7_Display_avalonS = cpu_0_data_master_qualified_request_SEG7_Display_avalonS;

  //cpu_0/data_master saved-grant SEG7_Display/avalonS, which is an e_assign
  assign cpu_0_data_master_saved_grant_SEG7_Display_avalonS = cpu_0_data_master_requests_SEG7_Display_avalonS;

  //allow new arb cycle for SEG7_Display/avalonS, which is an e_assign
  assign SEG7_Display_avalonS_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign SEG7_Display_avalonS_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign SEG7_Display_avalonS_master_qreq_vector = 1;

  //SEG7_Display_avalonS_reset_n assignment, which is an e_assign
  assign SEG7_Display_avalonS_reset_n = reset_n;

  //SEG7_Display_avalonS_firsttransfer first transaction, which is an e_assign
  assign SEG7_Display_avalonS_firsttransfer = SEG7_Display_avalonS_begins_xfer ? SEG7_Display_avalonS_unreg_firsttransfer : SEG7_Display_avalonS_reg_firsttransfer;

  //SEG7_Display_avalonS_unreg_firsttransfer first transaction, which is an e_assign
  assign SEG7_Display_avalonS_unreg_firsttransfer = ~(SEG7_Display_avalonS_slavearbiterlockenable & SEG7_Display_avalonS_any_continuerequest);

  //SEG7_Display_avalonS_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SEG7_Display_avalonS_reg_firsttransfer <= 1'b1;
      else if (SEG7_Display_avalonS_begins_xfer)
          SEG7_Display_avalonS_reg_firsttransfer <= SEG7_Display_avalonS_unreg_firsttransfer;
    end


  //SEG7_Display_avalonS_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SEG7_Display_avalonS_beginbursttransfer_internal = SEG7_Display_avalonS_begins_xfer;

  //SEG7_Display_avalonS_write assignment, which is an e_mux
  assign SEG7_Display_avalonS_write = cpu_0_data_master_granted_SEG7_Display_avalonS & cpu_0_data_master_write;

  assign shifted_address_to_SEG7_Display_avalonS_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //d1_SEG7_Display_avalonS_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SEG7_Display_avalonS_end_xfer <= 1;
      else 
        d1_SEG7_Display_avalonS_end_xfer <= SEG7_Display_avalonS_end_xfer;
    end


  //SEG7_Display_avalonS_waits_for_read in a cycle, which is an e_mux
  assign SEG7_Display_avalonS_waits_for_read = SEG7_Display_avalonS_in_a_read_cycle & 0;

  //SEG7_Display_avalonS_in_a_read_cycle assignment, which is an e_assign
  assign SEG7_Display_avalonS_in_a_read_cycle = cpu_0_data_master_granted_SEG7_Display_avalonS & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SEG7_Display_avalonS_in_a_read_cycle;

  //SEG7_Display_avalonS_waits_for_write in a cycle, which is an e_mux
  assign SEG7_Display_avalonS_waits_for_write = SEG7_Display_avalonS_in_a_write_cycle & 0;

  //SEG7_Display_avalonS_in_a_write_cycle assignment, which is an e_assign
  assign SEG7_Display_avalonS_in_a_write_cycle = cpu_0_data_master_granted_SEG7_Display_avalonS & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SEG7_Display_avalonS_in_a_write_cycle;

  assign wait_for_SEG7_Display_avalonS_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SEG7_Display/avalonS enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module binary_vga_controller_0_avalon_slave_0_arbitrator (
                                                           // inputs:
                                                            binary_vga_controller_0_avalon_slave_0_readdata,
                                                            clk,
                                                            cpu_0_data_master_address_to_slave,
                                                            cpu_0_data_master_read,
                                                            cpu_0_data_master_write,
                                                            cpu_0_data_master_writedata,
                                                            reset_n,

                                                           // outputs:
                                                            binary_vga_controller_0_avalon_slave_0_address,
                                                            binary_vga_controller_0_avalon_slave_0_chipselect,
                                                            binary_vga_controller_0_avalon_slave_0_read,
                                                            binary_vga_controller_0_avalon_slave_0_readdata_from_sa,
                                                            binary_vga_controller_0_avalon_slave_0_reset_n,
                                                            binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0,
                                                            binary_vga_controller_0_avalon_slave_0_write,
                                                            binary_vga_controller_0_avalon_slave_0_writedata,
                                                            cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0,
                                                            cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0,
                                                            cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0,
                                                            cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0,
                                                            d1_binary_vga_controller_0_avalon_slave_0_end_xfer
                                                         )
;

  output  [ 18: 0] binary_vga_controller_0_avalon_slave_0_address;
  output           binary_vga_controller_0_avalon_slave_0_chipselect;
  output           binary_vga_controller_0_avalon_slave_0_read;
  output  [ 15: 0] binary_vga_controller_0_avalon_slave_0_readdata_from_sa;
  output           binary_vga_controller_0_avalon_slave_0_reset_n;
  output           binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0;
  output           binary_vga_controller_0_avalon_slave_0_write;
  output  [ 15: 0] binary_vga_controller_0_avalon_slave_0_writedata;
  output           cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0;
  output           cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0;
  output           cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0;
  output           cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0;
  output           d1_binary_vga_controller_0_avalon_slave_0_end_xfer;
  input   [ 15: 0] binary_vga_controller_0_avalon_slave_0_readdata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [ 18: 0] binary_vga_controller_0_avalon_slave_0_address;
  wire             binary_vga_controller_0_avalon_slave_0_allgrants;
  wire             binary_vga_controller_0_avalon_slave_0_allow_new_arb_cycle;
  wire             binary_vga_controller_0_avalon_slave_0_any_bursting_master_saved_grant;
  wire             binary_vga_controller_0_avalon_slave_0_any_continuerequest;
  wire             binary_vga_controller_0_avalon_slave_0_arb_counter_enable;
  reg     [  2: 0] binary_vga_controller_0_avalon_slave_0_arb_share_counter;
  wire    [  2: 0] binary_vga_controller_0_avalon_slave_0_arb_share_counter_next_value;
  wire    [  2: 0] binary_vga_controller_0_avalon_slave_0_arb_share_set_values;
  wire             binary_vga_controller_0_avalon_slave_0_beginbursttransfer_internal;
  wire             binary_vga_controller_0_avalon_slave_0_begins_xfer;
  wire             binary_vga_controller_0_avalon_slave_0_chipselect;
  wire             binary_vga_controller_0_avalon_slave_0_counter_load_value;
  wire             binary_vga_controller_0_avalon_slave_0_end_xfer;
  wire             binary_vga_controller_0_avalon_slave_0_firsttransfer;
  wire             binary_vga_controller_0_avalon_slave_0_grant_vector;
  wire             binary_vga_controller_0_avalon_slave_0_in_a_read_cycle;
  wire             binary_vga_controller_0_avalon_slave_0_in_a_write_cycle;
  wire             binary_vga_controller_0_avalon_slave_0_master_qreq_vector;
  wire             binary_vga_controller_0_avalon_slave_0_non_bursting_master_requests;
  wire             binary_vga_controller_0_avalon_slave_0_read;
  wire    [ 15: 0] binary_vga_controller_0_avalon_slave_0_readdata_from_sa;
  reg              binary_vga_controller_0_avalon_slave_0_reg_firsttransfer;
  wire             binary_vga_controller_0_avalon_slave_0_reset_n;
  reg              binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable;
  wire             binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable2;
  wire             binary_vga_controller_0_avalon_slave_0_unreg_firsttransfer;
  reg              binary_vga_controller_0_avalon_slave_0_wait_counter;
  wire             binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0;
  wire             binary_vga_controller_0_avalon_slave_0_waits_for_read;
  wire             binary_vga_controller_0_avalon_slave_0_waits_for_write;
  wire             binary_vga_controller_0_avalon_slave_0_write;
  wire    [ 15: 0] binary_vga_controller_0_avalon_slave_0_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0;
  wire             cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0;
  wire             cpu_0_data_master_saved_grant_binary_vga_controller_0_avalon_slave_0;
  reg              d1_binary_vga_controller_0_avalon_slave_0_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_binary_vga_controller_0_avalon_slave_0;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_binary_vga_controller_0_avalon_slave_0_from_cpu_0_data_master;
  wire             wait_for_binary_vga_controller_0_avalon_slave_0_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~binary_vga_controller_0_avalon_slave_0_end_xfer;
    end


  assign binary_vga_controller_0_avalon_slave_0_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0));
  //assign binary_vga_controller_0_avalon_slave_0_readdata_from_sa = binary_vga_controller_0_avalon_slave_0_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_readdata_from_sa = binary_vga_controller_0_avalon_slave_0_readdata;

  assign cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0 = ({cpu_0_data_master_address_to_slave[24 : 21] , 21'b0} == 25'ha00000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //binary_vga_controller_0_avalon_slave_0_arb_share_counter set values, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_arb_share_set_values = 1;

  //binary_vga_controller_0_avalon_slave_0_non_bursting_master_requests mux, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_non_bursting_master_requests = cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0;

  //binary_vga_controller_0_avalon_slave_0_any_bursting_master_saved_grant mux, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_any_bursting_master_saved_grant = 0;

  //binary_vga_controller_0_avalon_slave_0_arb_share_counter_next_value assignment, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_arb_share_counter_next_value = binary_vga_controller_0_avalon_slave_0_firsttransfer ? (binary_vga_controller_0_avalon_slave_0_arb_share_set_values - 1) : |binary_vga_controller_0_avalon_slave_0_arb_share_counter ? (binary_vga_controller_0_avalon_slave_0_arb_share_counter - 1) : 0;

  //binary_vga_controller_0_avalon_slave_0_allgrants all slave grants, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_allgrants = |binary_vga_controller_0_avalon_slave_0_grant_vector;

  //binary_vga_controller_0_avalon_slave_0_end_xfer assignment, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_end_xfer = ~(binary_vga_controller_0_avalon_slave_0_waits_for_read | binary_vga_controller_0_avalon_slave_0_waits_for_write);

  //end_xfer_arb_share_counter_term_binary_vga_controller_0_avalon_slave_0 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_binary_vga_controller_0_avalon_slave_0 = binary_vga_controller_0_avalon_slave_0_end_xfer & (~binary_vga_controller_0_avalon_slave_0_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //binary_vga_controller_0_avalon_slave_0_arb_share_counter arbitration counter enable, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_arb_counter_enable = (end_xfer_arb_share_counter_term_binary_vga_controller_0_avalon_slave_0 & binary_vga_controller_0_avalon_slave_0_allgrants) | (end_xfer_arb_share_counter_term_binary_vga_controller_0_avalon_slave_0 & ~binary_vga_controller_0_avalon_slave_0_non_bursting_master_requests);

  //binary_vga_controller_0_avalon_slave_0_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          binary_vga_controller_0_avalon_slave_0_arb_share_counter <= 0;
      else if (binary_vga_controller_0_avalon_slave_0_arb_counter_enable)
          binary_vga_controller_0_avalon_slave_0_arb_share_counter <= binary_vga_controller_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable <= 0;
      else if ((|binary_vga_controller_0_avalon_slave_0_master_qreq_vector & end_xfer_arb_share_counter_term_binary_vga_controller_0_avalon_slave_0) | (end_xfer_arb_share_counter_term_binary_vga_controller_0_avalon_slave_0 & ~binary_vga_controller_0_avalon_slave_0_non_bursting_master_requests))
          binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable <= |binary_vga_controller_0_avalon_slave_0_arb_share_counter_next_value;
    end


  //cpu_0/data_master binary_vga_controller_0/avalon_slave_0 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable2 = |binary_vga_controller_0_avalon_slave_0_arb_share_counter_next_value;

  //cpu_0/data_master binary_vga_controller_0/avalon_slave_0 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //binary_vga_controller_0_avalon_slave_0_any_continuerequest at least one master continues requesting, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0 = cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0;
  //binary_vga_controller_0_avalon_slave_0_writedata mux, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0 = cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0;

  //cpu_0/data_master saved-grant binary_vga_controller_0/avalon_slave_0, which is an e_assign
  assign cpu_0_data_master_saved_grant_binary_vga_controller_0_avalon_slave_0 = cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0;

  //allow new arb cycle for binary_vga_controller_0/avalon_slave_0, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign binary_vga_controller_0_avalon_slave_0_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign binary_vga_controller_0_avalon_slave_0_master_qreq_vector = 1;

  //binary_vga_controller_0_avalon_slave_0_reset_n assignment, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_reset_n = reset_n;

  assign binary_vga_controller_0_avalon_slave_0_chipselect = cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0;
  //binary_vga_controller_0_avalon_slave_0_firsttransfer first transaction, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_firsttransfer = binary_vga_controller_0_avalon_slave_0_begins_xfer ? binary_vga_controller_0_avalon_slave_0_unreg_firsttransfer : binary_vga_controller_0_avalon_slave_0_reg_firsttransfer;

  //binary_vga_controller_0_avalon_slave_0_unreg_firsttransfer first transaction, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_unreg_firsttransfer = ~(binary_vga_controller_0_avalon_slave_0_slavearbiterlockenable & binary_vga_controller_0_avalon_slave_0_any_continuerequest);

  //binary_vga_controller_0_avalon_slave_0_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          binary_vga_controller_0_avalon_slave_0_reg_firsttransfer <= 1'b1;
      else if (binary_vga_controller_0_avalon_slave_0_begins_xfer)
          binary_vga_controller_0_avalon_slave_0_reg_firsttransfer <= binary_vga_controller_0_avalon_slave_0_unreg_firsttransfer;
    end


  //binary_vga_controller_0_avalon_slave_0_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_beginbursttransfer_internal = binary_vga_controller_0_avalon_slave_0_begins_xfer;

  //binary_vga_controller_0_avalon_slave_0_read assignment, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_read = ((cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0 & cpu_0_data_master_read))& ~binary_vga_controller_0_avalon_slave_0_begins_xfer;

  //binary_vga_controller_0_avalon_slave_0_write assignment, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_write = ((cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0 & cpu_0_data_master_write)) & ~binary_vga_controller_0_avalon_slave_0_begins_xfer & (binary_vga_controller_0_avalon_slave_0_wait_counter >= 1);

  assign shifted_address_to_binary_vga_controller_0_avalon_slave_0_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //binary_vga_controller_0_avalon_slave_0_address mux, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_address = shifted_address_to_binary_vga_controller_0_avalon_slave_0_from_cpu_0_data_master >> 2;

  //d1_binary_vga_controller_0_avalon_slave_0_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_binary_vga_controller_0_avalon_slave_0_end_xfer <= 1;
      else 
        d1_binary_vga_controller_0_avalon_slave_0_end_xfer <= binary_vga_controller_0_avalon_slave_0_end_xfer;
    end


  //binary_vga_controller_0_avalon_slave_0_waits_for_read in a cycle, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_waits_for_read = binary_vga_controller_0_avalon_slave_0_in_a_read_cycle & binary_vga_controller_0_avalon_slave_0_begins_xfer;

  //binary_vga_controller_0_avalon_slave_0_in_a_read_cycle assignment, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_in_a_read_cycle = cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = binary_vga_controller_0_avalon_slave_0_in_a_read_cycle;

  //binary_vga_controller_0_avalon_slave_0_waits_for_write in a cycle, which is an e_mux
  assign binary_vga_controller_0_avalon_slave_0_waits_for_write = binary_vga_controller_0_avalon_slave_0_in_a_write_cycle & wait_for_binary_vga_controller_0_avalon_slave_0_counter;

  //binary_vga_controller_0_avalon_slave_0_in_a_write_cycle assignment, which is an e_assign
  assign binary_vga_controller_0_avalon_slave_0_in_a_write_cycle = cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = binary_vga_controller_0_avalon_slave_0_in_a_write_cycle;

  assign binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0 = binary_vga_controller_0_avalon_slave_0_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          binary_vga_controller_0_avalon_slave_0_wait_counter <= 0;
      else 
        binary_vga_controller_0_avalon_slave_0_wait_counter <= binary_vga_controller_0_avalon_slave_0_counter_load_value;
    end


  assign binary_vga_controller_0_avalon_slave_0_counter_load_value = ((binary_vga_controller_0_avalon_slave_0_in_a_write_cycle & binary_vga_controller_0_avalon_slave_0_begins_xfer))? 1 :
    (~binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0)? binary_vga_controller_0_avalon_slave_0_wait_counter - 1 :
    0;

  assign wait_for_binary_vga_controller_0_avalon_slave_0_counter = binary_vga_controller_0_avalon_slave_0_begins_xfer | ~binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //binary_vga_controller_0/avalon_slave_0 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module button_pio_s1_arbitrator (
                                  // inputs:
                                   button_pio_s1_irq,
                                   button_pio_s1_readdata,
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_waitrequest,
                                   cpu_0_data_master_write,
                                   cpu_0_data_master_writedata,
                                   reset_n,

                                  // outputs:
                                   button_pio_s1_address,
                                   button_pio_s1_chipselect,
                                   button_pio_s1_irq_from_sa,
                                   button_pio_s1_readdata_from_sa,
                                   button_pio_s1_reset_n,
                                   button_pio_s1_write_n,
                                   button_pio_s1_writedata,
                                   cpu_0_data_master_granted_button_pio_s1,
                                   cpu_0_data_master_qualified_request_button_pio_s1,
                                   cpu_0_data_master_read_data_valid_button_pio_s1,
                                   cpu_0_data_master_requests_button_pio_s1,
                                   d1_button_pio_s1_end_xfer
                                )
;

  output  [  1: 0] button_pio_s1_address;
  output           button_pio_s1_chipselect;
  output           button_pio_s1_irq_from_sa;
  output  [ 31: 0] button_pio_s1_readdata_from_sa;
  output           button_pio_s1_reset_n;
  output           button_pio_s1_write_n;
  output  [ 31: 0] button_pio_s1_writedata;
  output           cpu_0_data_master_granted_button_pio_s1;
  output           cpu_0_data_master_qualified_request_button_pio_s1;
  output           cpu_0_data_master_read_data_valid_button_pio_s1;
  output           cpu_0_data_master_requests_button_pio_s1;
  output           d1_button_pio_s1_end_xfer;
  input            button_pio_s1_irq;
  input   [ 31: 0] button_pio_s1_readdata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] button_pio_s1_address;
  wire             button_pio_s1_allgrants;
  wire             button_pio_s1_allow_new_arb_cycle;
  wire             button_pio_s1_any_bursting_master_saved_grant;
  wire             button_pio_s1_any_continuerequest;
  wire             button_pio_s1_arb_counter_enable;
  reg     [  2: 0] button_pio_s1_arb_share_counter;
  wire    [  2: 0] button_pio_s1_arb_share_counter_next_value;
  wire    [  2: 0] button_pio_s1_arb_share_set_values;
  wire             button_pio_s1_beginbursttransfer_internal;
  wire             button_pio_s1_begins_xfer;
  wire             button_pio_s1_chipselect;
  wire             button_pio_s1_end_xfer;
  wire             button_pio_s1_firsttransfer;
  wire             button_pio_s1_grant_vector;
  wire             button_pio_s1_in_a_read_cycle;
  wire             button_pio_s1_in_a_write_cycle;
  wire             button_pio_s1_irq_from_sa;
  wire             button_pio_s1_master_qreq_vector;
  wire             button_pio_s1_non_bursting_master_requests;
  wire    [ 31: 0] button_pio_s1_readdata_from_sa;
  reg              button_pio_s1_reg_firsttransfer;
  wire             button_pio_s1_reset_n;
  reg              button_pio_s1_slavearbiterlockenable;
  wire             button_pio_s1_slavearbiterlockenable2;
  wire             button_pio_s1_unreg_firsttransfer;
  wire             button_pio_s1_waits_for_read;
  wire             button_pio_s1_waits_for_write;
  wire             button_pio_s1_write_n;
  wire    [ 31: 0] button_pio_s1_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_button_pio_s1;
  wire             cpu_0_data_master_qualified_request_button_pio_s1;
  wire             cpu_0_data_master_read_data_valid_button_pio_s1;
  wire             cpu_0_data_master_requests_button_pio_s1;
  wire             cpu_0_data_master_saved_grant_button_pio_s1;
  reg              d1_button_pio_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_button_pio_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_button_pio_s1_from_cpu_0_data_master;
  wire             wait_for_button_pio_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~button_pio_s1_end_xfer;
    end


  assign button_pio_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_button_pio_s1));
  //assign button_pio_s1_readdata_from_sa = button_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign button_pio_s1_readdata_from_sa = button_pio_s1_readdata;

  assign cpu_0_data_master_requests_button_pio_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h900120) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //button_pio_s1_arb_share_counter set values, which is an e_mux
  assign button_pio_s1_arb_share_set_values = 1;

  //button_pio_s1_non_bursting_master_requests mux, which is an e_mux
  assign button_pio_s1_non_bursting_master_requests = cpu_0_data_master_requests_button_pio_s1;

  //button_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign button_pio_s1_any_bursting_master_saved_grant = 0;

  //button_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign button_pio_s1_arb_share_counter_next_value = button_pio_s1_firsttransfer ? (button_pio_s1_arb_share_set_values - 1) : |button_pio_s1_arb_share_counter ? (button_pio_s1_arb_share_counter - 1) : 0;

  //button_pio_s1_allgrants all slave grants, which is an e_mux
  assign button_pio_s1_allgrants = |button_pio_s1_grant_vector;

  //button_pio_s1_end_xfer assignment, which is an e_assign
  assign button_pio_s1_end_xfer = ~(button_pio_s1_waits_for_read | button_pio_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_button_pio_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_button_pio_s1 = button_pio_s1_end_xfer & (~button_pio_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //button_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign button_pio_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_button_pio_s1 & button_pio_s1_allgrants) | (end_xfer_arb_share_counter_term_button_pio_s1 & ~button_pio_s1_non_bursting_master_requests);

  //button_pio_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_arb_share_counter <= 0;
      else if (button_pio_s1_arb_counter_enable)
          button_pio_s1_arb_share_counter <= button_pio_s1_arb_share_counter_next_value;
    end


  //button_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_slavearbiterlockenable <= 0;
      else if ((|button_pio_s1_master_qreq_vector & end_xfer_arb_share_counter_term_button_pio_s1) | (end_xfer_arb_share_counter_term_button_pio_s1 & ~button_pio_s1_non_bursting_master_requests))
          button_pio_s1_slavearbiterlockenable <= |button_pio_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master button_pio/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = button_pio_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //button_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign button_pio_s1_slavearbiterlockenable2 = |button_pio_s1_arb_share_counter_next_value;

  //cpu_0/data_master button_pio/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = button_pio_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //button_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign button_pio_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_button_pio_s1 = cpu_0_data_master_requests_button_pio_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //button_pio_s1_writedata mux, which is an e_mux
  assign button_pio_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_button_pio_s1 = cpu_0_data_master_qualified_request_button_pio_s1;

  //cpu_0/data_master saved-grant button_pio/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_button_pio_s1 = cpu_0_data_master_requests_button_pio_s1;

  //allow new arb cycle for button_pio/s1, which is an e_assign
  assign button_pio_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign button_pio_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign button_pio_s1_master_qreq_vector = 1;

  //button_pio_s1_reset_n assignment, which is an e_assign
  assign button_pio_s1_reset_n = reset_n;

  assign button_pio_s1_chipselect = cpu_0_data_master_granted_button_pio_s1;
  //button_pio_s1_firsttransfer first transaction, which is an e_assign
  assign button_pio_s1_firsttransfer = button_pio_s1_begins_xfer ? button_pio_s1_unreg_firsttransfer : button_pio_s1_reg_firsttransfer;

  //button_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign button_pio_s1_unreg_firsttransfer = ~(button_pio_s1_slavearbiterlockenable & button_pio_s1_any_continuerequest);

  //button_pio_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          button_pio_s1_reg_firsttransfer <= 1'b1;
      else if (button_pio_s1_begins_xfer)
          button_pio_s1_reg_firsttransfer <= button_pio_s1_unreg_firsttransfer;
    end


  //button_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign button_pio_s1_beginbursttransfer_internal = button_pio_s1_begins_xfer;

  //~button_pio_s1_write_n assignment, which is an e_mux
  assign button_pio_s1_write_n = ~(cpu_0_data_master_granted_button_pio_s1 & cpu_0_data_master_write);

  assign shifted_address_to_button_pio_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //button_pio_s1_address mux, which is an e_mux
  assign button_pio_s1_address = shifted_address_to_button_pio_s1_from_cpu_0_data_master >> 2;

  //d1_button_pio_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_button_pio_s1_end_xfer <= 1;
      else 
        d1_button_pio_s1_end_xfer <= button_pio_s1_end_xfer;
    end


  //button_pio_s1_waits_for_read in a cycle, which is an e_mux
  assign button_pio_s1_waits_for_read = button_pio_s1_in_a_read_cycle & button_pio_s1_begins_xfer;

  //button_pio_s1_in_a_read_cycle assignment, which is an e_assign
  assign button_pio_s1_in_a_read_cycle = cpu_0_data_master_granted_button_pio_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = button_pio_s1_in_a_read_cycle;

  //button_pio_s1_waits_for_write in a cycle, which is an e_mux
  assign button_pio_s1_waits_for_write = button_pio_s1_in_a_write_cycle & 0;

  //button_pio_s1_in_a_write_cycle assignment, which is an e_assign
  assign button_pio_s1_in_a_write_cycle = cpu_0_data_master_granted_button_pio_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = button_pio_s1_in_a_write_cycle;

  assign wait_for_button_pio_s1_counter = 0;
  //assign button_pio_s1_irq_from_sa = button_pio_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign button_pio_s1_irq_from_sa = button_pio_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //button_pio/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_0_data_master_address_to_slave,
                                             cpu_0_data_master_byteenable,
                                             cpu_0_data_master_debugaccess,
                                             cpu_0_data_master_read,
                                             cpu_0_data_master_waitrequest,
                                             cpu_0_data_master_write,
                                             cpu_0_data_master_writedata,
                                             cpu_0_instruction_master_address_to_slave,
                                             cpu_0_instruction_master_latency_counter,
                                             cpu_0_instruction_master_read,
                                             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_jtag_debug_module_address,
                                             cpu_0_jtag_debug_module_begintransfer,
                                             cpu_0_jtag_debug_module_byteenable,
                                             cpu_0_jtag_debug_module_chipselect,
                                             cpu_0_jtag_debug_module_debugaccess,
                                             cpu_0_jtag_debug_module_readdata_from_sa,
                                             cpu_0_jtag_debug_module_reset_n,
                                             cpu_0_jtag_debug_module_resetrequest_from_sa,
                                             cpu_0_jtag_debug_module_write,
                                             cpu_0_jtag_debug_module_writedata,
                                             d1_cpu_0_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  output  [  8: 0] cpu_0_jtag_debug_module_address;
  output           cpu_0_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_0_jtag_debug_module_byteenable;
  output           cpu_0_jtag_debug_module_chipselect;
  output           cpu_0_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  output           cpu_0_jtag_debug_module_reset_n;
  output           cpu_0_jtag_debug_module_resetrequest_from_sa;
  output           cpu_0_jtag_debug_module_write;
  output  [ 31: 0] cpu_0_jtag_debug_module_writedata;
  output           d1_cpu_0_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] cpu_0_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] cpu_0_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_winner;
  wire             cpu_0_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_0_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_0_jtag_debug_module_begins_xfer;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_0_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_0_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire             cpu_0_jtag_debug_module_end_xfer;
  wire             cpu_0_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_0_jtag_debug_module_grant_vector;
  wire             cpu_0_jtag_debug_module_in_a_read_cycle;
  wire             cpu_0_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_0_jtag_debug_module_master_qreq_vector;
  wire             cpu_0_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  reg              cpu_0_jtag_debug_module_reg_firsttransfer;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_0_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_0_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_0_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_0_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_0_jtag_debug_module_waits_for_read;
  wire             cpu_0_jtag_debug_module_waits_for_write;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  reg              d1_cpu_0_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1000000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = 1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_share_counter_next_value = cpu_0_jtag_debug_module_firsttransfer ? (cpu_0_jtag_debug_module_arb_share_set_values - 1) : |cpu_0_jtag_debug_module_arb_share_counter ? (cpu_0_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_0_jtag_debug_module_allgrants = (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector);

  //cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_end_xfer = ~(cpu_0_jtag_debug_module_waits_for_read | cpu_0_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_end_xfer & (~cpu_0_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & cpu_0_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests);

  //cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_0_jtag_debug_module_arb_counter_enable)
          cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_0_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests))
          cpu_0_jtag_debug_module_slavearbiterlockenable <= |cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_0_jtag_debug_module_slavearbiterlockenable2 = |cpu_0_jtag_debug_module_arb_share_counter_next_value;

  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = cpu_0_data_master_writedata;

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1000000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_instruction_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0] && cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[1];

  //cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[1] && cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_double_vector = {cpu_0_jtag_debug_module_master_qreq_vector, cpu_0_jtag_debug_module_master_qreq_vector} & ({~cpu_0_jtag_debug_module_master_qreq_vector, ~cpu_0_jtag_debug_module_master_qreq_vector} + cpu_0_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_0_jtag_debug_module_arb_winner = (cpu_0_jtag_debug_module_allow_new_arb_cycle & | cpu_0_jtag_debug_module_grant_vector) ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_0_jtag_debug_module_allow_new_arb_cycle)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= |cpu_0_jtag_debug_module_grant_vector ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_0_jtag_debug_module_grant_vector = {(cpu_0_jtag_debug_module_chosen_master_double_vector[1] | cpu_0_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_0_jtag_debug_module_chosen_master_double_vector[0] | cpu_0_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_rot_left = (cpu_0_jtag_debug_module_arb_winner << 1) ? (cpu_0_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_0/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_0_jtag_debug_module_grant_vector)
          cpu_0_jtag_debug_module_arb_addend <= cpu_0_jtag_debug_module_end_xfer? cpu_0_jtag_debug_module_chosen_master_rot_left : cpu_0_jtag_debug_module_grant_vector;
    end


  assign cpu_0_jtag_debug_module_begintransfer = cpu_0_jtag_debug_module_begins_xfer;
  //cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_reset_n = reset_n;

  //assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest;

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  //cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_firsttransfer = cpu_0_jtag_debug_module_begins_xfer ? cpu_0_jtag_debug_module_unreg_firsttransfer : cpu_0_jtag_debug_module_reg_firsttransfer;

  //cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_unreg_firsttransfer = ~(cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_jtag_debug_module_any_continuerequest);

  //cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_0_jtag_debug_module_begins_xfer)
          cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_0_jtag_debug_module_beginbursttransfer_internal = cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_0_jtag_debug_module_arbitration_holdoff_internal = cpu_0_jtag_debug_module_begins_xfer & cpu_0_jtag_debug_module_firsttransfer;

  //cpu_0_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_0_jtag_debug_module_write = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_0_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end


  //cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_read = cpu_0_jtag_debug_module_in_a_read_cycle & cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + cpu_0_instruction_master_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       DM9000A_avalonS_irq_from_sa,
                                       DM9000A_avalonS_readdata_from_sa,
                                       DM9000A_avalonS_wait_counter_eq_0,
                                       I2C_0_avalonS_irq_from_sa,
                                       I2C_0_avalonS_readdata_from_sa,
                                       I2C_0_avalonS_waitrequest_n_from_sa,
                                       ISP1362_avalonS_irq_n_from_sa,
                                       ISP1362_avalonS_readdata_from_sa,
                                       ISP1362_avalonS_wait_counter_eq_0,
                                       ISP1362_avalonS_wait_counter_eq_1,
                                       binary_vga_controller_0_avalon_slave_0_readdata_from_sa,
                                       binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0,
                                       button_pio_s1_irq_from_sa,
                                       button_pio_s1_readdata_from_sa,
                                       cfi_flash_0_s1_wait_counter_eq_0,
                                       cfi_flash_0_s1_wait_counter_eq_1,
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_byteenable_cfi_flash_0_s1,
                                       cpu_0_data_master_byteenable_sdram_0_s1,
                                       cpu_0_data_master_byteenable_sram_0_avalonS,
                                       cpu_0_data_master_granted_DM9000A_avalonS,
                                       cpu_0_data_master_granted_I2C_0_avalonS,
                                       cpu_0_data_master_granted_ISP1362_avalonS,
                                       cpu_0_data_master_granted_SEG7_Display_avalonS,
                                       cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0,
                                       cpu_0_data_master_granted_button_pio_s1,
                                       cpu_0_data_master_granted_cfi_flash_0_s1,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_epcs_controller_epcs_control_port,
                                       cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_granted_lcd_16207_0_control_slave,
                                       cpu_0_data_master_granted_led_green_s1,
                                       cpu_0_data_master_granted_led_red_s1,
                                       cpu_0_data_master_granted_ps2_0_avalon_PS2_slave,
                                       cpu_0_data_master_granted_sdram_0_s1,
                                       cpu_0_data_master_granted_sram_0_avalonS,
                                       cpu_0_data_master_granted_switch_pio_s1,
                                       cpu_0_data_master_granted_sysid_control_slave,
                                       cpu_0_data_master_granted_timer_0_s1,
                                       cpu_0_data_master_granted_timer_1_s1,
                                       cpu_0_data_master_granted_uart_0_s1,
                                       cpu_0_data_master_qualified_request_DM9000A_avalonS,
                                       cpu_0_data_master_qualified_request_I2C_0_avalonS,
                                       cpu_0_data_master_qualified_request_ISP1362_avalonS,
                                       cpu_0_data_master_qualified_request_SEG7_Display_avalonS,
                                       cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0,
                                       cpu_0_data_master_qualified_request_button_pio_s1,
                                       cpu_0_data_master_qualified_request_cfi_flash_0_s1,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port,
                                       cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_qualified_request_lcd_16207_0_control_slave,
                                       cpu_0_data_master_qualified_request_led_green_s1,
                                       cpu_0_data_master_qualified_request_led_red_s1,
                                       cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave,
                                       cpu_0_data_master_qualified_request_sdram_0_s1,
                                       cpu_0_data_master_qualified_request_sram_0_avalonS,
                                       cpu_0_data_master_qualified_request_switch_pio_s1,
                                       cpu_0_data_master_qualified_request_sysid_control_slave,
                                       cpu_0_data_master_qualified_request_timer_0_s1,
                                       cpu_0_data_master_qualified_request_timer_1_s1,
                                       cpu_0_data_master_qualified_request_uart_0_s1,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_DM9000A_avalonS,
                                       cpu_0_data_master_read_data_valid_I2C_0_avalonS,
                                       cpu_0_data_master_read_data_valid_ISP1362_avalonS,
                                       cpu_0_data_master_read_data_valid_SEG7_Display_avalonS,
                                       cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0,
                                       cpu_0_data_master_read_data_valid_button_pio_s1,
                                       cpu_0_data_master_read_data_valid_cfi_flash_0_s1,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port,
                                       cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave,
                                       cpu_0_data_master_read_data_valid_led_green_s1,
                                       cpu_0_data_master_read_data_valid_led_red_s1,
                                       cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                       cpu_0_data_master_read_data_valid_sram_0_avalonS,
                                       cpu_0_data_master_read_data_valid_switch_pio_s1,
                                       cpu_0_data_master_read_data_valid_sysid_control_slave,
                                       cpu_0_data_master_read_data_valid_timer_0_s1,
                                       cpu_0_data_master_read_data_valid_timer_1_s1,
                                       cpu_0_data_master_read_data_valid_uart_0_s1,
                                       cpu_0_data_master_requests_DM9000A_avalonS,
                                       cpu_0_data_master_requests_I2C_0_avalonS,
                                       cpu_0_data_master_requests_ISP1362_avalonS,
                                       cpu_0_data_master_requests_SEG7_Display_avalonS,
                                       cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0,
                                       cpu_0_data_master_requests_button_pio_s1,
                                       cpu_0_data_master_requests_cfi_flash_0_s1,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_epcs_controller_epcs_control_port,
                                       cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_requests_lcd_16207_0_control_slave,
                                       cpu_0_data_master_requests_led_green_s1,
                                       cpu_0_data_master_requests_led_red_s1,
                                       cpu_0_data_master_requests_ps2_0_avalon_PS2_slave,
                                       cpu_0_data_master_requests_sdram_0_s1,
                                       cpu_0_data_master_requests_sram_0_avalonS,
                                       cpu_0_data_master_requests_switch_pio_s1,
                                       cpu_0_data_master_requests_sysid_control_slave,
                                       cpu_0_data_master_requests_timer_0_s1,
                                       cpu_0_data_master_requests_timer_1_s1,
                                       cpu_0_data_master_requests_uart_0_s1,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_DM9000A_avalonS_end_xfer,
                                       d1_I2C_0_avalonS_end_xfer,
                                       d1_ISP1362_avalonS_end_xfer,
                                       d1_SEG7_Display_avalonS_end_xfer,
                                       d1_binary_vga_controller_0_avalon_slave_0_end_xfer,
                                       d1_button_pio_s1_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_epcs_controller_epcs_control_port_end_xfer,
                                       d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                       d1_lcd_16207_0_control_slave_end_xfer,
                                       d1_led_green_s1_end_xfer,
                                       d1_led_red_s1_end_xfer,
                                       d1_ps2_0_avalon_PS2_slave_end_xfer,
                                       d1_sdram_0_s1_end_xfer,
                                       d1_sram_0_avalonS_end_xfer,
                                       d1_switch_pio_s1_end_xfer,
                                       d1_sysid_control_slave_end_xfer,
                                       d1_timer_0_s1_end_xfer,
                                       d1_timer_1_s1_end_xfer,
                                       d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                       d1_uart_0_s1_end_xfer,
                                       epcs_controller_epcs_control_port_irq_from_sa,
                                       epcs_controller_epcs_control_port_readdata_from_sa,
                                       incoming_tri_state_bridge_0_data_with_Xs_converted_to_0,
                                       jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                       lcd_16207_0_control_slave_readdata_from_sa,
                                       lcd_16207_0_control_slave_wait_counter_eq_0,
                                       lcd_16207_0_control_slave_wait_counter_eq_1,
                                       led_green_s1_readdata_from_sa,
                                       led_red_s1_readdata_from_sa,
                                       ps2_0_avalon_PS2_slave_irq_from_sa,
                                       ps2_0_avalon_PS2_slave_readdata_from_sa,
                                       ps2_0_avalon_PS2_slave_waitrequest_from_sa,
                                       registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1,
                                       registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave,
                                       reset_n,
                                       sdram_0_s1_readdata_from_sa,
                                       sdram_0_s1_waitrequest_from_sa,
                                       sram_0_avalonS_readdata_from_sa,
                                       sram_0_avalonS_wait_counter_eq_0,
                                       switch_pio_s1_readdata_from_sa,
                                       sysid_control_slave_readdata_from_sa,
                                       timer_0_s1_irq_from_sa,
                                       timer_0_s1_readdata_from_sa,
                                       timer_1_s1_irq_from_sa,
                                       timer_1_s1_readdata_from_sa,
                                       uart_0_s1_irq_from_sa,
                                       uart_0_s1_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_dbs_write_16,
                                       cpu_0_data_master_dbs_write_8,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_no_byte_enables_and_last_term,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 24: 0] cpu_0_data_master_address_to_slave;
  output  [  1: 0] cpu_0_data_master_dbs_address;
  output  [ 15: 0] cpu_0_data_master_dbs_write_16;
  output  [  7: 0] cpu_0_data_master_dbs_write_8;
  output  [ 31: 0] cpu_0_data_master_irq;
  output           cpu_0_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_waitrequest;
  input            DM9000A_avalonS_irq_from_sa;
  input   [ 15: 0] DM9000A_avalonS_readdata_from_sa;
  input            DM9000A_avalonS_wait_counter_eq_0;
  input            I2C_0_avalonS_irq_from_sa;
  input   [  7: 0] I2C_0_avalonS_readdata_from_sa;
  input            I2C_0_avalonS_waitrequest_n_from_sa;
  input            ISP1362_avalonS_irq_n_from_sa;
  input   [ 15: 0] ISP1362_avalonS_readdata_from_sa;
  input            ISP1362_avalonS_wait_counter_eq_0;
  input            ISP1362_avalonS_wait_counter_eq_1;
  input   [ 15: 0] binary_vga_controller_0_avalon_slave_0_readdata_from_sa;
  input            binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0;
  input            button_pio_s1_irq_from_sa;
  input   [ 31: 0] button_pio_s1_readdata_from_sa;
  input            cfi_flash_0_s1_wait_counter_eq_0;
  input            cfi_flash_0_s1_wait_counter_eq_1;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_byteenable_cfi_flash_0_s1;
  input   [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  input   [  1: 0] cpu_0_data_master_byteenable_sram_0_avalonS;
  input            cpu_0_data_master_granted_DM9000A_avalonS;
  input            cpu_0_data_master_granted_I2C_0_avalonS;
  input            cpu_0_data_master_granted_ISP1362_avalonS;
  input            cpu_0_data_master_granted_SEG7_Display_avalonS;
  input            cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0;
  input            cpu_0_data_master_granted_button_pio_s1;
  input            cpu_0_data_master_granted_cfi_flash_0_s1;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_epcs_controller_epcs_control_port;
  input            cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_granted_lcd_16207_0_control_slave;
  input            cpu_0_data_master_granted_led_green_s1;
  input            cpu_0_data_master_granted_led_red_s1;
  input            cpu_0_data_master_granted_ps2_0_avalon_PS2_slave;
  input            cpu_0_data_master_granted_sdram_0_s1;
  input            cpu_0_data_master_granted_sram_0_avalonS;
  input            cpu_0_data_master_granted_switch_pio_s1;
  input            cpu_0_data_master_granted_sysid_control_slave;
  input            cpu_0_data_master_granted_timer_0_s1;
  input            cpu_0_data_master_granted_timer_1_s1;
  input            cpu_0_data_master_granted_uart_0_s1;
  input            cpu_0_data_master_qualified_request_DM9000A_avalonS;
  input            cpu_0_data_master_qualified_request_I2C_0_avalonS;
  input            cpu_0_data_master_qualified_request_ISP1362_avalonS;
  input            cpu_0_data_master_qualified_request_SEG7_Display_avalonS;
  input            cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0;
  input            cpu_0_data_master_qualified_request_button_pio_s1;
  input            cpu_0_data_master_qualified_request_cfi_flash_0_s1;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port;
  input            cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_qualified_request_lcd_16207_0_control_slave;
  input            cpu_0_data_master_qualified_request_led_green_s1;
  input            cpu_0_data_master_qualified_request_led_red_s1;
  input            cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave;
  input            cpu_0_data_master_qualified_request_sdram_0_s1;
  input            cpu_0_data_master_qualified_request_sram_0_avalonS;
  input            cpu_0_data_master_qualified_request_switch_pio_s1;
  input            cpu_0_data_master_qualified_request_sysid_control_slave;
  input            cpu_0_data_master_qualified_request_timer_0_s1;
  input            cpu_0_data_master_qualified_request_timer_1_s1;
  input            cpu_0_data_master_qualified_request_uart_0_s1;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_DM9000A_avalonS;
  input            cpu_0_data_master_read_data_valid_I2C_0_avalonS;
  input            cpu_0_data_master_read_data_valid_ISP1362_avalonS;
  input            cpu_0_data_master_read_data_valid_SEG7_Display_avalonS;
  input            cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0;
  input            cpu_0_data_master_read_data_valid_button_pio_s1;
  input            cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port;
  input            cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave;
  input            cpu_0_data_master_read_data_valid_led_green_s1;
  input            cpu_0_data_master_read_data_valid_led_red_s1;
  input            cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_read_data_valid_sram_0_avalonS;
  input            cpu_0_data_master_read_data_valid_switch_pio_s1;
  input            cpu_0_data_master_read_data_valid_sysid_control_slave;
  input            cpu_0_data_master_read_data_valid_timer_0_s1;
  input            cpu_0_data_master_read_data_valid_timer_1_s1;
  input            cpu_0_data_master_read_data_valid_uart_0_s1;
  input            cpu_0_data_master_requests_DM9000A_avalonS;
  input            cpu_0_data_master_requests_I2C_0_avalonS;
  input            cpu_0_data_master_requests_ISP1362_avalonS;
  input            cpu_0_data_master_requests_SEG7_Display_avalonS;
  input            cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0;
  input            cpu_0_data_master_requests_button_pio_s1;
  input            cpu_0_data_master_requests_cfi_flash_0_s1;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_epcs_controller_epcs_control_port;
  input            cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_requests_lcd_16207_0_control_slave;
  input            cpu_0_data_master_requests_led_green_s1;
  input            cpu_0_data_master_requests_led_red_s1;
  input            cpu_0_data_master_requests_ps2_0_avalon_PS2_slave;
  input            cpu_0_data_master_requests_sdram_0_s1;
  input            cpu_0_data_master_requests_sram_0_avalonS;
  input            cpu_0_data_master_requests_switch_pio_s1;
  input            cpu_0_data_master_requests_sysid_control_slave;
  input            cpu_0_data_master_requests_timer_0_s1;
  input            cpu_0_data_master_requests_timer_1_s1;
  input            cpu_0_data_master_requests_uart_0_s1;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_DM9000A_avalonS_end_xfer;
  input            d1_I2C_0_avalonS_end_xfer;
  input            d1_ISP1362_avalonS_end_xfer;
  input            d1_SEG7_Display_avalonS_end_xfer;
  input            d1_binary_vga_controller_0_avalon_slave_0_end_xfer;
  input            d1_button_pio_s1_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_epcs_controller_epcs_control_port_end_xfer;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input            d1_lcd_16207_0_control_slave_end_xfer;
  input            d1_led_green_s1_end_xfer;
  input            d1_led_red_s1_end_xfer;
  input            d1_ps2_0_avalon_PS2_slave_end_xfer;
  input            d1_sdram_0_s1_end_xfer;
  input            d1_sram_0_avalonS_end_xfer;
  input            d1_switch_pio_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_0_s1_end_xfer;
  input            d1_timer_1_s1_end_xfer;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input            d1_uart_0_s1_end_xfer;
  input            epcs_controller_epcs_control_port_irq_from_sa;
  input   [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  input   [  7: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input   [  7: 0] lcd_16207_0_control_slave_readdata_from_sa;
  input            lcd_16207_0_control_slave_wait_counter_eq_0;
  input            lcd_16207_0_control_slave_wait_counter_eq_1;
  input   [ 31: 0] led_green_s1_readdata_from_sa;
  input   [ 31: 0] led_red_s1_readdata_from_sa;
  input            ps2_0_avalon_PS2_slave_irq_from_sa;
  input   [ 31: 0] ps2_0_avalon_PS2_slave_readdata_from_sa;
  input            ps2_0_avalon_PS2_slave_waitrequest_from_sa;
  input            registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  input            registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_0_avalonS_readdata_from_sa;
  input            sram_0_avalonS_wait_counter_eq_0;
  input   [ 31: 0] switch_pio_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            timer_0_s1_irq_from_sa;
  input   [ 15: 0] timer_0_s1_readdata_from_sa;
  input            timer_1_s1_irq_from_sa;
  input   [ 15: 0] timer_1_s1_readdata_from_sa;
  input            uart_0_s1_irq_from_sa;
  input   [ 15: 0] uart_0_s1_readdata_from_sa;

  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  reg     [  1: 0] cpu_0_data_master_dbs_address;
  wire    [  1: 0] cpu_0_data_master_dbs_increment;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [  7: 0] cpu_0_data_master_dbs_write_8;
  wire    [ 31: 0] cpu_0_data_master_irq;
  reg              cpu_0_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 31: 0] p1_registered_cpu_0_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  wire             r_4;
  reg     [ 31: 0] registered_cpu_0_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~cpu_0_data_master_qualified_request_DM9000A_avalonS | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_DM9000A_avalonS | ~cpu_0_data_master_write | (1 & ~d1_DM9000A_avalonS_end_xfer & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_I2C_0_avalonS | ~cpu_0_data_master_requests_I2C_0_avalonS) & ((~cpu_0_data_master_qualified_request_I2C_0_avalonS | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & I2C_0_avalonS_waitrequest_n_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_I2C_0_avalonS | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & I2C_0_avalonS_waitrequest_n_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & ((~cpu_0_data_master_qualified_request_ISP1362_avalonS | ~cpu_0_data_master_read | (1 & ISP1362_avalonS_wait_counter_eq_1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_ISP1362_avalonS | ~cpu_0_data_master_write | (1 & ISP1362_avalonS_wait_counter_eq_1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_SEG7_Display_avalonS | ~cpu_0_data_master_requests_SEG7_Display_avalonS) & ((~cpu_0_data_master_qualified_request_SEG7_Display_avalonS | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_SEG7_Display_avalonS | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & ((~cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0 | ~cpu_0_data_master_write | (1 & ~d1_binary_vga_controller_0_avalon_slave_0_end_xfer & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_button_pio_s1 | ~cpu_0_data_master_requests_button_pio_s1) & ((~cpu_0_data_master_qualified_request_button_pio_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1 & r_2 & r_3 & r_4;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_data_master_qualified_request_button_pio_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port | ~cpu_0_data_master_requests_epcs_controller_epcs_control_port) & (cpu_0_data_master_granted_epcs_controller_epcs_control_port | ~cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port) & ((~cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & 1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & 1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & ((~cpu_0_data_master_qualified_request_lcd_16207_0_control_slave | ~cpu_0_data_master_read | (1 & lcd_16207_0_control_slave_wait_counter_eq_1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_lcd_16207_0_control_slave | ~cpu_0_data_master_write | (1 & lcd_16207_0_control_slave_wait_counter_eq_1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_led_green_s1 | ~cpu_0_data_master_requests_led_green_s1);

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_0_data_master_qualified_request_led_green_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_led_green_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_led_red_s1 | ~cpu_0_data_master_requests_led_red_s1) & ((~cpu_0_data_master_qualified_request_led_red_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_led_red_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave | registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave | ~cpu_0_data_master_requests_ps2_0_avalon_PS2_slave) & ((~cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~ps2_0_avalon_PS2_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_sdram_0_s1 | (cpu_0_data_master_read_data_valid_sdram_0_s1 & cpu_0_data_master_dbs_address[1]) | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1 & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_sdram_0_s1) & (cpu_0_data_master_granted_sdram_0_s1 | ~cpu_0_data_master_qualified_request_sdram_0_s1) & ((~cpu_0_data_master_qualified_request_sdram_0_s1 | ~cpu_0_data_master_read | (cpu_0_data_master_read_data_valid_sdram_0_s1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sdram_0_s1 | ~cpu_0_data_master_write | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_sram_0_avalonS | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_sram_0_avalonS & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_sram_0_avalonS) & (cpu_0_data_master_granted_sram_0_avalonS | ~cpu_0_data_master_qualified_request_sram_0_avalonS) & ((~cpu_0_data_master_qualified_request_sram_0_avalonS | ~cpu_0_data_master_read | (1 & 1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sram_0_avalonS | ~cpu_0_data_master_write | (1 & ~d1_sram_0_avalonS_end_xfer & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & ((~cpu_0_data_master_qualified_request_switch_pio_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_switch_pio_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_requests_timer_0_s1) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_timer_1_s1 | ~cpu_0_data_master_requests_timer_1_s1) & ((~cpu_0_data_master_qualified_request_timer_1_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_timer_1_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & ((cpu_0_data_master_qualified_request_cfi_flash_0_s1 | (registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 & cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) | ((cpu_0_data_master_write & !cpu_0_data_master_byteenable_cfi_flash_0_s1 & cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0])) | ~cpu_0_data_master_requests_cfi_flash_0_s1)) & (cpu_0_data_master_granted_cfi_flash_0_s1 | ~cpu_0_data_master_qualified_request_cfi_flash_0_s1) & ((~cpu_0_data_master_qualified_request_cfi_flash_0_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 & (cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cfi_flash_0_s1 | ~cpu_0_data_master_write | (1 & cfi_flash_0_s1_wait_counter_eq_1 & (cpu_0_data_master_dbs_address[1] & cpu_0_data_master_dbs_address[0]) & cpu_0_data_master_write))) & 1;

  //r_4 master_run cascaded wait assignment, which is an e_assign
  assign r_4 = ((~cpu_0_data_master_qualified_request_uart_0_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & 1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_uart_0_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & 1 & (cpu_0_data_master_read | cpu_0_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[24 : 0];

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_DM9000A_avalonS}} | DM9000A_avalonS_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_I2C_0_avalonS}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_ISP1362_avalonS}} | ISP1362_avalonS_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0}} | binary_vga_controller_0_avalon_slave_0_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_button_pio_s1}} | button_pio_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_cpu_0_jtag_debug_module}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_epcs_controller_epcs_control_port}} | epcs_controller_epcs_control_port_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_lcd_16207_0_control_slave}} | lcd_16207_0_control_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_led_green_s1}} | led_green_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_led_red_s1}} | led_red_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_ps2_0_avalon_PS2_slave}} | ps2_0_avalon_PS2_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_sdram_0_s1}} | registered_cpu_0_data_master_readdata) &
    ({32 {~cpu_0_data_master_requests_sram_0_avalonS}} | {sram_0_avalonS_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_0_data_master_requests_switch_pio_s1}} | switch_pio_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_timer_0_s1}} | timer_0_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_timer_1_s1}} | timer_1_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_cfi_flash_0_s1}} | {incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~cpu_0_data_master_requests_uart_0_s1}} | uart_0_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_waitrequest <= ~0;
      else 
        cpu_0_data_master_waitrequest <= ~((~(cpu_0_data_master_read | cpu_0_data_master_write))? 0: (cpu_0_data_master_run & cpu_0_data_master_waitrequest));
    end


  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    ps2_0_avalon_PS2_slave_irq_from_sa,
    DM9000A_avalonS_irq_from_sa,
    epcs_controller_epcs_control_port_irq_from_sa,
    I2C_0_avalonS_irq_from_sa,
    button_pio_s1_irq_from_sa,
    ~ISP1362_avalonS_irq_n_from_sa,
    timer_1_s1_irq_from_sa,
    uart_0_s1_irq_from_sa,
    jtag_uart_0_avalon_jtag_slave_irq_from_sa,
    timer_0_s1_irq_from_sa};

  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_0_data_master_readdata <= 0;
      else 
        registered_cpu_0_data_master_readdata <= p1_registered_cpu_0_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_I2C_0_avalonS}} | I2C_0_avalonS_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave}} | jtag_uart_0_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_sdram_0_s1}} | {sdram_0_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0});

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_no_byte_enables_and_last_term <= 0;
      else 
        cpu_0_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (cpu_0_data_master_requests_sdram_0_s1)? (((cpu_0_data_master_dbs_address == 2'b10) & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1)) :
    (cpu_0_data_master_requests_sram_0_avalonS)? (((cpu_0_data_master_dbs_address == 2'b10) & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sram_0_avalonS)) :
    (((cpu_0_data_master_dbs_address == 2'b11) & cpu_0_data_master_write & !cpu_0_data_master_byteenable_cfi_flash_0_s1));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~cpu_0_data_master_no_byte_enables_and_last_term) & cpu_0_data_master_requests_sdram_0_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1)) |
    cpu_0_data_master_read_data_valid_sdram_0_s1 |
    (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa) |
    (((~cpu_0_data_master_no_byte_enables_and_last_term) & cpu_0_data_master_requests_sram_0_avalonS & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sram_0_avalonS)) |
    (cpu_0_data_master_granted_sram_0_avalonS & cpu_0_data_master_read & 1 & 1 & ~d1_sram_0_avalonS_end_xfer) |
    ((cpu_0_data_master_granted_sram_0_avalonS & cpu_0_data_master_write & 1 & 1 & ({sram_0_avalonS_wait_counter_eq_0 & ~d1_sram_0_avalonS_end_xfer}))) |
    (((~cpu_0_data_master_no_byte_enables_and_last_term) & cpu_0_data_master_requests_cfi_flash_0_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_cfi_flash_0_s1)) |
    cpu_0_data_master_read_data_valid_cfi_flash_0_s1 |
    ((cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_write & 1 & 1 & ({cfi_flash_0_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_0_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (cpu_0_data_master_requests_sdram_0_s1)? sdram_0_s1_readdata_from_sa :
    sram_0_avalonS_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_0_data_master_dbs_write_16 = (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    (~(cpu_0_data_master_dbs_address[1]))? cpu_0_data_master_writedata[15 : 0] :
    (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    cpu_0_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_0_data_master_dbs_increment = (cpu_0_data_master_requests_sdram_0_s1)? 2 :
    (cpu_0_data_master_requests_sram_0_avalonS)? 2 :
    (cpu_0_data_master_requests_cfi_flash_0_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_data_master_dbs_address + cpu_0_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(cpu_0_data_master_requests_sdram_0_s1 & ~cpu_0_data_master_waitrequest));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_data_master_dbs_address <= next_dbs_address;
    end


  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((cpu_0_data_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign cpu_0_data_master_dbs_write_8 = ((cpu_0_data_master_dbs_address[1 : 0] == 0))? cpu_0_data_master_writedata[7 : 0] :
    ((cpu_0_data_master_dbs_address[1 : 0] == 1))? cpu_0_data_master_writedata[15 : 8] :
    ((cpu_0_data_master_dbs_address[1 : 0] == 2))? cpu_0_data_master_writedata[23 : 16] :
    cpu_0_data_master_writedata[31 : 24];


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              cfi_flash_0_s1_wait_counter_eq_0,
                                              cfi_flash_0_s1_wait_counter_eq_1,
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_cfi_flash_0_s1,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_granted_epcs_controller_epcs_control_port,
                                              cpu_0_instruction_master_granted_sdram_0_s1,
                                              cpu_0_instruction_master_granted_sram_0_avalonS,
                                              cpu_0_instruction_master_qualified_request_cfi_flash_0_s1,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port,
                                              cpu_0_instruction_master_qualified_request_sdram_0_s1,
                                              cpu_0_instruction_master_qualified_request_sram_0_avalonS,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                              cpu_0_instruction_master_read_data_valid_sram_0_avalonS,
                                              cpu_0_instruction_master_requests_cfi_flash_0_s1,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_epcs_controller_epcs_control_port,
                                              cpu_0_instruction_master_requests_sdram_0_s1,
                                              cpu_0_instruction_master_requests_sram_0_avalonS,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              d1_epcs_controller_epcs_control_port_end_xfer,
                                              d1_sdram_0_s1_end_xfer,
                                              d1_sram_0_avalonS_end_xfer,
                                              d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                              epcs_controller_epcs_control_port_readdata_from_sa,
                                              incoming_tri_state_bridge_0_data,
                                              reset_n,
                                              sdram_0_s1_readdata_from_sa,
                                              sdram_0_s1_waitrequest_from_sa,
                                              sram_0_avalonS_readdata_from_sa,
                                              sram_0_avalonS_wait_counter_eq_0,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_dbs_address,
                                              cpu_0_instruction_master_latency_counter,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_readdatavalid,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 24: 0] cpu_0_instruction_master_address_to_slave;
  output  [  1: 0] cpu_0_instruction_master_dbs_address;
  output  [  1: 0] cpu_0_instruction_master_latency_counter;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_readdatavalid;
  output           cpu_0_instruction_master_waitrequest;
  input            cfi_flash_0_s1_wait_counter_eq_0;
  input            cfi_flash_0_s1_wait_counter_eq_1;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_cfi_flash_0_s1;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_granted_epcs_controller_epcs_control_port;
  input            cpu_0_instruction_master_granted_sdram_0_s1;
  input            cpu_0_instruction_master_granted_sram_0_avalonS;
  input            cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port;
  input            cpu_0_instruction_master_qualified_request_sdram_0_s1;
  input            cpu_0_instruction_master_qualified_request_sram_0_avalonS;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_instruction_master_read_data_valid_sram_0_avalonS;
  input            cpu_0_instruction_master_requests_cfi_flash_0_s1;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_epcs_controller_epcs_control_port;
  input            cpu_0_instruction_master_requests_sdram_0_s1;
  input            cpu_0_instruction_master_requests_sram_0_avalonS;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_epcs_controller_epcs_control_port_end_xfer;
  input            d1_sdram_0_s1_end_xfer;
  input            d1_sram_0_avalonS_end_xfer;
  input            d1_tri_state_bridge_0_avalon_slave_end_xfer;
  input   [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  input   [  7: 0] incoming_tri_state_bridge_0_data;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_0_avalonS_readdata_from_sa;
  input            sram_0_avalonS_wait_counter_eq_0;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_0_instruction_master_dbs_address;
  wire    [  1: 0] cpu_0_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_0_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_0_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_0_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_0_instruction_master_latency_counter;
  wire    [  1: 0] cpu_0_instruction_master_next_dbs_rdv_counter;
  reg              cpu_0_instruction_master_read_but_no_slave_selected;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_0_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_0_instruction_master_readdatavalid;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port | ~cpu_0_instruction_master_requests_epcs_controller_epcs_control_port) & (cpu_0_instruction_master_granted_epcs_controller_epcs_control_port | ~cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port) & ((~cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port | ~(cpu_0_instruction_master_read) | (1 & ~d1_epcs_controller_epcs_control_port_end_xfer & (cpu_0_instruction_master_read))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_1 & r_2 & r_3;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_0_instruction_master_qualified_request_sdram_0_s1 | ~cpu_0_instruction_master_requests_sdram_0_s1) & (cpu_0_instruction_master_granted_sdram_0_s1 | ~cpu_0_instruction_master_qualified_request_sdram_0_s1) & ((~cpu_0_instruction_master_qualified_request_sdram_0_s1 | ~cpu_0_instruction_master_read | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_sram_0_avalonS | ~cpu_0_instruction_master_requests_sram_0_avalonS) & (cpu_0_instruction_master_granted_sram_0_avalonS | ~cpu_0_instruction_master_qualified_request_sram_0_avalonS) & ((~cpu_0_instruction_master_qualified_request_sram_0_avalonS | ~cpu_0_instruction_master_read | (1 & ~d1_sram_0_avalonS_end_xfer & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & (cpu_0_instruction_master_qualified_request_cfi_flash_0_s1 | ~cpu_0_instruction_master_requests_cfi_flash_0_s1) & (cpu_0_instruction_master_granted_cfi_flash_0_s1 | ~cpu_0_instruction_master_qualified_request_cfi_flash_0_s1) & ((~cpu_0_instruction_master_qualified_request_cfi_flash_0_s1 | ~cpu_0_instruction_master_read | (1 & ((cfi_flash_0_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_0_avalon_slave_end_xfer)) & (cpu_0_instruction_master_dbs_address[1] & cpu_0_instruction_master_dbs_address[0]) & cpu_0_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[24 : 0];

  //cpu_0_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_instruction_master_read_but_no_slave_selected <= cpu_0_instruction_master_read & cpu_0_instruction_master_run & ~cpu_0_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_instruction_master_is_granted_some_slave = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_granted_epcs_controller_epcs_control_port |
    cpu_0_instruction_master_granted_sdram_0_s1 |
    cpu_0_instruction_master_granted_sram_0_avalonS |
    cpu_0_instruction_master_granted_cfi_flash_0_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_instruction_master_readdatavalid = (cpu_0_instruction_master_read_data_valid_sdram_0_s1 & dbs_rdv_counter_overflow) |
    (cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    (cpu_0_instruction_master_read_data_valid_sram_0_avalonS & dbs_counter_overflow) |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid;

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~(cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_instruction_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port & cpu_0_instruction_master_read)}} | epcs_controller_epcs_control_port_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_read_data_valid_sdram_0_s1}} | {sdram_0_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(cpu_0_instruction_master_qualified_request_sram_0_avalonS & cpu_0_instruction_master_read)}} | {sram_0_avalonS_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1}} | {incoming_tri_state_bridge_0_data[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_latency_counter <= 0;
      else 
        cpu_0_instruction_master_latency_counter <= p1_cpu_0_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_instruction_master_latency_counter = ((cpu_0_instruction_master_run & cpu_0_instruction_master_read))? latency_load_value :
    (cpu_0_instruction_master_latency_counter)? cpu_0_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_0_instruction_master_requests_cfi_flash_0_s1}} & 2;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = sdram_0_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_instruction_master_dbs_increment = (cpu_0_instruction_master_requests_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_requests_sram_0_avalonS)? 2 :
    (cpu_0_instruction_master_requests_cfi_flash_0_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_instruction_master_dbs_address + cpu_0_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_0_instruction_master_next_dbs_rdv_counter = cpu_0_instruction_master_dbs_rdv_counter + cpu_0_instruction_master_dbs_rdv_counter_inc;

  //cpu_0_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_0_instruction_master_dbs_rdv_counter_inc = (cpu_0_instruction_master_read_data_valid_sdram_0_s1)? 2 :
    1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_0_instruction_master_read_data_valid_sdram_0_s1 |
    cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_0_instruction_master_dbs_rdv_counter <= cpu_0_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_0_instruction_master_dbs_rdv_counter[1] & ~cpu_0_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa) |
    (cpu_0_instruction_master_granted_sram_0_avalonS & cpu_0_instruction_master_read & 1 & 1 & ~d1_sram_0_avalonS_end_xfer) |
    ((cpu_0_instruction_master_granted_cfi_flash_0_s1 & cpu_0_instruction_master_read & 1 & 1 & ({cfi_flash_0_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_0_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_0_avalonS_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_0_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_tri_state_bridge_0_data;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_instruction_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_tri_state_bridge_0_data;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_instruction_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_tri_state_bridge_0_data;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_instruction_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end



//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module epcs_controller_epcs_control_port_arbitrator (
                                                      // inputs:
                                                       clk,
                                                       cpu_0_data_master_address_to_slave,
                                                       cpu_0_data_master_read,
                                                       cpu_0_data_master_write,
                                                       cpu_0_data_master_writedata,
                                                       cpu_0_instruction_master_address_to_slave,
                                                       cpu_0_instruction_master_latency_counter,
                                                       cpu_0_instruction_master_read,
                                                       cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                                       epcs_controller_epcs_control_port_dataavailable,
                                                       epcs_controller_epcs_control_port_endofpacket,
                                                       epcs_controller_epcs_control_port_irq,
                                                       epcs_controller_epcs_control_port_readdata,
                                                       epcs_controller_epcs_control_port_readyfordata,
                                                       reset_n,

                                                      // outputs:
                                                       cpu_0_data_master_granted_epcs_controller_epcs_control_port,
                                                       cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port,
                                                       cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port,
                                                       cpu_0_data_master_requests_epcs_controller_epcs_control_port,
                                                       cpu_0_instruction_master_granted_epcs_controller_epcs_control_port,
                                                       cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port,
                                                       cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port,
                                                       cpu_0_instruction_master_requests_epcs_controller_epcs_control_port,
                                                       d1_epcs_controller_epcs_control_port_end_xfer,
                                                       epcs_controller_epcs_control_port_address,
                                                       epcs_controller_epcs_control_port_chipselect,
                                                       epcs_controller_epcs_control_port_dataavailable_from_sa,
                                                       epcs_controller_epcs_control_port_endofpacket_from_sa,
                                                       epcs_controller_epcs_control_port_irq_from_sa,
                                                       epcs_controller_epcs_control_port_read_n,
                                                       epcs_controller_epcs_control_port_readdata_from_sa,
                                                       epcs_controller_epcs_control_port_readyfordata_from_sa,
                                                       epcs_controller_epcs_control_port_reset_n,
                                                       epcs_controller_epcs_control_port_write_n,
                                                       epcs_controller_epcs_control_port_writedata
                                                    )
;

  output           cpu_0_data_master_granted_epcs_controller_epcs_control_port;
  output           cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port;
  output           cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port;
  output           cpu_0_data_master_requests_epcs_controller_epcs_control_port;
  output           cpu_0_instruction_master_granted_epcs_controller_epcs_control_port;
  output           cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port;
  output           cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port;
  output           cpu_0_instruction_master_requests_epcs_controller_epcs_control_port;
  output           d1_epcs_controller_epcs_control_port_end_xfer;
  output  [  8: 0] epcs_controller_epcs_control_port_address;
  output           epcs_controller_epcs_control_port_chipselect;
  output           epcs_controller_epcs_control_port_dataavailable_from_sa;
  output           epcs_controller_epcs_control_port_endofpacket_from_sa;
  output           epcs_controller_epcs_control_port_irq_from_sa;
  output           epcs_controller_epcs_control_port_read_n;
  output  [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  output           epcs_controller_epcs_control_port_readyfordata_from_sa;
  output           epcs_controller_epcs_control_port_reset_n;
  output           epcs_controller_epcs_control_port_write_n;
  output  [ 31: 0] epcs_controller_epcs_control_port_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input            epcs_controller_epcs_control_port_dataavailable;
  input            epcs_controller_epcs_control_port_endofpacket;
  input            epcs_controller_epcs_control_port_irq;
  input   [ 31: 0] epcs_controller_epcs_control_port_readdata;
  input            epcs_controller_epcs_control_port_readyfordata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_epcs_controller_epcs_control_port;
  wire             cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port;
  wire             cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port;
  wire             cpu_0_data_master_requests_epcs_controller_epcs_control_port;
  wire             cpu_0_data_master_saved_grant_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_requests_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_saved_grant_epcs_controller_epcs_control_port;
  reg              d1_epcs_controller_epcs_control_port_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port;
  wire    [  8: 0] epcs_controller_epcs_control_port_address;
  wire             epcs_controller_epcs_control_port_allgrants;
  wire             epcs_controller_epcs_control_port_allow_new_arb_cycle;
  wire             epcs_controller_epcs_control_port_any_bursting_master_saved_grant;
  wire             epcs_controller_epcs_control_port_any_continuerequest;
  reg     [  1: 0] epcs_controller_epcs_control_port_arb_addend;
  wire             epcs_controller_epcs_control_port_arb_counter_enable;
  reg     [  2: 0] epcs_controller_epcs_control_port_arb_share_counter;
  wire    [  2: 0] epcs_controller_epcs_control_port_arb_share_counter_next_value;
  wire    [  2: 0] epcs_controller_epcs_control_port_arb_share_set_values;
  wire    [  1: 0] epcs_controller_epcs_control_port_arb_winner;
  wire             epcs_controller_epcs_control_port_arbitration_holdoff_internal;
  wire             epcs_controller_epcs_control_port_beginbursttransfer_internal;
  wire             epcs_controller_epcs_control_port_begins_xfer;
  wire             epcs_controller_epcs_control_port_chipselect;
  wire    [  3: 0] epcs_controller_epcs_control_port_chosen_master_double_vector;
  wire    [  1: 0] epcs_controller_epcs_control_port_chosen_master_rot_left;
  wire             epcs_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_controller_epcs_control_port_end_xfer;
  wire             epcs_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_controller_epcs_control_port_firsttransfer;
  wire    [  1: 0] epcs_controller_epcs_control_port_grant_vector;
  wire             epcs_controller_epcs_control_port_in_a_read_cycle;
  wire             epcs_controller_epcs_control_port_in_a_write_cycle;
  wire             epcs_controller_epcs_control_port_irq_from_sa;
  wire    [  1: 0] epcs_controller_epcs_control_port_master_qreq_vector;
  wire             epcs_controller_epcs_control_port_non_bursting_master_requests;
  wire             epcs_controller_epcs_control_port_read_n;
  wire    [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  wire             epcs_controller_epcs_control_port_readyfordata_from_sa;
  reg              epcs_controller_epcs_control_port_reg_firsttransfer;
  wire             epcs_controller_epcs_control_port_reset_n;
  reg     [  1: 0] epcs_controller_epcs_control_port_saved_chosen_master_vector;
  reg              epcs_controller_epcs_control_port_slavearbiterlockenable;
  wire             epcs_controller_epcs_control_port_slavearbiterlockenable2;
  wire             epcs_controller_epcs_control_port_unreg_firsttransfer;
  wire             epcs_controller_epcs_control_port_waits_for_read;
  wire             epcs_controller_epcs_control_port_waits_for_write;
  wire             epcs_controller_epcs_control_port_write_n;
  wire    [ 31: 0] epcs_controller_epcs_control_port_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_epcs_controller_epcs_control_port;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_epcs_controller_epcs_control_port;
  wire    [ 24: 0] shifted_address_to_epcs_controller_epcs_control_port_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_epcs_controller_epcs_control_port_from_cpu_0_instruction_master;
  wire             wait_for_epcs_controller_epcs_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~epcs_controller_epcs_control_port_end_xfer;
    end


  assign epcs_controller_epcs_control_port_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port | cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port));
  //assign epcs_controller_epcs_control_port_readdata_from_sa = epcs_controller_epcs_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_readdata_from_sa = epcs_controller_epcs_control_port_readdata;

  assign cpu_0_data_master_requests_epcs_controller_epcs_control_port = ({cpu_0_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h900800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign epcs_controller_epcs_control_port_dataavailable_from_sa = epcs_controller_epcs_control_port_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_dataavailable_from_sa = epcs_controller_epcs_control_port_dataavailable;

  //assign epcs_controller_epcs_control_port_readyfordata_from_sa = epcs_controller_epcs_control_port_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_readyfordata_from_sa = epcs_controller_epcs_control_port_readyfordata;

  //epcs_controller_epcs_control_port_arb_share_counter set values, which is an e_mux
  assign epcs_controller_epcs_control_port_arb_share_set_values = 1;

  //epcs_controller_epcs_control_port_non_bursting_master_requests mux, which is an e_mux
  assign epcs_controller_epcs_control_port_non_bursting_master_requests = cpu_0_data_master_requests_epcs_controller_epcs_control_port |
    cpu_0_instruction_master_requests_epcs_controller_epcs_control_port |
    cpu_0_data_master_requests_epcs_controller_epcs_control_port |
    cpu_0_instruction_master_requests_epcs_controller_epcs_control_port;

  //epcs_controller_epcs_control_port_any_bursting_master_saved_grant mux, which is an e_mux
  assign epcs_controller_epcs_control_port_any_bursting_master_saved_grant = 0;

  //epcs_controller_epcs_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_arb_share_counter_next_value = epcs_controller_epcs_control_port_firsttransfer ? (epcs_controller_epcs_control_port_arb_share_set_values - 1) : |epcs_controller_epcs_control_port_arb_share_counter ? (epcs_controller_epcs_control_port_arb_share_counter - 1) : 0;

  //epcs_controller_epcs_control_port_allgrants all slave grants, which is an e_mux
  assign epcs_controller_epcs_control_port_allgrants = (|epcs_controller_epcs_control_port_grant_vector) |
    (|epcs_controller_epcs_control_port_grant_vector) |
    (|epcs_controller_epcs_control_port_grant_vector) |
    (|epcs_controller_epcs_control_port_grant_vector);

  //epcs_controller_epcs_control_port_end_xfer assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_end_xfer = ~(epcs_controller_epcs_control_port_waits_for_read | epcs_controller_epcs_control_port_waits_for_write);

  //end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_end_xfer & (~epcs_controller_epcs_control_port_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //epcs_controller_epcs_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign epcs_controller_epcs_control_port_arb_counter_enable = (end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port & epcs_controller_epcs_control_port_allgrants) | (end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port & ~epcs_controller_epcs_control_port_non_bursting_master_requests);

  //epcs_controller_epcs_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_arb_share_counter <= 0;
      else if (epcs_controller_epcs_control_port_arb_counter_enable)
          epcs_controller_epcs_control_port_arb_share_counter <= epcs_controller_epcs_control_port_arb_share_counter_next_value;
    end


  //epcs_controller_epcs_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_slavearbiterlockenable <= 0;
      else if ((|epcs_controller_epcs_control_port_master_qreq_vector & end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port) | (end_xfer_arb_share_counter_term_epcs_controller_epcs_control_port & ~epcs_controller_epcs_control_port_non_bursting_master_requests))
          epcs_controller_epcs_control_port_slavearbiterlockenable <= |epcs_controller_epcs_control_port_arb_share_counter_next_value;
    end


  //cpu_0/data_master epcs_controller/epcs_control_port arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = epcs_controller_epcs_control_port_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //epcs_controller_epcs_control_port_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign epcs_controller_epcs_control_port_slavearbiterlockenable2 = |epcs_controller_epcs_control_port_arb_share_counter_next_value;

  //cpu_0/data_master epcs_controller/epcs_control_port arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = epcs_controller_epcs_control_port_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master epcs_controller/epcs_control_port arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = epcs_controller_epcs_control_port_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master epcs_controller/epcs_control_port arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = epcs_controller_epcs_control_port_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted epcs_controller/epcs_control_port last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_epcs_controller_epcs_control_port <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_epcs_controller_epcs_control_port <= cpu_0_instruction_master_saved_grant_epcs_controller_epcs_control_port ? 1 : (epcs_controller_epcs_control_port_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_epcs_controller_epcs_control_port) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_epcs_controller_epcs_control_port;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_epcs_controller_epcs_control_port & cpu_0_instruction_master_requests_epcs_controller_epcs_control_port;

  //epcs_controller_epcs_control_port_any_continuerequest at least one master continues requesting, which is an e_mux
  assign epcs_controller_epcs_control_port_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port = cpu_0_data_master_requests_epcs_controller_epcs_control_port & ~(cpu_0_instruction_master_arbiterlock);
  //epcs_controller_epcs_control_port_writedata mux, which is an e_mux
  assign epcs_controller_epcs_control_port_writedata = cpu_0_data_master_writedata;

  //assign epcs_controller_epcs_control_port_endofpacket_from_sa = epcs_controller_epcs_control_port_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_endofpacket_from_sa = epcs_controller_epcs_control_port_endofpacket;

  assign cpu_0_instruction_master_requests_epcs_controller_epcs_control_port = (({cpu_0_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h900800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted epcs_controller/epcs_control_port last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_epcs_controller_epcs_control_port <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_epcs_controller_epcs_control_port <= cpu_0_data_master_saved_grant_epcs_controller_epcs_control_port ? 1 : (epcs_controller_epcs_control_port_arbitration_holdoff_internal | ~cpu_0_data_master_requests_epcs_controller_epcs_control_port) ? 0 : last_cycle_cpu_0_data_master_granted_slave_epcs_controller_epcs_control_port;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_epcs_controller_epcs_control_port & cpu_0_data_master_requests_epcs_controller_epcs_control_port;

  assign cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port = cpu_0_instruction_master_requests_epcs_controller_epcs_control_port & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port = cpu_0_instruction_master_granted_epcs_controller_epcs_control_port & cpu_0_instruction_master_read & ~epcs_controller_epcs_control_port_waits_for_read;

  //allow new arb cycle for epcs_controller/epcs_control_port, which is an e_assign
  assign epcs_controller_epcs_control_port_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for epcs_controller/epcs_control_port, which is an e_assign
  assign epcs_controller_epcs_control_port_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port;

  //cpu_0/instruction_master grant epcs_controller/epcs_control_port, which is an e_assign
  assign cpu_0_instruction_master_granted_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_grant_vector[0];

  //cpu_0/instruction_master saved-grant epcs_controller/epcs_control_port, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_arb_winner[0] && cpu_0_instruction_master_requests_epcs_controller_epcs_control_port;

  //cpu_0/data_master assignment into master qualified-requests vector for epcs_controller/epcs_control_port, which is an e_assign
  assign epcs_controller_epcs_control_port_master_qreq_vector[1] = cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port;

  //cpu_0/data_master grant epcs_controller/epcs_control_port, which is an e_assign
  assign cpu_0_data_master_granted_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_grant_vector[1];

  //cpu_0/data_master saved-grant epcs_controller/epcs_control_port, which is an e_assign
  assign cpu_0_data_master_saved_grant_epcs_controller_epcs_control_port = epcs_controller_epcs_control_port_arb_winner[1] && cpu_0_data_master_requests_epcs_controller_epcs_control_port;

  //epcs_controller/epcs_control_port chosen-master double-vector, which is an e_assign
  assign epcs_controller_epcs_control_port_chosen_master_double_vector = {epcs_controller_epcs_control_port_master_qreq_vector, epcs_controller_epcs_control_port_master_qreq_vector} & ({~epcs_controller_epcs_control_port_master_qreq_vector, ~epcs_controller_epcs_control_port_master_qreq_vector} + epcs_controller_epcs_control_port_arb_addend);

  //stable onehot encoding of arb winner
  assign epcs_controller_epcs_control_port_arb_winner = (epcs_controller_epcs_control_port_allow_new_arb_cycle & | epcs_controller_epcs_control_port_grant_vector) ? epcs_controller_epcs_control_port_grant_vector : epcs_controller_epcs_control_port_saved_chosen_master_vector;

  //saved epcs_controller_epcs_control_port_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_saved_chosen_master_vector <= 0;
      else if (epcs_controller_epcs_control_port_allow_new_arb_cycle)
          epcs_controller_epcs_control_port_saved_chosen_master_vector <= |epcs_controller_epcs_control_port_grant_vector ? epcs_controller_epcs_control_port_grant_vector : epcs_controller_epcs_control_port_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign epcs_controller_epcs_control_port_grant_vector = {(epcs_controller_epcs_control_port_chosen_master_double_vector[1] | epcs_controller_epcs_control_port_chosen_master_double_vector[3]),
    (epcs_controller_epcs_control_port_chosen_master_double_vector[0] | epcs_controller_epcs_control_port_chosen_master_double_vector[2])};

  //epcs_controller/epcs_control_port chosen master rotated left, which is an e_assign
  assign epcs_controller_epcs_control_port_chosen_master_rot_left = (epcs_controller_epcs_control_port_arb_winner << 1) ? (epcs_controller_epcs_control_port_arb_winner << 1) : 1;

  //epcs_controller/epcs_control_port's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_arb_addend <= 1;
      else if (|epcs_controller_epcs_control_port_grant_vector)
          epcs_controller_epcs_control_port_arb_addend <= epcs_controller_epcs_control_port_end_xfer? epcs_controller_epcs_control_port_chosen_master_rot_left : epcs_controller_epcs_control_port_grant_vector;
    end


  //epcs_controller_epcs_control_port_reset_n assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_reset_n = reset_n;

  assign epcs_controller_epcs_control_port_chipselect = cpu_0_data_master_granted_epcs_controller_epcs_control_port | cpu_0_instruction_master_granted_epcs_controller_epcs_control_port;
  //epcs_controller_epcs_control_port_firsttransfer first transaction, which is an e_assign
  assign epcs_controller_epcs_control_port_firsttransfer = epcs_controller_epcs_control_port_begins_xfer ? epcs_controller_epcs_control_port_unreg_firsttransfer : epcs_controller_epcs_control_port_reg_firsttransfer;

  //epcs_controller_epcs_control_port_unreg_firsttransfer first transaction, which is an e_assign
  assign epcs_controller_epcs_control_port_unreg_firsttransfer = ~(epcs_controller_epcs_control_port_slavearbiterlockenable & epcs_controller_epcs_control_port_any_continuerequest);

  //epcs_controller_epcs_control_port_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_controller_epcs_control_port_reg_firsttransfer <= 1'b1;
      else if (epcs_controller_epcs_control_port_begins_xfer)
          epcs_controller_epcs_control_port_reg_firsttransfer <= epcs_controller_epcs_control_port_unreg_firsttransfer;
    end


  //epcs_controller_epcs_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign epcs_controller_epcs_control_port_beginbursttransfer_internal = epcs_controller_epcs_control_port_begins_xfer;

  //epcs_controller_epcs_control_port_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign epcs_controller_epcs_control_port_arbitration_holdoff_internal = epcs_controller_epcs_control_port_begins_xfer & epcs_controller_epcs_control_port_firsttransfer;

  //~epcs_controller_epcs_control_port_read_n assignment, which is an e_mux
  assign epcs_controller_epcs_control_port_read_n = ~((cpu_0_data_master_granted_epcs_controller_epcs_control_port & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_epcs_controller_epcs_control_port & cpu_0_instruction_master_read));

  //~epcs_controller_epcs_control_port_write_n assignment, which is an e_mux
  assign epcs_controller_epcs_control_port_write_n = ~(cpu_0_data_master_granted_epcs_controller_epcs_control_port & cpu_0_data_master_write);

  assign shifted_address_to_epcs_controller_epcs_control_port_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //epcs_controller_epcs_control_port_address mux, which is an e_mux
  assign epcs_controller_epcs_control_port_address = (cpu_0_data_master_granted_epcs_controller_epcs_control_port)? (shifted_address_to_epcs_controller_epcs_control_port_from_cpu_0_data_master >> 2) :
    (shifted_address_to_epcs_controller_epcs_control_port_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_epcs_controller_epcs_control_port_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_epcs_controller_epcs_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_epcs_controller_epcs_control_port_end_xfer <= 1;
      else 
        d1_epcs_controller_epcs_control_port_end_xfer <= epcs_controller_epcs_control_port_end_xfer;
    end


  //epcs_controller_epcs_control_port_waits_for_read in a cycle, which is an e_mux
  assign epcs_controller_epcs_control_port_waits_for_read = epcs_controller_epcs_control_port_in_a_read_cycle & epcs_controller_epcs_control_port_begins_xfer;

  //epcs_controller_epcs_control_port_in_a_read_cycle assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_in_a_read_cycle = (cpu_0_data_master_granted_epcs_controller_epcs_control_port & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_epcs_controller_epcs_control_port & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = epcs_controller_epcs_control_port_in_a_read_cycle;

  //epcs_controller_epcs_control_port_waits_for_write in a cycle, which is an e_mux
  assign epcs_controller_epcs_control_port_waits_for_write = epcs_controller_epcs_control_port_in_a_write_cycle & epcs_controller_epcs_control_port_begins_xfer;

  //epcs_controller_epcs_control_port_in_a_write_cycle assignment, which is an e_assign
  assign epcs_controller_epcs_control_port_in_a_write_cycle = cpu_0_data_master_granted_epcs_controller_epcs_control_port & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = epcs_controller_epcs_control_port_in_a_write_cycle;

  assign wait_for_epcs_controller_epcs_control_port_counter = 0;
  //assign epcs_controller_epcs_control_port_irq_from_sa = epcs_controller_epcs_control_port_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_controller_epcs_control_port_irq_from_sa = epcs_controller_epcs_control_port_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //epcs_controller/epcs_control_port enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_epcs_controller_epcs_control_port + cpu_0_instruction_master_granted_epcs_controller_epcs_control_port > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_epcs_controller_epcs_control_port + cpu_0_instruction_master_saved_grant_epcs_controller_epcs_control_port > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_waitrequest,
                                                   cpu_0_data_master_write,
                                                   cpu_0_data_master_writedata,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
;

  output           cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [ 24: 0] shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1004000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest)) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write);

  assign shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master >> 2;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_16207_0_control_slave_arbitrator (
                                              // inputs:
                                               clk,
                                               cpu_0_data_master_address_to_slave,
                                               cpu_0_data_master_byteenable,
                                               cpu_0_data_master_read,
                                               cpu_0_data_master_write,
                                               cpu_0_data_master_writedata,
                                               lcd_16207_0_control_slave_readdata,
                                               reset_n,

                                              // outputs:
                                               cpu_0_data_master_granted_lcd_16207_0_control_slave,
                                               cpu_0_data_master_qualified_request_lcd_16207_0_control_slave,
                                               cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave,
                                               cpu_0_data_master_requests_lcd_16207_0_control_slave,
                                               d1_lcd_16207_0_control_slave_end_xfer,
                                               lcd_16207_0_control_slave_address,
                                               lcd_16207_0_control_slave_begintransfer,
                                               lcd_16207_0_control_slave_read,
                                               lcd_16207_0_control_slave_readdata_from_sa,
                                               lcd_16207_0_control_slave_reset_n,
                                               lcd_16207_0_control_slave_wait_counter_eq_0,
                                               lcd_16207_0_control_slave_wait_counter_eq_1,
                                               lcd_16207_0_control_slave_write,
                                               lcd_16207_0_control_slave_writedata
                                            )
;

  output           cpu_0_data_master_granted_lcd_16207_0_control_slave;
  output           cpu_0_data_master_qualified_request_lcd_16207_0_control_slave;
  output           cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave;
  output           cpu_0_data_master_requests_lcd_16207_0_control_slave;
  output           d1_lcd_16207_0_control_slave_end_xfer;
  output  [  1: 0] lcd_16207_0_control_slave_address;
  output           lcd_16207_0_control_slave_begintransfer;
  output           lcd_16207_0_control_slave_read;
  output  [  7: 0] lcd_16207_0_control_slave_readdata_from_sa;
  output           lcd_16207_0_control_slave_reset_n;
  output           lcd_16207_0_control_slave_wait_counter_eq_0;
  output           lcd_16207_0_control_slave_wait_counter_eq_1;
  output           lcd_16207_0_control_slave_write;
  output  [  7: 0] lcd_16207_0_control_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [  7: 0] lcd_16207_0_control_slave_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_lcd_16207_0_control_slave;
  wire             cpu_0_data_master_qualified_request_lcd_16207_0_control_slave;
  wire             cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave;
  wire             cpu_0_data_master_requests_lcd_16207_0_control_slave;
  wire             cpu_0_data_master_saved_grant_lcd_16207_0_control_slave;
  reg              d1_lcd_16207_0_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_16207_0_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_16207_0_control_slave_address;
  wire             lcd_16207_0_control_slave_allgrants;
  wire             lcd_16207_0_control_slave_allow_new_arb_cycle;
  wire             lcd_16207_0_control_slave_any_bursting_master_saved_grant;
  wire             lcd_16207_0_control_slave_any_continuerequest;
  wire             lcd_16207_0_control_slave_arb_counter_enable;
  reg     [  2: 0] lcd_16207_0_control_slave_arb_share_counter;
  wire    [  2: 0] lcd_16207_0_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] lcd_16207_0_control_slave_arb_share_set_values;
  wire             lcd_16207_0_control_slave_beginbursttransfer_internal;
  wire             lcd_16207_0_control_slave_begins_xfer;
  wire             lcd_16207_0_control_slave_begintransfer;
  wire    [  5: 0] lcd_16207_0_control_slave_counter_load_value;
  wire             lcd_16207_0_control_slave_end_xfer;
  wire             lcd_16207_0_control_slave_firsttransfer;
  wire             lcd_16207_0_control_slave_grant_vector;
  wire             lcd_16207_0_control_slave_in_a_read_cycle;
  wire             lcd_16207_0_control_slave_in_a_write_cycle;
  wire             lcd_16207_0_control_slave_master_qreq_vector;
  wire             lcd_16207_0_control_slave_non_bursting_master_requests;
  wire             lcd_16207_0_control_slave_pretend_byte_enable;
  wire             lcd_16207_0_control_slave_read;
  wire    [  7: 0] lcd_16207_0_control_slave_readdata_from_sa;
  reg              lcd_16207_0_control_slave_reg_firsttransfer;
  wire             lcd_16207_0_control_slave_reset_n;
  reg              lcd_16207_0_control_slave_slavearbiterlockenable;
  wire             lcd_16207_0_control_slave_slavearbiterlockenable2;
  wire             lcd_16207_0_control_slave_unreg_firsttransfer;
  reg     [  5: 0] lcd_16207_0_control_slave_wait_counter;
  wire             lcd_16207_0_control_slave_wait_counter_eq_0;
  wire             lcd_16207_0_control_slave_wait_counter_eq_1;
  wire             lcd_16207_0_control_slave_waits_for_read;
  wire             lcd_16207_0_control_slave_waits_for_write;
  wire             lcd_16207_0_control_slave_write;
  wire    [  7: 0] lcd_16207_0_control_slave_writedata;
  wire    [ 24: 0] shifted_address_to_lcd_16207_0_control_slave_from_cpu_0_data_master;
  wire             wait_for_lcd_16207_0_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_16207_0_control_slave_end_xfer;
    end


  assign lcd_16207_0_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_lcd_16207_0_control_slave));
  //assign lcd_16207_0_control_slave_readdata_from_sa = lcd_16207_0_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_16207_0_control_slave_readdata_from_sa = lcd_16207_0_control_slave_readdata;

  assign cpu_0_data_master_requests_lcd_16207_0_control_slave = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h900030) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //lcd_16207_0_control_slave_arb_share_counter set values, which is an e_mux
  assign lcd_16207_0_control_slave_arb_share_set_values = 1;

  //lcd_16207_0_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign lcd_16207_0_control_slave_non_bursting_master_requests = cpu_0_data_master_requests_lcd_16207_0_control_slave;

  //lcd_16207_0_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_16207_0_control_slave_any_bursting_master_saved_grant = 0;

  //lcd_16207_0_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_16207_0_control_slave_arb_share_counter_next_value = lcd_16207_0_control_slave_firsttransfer ? (lcd_16207_0_control_slave_arb_share_set_values - 1) : |lcd_16207_0_control_slave_arb_share_counter ? (lcd_16207_0_control_slave_arb_share_counter - 1) : 0;

  //lcd_16207_0_control_slave_allgrants all slave grants, which is an e_mux
  assign lcd_16207_0_control_slave_allgrants = |lcd_16207_0_control_slave_grant_vector;

  //lcd_16207_0_control_slave_end_xfer assignment, which is an e_assign
  assign lcd_16207_0_control_slave_end_xfer = ~(lcd_16207_0_control_slave_waits_for_read | lcd_16207_0_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_16207_0_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_16207_0_control_slave = lcd_16207_0_control_slave_end_xfer & (~lcd_16207_0_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_16207_0_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_16207_0_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_16207_0_control_slave & lcd_16207_0_control_slave_allgrants) | (end_xfer_arb_share_counter_term_lcd_16207_0_control_slave & ~lcd_16207_0_control_slave_non_bursting_master_requests);

  //lcd_16207_0_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_16207_0_control_slave_arb_share_counter <= 0;
      else if (lcd_16207_0_control_slave_arb_counter_enable)
          lcd_16207_0_control_slave_arb_share_counter <= lcd_16207_0_control_slave_arb_share_counter_next_value;
    end


  //lcd_16207_0_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_16207_0_control_slave_slavearbiterlockenable <= 0;
      else if ((|lcd_16207_0_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_16207_0_control_slave) | (end_xfer_arb_share_counter_term_lcd_16207_0_control_slave & ~lcd_16207_0_control_slave_non_bursting_master_requests))
          lcd_16207_0_control_slave_slavearbiterlockenable <= |lcd_16207_0_control_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master lcd_16207_0/control_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = lcd_16207_0_control_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //lcd_16207_0_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_16207_0_control_slave_slavearbiterlockenable2 = |lcd_16207_0_control_slave_arb_share_counter_next_value;

  //cpu_0/data_master lcd_16207_0/control_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = lcd_16207_0_control_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //lcd_16207_0_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_16207_0_control_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_lcd_16207_0_control_slave = cpu_0_data_master_requests_lcd_16207_0_control_slave;
  //lcd_16207_0_control_slave_writedata mux, which is an e_mux
  assign lcd_16207_0_control_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_lcd_16207_0_control_slave = cpu_0_data_master_qualified_request_lcd_16207_0_control_slave;

  //cpu_0/data_master saved-grant lcd_16207_0/control_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_lcd_16207_0_control_slave = cpu_0_data_master_requests_lcd_16207_0_control_slave;

  //allow new arb cycle for lcd_16207_0/control_slave, which is an e_assign
  assign lcd_16207_0_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_16207_0_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_16207_0_control_slave_master_qreq_vector = 1;

  assign lcd_16207_0_control_slave_begintransfer = lcd_16207_0_control_slave_begins_xfer;
  //lcd_16207_0_control_slave_reset_n assignment, which is an e_assign
  assign lcd_16207_0_control_slave_reset_n = reset_n;

  //lcd_16207_0_control_slave_firsttransfer first transaction, which is an e_assign
  assign lcd_16207_0_control_slave_firsttransfer = lcd_16207_0_control_slave_begins_xfer ? lcd_16207_0_control_slave_unreg_firsttransfer : lcd_16207_0_control_slave_reg_firsttransfer;

  //lcd_16207_0_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_16207_0_control_slave_unreg_firsttransfer = ~(lcd_16207_0_control_slave_slavearbiterlockenable & lcd_16207_0_control_slave_any_continuerequest);

  //lcd_16207_0_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_16207_0_control_slave_reg_firsttransfer <= 1'b1;
      else if (lcd_16207_0_control_slave_begins_xfer)
          lcd_16207_0_control_slave_reg_firsttransfer <= lcd_16207_0_control_slave_unreg_firsttransfer;
    end


  //lcd_16207_0_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_16207_0_control_slave_beginbursttransfer_internal = lcd_16207_0_control_slave_begins_xfer;

  //lcd_16207_0_control_slave_read assignment, which is an e_mux
  assign lcd_16207_0_control_slave_read = ((cpu_0_data_master_granted_lcd_16207_0_control_slave & cpu_0_data_master_read))& ~lcd_16207_0_control_slave_begins_xfer & (lcd_16207_0_control_slave_wait_counter < 13);

  //lcd_16207_0_control_slave_write assignment, which is an e_mux
  assign lcd_16207_0_control_slave_write = ((cpu_0_data_master_granted_lcd_16207_0_control_slave & cpu_0_data_master_write)) & ~lcd_16207_0_control_slave_begins_xfer & (lcd_16207_0_control_slave_wait_counter >= 13) & (lcd_16207_0_control_slave_wait_counter < 26) & lcd_16207_0_control_slave_pretend_byte_enable;

  assign shifted_address_to_lcd_16207_0_control_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //lcd_16207_0_control_slave_address mux, which is an e_mux
  assign lcd_16207_0_control_slave_address = shifted_address_to_lcd_16207_0_control_slave_from_cpu_0_data_master >> 2;

  //d1_lcd_16207_0_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_16207_0_control_slave_end_xfer <= 1;
      else 
        d1_lcd_16207_0_control_slave_end_xfer <= lcd_16207_0_control_slave_end_xfer;
    end


  //lcd_16207_0_control_slave_wait_counter_eq_1 assignment, which is an e_assign
  assign lcd_16207_0_control_slave_wait_counter_eq_1 = lcd_16207_0_control_slave_wait_counter == 1;

  //lcd_16207_0_control_slave_waits_for_read in a cycle, which is an e_mux
  assign lcd_16207_0_control_slave_waits_for_read = lcd_16207_0_control_slave_in_a_read_cycle & wait_for_lcd_16207_0_control_slave_counter;

  //lcd_16207_0_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign lcd_16207_0_control_slave_in_a_read_cycle = cpu_0_data_master_granted_lcd_16207_0_control_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_16207_0_control_slave_in_a_read_cycle;

  //lcd_16207_0_control_slave_waits_for_write in a cycle, which is an e_mux
  assign lcd_16207_0_control_slave_waits_for_write = lcd_16207_0_control_slave_in_a_write_cycle & wait_for_lcd_16207_0_control_slave_counter;

  //lcd_16207_0_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign lcd_16207_0_control_slave_in_a_write_cycle = cpu_0_data_master_granted_lcd_16207_0_control_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_16207_0_control_slave_in_a_write_cycle;

  assign lcd_16207_0_control_slave_wait_counter_eq_0 = lcd_16207_0_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_16207_0_control_slave_wait_counter <= 0;
      else 
        lcd_16207_0_control_slave_wait_counter <= lcd_16207_0_control_slave_counter_load_value;
    end


  assign lcd_16207_0_control_slave_counter_load_value = ((lcd_16207_0_control_slave_in_a_read_cycle & lcd_16207_0_control_slave_begins_xfer))? 24 :
    ((lcd_16207_0_control_slave_in_a_write_cycle & lcd_16207_0_control_slave_begins_xfer))? 37 :
    (~lcd_16207_0_control_slave_wait_counter_eq_0)? lcd_16207_0_control_slave_wait_counter - 1 :
    0;

  assign wait_for_lcd_16207_0_control_slave_counter = lcd_16207_0_control_slave_begins_xfer | ~lcd_16207_0_control_slave_wait_counter_eq_0;
  //lcd_16207_0_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign lcd_16207_0_control_slave_pretend_byte_enable = (cpu_0_data_master_granted_lcd_16207_0_control_slave)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_16207_0/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led_green_s1_arbitrator (
                                 // inputs:
                                  clk,
                                  cpu_0_data_master_address_to_slave,
                                  cpu_0_data_master_read,
                                  cpu_0_data_master_waitrequest,
                                  cpu_0_data_master_write,
                                  cpu_0_data_master_writedata,
                                  led_green_s1_readdata,
                                  reset_n,

                                 // outputs:
                                  cpu_0_data_master_granted_led_green_s1,
                                  cpu_0_data_master_qualified_request_led_green_s1,
                                  cpu_0_data_master_read_data_valid_led_green_s1,
                                  cpu_0_data_master_requests_led_green_s1,
                                  d1_led_green_s1_end_xfer,
                                  led_green_s1_address,
                                  led_green_s1_chipselect,
                                  led_green_s1_readdata_from_sa,
                                  led_green_s1_reset_n,
                                  led_green_s1_write_n,
                                  led_green_s1_writedata
                               )
;

  output           cpu_0_data_master_granted_led_green_s1;
  output           cpu_0_data_master_qualified_request_led_green_s1;
  output           cpu_0_data_master_read_data_valid_led_green_s1;
  output           cpu_0_data_master_requests_led_green_s1;
  output           d1_led_green_s1_end_xfer;
  output  [  1: 0] led_green_s1_address;
  output           led_green_s1_chipselect;
  output  [ 31: 0] led_green_s1_readdata_from_sa;
  output           led_green_s1_reset_n;
  output           led_green_s1_write_n;
  output  [ 31: 0] led_green_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] led_green_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_led_green_s1;
  wire             cpu_0_data_master_qualified_request_led_green_s1;
  wire             cpu_0_data_master_read_data_valid_led_green_s1;
  wire             cpu_0_data_master_requests_led_green_s1;
  wire             cpu_0_data_master_saved_grant_led_green_s1;
  reg              d1_led_green_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_led_green_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] led_green_s1_address;
  wire             led_green_s1_allgrants;
  wire             led_green_s1_allow_new_arb_cycle;
  wire             led_green_s1_any_bursting_master_saved_grant;
  wire             led_green_s1_any_continuerequest;
  wire             led_green_s1_arb_counter_enable;
  reg     [  2: 0] led_green_s1_arb_share_counter;
  wire    [  2: 0] led_green_s1_arb_share_counter_next_value;
  wire    [  2: 0] led_green_s1_arb_share_set_values;
  wire             led_green_s1_beginbursttransfer_internal;
  wire             led_green_s1_begins_xfer;
  wire             led_green_s1_chipselect;
  wire             led_green_s1_end_xfer;
  wire             led_green_s1_firsttransfer;
  wire             led_green_s1_grant_vector;
  wire             led_green_s1_in_a_read_cycle;
  wire             led_green_s1_in_a_write_cycle;
  wire             led_green_s1_master_qreq_vector;
  wire             led_green_s1_non_bursting_master_requests;
  wire    [ 31: 0] led_green_s1_readdata_from_sa;
  reg              led_green_s1_reg_firsttransfer;
  wire             led_green_s1_reset_n;
  reg              led_green_s1_slavearbiterlockenable;
  wire             led_green_s1_slavearbiterlockenable2;
  wire             led_green_s1_unreg_firsttransfer;
  wire             led_green_s1_waits_for_read;
  wire             led_green_s1_waits_for_write;
  wire             led_green_s1_write_n;
  wire    [ 31: 0] led_green_s1_writedata;
  wire    [ 24: 0] shifted_address_to_led_green_s1_from_cpu_0_data_master;
  wire             wait_for_led_green_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~led_green_s1_end_xfer;
    end


  assign led_green_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_led_green_s1));
  //assign led_green_s1_readdata_from_sa = led_green_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign led_green_s1_readdata_from_sa = led_green_s1_readdata;

  assign cpu_0_data_master_requests_led_green_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h9000c0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //led_green_s1_arb_share_counter set values, which is an e_mux
  assign led_green_s1_arb_share_set_values = 1;

  //led_green_s1_non_bursting_master_requests mux, which is an e_mux
  assign led_green_s1_non_bursting_master_requests = cpu_0_data_master_requests_led_green_s1;

  //led_green_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign led_green_s1_any_bursting_master_saved_grant = 0;

  //led_green_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign led_green_s1_arb_share_counter_next_value = led_green_s1_firsttransfer ? (led_green_s1_arb_share_set_values - 1) : |led_green_s1_arb_share_counter ? (led_green_s1_arb_share_counter - 1) : 0;

  //led_green_s1_allgrants all slave grants, which is an e_mux
  assign led_green_s1_allgrants = |led_green_s1_grant_vector;

  //led_green_s1_end_xfer assignment, which is an e_assign
  assign led_green_s1_end_xfer = ~(led_green_s1_waits_for_read | led_green_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_led_green_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_led_green_s1 = led_green_s1_end_xfer & (~led_green_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //led_green_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign led_green_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_led_green_s1 & led_green_s1_allgrants) | (end_xfer_arb_share_counter_term_led_green_s1 & ~led_green_s1_non_bursting_master_requests);

  //led_green_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_green_s1_arb_share_counter <= 0;
      else if (led_green_s1_arb_counter_enable)
          led_green_s1_arb_share_counter <= led_green_s1_arb_share_counter_next_value;
    end


  //led_green_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_green_s1_slavearbiterlockenable <= 0;
      else if ((|led_green_s1_master_qreq_vector & end_xfer_arb_share_counter_term_led_green_s1) | (end_xfer_arb_share_counter_term_led_green_s1 & ~led_green_s1_non_bursting_master_requests))
          led_green_s1_slavearbiterlockenable <= |led_green_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master led_green/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = led_green_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //led_green_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign led_green_s1_slavearbiterlockenable2 = |led_green_s1_arb_share_counter_next_value;

  //cpu_0/data_master led_green/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = led_green_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //led_green_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign led_green_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_led_green_s1 = cpu_0_data_master_requests_led_green_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //led_green_s1_writedata mux, which is an e_mux
  assign led_green_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_led_green_s1 = cpu_0_data_master_qualified_request_led_green_s1;

  //cpu_0/data_master saved-grant led_green/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_led_green_s1 = cpu_0_data_master_requests_led_green_s1;

  //allow new arb cycle for led_green/s1, which is an e_assign
  assign led_green_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign led_green_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign led_green_s1_master_qreq_vector = 1;

  //led_green_s1_reset_n assignment, which is an e_assign
  assign led_green_s1_reset_n = reset_n;

  assign led_green_s1_chipselect = cpu_0_data_master_granted_led_green_s1;
  //led_green_s1_firsttransfer first transaction, which is an e_assign
  assign led_green_s1_firsttransfer = led_green_s1_begins_xfer ? led_green_s1_unreg_firsttransfer : led_green_s1_reg_firsttransfer;

  //led_green_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign led_green_s1_unreg_firsttransfer = ~(led_green_s1_slavearbiterlockenable & led_green_s1_any_continuerequest);

  //led_green_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_green_s1_reg_firsttransfer <= 1'b1;
      else if (led_green_s1_begins_xfer)
          led_green_s1_reg_firsttransfer <= led_green_s1_unreg_firsttransfer;
    end


  //led_green_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign led_green_s1_beginbursttransfer_internal = led_green_s1_begins_xfer;

  //~led_green_s1_write_n assignment, which is an e_mux
  assign led_green_s1_write_n = ~(cpu_0_data_master_granted_led_green_s1 & cpu_0_data_master_write);

  assign shifted_address_to_led_green_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //led_green_s1_address mux, which is an e_mux
  assign led_green_s1_address = shifted_address_to_led_green_s1_from_cpu_0_data_master >> 2;

  //d1_led_green_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_led_green_s1_end_xfer <= 1;
      else 
        d1_led_green_s1_end_xfer <= led_green_s1_end_xfer;
    end


  //led_green_s1_waits_for_read in a cycle, which is an e_mux
  assign led_green_s1_waits_for_read = led_green_s1_in_a_read_cycle & led_green_s1_begins_xfer;

  //led_green_s1_in_a_read_cycle assignment, which is an e_assign
  assign led_green_s1_in_a_read_cycle = cpu_0_data_master_granted_led_green_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = led_green_s1_in_a_read_cycle;

  //led_green_s1_waits_for_write in a cycle, which is an e_mux
  assign led_green_s1_waits_for_write = led_green_s1_in_a_write_cycle & 0;

  //led_green_s1_in_a_write_cycle assignment, which is an e_assign
  assign led_green_s1_in_a_write_cycle = cpu_0_data_master_granted_led_green_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = led_green_s1_in_a_write_cycle;

  assign wait_for_led_green_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //led_green/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led_red_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_read,
                                cpu_0_data_master_waitrequest,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                led_red_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_0_data_master_granted_led_red_s1,
                                cpu_0_data_master_qualified_request_led_red_s1,
                                cpu_0_data_master_read_data_valid_led_red_s1,
                                cpu_0_data_master_requests_led_red_s1,
                                d1_led_red_s1_end_xfer,
                                led_red_s1_address,
                                led_red_s1_chipselect,
                                led_red_s1_readdata_from_sa,
                                led_red_s1_reset_n,
                                led_red_s1_write_n,
                                led_red_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_led_red_s1;
  output           cpu_0_data_master_qualified_request_led_red_s1;
  output           cpu_0_data_master_read_data_valid_led_red_s1;
  output           cpu_0_data_master_requests_led_red_s1;
  output           d1_led_red_s1_end_xfer;
  output  [  1: 0] led_red_s1_address;
  output           led_red_s1_chipselect;
  output  [ 31: 0] led_red_s1_readdata_from_sa;
  output           led_red_s1_reset_n;
  output           led_red_s1_write_n;
  output  [ 31: 0] led_red_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] led_red_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_led_red_s1;
  wire             cpu_0_data_master_qualified_request_led_red_s1;
  wire             cpu_0_data_master_read_data_valid_led_red_s1;
  wire             cpu_0_data_master_requests_led_red_s1;
  wire             cpu_0_data_master_saved_grant_led_red_s1;
  reg              d1_led_red_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_led_red_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] led_red_s1_address;
  wire             led_red_s1_allgrants;
  wire             led_red_s1_allow_new_arb_cycle;
  wire             led_red_s1_any_bursting_master_saved_grant;
  wire             led_red_s1_any_continuerequest;
  wire             led_red_s1_arb_counter_enable;
  reg     [  2: 0] led_red_s1_arb_share_counter;
  wire    [  2: 0] led_red_s1_arb_share_counter_next_value;
  wire    [  2: 0] led_red_s1_arb_share_set_values;
  wire             led_red_s1_beginbursttransfer_internal;
  wire             led_red_s1_begins_xfer;
  wire             led_red_s1_chipselect;
  wire             led_red_s1_end_xfer;
  wire             led_red_s1_firsttransfer;
  wire             led_red_s1_grant_vector;
  wire             led_red_s1_in_a_read_cycle;
  wire             led_red_s1_in_a_write_cycle;
  wire             led_red_s1_master_qreq_vector;
  wire             led_red_s1_non_bursting_master_requests;
  wire    [ 31: 0] led_red_s1_readdata_from_sa;
  reg              led_red_s1_reg_firsttransfer;
  wire             led_red_s1_reset_n;
  reg              led_red_s1_slavearbiterlockenable;
  wire             led_red_s1_slavearbiterlockenable2;
  wire             led_red_s1_unreg_firsttransfer;
  wire             led_red_s1_waits_for_read;
  wire             led_red_s1_waits_for_write;
  wire             led_red_s1_write_n;
  wire    [ 31: 0] led_red_s1_writedata;
  wire    [ 24: 0] shifted_address_to_led_red_s1_from_cpu_0_data_master;
  wire             wait_for_led_red_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~led_red_s1_end_xfer;
    end


  assign led_red_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_led_red_s1));
  //assign led_red_s1_readdata_from_sa = led_red_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign led_red_s1_readdata_from_sa = led_red_s1_readdata;

  assign cpu_0_data_master_requests_led_red_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h9000d0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //led_red_s1_arb_share_counter set values, which is an e_mux
  assign led_red_s1_arb_share_set_values = 1;

  //led_red_s1_non_bursting_master_requests mux, which is an e_mux
  assign led_red_s1_non_bursting_master_requests = cpu_0_data_master_requests_led_red_s1;

  //led_red_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign led_red_s1_any_bursting_master_saved_grant = 0;

  //led_red_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign led_red_s1_arb_share_counter_next_value = led_red_s1_firsttransfer ? (led_red_s1_arb_share_set_values - 1) : |led_red_s1_arb_share_counter ? (led_red_s1_arb_share_counter - 1) : 0;

  //led_red_s1_allgrants all slave grants, which is an e_mux
  assign led_red_s1_allgrants = |led_red_s1_grant_vector;

  //led_red_s1_end_xfer assignment, which is an e_assign
  assign led_red_s1_end_xfer = ~(led_red_s1_waits_for_read | led_red_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_led_red_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_led_red_s1 = led_red_s1_end_xfer & (~led_red_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //led_red_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign led_red_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_led_red_s1 & led_red_s1_allgrants) | (end_xfer_arb_share_counter_term_led_red_s1 & ~led_red_s1_non_bursting_master_requests);

  //led_red_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_red_s1_arb_share_counter <= 0;
      else if (led_red_s1_arb_counter_enable)
          led_red_s1_arb_share_counter <= led_red_s1_arb_share_counter_next_value;
    end


  //led_red_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_red_s1_slavearbiterlockenable <= 0;
      else if ((|led_red_s1_master_qreq_vector & end_xfer_arb_share_counter_term_led_red_s1) | (end_xfer_arb_share_counter_term_led_red_s1 & ~led_red_s1_non_bursting_master_requests))
          led_red_s1_slavearbiterlockenable <= |led_red_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master led_red/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = led_red_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //led_red_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign led_red_s1_slavearbiterlockenable2 = |led_red_s1_arb_share_counter_next_value;

  //cpu_0/data_master led_red/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = led_red_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //led_red_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign led_red_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_led_red_s1 = cpu_0_data_master_requests_led_red_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //led_red_s1_writedata mux, which is an e_mux
  assign led_red_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_led_red_s1 = cpu_0_data_master_qualified_request_led_red_s1;

  //cpu_0/data_master saved-grant led_red/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_led_red_s1 = cpu_0_data_master_requests_led_red_s1;

  //allow new arb cycle for led_red/s1, which is an e_assign
  assign led_red_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign led_red_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign led_red_s1_master_qreq_vector = 1;

  //led_red_s1_reset_n assignment, which is an e_assign
  assign led_red_s1_reset_n = reset_n;

  assign led_red_s1_chipselect = cpu_0_data_master_granted_led_red_s1;
  //led_red_s1_firsttransfer first transaction, which is an e_assign
  assign led_red_s1_firsttransfer = led_red_s1_begins_xfer ? led_red_s1_unreg_firsttransfer : led_red_s1_reg_firsttransfer;

  //led_red_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign led_red_s1_unreg_firsttransfer = ~(led_red_s1_slavearbiterlockenable & led_red_s1_any_continuerequest);

  //led_red_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_red_s1_reg_firsttransfer <= 1'b1;
      else if (led_red_s1_begins_xfer)
          led_red_s1_reg_firsttransfer <= led_red_s1_unreg_firsttransfer;
    end


  //led_red_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign led_red_s1_beginbursttransfer_internal = led_red_s1_begins_xfer;

  //~led_red_s1_write_n assignment, which is an e_mux
  assign led_red_s1_write_n = ~(cpu_0_data_master_granted_led_red_s1 & cpu_0_data_master_write);

  assign shifted_address_to_led_red_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //led_red_s1_address mux, which is an e_mux
  assign led_red_s1_address = shifted_address_to_led_red_s1_from_cpu_0_data_master >> 2;

  //d1_led_red_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_led_red_s1_end_xfer <= 1;
      else 
        d1_led_red_s1_end_xfer <= led_red_s1_end_xfer;
    end


  //led_red_s1_waits_for_read in a cycle, which is an e_mux
  assign led_red_s1_waits_for_read = led_red_s1_in_a_read_cycle & led_red_s1_begins_xfer;

  //led_red_s1_in_a_read_cycle assignment, which is an e_assign
  assign led_red_s1_in_a_read_cycle = cpu_0_data_master_granted_led_red_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = led_red_s1_in_a_read_cycle;

  //led_red_s1_waits_for_write in a cycle, which is an e_mux
  assign led_red_s1_waits_for_write = led_red_s1_in_a_write_cycle & 0;

  //led_red_s1_in_a_write_cycle assignment, which is an e_assign
  assign led_red_s1_in_a_write_cycle = cpu_0_data_master_granted_led_red_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = led_red_s1_in_a_write_cycle;

  assign wait_for_led_red_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //led_red/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ps2_0_avalon_PS2_slave_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_0_data_master_address_to_slave,
                                            cpu_0_data_master_byteenable,
                                            cpu_0_data_master_read,
                                            cpu_0_data_master_waitrequest,
                                            cpu_0_data_master_write,
                                            cpu_0_data_master_writedata,
                                            ps2_0_avalon_PS2_slave_irq,
                                            ps2_0_avalon_PS2_slave_readdata,
                                            ps2_0_avalon_PS2_slave_waitrequest,
                                            reset_n,

                                           // outputs:
                                            cpu_0_data_master_granted_ps2_0_avalon_PS2_slave,
                                            cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave,
                                            cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave,
                                            cpu_0_data_master_requests_ps2_0_avalon_PS2_slave,
                                            d1_ps2_0_avalon_PS2_slave_end_xfer,
                                            ps2_0_avalon_PS2_slave_address,
                                            ps2_0_avalon_PS2_slave_byteenable,
                                            ps2_0_avalon_PS2_slave_chipselect,
                                            ps2_0_avalon_PS2_slave_irq_from_sa,
                                            ps2_0_avalon_PS2_slave_read,
                                            ps2_0_avalon_PS2_slave_readdata_from_sa,
                                            ps2_0_avalon_PS2_slave_waitrequest_from_sa,
                                            ps2_0_avalon_PS2_slave_write,
                                            ps2_0_avalon_PS2_slave_writedata,
                                            registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave
                                         )
;

  output           cpu_0_data_master_granted_ps2_0_avalon_PS2_slave;
  output           cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave;
  output           cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave;
  output           cpu_0_data_master_requests_ps2_0_avalon_PS2_slave;
  output           d1_ps2_0_avalon_PS2_slave_end_xfer;
  output           ps2_0_avalon_PS2_slave_address;
  output  [  3: 0] ps2_0_avalon_PS2_slave_byteenable;
  output           ps2_0_avalon_PS2_slave_chipselect;
  output           ps2_0_avalon_PS2_slave_irq_from_sa;
  output           ps2_0_avalon_PS2_slave_read;
  output  [ 31: 0] ps2_0_avalon_PS2_slave_readdata_from_sa;
  output           ps2_0_avalon_PS2_slave_waitrequest_from_sa;
  output           ps2_0_avalon_PS2_slave_write;
  output  [ 31: 0] ps2_0_avalon_PS2_slave_writedata;
  output           registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            ps2_0_avalon_PS2_slave_irq;
  input   [ 31: 0] ps2_0_avalon_PS2_slave_readdata;
  input            ps2_0_avalon_PS2_slave_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_ps2_0_avalon_PS2_slave;
  wire             cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave;
  wire             cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave;
  reg              cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register_in;
  wire             cpu_0_data_master_requests_ps2_0_avalon_PS2_slave;
  wire             cpu_0_data_master_saved_grant_ps2_0_avalon_PS2_slave;
  reg              d1_ps2_0_avalon_PS2_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_ps2_0_avalon_PS2_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register;
  wire             ps2_0_avalon_PS2_slave_address;
  wire             ps2_0_avalon_PS2_slave_allgrants;
  wire             ps2_0_avalon_PS2_slave_allow_new_arb_cycle;
  wire             ps2_0_avalon_PS2_slave_any_bursting_master_saved_grant;
  wire             ps2_0_avalon_PS2_slave_any_continuerequest;
  wire             ps2_0_avalon_PS2_slave_arb_counter_enable;
  reg     [  2: 0] ps2_0_avalon_PS2_slave_arb_share_counter;
  wire    [  2: 0] ps2_0_avalon_PS2_slave_arb_share_counter_next_value;
  wire    [  2: 0] ps2_0_avalon_PS2_slave_arb_share_set_values;
  wire             ps2_0_avalon_PS2_slave_beginbursttransfer_internal;
  wire             ps2_0_avalon_PS2_slave_begins_xfer;
  wire    [  3: 0] ps2_0_avalon_PS2_slave_byteenable;
  wire             ps2_0_avalon_PS2_slave_chipselect;
  wire             ps2_0_avalon_PS2_slave_end_xfer;
  wire             ps2_0_avalon_PS2_slave_firsttransfer;
  wire             ps2_0_avalon_PS2_slave_grant_vector;
  wire             ps2_0_avalon_PS2_slave_in_a_read_cycle;
  wire             ps2_0_avalon_PS2_slave_in_a_write_cycle;
  wire             ps2_0_avalon_PS2_slave_irq_from_sa;
  wire             ps2_0_avalon_PS2_slave_master_qreq_vector;
  wire             ps2_0_avalon_PS2_slave_non_bursting_master_requests;
  wire             ps2_0_avalon_PS2_slave_read;
  wire    [ 31: 0] ps2_0_avalon_PS2_slave_readdata_from_sa;
  reg              ps2_0_avalon_PS2_slave_reg_firsttransfer;
  reg              ps2_0_avalon_PS2_slave_slavearbiterlockenable;
  wire             ps2_0_avalon_PS2_slave_slavearbiterlockenable2;
  wire             ps2_0_avalon_PS2_slave_unreg_firsttransfer;
  wire             ps2_0_avalon_PS2_slave_waitrequest_from_sa;
  wire             ps2_0_avalon_PS2_slave_waits_for_read;
  wire             ps2_0_avalon_PS2_slave_waits_for_write;
  wire             ps2_0_avalon_PS2_slave_write;
  wire    [ 31: 0] ps2_0_avalon_PS2_slave_writedata;
  wire             registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave;
  wire    [ 24: 0] shifted_address_to_ps2_0_avalon_PS2_slave_from_cpu_0_data_master;
  wire             wait_for_ps2_0_avalon_PS2_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~ps2_0_avalon_PS2_slave_end_xfer;
    end


  assign ps2_0_avalon_PS2_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave));
  //assign ps2_0_avalon_PS2_slave_readdata_from_sa = ps2_0_avalon_PS2_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ps2_0_avalon_PS2_slave_readdata_from_sa = ps2_0_avalon_PS2_slave_readdata;

  assign cpu_0_data_master_requests_ps2_0_avalon_PS2_slave = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h900098) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign ps2_0_avalon_PS2_slave_waitrequest_from_sa = ps2_0_avalon_PS2_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ps2_0_avalon_PS2_slave_waitrequest_from_sa = ps2_0_avalon_PS2_slave_waitrequest;

  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave = cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register_in;

  //ps2_0_avalon_PS2_slave_arb_share_counter set values, which is an e_mux
  assign ps2_0_avalon_PS2_slave_arb_share_set_values = 1;

  //ps2_0_avalon_PS2_slave_non_bursting_master_requests mux, which is an e_mux
  assign ps2_0_avalon_PS2_slave_non_bursting_master_requests = cpu_0_data_master_requests_ps2_0_avalon_PS2_slave;

  //ps2_0_avalon_PS2_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign ps2_0_avalon_PS2_slave_any_bursting_master_saved_grant = 0;

  //ps2_0_avalon_PS2_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign ps2_0_avalon_PS2_slave_arb_share_counter_next_value = ps2_0_avalon_PS2_slave_firsttransfer ? (ps2_0_avalon_PS2_slave_arb_share_set_values - 1) : |ps2_0_avalon_PS2_slave_arb_share_counter ? (ps2_0_avalon_PS2_slave_arb_share_counter - 1) : 0;

  //ps2_0_avalon_PS2_slave_allgrants all slave grants, which is an e_mux
  assign ps2_0_avalon_PS2_slave_allgrants = |ps2_0_avalon_PS2_slave_grant_vector;

  //ps2_0_avalon_PS2_slave_end_xfer assignment, which is an e_assign
  assign ps2_0_avalon_PS2_slave_end_xfer = ~(ps2_0_avalon_PS2_slave_waits_for_read | ps2_0_avalon_PS2_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_ps2_0_avalon_PS2_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_ps2_0_avalon_PS2_slave = ps2_0_avalon_PS2_slave_end_xfer & (~ps2_0_avalon_PS2_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //ps2_0_avalon_PS2_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign ps2_0_avalon_PS2_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_ps2_0_avalon_PS2_slave & ps2_0_avalon_PS2_slave_allgrants) | (end_xfer_arb_share_counter_term_ps2_0_avalon_PS2_slave & ~ps2_0_avalon_PS2_slave_non_bursting_master_requests);

  //ps2_0_avalon_PS2_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ps2_0_avalon_PS2_slave_arb_share_counter <= 0;
      else if (ps2_0_avalon_PS2_slave_arb_counter_enable)
          ps2_0_avalon_PS2_slave_arb_share_counter <= ps2_0_avalon_PS2_slave_arb_share_counter_next_value;
    end


  //ps2_0_avalon_PS2_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ps2_0_avalon_PS2_slave_slavearbiterlockenable <= 0;
      else if ((|ps2_0_avalon_PS2_slave_master_qreq_vector & end_xfer_arb_share_counter_term_ps2_0_avalon_PS2_slave) | (end_xfer_arb_share_counter_term_ps2_0_avalon_PS2_slave & ~ps2_0_avalon_PS2_slave_non_bursting_master_requests))
          ps2_0_avalon_PS2_slave_slavearbiterlockenable <= |ps2_0_avalon_PS2_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master ps2_0/avalon_PS2_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = ps2_0_avalon_PS2_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //ps2_0_avalon_PS2_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign ps2_0_avalon_PS2_slave_slavearbiterlockenable2 = |ps2_0_avalon_PS2_slave_arb_share_counter_next_value;

  //cpu_0/data_master ps2_0/avalon_PS2_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = ps2_0_avalon_PS2_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //ps2_0_avalon_PS2_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign ps2_0_avalon_PS2_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave = cpu_0_data_master_requests_ps2_0_avalon_PS2_slave & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register_in = cpu_0_data_master_granted_ps2_0_avalon_PS2_slave & cpu_0_data_master_read & ~ps2_0_avalon_PS2_slave_waits_for_read & ~(|cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register = {cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register, cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register_in};

  //cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register <= p1_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave = cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave_shift_register;

  //ps2_0_avalon_PS2_slave_writedata mux, which is an e_mux
  assign ps2_0_avalon_PS2_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_ps2_0_avalon_PS2_slave = cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave;

  //cpu_0/data_master saved-grant ps2_0/avalon_PS2_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_ps2_0_avalon_PS2_slave = cpu_0_data_master_requests_ps2_0_avalon_PS2_slave;

  //allow new arb cycle for ps2_0/avalon_PS2_slave, which is an e_assign
  assign ps2_0_avalon_PS2_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign ps2_0_avalon_PS2_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign ps2_0_avalon_PS2_slave_master_qreq_vector = 1;

  assign ps2_0_avalon_PS2_slave_chipselect = cpu_0_data_master_granted_ps2_0_avalon_PS2_slave;
  //ps2_0_avalon_PS2_slave_firsttransfer first transaction, which is an e_assign
  assign ps2_0_avalon_PS2_slave_firsttransfer = ps2_0_avalon_PS2_slave_begins_xfer ? ps2_0_avalon_PS2_slave_unreg_firsttransfer : ps2_0_avalon_PS2_slave_reg_firsttransfer;

  //ps2_0_avalon_PS2_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign ps2_0_avalon_PS2_slave_unreg_firsttransfer = ~(ps2_0_avalon_PS2_slave_slavearbiterlockenable & ps2_0_avalon_PS2_slave_any_continuerequest);

  //ps2_0_avalon_PS2_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ps2_0_avalon_PS2_slave_reg_firsttransfer <= 1'b1;
      else if (ps2_0_avalon_PS2_slave_begins_xfer)
          ps2_0_avalon_PS2_slave_reg_firsttransfer <= ps2_0_avalon_PS2_slave_unreg_firsttransfer;
    end


  //ps2_0_avalon_PS2_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign ps2_0_avalon_PS2_slave_beginbursttransfer_internal = ps2_0_avalon_PS2_slave_begins_xfer;

  //ps2_0_avalon_PS2_slave_read assignment, which is an e_mux
  assign ps2_0_avalon_PS2_slave_read = cpu_0_data_master_granted_ps2_0_avalon_PS2_slave & cpu_0_data_master_read;

  //ps2_0_avalon_PS2_slave_write assignment, which is an e_mux
  assign ps2_0_avalon_PS2_slave_write = cpu_0_data_master_granted_ps2_0_avalon_PS2_slave & cpu_0_data_master_write;

  assign shifted_address_to_ps2_0_avalon_PS2_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //ps2_0_avalon_PS2_slave_address mux, which is an e_mux
  assign ps2_0_avalon_PS2_slave_address = shifted_address_to_ps2_0_avalon_PS2_slave_from_cpu_0_data_master >> 2;

  //d1_ps2_0_avalon_PS2_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_ps2_0_avalon_PS2_slave_end_xfer <= 1;
      else 
        d1_ps2_0_avalon_PS2_slave_end_xfer <= ps2_0_avalon_PS2_slave_end_xfer;
    end


  //ps2_0_avalon_PS2_slave_waits_for_read in a cycle, which is an e_mux
  assign ps2_0_avalon_PS2_slave_waits_for_read = ps2_0_avalon_PS2_slave_in_a_read_cycle & ps2_0_avalon_PS2_slave_waitrequest_from_sa;

  //ps2_0_avalon_PS2_slave_in_a_read_cycle assignment, which is an e_assign
  assign ps2_0_avalon_PS2_slave_in_a_read_cycle = cpu_0_data_master_granted_ps2_0_avalon_PS2_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ps2_0_avalon_PS2_slave_in_a_read_cycle;

  //ps2_0_avalon_PS2_slave_waits_for_write in a cycle, which is an e_mux
  assign ps2_0_avalon_PS2_slave_waits_for_write = ps2_0_avalon_PS2_slave_in_a_write_cycle & ps2_0_avalon_PS2_slave_waitrequest_from_sa;

  //ps2_0_avalon_PS2_slave_in_a_write_cycle assignment, which is an e_assign
  assign ps2_0_avalon_PS2_slave_in_a_write_cycle = cpu_0_data_master_granted_ps2_0_avalon_PS2_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ps2_0_avalon_PS2_slave_in_a_write_cycle;

  assign wait_for_ps2_0_avalon_PS2_slave_counter = 0;
  //ps2_0_avalon_PS2_slave_byteenable byte enable port mux, which is an e_mux
  assign ps2_0_avalon_PS2_slave_byteenable = (cpu_0_data_master_granted_ps2_0_avalon_PS2_slave)? cpu_0_data_master_byteenable :
    -1;

  //assign ps2_0_avalon_PS2_slave_irq_from_sa = ps2_0_avalon_PS2_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign ps2_0_avalon_PS2_slave_irq_from_sa = ps2_0_avalon_PS2_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //ps2_0/avalon_PS2_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_0_reset_clk_domain_synch_module (
                                              // inputs:
                                               clk,
                                               data_in,
                                               reset_n,

                                              // outputs:
                                               data_out
                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1_module (
                                                             // inputs:
                                                              clear_fifo,
                                                              clk,
                                                              data_in,
                                                              read,
                                                              reset_n,
                                                              sync_reset,
                                                              write,

                                                             // outputs:
                                                              data_out,
                                                              empty,
                                                              fifo_contains_ones_n,
                                                              full
                                                           )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_byteenable,
                                cpu_0_data_master_dbs_address,
                                cpu_0_data_master_dbs_write_16,
                                cpu_0_data_master_no_byte_enables_and_last_term,
                                cpu_0_data_master_read,
                                cpu_0_data_master_waitrequest,
                                cpu_0_data_master_write,
                                cpu_0_instruction_master_address_to_slave,
                                cpu_0_instruction_master_dbs_address,
                                cpu_0_instruction_master_latency_counter,
                                cpu_0_instruction_master_read,
                                reset_n,
                                sdram_0_s1_readdata,
                                sdram_0_s1_readdatavalid,
                                sdram_0_s1_waitrequest,

                               // outputs:
                                cpu_0_data_master_byteenable_sdram_0_s1,
                                cpu_0_data_master_granted_sdram_0_s1,
                                cpu_0_data_master_qualified_request_sdram_0_s1,
                                cpu_0_data_master_read_data_valid_sdram_0_s1,
                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_data_master_requests_sdram_0_s1,
                                cpu_0_instruction_master_granted_sdram_0_s1,
                                cpu_0_instruction_master_qualified_request_sdram_0_s1,
                                cpu_0_instruction_master_read_data_valid_sdram_0_s1,
                                cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_instruction_master_requests_sdram_0_s1,
                                d1_sdram_0_s1_end_xfer,
                                sdram_0_s1_address,
                                sdram_0_s1_byteenable_n,
                                sdram_0_s1_chipselect,
                                sdram_0_s1_read_n,
                                sdram_0_s1_readdata_from_sa,
                                sdram_0_s1_reset_n,
                                sdram_0_s1_waitrequest_from_sa,
                                sdram_0_s1_write_n,
                                sdram_0_s1_writedata
                             )
;

  output  [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  output           cpu_0_data_master_granted_sdram_0_s1;
  output           cpu_0_data_master_qualified_request_sdram_0_s1;
  output           cpu_0_data_master_read_data_valid_sdram_0_s1;
  output           cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  output           cpu_0_data_master_requests_sdram_0_s1;
  output           cpu_0_instruction_master_granted_sdram_0_s1;
  output           cpu_0_instruction_master_qualified_request_sdram_0_s1;
  output           cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  output           cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  output           cpu_0_instruction_master_requests_sdram_0_s1;
  output           d1_sdram_0_s1_end_xfer;
  output  [ 21: 0] sdram_0_s1_address;
  output  [  1: 0] sdram_0_s1_byteenable_n;
  output           sdram_0_s1_chipselect;
  output           sdram_0_s1_read_n;
  output  [ 15: 0] sdram_0_s1_readdata_from_sa;
  output           sdram_0_s1_reset_n;
  output           sdram_0_s1_waitrequest_from_sa;
  output           sdram_0_s1_write_n;
  output  [ 15: 0] sdram_0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_no_byte_enables_and_last_term;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input   [  1: 0] cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata;
  input            sdram_0_s1_readdatavalid;
  input            sdram_0_s1_waitrequest;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sdram_0_s1;
  wire             cpu_0_data_master_qualified_request_sdram_0_s1;
  wire             cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;
  wire             cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_data_master_requests_sdram_0_s1;
  wire             cpu_0_data_master_saved_grant_sdram_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_sdram_0_s1;
  wire             cpu_0_instruction_master_qualified_request_sdram_0_s1;
  wire             cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_instruction_master_requests_sdram_0_s1;
  wire             cpu_0_instruction_master_saved_grant_sdram_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1;
  wire    [ 21: 0] sdram_0_s1_address;
  wire             sdram_0_s1_allgrants;
  wire             sdram_0_s1_allow_new_arb_cycle;
  wire             sdram_0_s1_any_bursting_master_saved_grant;
  wire             sdram_0_s1_any_continuerequest;
  reg     [  1: 0] sdram_0_s1_arb_addend;
  wire             sdram_0_s1_arb_counter_enable;
  reg     [  2: 0] sdram_0_s1_arb_share_counter;
  wire    [  2: 0] sdram_0_s1_arb_share_counter_next_value;
  wire    [  2: 0] sdram_0_s1_arb_share_set_values;
  wire    [  1: 0] sdram_0_s1_arb_winner;
  wire             sdram_0_s1_arbitration_holdoff_internal;
  wire             sdram_0_s1_beginbursttransfer_internal;
  wire             sdram_0_s1_begins_xfer;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire    [  3: 0] sdram_0_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_0_s1_chosen_master_rot_left;
  wire             sdram_0_s1_end_xfer;
  wire             sdram_0_s1_firsttransfer;
  wire    [  1: 0] sdram_0_s1_grant_vector;
  wire             sdram_0_s1_in_a_read_cycle;
  wire             sdram_0_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_0_s1_master_qreq_vector;
  wire             sdram_0_s1_move_on_to_next_transaction;
  wire             sdram_0_s1_non_bursting_master_requests;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid_from_sa;
  reg              sdram_0_s1_reg_firsttransfer;
  wire             sdram_0_s1_reset_n;
  reg     [  1: 0] sdram_0_s1_saved_chosen_master_vector;
  reg              sdram_0_s1_slavearbiterlockenable;
  wire             sdram_0_s1_slavearbiterlockenable2;
  wire             sdram_0_s1_unreg_firsttransfer;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_waits_for_read;
  wire             sdram_0_s1_waits_for_write;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire    [ 24: 0] shifted_address_to_sdram_0_s1_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master;
  wire             wait_for_sdram_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_0_s1_end_xfer;
    end


  assign sdram_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sdram_0_s1 | cpu_0_instruction_master_qualified_request_sdram_0_s1));
  //assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid;

  //assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata;

  assign cpu_0_data_master_requests_sdram_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 23] , 23'b0} == 25'h0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest;

  //sdram_0_s1_arb_share_counter set values, which is an e_mux
  assign sdram_0_s1_arb_share_set_values = (cpu_0_data_master_granted_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_granted_sdram_0_s1)? 2 :
    (cpu_0_data_master_granted_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_granted_sdram_0_s1)? 2 :
    1;

  //sdram_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_sdram_0_s1 |
    cpu_0_instruction_master_requests_sdram_0_s1 |
    cpu_0_data_master_requests_sdram_0_s1 |
    cpu_0_instruction_master_requests_sdram_0_s1;

  //sdram_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_0_s1_any_bursting_master_saved_grant = 0;

  //sdram_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_0_s1_arb_share_counter_next_value = sdram_0_s1_firsttransfer ? (sdram_0_s1_arb_share_set_values - 1) : |sdram_0_s1_arb_share_counter ? (sdram_0_s1_arb_share_counter - 1) : 0;

  //sdram_0_s1_allgrants all slave grants, which is an e_mux
  assign sdram_0_s1_allgrants = (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector);

  //sdram_0_s1_end_xfer assignment, which is an e_assign
  assign sdram_0_s1_end_xfer = ~(sdram_0_s1_waits_for_read | sdram_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_0_s1 = sdram_0_s1_end_xfer & (~sdram_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_0_s1 & sdram_0_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests);

  //sdram_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_share_counter <= 0;
      else if (sdram_0_s1_arb_counter_enable)
          sdram_0_s1_arb_share_counter <= sdram_0_s1_arb_share_counter_next_value;
    end


  //sdram_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_0_s1) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests))
          sdram_0_s1_slavearbiterlockenable <= |sdram_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master sdram_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sdram_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sdram_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_0_s1_slavearbiterlockenable2 = |sdram_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master sdram_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master sdram_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = sdram_0_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master sdram_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 <= cpu_0_instruction_master_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_sdram_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 & cpu_0_instruction_master_requests_sdram_0_s1;

  //sdram_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_0_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_sdram_0_s1 = cpu_0_data_master_requests_sdram_0_s1 & ~((cpu_0_data_master_read & (~cpu_0_data_master_waitrequest | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))) | ((~cpu_0_data_master_waitrequest | cpu_0_data_master_no_byte_enables_and_last_term | !cpu_0_data_master_byteenable_sdram_0_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //unique name for sdram_0_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_0_s1_move_on_to_next_transaction = sdram_0_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1_module rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_data_master_granted_sdram_0_s1),
      .data_out             (cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_data_master_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register = ~cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid cpu_0_data_master_read_data_valid_sdram_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1) & ~ cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;

  //sdram_0_s1_writedata mux, which is an e_mux
  assign sdram_0_s1_writedata = cpu_0_data_master_dbs_write_16;

  assign cpu_0_instruction_master_requests_sdram_0_s1 = (({cpu_0_instruction_master_address_to_slave[24 : 23] , 23'b0} == 25'h0) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 <= cpu_0_data_master_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_sdram_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 & cpu_0_data_master_requests_sdram_0_s1;

  assign cpu_0_instruction_master_qualified_request_sdram_0_s1 = cpu_0_instruction_master_requests_sdram_0_s1 & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (1 < cpu_0_instruction_master_latency_counter))) | cpu_0_data_master_arbiterlock);
  //rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1_module rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_sdram_0_s1),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_sdram_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1) & ~ cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;

  //allow new arb cycle for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_sdram_0_s1;

  //cpu_0/instruction_master grant sdram_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_sdram_0_s1 = sdram_0_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant sdram_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[0] && cpu_0_instruction_master_requests_sdram_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_sdram_0_s1;

  //cpu_0/data_master grant sdram_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_sdram_0_s1 = sdram_0_s1_grant_vector[1];

  //cpu_0/data_master saved-grant sdram_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[1] && cpu_0_data_master_requests_sdram_0_s1;

  //sdram_0/s1 chosen-master double-vector, which is an e_assign
  assign sdram_0_s1_chosen_master_double_vector = {sdram_0_s1_master_qreq_vector, sdram_0_s1_master_qreq_vector} & ({~sdram_0_s1_master_qreq_vector, ~sdram_0_s1_master_qreq_vector} + sdram_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_0_s1_arb_winner = (sdram_0_s1_allow_new_arb_cycle & | sdram_0_s1_grant_vector) ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;

  //saved sdram_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_saved_chosen_master_vector <= 0;
      else if (sdram_0_s1_allow_new_arb_cycle)
          sdram_0_s1_saved_chosen_master_vector <= |sdram_0_s1_grant_vector ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_0_s1_grant_vector = {(sdram_0_s1_chosen_master_double_vector[1] | sdram_0_s1_chosen_master_double_vector[3]),
    (sdram_0_s1_chosen_master_double_vector[0] | sdram_0_s1_chosen_master_double_vector[2])};

  //sdram_0/s1 chosen master rotated left, which is an e_assign
  assign sdram_0_s1_chosen_master_rot_left = (sdram_0_s1_arb_winner << 1) ? (sdram_0_s1_arb_winner << 1) : 1;

  //sdram_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_addend <= 1;
      else if (|sdram_0_s1_grant_vector)
          sdram_0_s1_arb_addend <= sdram_0_s1_end_xfer? sdram_0_s1_chosen_master_rot_left : sdram_0_s1_grant_vector;
    end


  //sdram_0_s1_reset_n assignment, which is an e_assign
  assign sdram_0_s1_reset_n = reset_n;

  assign sdram_0_s1_chipselect = cpu_0_data_master_granted_sdram_0_s1 | cpu_0_instruction_master_granted_sdram_0_s1;
  //sdram_0_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_firsttransfer = sdram_0_s1_begins_xfer ? sdram_0_s1_unreg_firsttransfer : sdram_0_s1_reg_firsttransfer;

  //sdram_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_unreg_firsttransfer = ~(sdram_0_s1_slavearbiterlockenable & sdram_0_s1_any_continuerequest);

  //sdram_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_0_s1_begins_xfer)
          sdram_0_s1_reg_firsttransfer <= sdram_0_s1_unreg_firsttransfer;
    end


  //sdram_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_0_s1_beginbursttransfer_internal = sdram_0_s1_begins_xfer;

  //sdram_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_0_s1_arbitration_holdoff_internal = sdram_0_s1_begins_xfer & sdram_0_s1_firsttransfer;

  //~sdram_0_s1_read_n assignment, which is an e_mux
  assign sdram_0_s1_read_n = ~((cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read));

  //~sdram_0_s1_write_n assignment, which is an e_mux
  assign sdram_0_s1_write_n = ~(cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_sdram_0_s1_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sdram_0_s1_address mux, which is an e_mux
  assign sdram_0_s1_address = (cpu_0_data_master_granted_sdram_0_s1)? (shifted_address_to_sdram_0_s1_from_cpu_0_data_master >> 1) :
    (shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master >> 1);

  assign shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sdram_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_0_s1_end_xfer <= 1;
      else 
        d1_sdram_0_s1_end_xfer <= sdram_0_s1_end_xfer;
    end


  //sdram_0_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_read = sdram_0_s1_in_a_read_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_0_s1_in_a_read_cycle;

  //sdram_0_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_write = sdram_0_s1_in_a_write_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_write_cycle = cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_0_s1_in_a_write_cycle;

  assign wait_for_sdram_0_s1_counter = 0;
  //~sdram_0_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_0_s1_byteenable_n = ~((cpu_0_data_master_granted_sdram_0_s1)? cpu_0_data_master_byteenable_sdram_0_s1 :
    -1);

  assign {cpu_0_data_master_byteenable_sdram_0_s1_segment_1,
cpu_0_data_master_byteenable_sdram_0_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_sdram_0_s1 = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_sdram_0_s1_segment_0 :
    cpu_0_data_master_byteenable_sdram_0_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_sdram_0_s1 + cpu_0_instruction_master_granted_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_sdram_0_s1 + cpu_0_instruction_master_saved_grant_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_0_avalonS_arbitrator (
                                   // inputs:
                                    clk,
                                    cpu_0_data_master_address_to_slave,
                                    cpu_0_data_master_byteenable,
                                    cpu_0_data_master_dbs_address,
                                    cpu_0_data_master_dbs_write_16,
                                    cpu_0_data_master_no_byte_enables_and_last_term,
                                    cpu_0_data_master_read,
                                    cpu_0_data_master_write,
                                    cpu_0_instruction_master_address_to_slave,
                                    cpu_0_instruction_master_dbs_address,
                                    cpu_0_instruction_master_latency_counter,
                                    cpu_0_instruction_master_read,
                                    cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                    reset_n,
                                    sram_0_avalonS_readdata,

                                   // outputs:
                                    cpu_0_data_master_byteenable_sram_0_avalonS,
                                    cpu_0_data_master_granted_sram_0_avalonS,
                                    cpu_0_data_master_qualified_request_sram_0_avalonS,
                                    cpu_0_data_master_read_data_valid_sram_0_avalonS,
                                    cpu_0_data_master_requests_sram_0_avalonS,
                                    cpu_0_instruction_master_granted_sram_0_avalonS,
                                    cpu_0_instruction_master_qualified_request_sram_0_avalonS,
                                    cpu_0_instruction_master_read_data_valid_sram_0_avalonS,
                                    cpu_0_instruction_master_requests_sram_0_avalonS,
                                    d1_sram_0_avalonS_end_xfer,
                                    sram_0_avalonS_address,
                                    sram_0_avalonS_byteenable_n,
                                    sram_0_avalonS_chipselect_n,
                                    sram_0_avalonS_outputenable_n,
                                    sram_0_avalonS_readdata_from_sa,
                                    sram_0_avalonS_reset_n,
                                    sram_0_avalonS_wait_counter_eq_0,
                                    sram_0_avalonS_write_n,
                                    sram_0_avalonS_writedata
                                 )
;

  output  [  1: 0] cpu_0_data_master_byteenable_sram_0_avalonS;
  output           cpu_0_data_master_granted_sram_0_avalonS;
  output           cpu_0_data_master_qualified_request_sram_0_avalonS;
  output           cpu_0_data_master_read_data_valid_sram_0_avalonS;
  output           cpu_0_data_master_requests_sram_0_avalonS;
  output           cpu_0_instruction_master_granted_sram_0_avalonS;
  output           cpu_0_instruction_master_qualified_request_sram_0_avalonS;
  output           cpu_0_instruction_master_read_data_valid_sram_0_avalonS;
  output           cpu_0_instruction_master_requests_sram_0_avalonS;
  output           d1_sram_0_avalonS_end_xfer;
  output  [ 17: 0] sram_0_avalonS_address;
  output  [  1: 0] sram_0_avalonS_byteenable_n;
  output           sram_0_avalonS_chipselect_n;
  output           sram_0_avalonS_outputenable_n;
  output  [ 15: 0] sram_0_avalonS_readdata_from_sa;
  output           sram_0_avalonS_reset_n;
  output           sram_0_avalonS_wait_counter_eq_0;
  output           sram_0_avalonS_write_n;
  output  [ 15: 0] sram_0_avalonS_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input            cpu_0_data_master_no_byte_enables_and_last_term;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input   [  1: 0] cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input            reset_n;
  input   [ 15: 0] sram_0_avalonS_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalonS;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalonS_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalonS_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sram_0_avalonS;
  wire             cpu_0_data_master_qualified_request_sram_0_avalonS;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalonS;
  wire             cpu_0_data_master_requests_sram_0_avalonS;
  wire             cpu_0_data_master_saved_grant_sram_0_avalonS;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_sram_0_avalonS;
  wire             cpu_0_instruction_master_qualified_request_sram_0_avalonS;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalonS;
  wire             cpu_0_instruction_master_requests_sram_0_avalonS;
  wire             cpu_0_instruction_master_saved_grant_sram_0_avalonS;
  reg              d1_reasons_to_wait;
  reg              d1_sram_0_avalonS_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sram_0_avalonS;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_sram_0_avalonS;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalonS;
  wire    [ 24: 0] shifted_address_to_sram_0_avalonS_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_sram_0_avalonS_from_cpu_0_instruction_master;
  wire    [ 17: 0] sram_0_avalonS_address;
  wire             sram_0_avalonS_allgrants;
  wire             sram_0_avalonS_allow_new_arb_cycle;
  wire             sram_0_avalonS_any_bursting_master_saved_grant;
  wire             sram_0_avalonS_any_continuerequest;
  reg     [  1: 0] sram_0_avalonS_arb_addend;
  wire             sram_0_avalonS_arb_counter_enable;
  reg     [  2: 0] sram_0_avalonS_arb_share_counter;
  wire    [  2: 0] sram_0_avalonS_arb_share_counter_next_value;
  wire    [  2: 0] sram_0_avalonS_arb_share_set_values;
  wire    [  1: 0] sram_0_avalonS_arb_winner;
  wire             sram_0_avalonS_arbitration_holdoff_internal;
  wire             sram_0_avalonS_beginbursttransfer_internal;
  wire             sram_0_avalonS_begins_xfer;
  wire    [  1: 0] sram_0_avalonS_byteenable_n;
  wire             sram_0_avalonS_chipselect_n;
  wire    [  3: 0] sram_0_avalonS_chosen_master_double_vector;
  wire    [  1: 0] sram_0_avalonS_chosen_master_rot_left;
  wire             sram_0_avalonS_counter_load_value;
  wire             sram_0_avalonS_end_xfer;
  wire             sram_0_avalonS_firsttransfer;
  wire    [  1: 0] sram_0_avalonS_grant_vector;
  wire             sram_0_avalonS_in_a_read_cycle;
  wire             sram_0_avalonS_in_a_write_cycle;
  wire    [  1: 0] sram_0_avalonS_master_qreq_vector;
  wire             sram_0_avalonS_non_bursting_master_requests;
  wire             sram_0_avalonS_outputenable_n;
  wire    [ 15: 0] sram_0_avalonS_readdata_from_sa;
  reg              sram_0_avalonS_reg_firsttransfer;
  wire             sram_0_avalonS_reset_n;
  reg     [  1: 0] sram_0_avalonS_saved_chosen_master_vector;
  reg              sram_0_avalonS_slavearbiterlockenable;
  wire             sram_0_avalonS_slavearbiterlockenable2;
  wire             sram_0_avalonS_unreg_firsttransfer;
  reg              sram_0_avalonS_wait_counter;
  wire             sram_0_avalonS_wait_counter_eq_0;
  wire             sram_0_avalonS_waits_for_read;
  wire             sram_0_avalonS_waits_for_write;
  wire             sram_0_avalonS_write_n;
  wire    [ 15: 0] sram_0_avalonS_writedata;
  wire             wait_for_sram_0_avalonS_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sram_0_avalonS_end_xfer;
    end


  assign sram_0_avalonS_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sram_0_avalonS | cpu_0_instruction_master_qualified_request_sram_0_avalonS));
  //assign sram_0_avalonS_readdata_from_sa = sram_0_avalonS_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_0_avalonS_readdata_from_sa = sram_0_avalonS_readdata;

  assign cpu_0_data_master_requests_sram_0_avalonS = ({cpu_0_data_master_address_to_slave[24 : 19] , 19'b0} == 25'h980000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //sram_0_avalonS_arb_share_counter set values, which is an e_mux
  assign sram_0_avalonS_arb_share_set_values = (cpu_0_data_master_granted_sram_0_avalonS)? 2 :
    (cpu_0_instruction_master_granted_sram_0_avalonS)? 2 :
    (cpu_0_data_master_granted_sram_0_avalonS)? 2 :
    (cpu_0_instruction_master_granted_sram_0_avalonS)? 2 :
    1;

  //sram_0_avalonS_non_bursting_master_requests mux, which is an e_mux
  assign sram_0_avalonS_non_bursting_master_requests = cpu_0_data_master_requests_sram_0_avalonS |
    cpu_0_instruction_master_requests_sram_0_avalonS |
    cpu_0_data_master_requests_sram_0_avalonS |
    cpu_0_instruction_master_requests_sram_0_avalonS;

  //sram_0_avalonS_any_bursting_master_saved_grant mux, which is an e_mux
  assign sram_0_avalonS_any_bursting_master_saved_grant = 0;

  //sram_0_avalonS_arb_share_counter_next_value assignment, which is an e_assign
  assign sram_0_avalonS_arb_share_counter_next_value = sram_0_avalonS_firsttransfer ? (sram_0_avalonS_arb_share_set_values - 1) : |sram_0_avalonS_arb_share_counter ? (sram_0_avalonS_arb_share_counter - 1) : 0;

  //sram_0_avalonS_allgrants all slave grants, which is an e_mux
  assign sram_0_avalonS_allgrants = (|sram_0_avalonS_grant_vector) |
    (|sram_0_avalonS_grant_vector) |
    (|sram_0_avalonS_grant_vector) |
    (|sram_0_avalonS_grant_vector);

  //sram_0_avalonS_end_xfer assignment, which is an e_assign
  assign sram_0_avalonS_end_xfer = ~(sram_0_avalonS_waits_for_read | sram_0_avalonS_waits_for_write);

  //end_xfer_arb_share_counter_term_sram_0_avalonS arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sram_0_avalonS = sram_0_avalonS_end_xfer & (~sram_0_avalonS_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sram_0_avalonS_arb_share_counter arbitration counter enable, which is an e_assign
  assign sram_0_avalonS_arb_counter_enable = (end_xfer_arb_share_counter_term_sram_0_avalonS & sram_0_avalonS_allgrants) | (end_xfer_arb_share_counter_term_sram_0_avalonS & ~sram_0_avalonS_non_bursting_master_requests);

  //sram_0_avalonS_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalonS_arb_share_counter <= 0;
      else if (sram_0_avalonS_arb_counter_enable)
          sram_0_avalonS_arb_share_counter <= sram_0_avalonS_arb_share_counter_next_value;
    end


  //sram_0_avalonS_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalonS_slavearbiterlockenable <= 0;
      else if ((|sram_0_avalonS_master_qreq_vector & end_xfer_arb_share_counter_term_sram_0_avalonS) | (end_xfer_arb_share_counter_term_sram_0_avalonS & ~sram_0_avalonS_non_bursting_master_requests))
          sram_0_avalonS_slavearbiterlockenable <= |sram_0_avalonS_arb_share_counter_next_value;
    end


  //cpu_0/data_master sram_0/avalonS arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sram_0_avalonS_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sram_0_avalonS_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sram_0_avalonS_slavearbiterlockenable2 = |sram_0_avalonS_arb_share_counter_next_value;

  //cpu_0/data_master sram_0/avalonS arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sram_0_avalonS_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master sram_0/avalonS arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = sram_0_avalonS_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master sram_0/avalonS arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = sram_0_avalonS_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted sram_0/avalonS last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalonS <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalonS <= cpu_0_instruction_master_saved_grant_sram_0_avalonS ? 1 : (sram_0_avalonS_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_sram_0_avalonS) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalonS;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalonS & cpu_0_instruction_master_requests_sram_0_avalonS;

  //sram_0_avalonS_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sram_0_avalonS_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_sram_0_avalonS = cpu_0_data_master_requests_sram_0_avalonS & ~(((cpu_0_data_master_no_byte_enables_and_last_term | !cpu_0_data_master_byteenable_sram_0_avalonS) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //sram_0_avalonS_writedata mux, which is an e_mux
  assign sram_0_avalonS_writedata = cpu_0_data_master_dbs_write_16;

  assign cpu_0_instruction_master_requests_sram_0_avalonS = (({cpu_0_instruction_master_address_to_slave[24 : 19] , 19'b0} == 25'h980000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted sram_0/avalonS last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_sram_0_avalonS <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_sram_0_avalonS <= cpu_0_data_master_saved_grant_sram_0_avalonS ? 1 : (sram_0_avalonS_arbitration_holdoff_internal | ~cpu_0_data_master_requests_sram_0_avalonS) ? 0 : last_cycle_cpu_0_data_master_granted_slave_sram_0_avalonS;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_sram_0_avalonS & cpu_0_data_master_requests_sram_0_avalonS;

  assign cpu_0_instruction_master_qualified_request_sram_0_avalonS = cpu_0_instruction_master_requests_sram_0_avalonS & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_sram_0_avalonS, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_sram_0_avalonS = cpu_0_instruction_master_granted_sram_0_avalonS & cpu_0_instruction_master_read & ~sram_0_avalonS_waits_for_read;

  //allow new arb cycle for sram_0/avalonS, which is an e_assign
  assign sram_0_avalonS_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for sram_0/avalonS, which is an e_assign
  assign sram_0_avalonS_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_sram_0_avalonS;

  //cpu_0/instruction_master grant sram_0/avalonS, which is an e_assign
  assign cpu_0_instruction_master_granted_sram_0_avalonS = sram_0_avalonS_grant_vector[0];

  //cpu_0/instruction_master saved-grant sram_0/avalonS, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_sram_0_avalonS = sram_0_avalonS_arb_winner[0] && cpu_0_instruction_master_requests_sram_0_avalonS;

  //cpu_0/data_master assignment into master qualified-requests vector for sram_0/avalonS, which is an e_assign
  assign sram_0_avalonS_master_qreq_vector[1] = cpu_0_data_master_qualified_request_sram_0_avalonS;

  //cpu_0/data_master grant sram_0/avalonS, which is an e_assign
  assign cpu_0_data_master_granted_sram_0_avalonS = sram_0_avalonS_grant_vector[1];

  //cpu_0/data_master saved-grant sram_0/avalonS, which is an e_assign
  assign cpu_0_data_master_saved_grant_sram_0_avalonS = sram_0_avalonS_arb_winner[1] && cpu_0_data_master_requests_sram_0_avalonS;

  //sram_0/avalonS chosen-master double-vector, which is an e_assign
  assign sram_0_avalonS_chosen_master_double_vector = {sram_0_avalonS_master_qreq_vector, sram_0_avalonS_master_qreq_vector} & ({~sram_0_avalonS_master_qreq_vector, ~sram_0_avalonS_master_qreq_vector} + sram_0_avalonS_arb_addend);

  //stable onehot encoding of arb winner
  assign sram_0_avalonS_arb_winner = (sram_0_avalonS_allow_new_arb_cycle & | sram_0_avalonS_grant_vector) ? sram_0_avalonS_grant_vector : sram_0_avalonS_saved_chosen_master_vector;

  //saved sram_0_avalonS_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalonS_saved_chosen_master_vector <= 0;
      else if (sram_0_avalonS_allow_new_arb_cycle)
          sram_0_avalonS_saved_chosen_master_vector <= |sram_0_avalonS_grant_vector ? sram_0_avalonS_grant_vector : sram_0_avalonS_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sram_0_avalonS_grant_vector = {(sram_0_avalonS_chosen_master_double_vector[1] | sram_0_avalonS_chosen_master_double_vector[3]),
    (sram_0_avalonS_chosen_master_double_vector[0] | sram_0_avalonS_chosen_master_double_vector[2])};

  //sram_0/avalonS chosen master rotated left, which is an e_assign
  assign sram_0_avalonS_chosen_master_rot_left = (sram_0_avalonS_arb_winner << 1) ? (sram_0_avalonS_arb_winner << 1) : 1;

  //sram_0/avalonS's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalonS_arb_addend <= 1;
      else if (|sram_0_avalonS_grant_vector)
          sram_0_avalonS_arb_addend <= sram_0_avalonS_end_xfer? sram_0_avalonS_chosen_master_rot_left : sram_0_avalonS_grant_vector;
    end


  //~sram_0_avalonS_outputenable_n assignment, which is an e_mux
  assign sram_0_avalonS_outputenable_n = ~sram_0_avalonS_in_a_read_cycle;

  //sram_0_avalonS_reset_n assignment, which is an e_assign
  assign sram_0_avalonS_reset_n = reset_n;

  assign sram_0_avalonS_chipselect_n = ~(cpu_0_data_master_granted_sram_0_avalonS | cpu_0_instruction_master_granted_sram_0_avalonS);
  //sram_0_avalonS_firsttransfer first transaction, which is an e_assign
  assign sram_0_avalonS_firsttransfer = sram_0_avalonS_begins_xfer ? sram_0_avalonS_unreg_firsttransfer : sram_0_avalonS_reg_firsttransfer;

  //sram_0_avalonS_unreg_firsttransfer first transaction, which is an e_assign
  assign sram_0_avalonS_unreg_firsttransfer = ~(sram_0_avalonS_slavearbiterlockenable & sram_0_avalonS_any_continuerequest);

  //sram_0_avalonS_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalonS_reg_firsttransfer <= 1'b1;
      else if (sram_0_avalonS_begins_xfer)
          sram_0_avalonS_reg_firsttransfer <= sram_0_avalonS_unreg_firsttransfer;
    end


  //sram_0_avalonS_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sram_0_avalonS_beginbursttransfer_internal = sram_0_avalonS_begins_xfer;

  //sram_0_avalonS_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sram_0_avalonS_arbitration_holdoff_internal = sram_0_avalonS_begins_xfer & sram_0_avalonS_firsttransfer;

  //~sram_0_avalonS_write_n assignment, which is an e_mux
  assign sram_0_avalonS_write_n = ~(((cpu_0_data_master_granted_sram_0_avalonS & cpu_0_data_master_write)) & ~sram_0_avalonS_begins_xfer & (sram_0_avalonS_wait_counter >= 1));

  assign shifted_address_to_sram_0_avalonS_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sram_0_avalonS_address mux, which is an e_mux
  assign sram_0_avalonS_address = (cpu_0_data_master_granted_sram_0_avalonS)? (shifted_address_to_sram_0_avalonS_from_cpu_0_data_master >> 1) :
    (shifted_address_to_sram_0_avalonS_from_cpu_0_instruction_master >> 1);

  assign shifted_address_to_sram_0_avalonS_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sram_0_avalonS_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sram_0_avalonS_end_xfer <= 1;
      else 
        d1_sram_0_avalonS_end_xfer <= sram_0_avalonS_end_xfer;
    end


  //sram_0_avalonS_waits_for_read in a cycle, which is an e_mux
  assign sram_0_avalonS_waits_for_read = sram_0_avalonS_in_a_read_cycle & sram_0_avalonS_begins_xfer;

  //sram_0_avalonS_in_a_read_cycle assignment, which is an e_assign
  assign sram_0_avalonS_in_a_read_cycle = (cpu_0_data_master_granted_sram_0_avalonS & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sram_0_avalonS & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_0_avalonS_in_a_read_cycle;

  //sram_0_avalonS_waits_for_write in a cycle, which is an e_mux
  assign sram_0_avalonS_waits_for_write = sram_0_avalonS_in_a_write_cycle & wait_for_sram_0_avalonS_counter;

  //sram_0_avalonS_in_a_write_cycle assignment, which is an e_assign
  assign sram_0_avalonS_in_a_write_cycle = cpu_0_data_master_granted_sram_0_avalonS & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_0_avalonS_in_a_write_cycle;

  assign sram_0_avalonS_wait_counter_eq_0 = sram_0_avalonS_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalonS_wait_counter <= 0;
      else 
        sram_0_avalonS_wait_counter <= sram_0_avalonS_counter_load_value;
    end


  assign sram_0_avalonS_counter_load_value = ((sram_0_avalonS_in_a_write_cycle & sram_0_avalonS_begins_xfer))? 1 :
    (~sram_0_avalonS_wait_counter_eq_0)? sram_0_avalonS_wait_counter - 1 :
    0;

  assign wait_for_sram_0_avalonS_counter = sram_0_avalonS_begins_xfer | ~sram_0_avalonS_wait_counter_eq_0;
  //~sram_0_avalonS_byteenable_n byte enable port mux, which is an e_mux
  assign sram_0_avalonS_byteenable_n = ~((cpu_0_data_master_granted_sram_0_avalonS)? cpu_0_data_master_byteenable_sram_0_avalonS :
    -1);

  assign {cpu_0_data_master_byteenable_sram_0_avalonS_segment_1,
cpu_0_data_master_byteenable_sram_0_avalonS_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_sram_0_avalonS = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_sram_0_avalonS_segment_0 :
    cpu_0_data_master_byteenable_sram_0_avalonS_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram_0/avalonS enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_sram_0_avalonS + cpu_0_instruction_master_granted_sram_0_avalonS > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_sram_0_avalonS + cpu_0_instruction_master_saved_grant_sram_0_avalonS > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module switch_pio_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_0_data_master_address_to_slave,
                                   cpu_0_data_master_read,
                                   cpu_0_data_master_write,
                                   reset_n,
                                   switch_pio_s1_readdata,

                                  // outputs:
                                   cpu_0_data_master_granted_switch_pio_s1,
                                   cpu_0_data_master_qualified_request_switch_pio_s1,
                                   cpu_0_data_master_read_data_valid_switch_pio_s1,
                                   cpu_0_data_master_requests_switch_pio_s1,
                                   d1_switch_pio_s1_end_xfer,
                                   switch_pio_s1_address,
                                   switch_pio_s1_readdata_from_sa,
                                   switch_pio_s1_reset_n
                                )
;

  output           cpu_0_data_master_granted_switch_pio_s1;
  output           cpu_0_data_master_qualified_request_switch_pio_s1;
  output           cpu_0_data_master_read_data_valid_switch_pio_s1;
  output           cpu_0_data_master_requests_switch_pio_s1;
  output           d1_switch_pio_s1_end_xfer;
  output  [  1: 0] switch_pio_s1_address;
  output  [ 31: 0] switch_pio_s1_readdata_from_sa;
  output           switch_pio_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [ 31: 0] switch_pio_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_switch_pio_s1;
  wire             cpu_0_data_master_qualified_request_switch_pio_s1;
  wire             cpu_0_data_master_read_data_valid_switch_pio_s1;
  wire             cpu_0_data_master_requests_switch_pio_s1;
  wire             cpu_0_data_master_saved_grant_switch_pio_s1;
  reg              d1_reasons_to_wait;
  reg              d1_switch_pio_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_switch_pio_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_switch_pio_s1_from_cpu_0_data_master;
  wire    [  1: 0] switch_pio_s1_address;
  wire             switch_pio_s1_allgrants;
  wire             switch_pio_s1_allow_new_arb_cycle;
  wire             switch_pio_s1_any_bursting_master_saved_grant;
  wire             switch_pio_s1_any_continuerequest;
  wire             switch_pio_s1_arb_counter_enable;
  reg     [  2: 0] switch_pio_s1_arb_share_counter;
  wire    [  2: 0] switch_pio_s1_arb_share_counter_next_value;
  wire    [  2: 0] switch_pio_s1_arb_share_set_values;
  wire             switch_pio_s1_beginbursttransfer_internal;
  wire             switch_pio_s1_begins_xfer;
  wire             switch_pio_s1_end_xfer;
  wire             switch_pio_s1_firsttransfer;
  wire             switch_pio_s1_grant_vector;
  wire             switch_pio_s1_in_a_read_cycle;
  wire             switch_pio_s1_in_a_write_cycle;
  wire             switch_pio_s1_master_qreq_vector;
  wire             switch_pio_s1_non_bursting_master_requests;
  wire    [ 31: 0] switch_pio_s1_readdata_from_sa;
  reg              switch_pio_s1_reg_firsttransfer;
  wire             switch_pio_s1_reset_n;
  reg              switch_pio_s1_slavearbiterlockenable;
  wire             switch_pio_s1_slavearbiterlockenable2;
  wire             switch_pio_s1_unreg_firsttransfer;
  wire             switch_pio_s1_waits_for_read;
  wire             switch_pio_s1_waits_for_write;
  wire             wait_for_switch_pio_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~switch_pio_s1_end_xfer;
    end


  assign switch_pio_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_switch_pio_s1));
  //assign switch_pio_s1_readdata_from_sa = switch_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign switch_pio_s1_readdata_from_sa = switch_pio_s1_readdata;

  assign cpu_0_data_master_requests_switch_pio_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h900130) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //switch_pio_s1_arb_share_counter set values, which is an e_mux
  assign switch_pio_s1_arb_share_set_values = 1;

  //switch_pio_s1_non_bursting_master_requests mux, which is an e_mux
  assign switch_pio_s1_non_bursting_master_requests = cpu_0_data_master_requests_switch_pio_s1;

  //switch_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign switch_pio_s1_any_bursting_master_saved_grant = 0;

  //switch_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign switch_pio_s1_arb_share_counter_next_value = switch_pio_s1_firsttransfer ? (switch_pio_s1_arb_share_set_values - 1) : |switch_pio_s1_arb_share_counter ? (switch_pio_s1_arb_share_counter - 1) : 0;

  //switch_pio_s1_allgrants all slave grants, which is an e_mux
  assign switch_pio_s1_allgrants = |switch_pio_s1_grant_vector;

  //switch_pio_s1_end_xfer assignment, which is an e_assign
  assign switch_pio_s1_end_xfer = ~(switch_pio_s1_waits_for_read | switch_pio_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_switch_pio_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_switch_pio_s1 = switch_pio_s1_end_xfer & (~switch_pio_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //switch_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign switch_pio_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_switch_pio_s1 & switch_pio_s1_allgrants) | (end_xfer_arb_share_counter_term_switch_pio_s1 & ~switch_pio_s1_non_bursting_master_requests);

  //switch_pio_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switch_pio_s1_arb_share_counter <= 0;
      else if (switch_pio_s1_arb_counter_enable)
          switch_pio_s1_arb_share_counter <= switch_pio_s1_arb_share_counter_next_value;
    end


  //switch_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switch_pio_s1_slavearbiterlockenable <= 0;
      else if ((|switch_pio_s1_master_qreq_vector & end_xfer_arb_share_counter_term_switch_pio_s1) | (end_xfer_arb_share_counter_term_switch_pio_s1 & ~switch_pio_s1_non_bursting_master_requests))
          switch_pio_s1_slavearbiterlockenable <= |switch_pio_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master switch_pio/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = switch_pio_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //switch_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign switch_pio_s1_slavearbiterlockenable2 = |switch_pio_s1_arb_share_counter_next_value;

  //cpu_0/data_master switch_pio/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = switch_pio_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //switch_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign switch_pio_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_switch_pio_s1 = cpu_0_data_master_requests_switch_pio_s1;
  //master is always granted when requested
  assign cpu_0_data_master_granted_switch_pio_s1 = cpu_0_data_master_qualified_request_switch_pio_s1;

  //cpu_0/data_master saved-grant switch_pio/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_switch_pio_s1 = cpu_0_data_master_requests_switch_pio_s1;

  //allow new arb cycle for switch_pio/s1, which is an e_assign
  assign switch_pio_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign switch_pio_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign switch_pio_s1_master_qreq_vector = 1;

  //switch_pio_s1_reset_n assignment, which is an e_assign
  assign switch_pio_s1_reset_n = reset_n;

  //switch_pio_s1_firsttransfer first transaction, which is an e_assign
  assign switch_pio_s1_firsttransfer = switch_pio_s1_begins_xfer ? switch_pio_s1_unreg_firsttransfer : switch_pio_s1_reg_firsttransfer;

  //switch_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign switch_pio_s1_unreg_firsttransfer = ~(switch_pio_s1_slavearbiterlockenable & switch_pio_s1_any_continuerequest);

  //switch_pio_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switch_pio_s1_reg_firsttransfer <= 1'b1;
      else if (switch_pio_s1_begins_xfer)
          switch_pio_s1_reg_firsttransfer <= switch_pio_s1_unreg_firsttransfer;
    end


  //switch_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign switch_pio_s1_beginbursttransfer_internal = switch_pio_s1_begins_xfer;

  assign shifted_address_to_switch_pio_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //switch_pio_s1_address mux, which is an e_mux
  assign switch_pio_s1_address = shifted_address_to_switch_pio_s1_from_cpu_0_data_master >> 2;

  //d1_switch_pio_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_switch_pio_s1_end_xfer <= 1;
      else 
        d1_switch_pio_s1_end_xfer <= switch_pio_s1_end_xfer;
    end


  //switch_pio_s1_waits_for_read in a cycle, which is an e_mux
  assign switch_pio_s1_waits_for_read = switch_pio_s1_in_a_read_cycle & switch_pio_s1_begins_xfer;

  //switch_pio_s1_in_a_read_cycle assignment, which is an e_assign
  assign switch_pio_s1_in_a_read_cycle = cpu_0_data_master_granted_switch_pio_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = switch_pio_s1_in_a_read_cycle;

  //switch_pio_s1_waits_for_write in a cycle, which is an e_mux
  assign switch_pio_s1_waits_for_write = switch_pio_s1_in_a_write_cycle & 0;

  //switch_pio_s1_in_a_write_cycle assignment, which is an e_assign
  assign switch_pio_s1_in_a_write_cycle = cpu_0_data_master_granted_switch_pio_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = switch_pio_s1_in_a_write_cycle;

  assign wait_for_switch_pio_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //switch_pio/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_0_data_master_granted_sysid_control_slave,
                                         cpu_0_data_master_qualified_request_sysid_control_slave,
                                         cpu_0_data_master_read_data_valid_sysid_control_slave,
                                         cpu_0_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_0_data_master_granted_sysid_control_slave;
  output           cpu_0_data_master_qualified_request_sysid_control_slave;
  output           cpu_0_data_master_read_data_valid_sysid_control_slave;
  output           cpu_0_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sysid_control_slave_from_cpu_0_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  2: 0] sysid_control_slave_arb_share_counter;
  wire    [  2: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_0_data_master_requests_sysid_control_slave = (({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h900020) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_0_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu_0/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign cpu_0_data_master_granted_sysid_control_slave = cpu_0_data_master_qualified_request_sysid_control_slave;

  //cpu_0/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_0_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_read,
                                cpu_0_data_master_waitrequest,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                reset_n,
                                timer_0_s1_irq,
                                timer_0_s1_readdata,

                               // outputs:
                                cpu_0_data_master_granted_timer_0_s1,
                                cpu_0_data_master_qualified_request_timer_0_s1,
                                cpu_0_data_master_read_data_valid_timer_0_s1,
                                cpu_0_data_master_requests_timer_0_s1,
                                d1_timer_0_s1_end_xfer,
                                timer_0_s1_address,
                                timer_0_s1_chipselect,
                                timer_0_s1_irq_from_sa,
                                timer_0_s1_readdata_from_sa,
                                timer_0_s1_reset_n,
                                timer_0_s1_write_n,
                                timer_0_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_timer_0_s1;
  output           cpu_0_data_master_qualified_request_timer_0_s1;
  output           cpu_0_data_master_read_data_valid_timer_0_s1;
  output           cpu_0_data_master_requests_timer_0_s1;
  output           d1_timer_0_s1_end_xfer;
  output  [  2: 0] timer_0_s1_address;
  output           timer_0_s1_chipselect;
  output           timer_0_s1_irq_from_sa;
  output  [ 15: 0] timer_0_s1_readdata_from_sa;
  output           timer_0_s1_reset_n;
  output           timer_0_s1_write_n;
  output  [ 15: 0] timer_0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input            timer_0_s1_irq;
  input   [ 15: 0] timer_0_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_saved_grant_timer_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_timer_0_s1_from_cpu_0_data_master;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_allgrants;
  wire             timer_0_s1_allow_new_arb_cycle;
  wire             timer_0_s1_any_bursting_master_saved_grant;
  wire             timer_0_s1_any_continuerequest;
  wire             timer_0_s1_arb_counter_enable;
  reg     [  2: 0] timer_0_s1_arb_share_counter;
  wire    [  2: 0] timer_0_s1_arb_share_counter_next_value;
  wire    [  2: 0] timer_0_s1_arb_share_set_values;
  wire             timer_0_s1_beginbursttransfer_internal;
  wire             timer_0_s1_begins_xfer;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_end_xfer;
  wire             timer_0_s1_firsttransfer;
  wire             timer_0_s1_grant_vector;
  wire             timer_0_s1_in_a_read_cycle;
  wire             timer_0_s1_in_a_write_cycle;
  wire             timer_0_s1_irq_from_sa;
  wire             timer_0_s1_master_qreq_vector;
  wire             timer_0_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  reg              timer_0_s1_reg_firsttransfer;
  wire             timer_0_s1_reset_n;
  reg              timer_0_s1_slavearbiterlockenable;
  wire             timer_0_s1_slavearbiterlockenable2;
  wire             timer_0_s1_unreg_firsttransfer;
  wire             timer_0_s1_waits_for_read;
  wire             timer_0_s1_waits_for_write;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire             wait_for_timer_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_0_s1_end_xfer;
    end


  assign timer_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_timer_0_s1));
  //assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata;

  assign cpu_0_data_master_requests_timer_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h900000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //timer_0_s1_arb_share_counter set values, which is an e_mux
  assign timer_0_s1_arb_share_set_values = 1;

  //timer_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_timer_0_s1;

  //timer_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_0_s1_any_bursting_master_saved_grant = 0;

  //timer_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_0_s1_arb_share_counter_next_value = timer_0_s1_firsttransfer ? (timer_0_s1_arb_share_set_values - 1) : |timer_0_s1_arb_share_counter ? (timer_0_s1_arb_share_counter - 1) : 0;

  //timer_0_s1_allgrants all slave grants, which is an e_mux
  assign timer_0_s1_allgrants = |timer_0_s1_grant_vector;

  //timer_0_s1_end_xfer assignment, which is an e_assign
  assign timer_0_s1_end_xfer = ~(timer_0_s1_waits_for_read | timer_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_0_s1 = timer_0_s1_end_xfer & (~timer_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_0_s1 & timer_0_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests);

  //timer_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_arb_share_counter <= 0;
      else if (timer_0_s1_arb_counter_enable)
          timer_0_s1_arb_share_counter <= timer_0_s1_arb_share_counter_next_value;
    end


  //timer_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_slavearbiterlockenable <= 0;
      else if ((|timer_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_0_s1) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests))
          timer_0_s1_slavearbiterlockenable <= |timer_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master timer_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = timer_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //timer_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_0_s1_slavearbiterlockenable2 = |timer_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master timer_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = timer_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //timer_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //timer_0_s1_writedata mux, which is an e_mux
  assign timer_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_timer_0_s1 = cpu_0_data_master_qualified_request_timer_0_s1;

  //cpu_0/data_master saved-grant timer_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1;

  //allow new arb cycle for timer_0/s1, which is an e_assign
  assign timer_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_0_s1_master_qreq_vector = 1;

  //timer_0_s1_reset_n assignment, which is an e_assign
  assign timer_0_s1_reset_n = reset_n;

  assign timer_0_s1_chipselect = cpu_0_data_master_granted_timer_0_s1;
  //timer_0_s1_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_firsttransfer = timer_0_s1_begins_xfer ? timer_0_s1_unreg_firsttransfer : timer_0_s1_reg_firsttransfer;

  //timer_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_unreg_firsttransfer = ~(timer_0_s1_slavearbiterlockenable & timer_0_s1_any_continuerequest);

  //timer_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_reg_firsttransfer <= 1'b1;
      else if (timer_0_s1_begins_xfer)
          timer_0_s1_reg_firsttransfer <= timer_0_s1_unreg_firsttransfer;
    end


  //timer_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_0_s1_beginbursttransfer_internal = timer_0_s1_begins_xfer;

  //~timer_0_s1_write_n assignment, which is an e_mux
  assign timer_0_s1_write_n = ~(cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_timer_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //timer_0_s1_address mux, which is an e_mux
  assign timer_0_s1_address = shifted_address_to_timer_0_s1_from_cpu_0_data_master >> 2;

  //d1_timer_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_0_s1_end_xfer <= 1;
      else 
        d1_timer_0_s1_end_xfer <= timer_0_s1_end_xfer;
    end


  //timer_0_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_read = timer_0_s1_in_a_read_cycle & timer_0_s1_begins_xfer;

  //timer_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_read_cycle = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_0_s1_in_a_read_cycle;

  //timer_0_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_write = timer_0_s1_in_a_write_cycle & 0;

  //timer_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_write_cycle = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_0_s1_in_a_write_cycle;

  assign wait_for_timer_0_s1_counter = 0;
  //assign timer_0_s1_irq_from_sa = timer_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_irq_from_sa = timer_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_1_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_read,
                                cpu_0_data_master_waitrequest,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                reset_n,
                                timer_1_s1_irq,
                                timer_1_s1_readdata,

                               // outputs:
                                cpu_0_data_master_granted_timer_1_s1,
                                cpu_0_data_master_qualified_request_timer_1_s1,
                                cpu_0_data_master_read_data_valid_timer_1_s1,
                                cpu_0_data_master_requests_timer_1_s1,
                                d1_timer_1_s1_end_xfer,
                                timer_1_s1_address,
                                timer_1_s1_chipselect,
                                timer_1_s1_irq_from_sa,
                                timer_1_s1_readdata_from_sa,
                                timer_1_s1_reset_n,
                                timer_1_s1_write_n,
                                timer_1_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_timer_1_s1;
  output           cpu_0_data_master_qualified_request_timer_1_s1;
  output           cpu_0_data_master_read_data_valid_timer_1_s1;
  output           cpu_0_data_master_requests_timer_1_s1;
  output           d1_timer_1_s1_end_xfer;
  output  [  2: 0] timer_1_s1_address;
  output           timer_1_s1_chipselect;
  output           timer_1_s1_irq_from_sa;
  output  [ 15: 0] timer_1_s1_readdata_from_sa;
  output           timer_1_s1_reset_n;
  output           timer_1_s1_write_n;
  output  [ 15: 0] timer_1_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input            timer_1_s1_irq;
  input   [ 15: 0] timer_1_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_timer_1_s1;
  wire             cpu_0_data_master_qualified_request_timer_1_s1;
  wire             cpu_0_data_master_read_data_valid_timer_1_s1;
  wire             cpu_0_data_master_requests_timer_1_s1;
  wire             cpu_0_data_master_saved_grant_timer_1_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_1_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_1_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_timer_1_s1_from_cpu_0_data_master;
  wire    [  2: 0] timer_1_s1_address;
  wire             timer_1_s1_allgrants;
  wire             timer_1_s1_allow_new_arb_cycle;
  wire             timer_1_s1_any_bursting_master_saved_grant;
  wire             timer_1_s1_any_continuerequest;
  wire             timer_1_s1_arb_counter_enable;
  reg     [  2: 0] timer_1_s1_arb_share_counter;
  wire    [  2: 0] timer_1_s1_arb_share_counter_next_value;
  wire    [  2: 0] timer_1_s1_arb_share_set_values;
  wire             timer_1_s1_beginbursttransfer_internal;
  wire             timer_1_s1_begins_xfer;
  wire             timer_1_s1_chipselect;
  wire             timer_1_s1_end_xfer;
  wire             timer_1_s1_firsttransfer;
  wire             timer_1_s1_grant_vector;
  wire             timer_1_s1_in_a_read_cycle;
  wire             timer_1_s1_in_a_write_cycle;
  wire             timer_1_s1_irq_from_sa;
  wire             timer_1_s1_master_qreq_vector;
  wire             timer_1_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_1_s1_readdata_from_sa;
  reg              timer_1_s1_reg_firsttransfer;
  wire             timer_1_s1_reset_n;
  reg              timer_1_s1_slavearbiterlockenable;
  wire             timer_1_s1_slavearbiterlockenable2;
  wire             timer_1_s1_unreg_firsttransfer;
  wire             timer_1_s1_waits_for_read;
  wire             timer_1_s1_waits_for_write;
  wire             timer_1_s1_write_n;
  wire    [ 15: 0] timer_1_s1_writedata;
  wire             wait_for_timer_1_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_1_s1_end_xfer;
    end


  assign timer_1_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_timer_1_s1));
  //assign timer_1_s1_readdata_from_sa = timer_1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_1_s1_readdata_from_sa = timer_1_s1_readdata;

  assign cpu_0_data_master_requests_timer_1_s1 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h900060) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //timer_1_s1_arb_share_counter set values, which is an e_mux
  assign timer_1_s1_arb_share_set_values = 1;

  //timer_1_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_1_s1_non_bursting_master_requests = cpu_0_data_master_requests_timer_1_s1;

  //timer_1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_1_s1_any_bursting_master_saved_grant = 0;

  //timer_1_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_1_s1_arb_share_counter_next_value = timer_1_s1_firsttransfer ? (timer_1_s1_arb_share_set_values - 1) : |timer_1_s1_arb_share_counter ? (timer_1_s1_arb_share_counter - 1) : 0;

  //timer_1_s1_allgrants all slave grants, which is an e_mux
  assign timer_1_s1_allgrants = |timer_1_s1_grant_vector;

  //timer_1_s1_end_xfer assignment, which is an e_assign
  assign timer_1_s1_end_xfer = ~(timer_1_s1_waits_for_read | timer_1_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_1_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_1_s1 = timer_1_s1_end_xfer & (~timer_1_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_1_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_1_s1 & timer_1_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_1_s1 & ~timer_1_s1_non_bursting_master_requests);

  //timer_1_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_1_s1_arb_share_counter <= 0;
      else if (timer_1_s1_arb_counter_enable)
          timer_1_s1_arb_share_counter <= timer_1_s1_arb_share_counter_next_value;
    end


  //timer_1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_1_s1_slavearbiterlockenable <= 0;
      else if ((|timer_1_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_1_s1) | (end_xfer_arb_share_counter_term_timer_1_s1 & ~timer_1_s1_non_bursting_master_requests))
          timer_1_s1_slavearbiterlockenable <= |timer_1_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master timer_1/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = timer_1_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //timer_1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_1_s1_slavearbiterlockenable2 = |timer_1_s1_arb_share_counter_next_value;

  //cpu_0/data_master timer_1/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = timer_1_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //timer_1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_1_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_timer_1_s1 = cpu_0_data_master_requests_timer_1_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //timer_1_s1_writedata mux, which is an e_mux
  assign timer_1_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_timer_1_s1 = cpu_0_data_master_qualified_request_timer_1_s1;

  //cpu_0/data_master saved-grant timer_1/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_timer_1_s1 = cpu_0_data_master_requests_timer_1_s1;

  //allow new arb cycle for timer_1/s1, which is an e_assign
  assign timer_1_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_1_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_1_s1_master_qreq_vector = 1;

  //timer_1_s1_reset_n assignment, which is an e_assign
  assign timer_1_s1_reset_n = reset_n;

  assign timer_1_s1_chipselect = cpu_0_data_master_granted_timer_1_s1;
  //timer_1_s1_firsttransfer first transaction, which is an e_assign
  assign timer_1_s1_firsttransfer = timer_1_s1_begins_xfer ? timer_1_s1_unreg_firsttransfer : timer_1_s1_reg_firsttransfer;

  //timer_1_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_1_s1_unreg_firsttransfer = ~(timer_1_s1_slavearbiterlockenable & timer_1_s1_any_continuerequest);

  //timer_1_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_1_s1_reg_firsttransfer <= 1'b1;
      else if (timer_1_s1_begins_xfer)
          timer_1_s1_reg_firsttransfer <= timer_1_s1_unreg_firsttransfer;
    end


  //timer_1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_1_s1_beginbursttransfer_internal = timer_1_s1_begins_xfer;

  //~timer_1_s1_write_n assignment, which is an e_mux
  assign timer_1_s1_write_n = ~(cpu_0_data_master_granted_timer_1_s1 & cpu_0_data_master_write);

  assign shifted_address_to_timer_1_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //timer_1_s1_address mux, which is an e_mux
  assign timer_1_s1_address = shifted_address_to_timer_1_s1_from_cpu_0_data_master >> 2;

  //d1_timer_1_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_1_s1_end_xfer <= 1;
      else 
        d1_timer_1_s1_end_xfer <= timer_1_s1_end_xfer;
    end


  //timer_1_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_1_s1_waits_for_read = timer_1_s1_in_a_read_cycle & timer_1_s1_begins_xfer;

  //timer_1_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_1_s1_in_a_read_cycle = cpu_0_data_master_granted_timer_1_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_1_s1_in_a_read_cycle;

  //timer_1_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_1_s1_waits_for_write = timer_1_s1_in_a_write_cycle & 0;

  //timer_1_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_1_s1_in_a_write_cycle = cpu_0_data_master_granted_timer_1_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_1_s1_in_a_write_cycle;

  assign wait_for_timer_1_s1_counter = 0;
  //assign timer_1_s1_irq_from_sa = timer_1_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_1_s1_irq_from_sa = timer_1_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_1/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_0_avalon_slave_arbitrator (
                                                    // inputs:
                                                     clk,
                                                     cpu_0_data_master_address_to_slave,
                                                     cpu_0_data_master_byteenable,
                                                     cpu_0_data_master_dbs_address,
                                                     cpu_0_data_master_dbs_write_8,
                                                     cpu_0_data_master_no_byte_enables_and_last_term,
                                                     cpu_0_data_master_read,
                                                     cpu_0_data_master_write,
                                                     cpu_0_instruction_master_address_to_slave,
                                                     cpu_0_instruction_master_dbs_address,
                                                     cpu_0_instruction_master_latency_counter,
                                                     cpu_0_instruction_master_read,
                                                     cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                                     reset_n,

                                                    // outputs:
                                                     cfi_flash_0_s1_wait_counter_eq_0,
                                                     cfi_flash_0_s1_wait_counter_eq_1,
                                                     cpu_0_data_master_byteenable_cfi_flash_0_s1,
                                                     cpu_0_data_master_granted_cfi_flash_0_s1,
                                                     cpu_0_data_master_qualified_request_cfi_flash_0_s1,
                                                     cpu_0_data_master_read_data_valid_cfi_flash_0_s1,
                                                     cpu_0_data_master_requests_cfi_flash_0_s1,
                                                     cpu_0_instruction_master_granted_cfi_flash_0_s1,
                                                     cpu_0_instruction_master_qualified_request_cfi_flash_0_s1,
                                                     cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1,
                                                     cpu_0_instruction_master_requests_cfi_flash_0_s1,
                                                     d1_tri_state_bridge_0_avalon_slave_end_xfer,
                                                     incoming_tri_state_bridge_0_data,
                                                     incoming_tri_state_bridge_0_data_with_Xs_converted_to_0,
                                                     registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1,
                                                     select_n_to_the_cfi_flash_0,
                                                     tri_state_bridge_0_address,
                                                     tri_state_bridge_0_data,
                                                     tri_state_bridge_0_readn,
                                                     write_n_to_the_cfi_flash_0
                                                  )
;

  output           cfi_flash_0_s1_wait_counter_eq_0;
  output           cfi_flash_0_s1_wait_counter_eq_1;
  output           cpu_0_data_master_byteenable_cfi_flash_0_s1;
  output           cpu_0_data_master_granted_cfi_flash_0_s1;
  output           cpu_0_data_master_qualified_request_cfi_flash_0_s1;
  output           cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  output           cpu_0_data_master_requests_cfi_flash_0_s1;
  output           cpu_0_instruction_master_granted_cfi_flash_0_s1;
  output           cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;
  output           cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;
  output           cpu_0_instruction_master_requests_cfi_flash_0_s1;
  output           d1_tri_state_bridge_0_avalon_slave_end_xfer;
  output  [  7: 0] incoming_tri_state_bridge_0_data;
  output  [  7: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  output           registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  output           select_n_to_the_cfi_flash_0;
  output  [ 19: 0] tri_state_bridge_0_address;
  inout   [  7: 0] tri_state_bridge_0_data;
  output           tri_state_bridge_0_readn;
  output           write_n_to_the_cfi_flash_0;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [  7: 0] cpu_0_data_master_dbs_write_8;
  input            cpu_0_data_master_no_byte_enables_and_last_term;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input   [  1: 0] cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input            reset_n;

  wire    [  3: 0] cfi_flash_0_s1_counter_load_value;
  wire             cfi_flash_0_s1_in_a_read_cycle;
  wire             cfi_flash_0_s1_in_a_write_cycle;
  wire             cfi_flash_0_s1_pretend_byte_enable;
  reg     [  3: 0] cfi_flash_0_s1_wait_counter;
  wire             cfi_flash_0_s1_wait_counter_eq_0;
  wire             cfi_flash_0_s1_wait_counter_eq_1;
  wire             cfi_flash_0_s1_waits_for_read;
  wire             cfi_flash_0_s1_waits_for_write;
  wire             cfi_flash_0_s1_with_write_latency;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_0;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_1;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_2;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_3;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cfi_flash_0_s1;
  wire             cpu_0_data_master_qualified_request_cfi_flash_0_s1;
  wire             cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  reg     [  1: 0] cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register_in;
  wire             cpu_0_data_master_requests_cfi_flash_0_s1;
  wire             cpu_0_data_master_saved_grant_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;
  reg     [  1: 0] cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_saved_grant_cfi_flash_0_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [  7: 0] d1_outgoing_tri_state_bridge_0_data /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_0_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [  7: 0] incoming_tri_state_bridge_0_data /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_tri_state_bridge_0_data_bit_0_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_1_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_2_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_3_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_4_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_5_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_6_is_x;
  wire             incoming_tri_state_bridge_0_data_bit_7_is_x;
  wire    [  7: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  reg              last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1;
  wire    [  7: 0] outgoing_tri_state_bridge_0_data;
  wire    [  1: 0] p1_cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register;
  wire    [  1: 0] p1_cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register;
  wire             p1_select_n_to_the_cfi_flash_0;
  wire    [ 19: 0] p1_tri_state_bridge_0_address;
  wire             p1_tri_state_bridge_0_readn;
  wire             p1_write_n_to_the_cfi_flash_0;
  wire             registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  reg              select_n_to_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  reg     [ 19: 0] tri_state_bridge_0_address /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             tri_state_bridge_0_avalon_slave_allgrants;
  wire             tri_state_bridge_0_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant;
  wire             tri_state_bridge_0_avalon_slave_any_continuerequest;
  reg     [  1: 0] tri_state_bridge_0_avalon_slave_arb_addend;
  wire             tri_state_bridge_0_avalon_slave_arb_counter_enable;
  reg     [  2: 0] tri_state_bridge_0_avalon_slave_arb_share_counter;
  wire    [  2: 0] tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] tri_state_bridge_0_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_arb_winner;
  wire             tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_0_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_0_avalon_slave_begins_xfer;
  wire    [  3: 0] tri_state_bridge_0_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_0_avalon_slave_end_xfer;
  wire             tri_state_bridge_0_avalon_slave_firsttransfer;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_grant_vector;
  wire    [  1: 0] tri_state_bridge_0_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_0_avalon_slave_non_bursting_master_requests;
  wire             tri_state_bridge_0_avalon_slave_read_pending;
  reg              tri_state_bridge_0_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_0_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_0_avalon_slave_slavearbiterlockenable2;
  wire             tri_state_bridge_0_avalon_slave_unreg_firsttransfer;
  wire             tri_state_bridge_0_avalon_slave_write_pending;
  wire    [  7: 0] tri_state_bridge_0_data;
  reg              tri_state_bridge_0_readn /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             wait_for_cfi_flash_0_s1_counter;
  reg              write_n_to_the_cfi_flash_0 /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tri_state_bridge_0_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_0_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cfi_flash_0_s1 | cpu_0_instruction_master_qualified_request_cfi_flash_0_s1));
  assign cpu_0_data_master_requests_cfi_flash_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 20] , 20'b0} == 25'h800000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //~select_n_to_the_cfi_flash_0 of type chipselect to ~p1_select_n_to_the_cfi_flash_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash_0 <= ~0;
      else 
        select_n_to_the_cfi_flash_0 <= p1_select_n_to_the_cfi_flash_0;
    end


  assign tri_state_bridge_0_avalon_slave_write_pending = 0;
  //tri_state_bridge_0/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_read_pending = 0;

  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1 = cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register[0];

  //tri_state_bridge_0_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_arb_share_set_values = (cpu_0_data_master_granted_cfi_flash_0_s1)? 4 :
    (cpu_0_instruction_master_granted_cfi_flash_0_s1)? 4 :
    (cpu_0_data_master_granted_cfi_flash_0_s1)? 4 :
    (cpu_0_instruction_master_granted_cfi_flash_0_s1)? 4 :
    1;

  //tri_state_bridge_0_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_non_bursting_master_requests = cpu_0_data_master_requests_cfi_flash_0_s1 |
    cpu_0_instruction_master_requests_cfi_flash_0_s1 |
    cpu_0_data_master_requests_cfi_flash_0_s1 |
    cpu_0_instruction_master_requests_cfi_flash_0_s1;

  //tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant = 0;

  //tri_state_bridge_0_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arb_share_counter_next_value = tri_state_bridge_0_avalon_slave_firsttransfer ? (tri_state_bridge_0_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_0_avalon_slave_arb_share_counter ? (tri_state_bridge_0_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_0_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_allgrants = (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector) |
    (|tri_state_bridge_0_avalon_slave_grant_vector);

  //tri_state_bridge_0_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_end_xfer = ~(cfi_flash_0_s1_waits_for_read | cfi_flash_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave = tri_state_bridge_0_avalon_slave_end_xfer & (~tri_state_bridge_0_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tri_state_bridge_0_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & tri_state_bridge_0_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & ~tri_state_bridge_0_avalon_slave_non_bursting_master_requests);

  //tri_state_bridge_0_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_0_avalon_slave_arb_counter_enable)
          tri_state_bridge_0_avalon_slave_arb_share_counter <= tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_0_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tri_state_bridge_0_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave) | (end_xfer_arb_share_counter_term_tri_state_bridge_0_avalon_slave & ~tri_state_bridge_0_avalon_slave_non_bursting_master_requests))
          tri_state_bridge_0_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 = |tri_state_bridge_0_avalon_slave_arb_share_counter_next_value;

  //cpu_0/data_master tri_state_bridge_0/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master tri_state_bridge_0/avalon_slave arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = tri_state_bridge_0_avalon_slave_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master tri_state_bridge_0/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = tri_state_bridge_0_avalon_slave_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cfi_flash_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1 <= cpu_0_instruction_master_saved_grant_cfi_flash_0_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cfi_flash_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cfi_flash_0_s1 & cpu_0_instruction_master_requests_cfi_flash_0_s1;

  //tri_state_bridge_0_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_0_avalon_slave_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cfi_flash_0_s1 = cpu_0_data_master_requests_cfi_flash_0_s1 & ~((cpu_0_data_master_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (|cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register))) | ((tri_state_bridge_0_avalon_slave_read_pending | cpu_0_data_master_no_byte_enables_and_last_term | !cpu_0_data_master_byteenable_cfi_flash_0_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register_in = cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_read & ~cfi_flash_0_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register = {cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register, cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_cfi_flash_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cfi_flash_0_s1 = cpu_0_data_master_read_data_valid_cfi_flash_0_s1_shift_register[1];

  //tri_state_bridge_0_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_tri_state_bridge_0_data <= 0;
      else 
        incoming_tri_state_bridge_0_data <= tri_state_bridge_0_data;
    end


  //cfi_flash_0_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_0_s1_with_write_latency = in_a_write_cycle & (cpu_0_data_master_qualified_request_cfi_flash_0_s1 | cpu_0_instruction_master_qualified_request_cfi_flash_0_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_0_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_tri_state_bridge_0_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_tri_state_bridge_0_data <= 0;
      else 
        d1_outgoing_tri_state_bridge_0_data <= outgoing_tri_state_bridge_0_data;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_tri_state_bridge_0_data tristate driver, which is an e_assign
  assign tri_state_bridge_0_data = (d1_in_a_write_cycle)? d1_outgoing_tri_state_bridge_0_data:{8{1'bz}};

  //outgoing_tri_state_bridge_0_data mux, which is an e_mux
  assign outgoing_tri_state_bridge_0_data = cpu_0_data_master_dbs_write_8;

  assign cpu_0_instruction_master_requests_cfi_flash_0_s1 = (({cpu_0_instruction_master_address_to_slave[24 : 20] , 20'b0} == 25'h800000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cfi_flash_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1 <= cpu_0_data_master_saved_grant_cfi_flash_0_s1 ? 1 : (tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cfi_flash_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cfi_flash_0_s1 & cpu_0_data_master_requests_cfi_flash_0_s1;

  assign cpu_0_instruction_master_qualified_request_cfi_flash_0_s1 = cpu_0_instruction_master_requests_cfi_flash_0_s1 & ~((cpu_0_instruction_master_read & (tri_state_bridge_0_avalon_slave_write_pending | (tri_state_bridge_0_avalon_slave_read_pending) | (2 < cpu_0_instruction_master_latency_counter) | (|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register_in = cpu_0_instruction_master_granted_cfi_flash_0_s1 & cpu_0_instruction_master_read & ~cfi_flash_0_s1_waits_for_read;

  //shift register p1 cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register = {cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register, cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1 = cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge_0/avalon_slave, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cfi_flash_0/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;

  //cpu_0/instruction_master grant cfi_flash_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_grant_vector[0];

  //cpu_0/instruction_master saved-grant cfi_flash_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_arb_winner[0] && cpu_0_instruction_master_requests_cfi_flash_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for cfi_flash_0/s1, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cfi_flash_0_s1;

  //cpu_0/data_master grant cfi_flash_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_grant_vector[1];

  //cpu_0/data_master saved-grant cfi_flash_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_cfi_flash_0_s1 = tri_state_bridge_0_avalon_slave_arb_winner[1] && cpu_0_data_master_requests_cfi_flash_0_s1;

  //tri_state_bridge_0/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_chosen_master_double_vector = {tri_state_bridge_0_avalon_slave_master_qreq_vector, tri_state_bridge_0_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_0_avalon_slave_master_qreq_vector, ~tri_state_bridge_0_avalon_slave_master_qreq_vector} + tri_state_bridge_0_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_0_avalon_slave_arb_winner = (tri_state_bridge_0_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_0_avalon_slave_grant_vector) ? tri_state_bridge_0_avalon_slave_grant_vector : tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_0_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_0_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_0_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_0_avalon_slave_grant_vector ? tri_state_bridge_0_avalon_slave_grant_vector : tri_state_bridge_0_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_0_avalon_slave_grant_vector = {(tri_state_bridge_0_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[3]),
    (tri_state_bridge_0_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_0_avalon_slave_chosen_master_double_vector[2])};

  //tri_state_bridge_0/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_chosen_master_rot_left = (tri_state_bridge_0_avalon_slave_arb_winner << 1) ? (tri_state_bridge_0_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge_0/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_0_avalon_slave_grant_vector)
          tri_state_bridge_0_avalon_slave_arb_addend <= tri_state_bridge_0_avalon_slave_end_xfer? tri_state_bridge_0_avalon_slave_chosen_master_rot_left : tri_state_bridge_0_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash_0 = ~(cpu_0_data_master_granted_cfi_flash_0_s1 | cpu_0_instruction_master_granted_cfi_flash_0_s1);
  //tri_state_bridge_0_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_firsttransfer = tri_state_bridge_0_avalon_slave_begins_xfer ? tri_state_bridge_0_avalon_slave_unreg_firsttransfer : tri_state_bridge_0_avalon_slave_reg_firsttransfer;

  //tri_state_bridge_0_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_unreg_firsttransfer = ~(tri_state_bridge_0_avalon_slave_slavearbiterlockenable & tri_state_bridge_0_avalon_slave_any_continuerequest);

  //tri_state_bridge_0_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tri_state_bridge_0_avalon_slave_begins_xfer)
          tri_state_bridge_0_avalon_slave_reg_firsttransfer <= tri_state_bridge_0_avalon_slave_unreg_firsttransfer;
    end


  //tri_state_bridge_0_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_beginbursttransfer_internal = tri_state_bridge_0_avalon_slave_begins_xfer;

  //tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_0_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_0_avalon_slave_begins_xfer & tri_state_bridge_0_avalon_slave_firsttransfer;

  //~tri_state_bridge_0_readn of type read to ~p1_tri_state_bridge_0_readn, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_readn <= ~0;
      else 
        tri_state_bridge_0_readn <= p1_tri_state_bridge_0_readn;
    end


  //~p1_tri_state_bridge_0_readn assignment, which is an e_mux
  assign p1_tri_state_bridge_0_readn = ~(((cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cfi_flash_0_s1 & cpu_0_instruction_master_read))& ~tri_state_bridge_0_avalon_slave_begins_xfer & (cfi_flash_0_s1_wait_counter < 8));

  //~write_n_to_the_cfi_flash_0 of type write to ~p1_write_n_to_the_cfi_flash_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash_0 <= ~0;
      else 
        write_n_to_the_cfi_flash_0 <= p1_write_n_to_the_cfi_flash_0;
    end


  //~p1_write_n_to_the_cfi_flash_0 assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash_0 = ~(((cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_write)) & ~tri_state_bridge_0_avalon_slave_begins_xfer & (cfi_flash_0_s1_wait_counter >= 2) & (cfi_flash_0_s1_wait_counter < 10) & cfi_flash_0_s1_pretend_byte_enable);

  //tri_state_bridge_0_address of type address to p1_tri_state_bridge_0_address, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_0_address <= 0;
      else 
        tri_state_bridge_0_address <= p1_tri_state_bridge_0_address;
    end


  //p1_tri_state_bridge_0_address mux, which is an e_mux
  assign p1_tri_state_bridge_0_address = (cpu_0_data_master_granted_cfi_flash_0_s1)? ({cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1 : 0]}) :
    ({cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1 : 0]});

  //d1_tri_state_bridge_0_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_0_avalon_slave_end_xfer <= 1;
      else 
        d1_tri_state_bridge_0_avalon_slave_end_xfer <= tri_state_bridge_0_avalon_slave_end_xfer;
    end


  //cfi_flash_0_s1_wait_counter_eq_1 assignment, which is an e_assign
  assign cfi_flash_0_s1_wait_counter_eq_1 = cfi_flash_0_s1_wait_counter == 1;

  //cfi_flash_0_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_0_s1_waits_for_read = cfi_flash_0_s1_in_a_read_cycle & wait_for_cfi_flash_0_s1_counter;

  //cfi_flash_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cfi_flash_0_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_0_s1_in_a_read_cycle;

  //cfi_flash_0_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_0_s1_waits_for_write = cfi_flash_0_s1_in_a_write_cycle & wait_for_cfi_flash_0_s1_counter;

  //cfi_flash_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_0_s1_in_a_write_cycle = cpu_0_data_master_granted_cfi_flash_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_0_s1_in_a_write_cycle;

  assign cfi_flash_0_s1_wait_counter_eq_0 = cfi_flash_0_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_0_s1_wait_counter <= 0;
      else 
        cfi_flash_0_s1_wait_counter <= cfi_flash_0_s1_counter_load_value;
    end


  assign cfi_flash_0_s1_counter_load_value = ((cfi_flash_0_s1_in_a_write_cycle & tri_state_bridge_0_avalon_slave_begins_xfer))? 10 :
    ((cfi_flash_0_s1_in_a_read_cycle & tri_state_bridge_0_avalon_slave_begins_xfer))? 8 :
    (~cfi_flash_0_s1_wait_counter_eq_0)? cfi_flash_0_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_0_s1_counter = tri_state_bridge_0_avalon_slave_begins_xfer | ~cfi_flash_0_s1_wait_counter_eq_0;
  //cfi_flash_0_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign cfi_flash_0_s1_pretend_byte_enable = (cpu_0_data_master_granted_cfi_flash_0_s1)? cpu_0_data_master_byteenable_cfi_flash_0_s1 :
    -1;

  assign {cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_3,
cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_2,
cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_1,
cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_cfi_flash_0_s1 = ((cpu_0_data_master_dbs_address[1 : 0] == 0))? cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_0 :
    ((cpu_0_data_master_dbs_address[1 : 0] == 1))? cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_1 :
    ((cpu_0_data_master_dbs_address[1 : 0] == 2))? cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_2 :
    cpu_0_data_master_byteenable_cfi_flash_0_s1_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_tri_state_bridge_0_data_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_0_is_x = ^(incoming_tri_state_bridge_0_data[0]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[0] = incoming_tri_state_bridge_0_data_bit_0_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[0];

  //incoming_tri_state_bridge_0_data_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_1_is_x = ^(incoming_tri_state_bridge_0_data[1]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[1] = incoming_tri_state_bridge_0_data_bit_1_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[1];

  //incoming_tri_state_bridge_0_data_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_2_is_x = ^(incoming_tri_state_bridge_0_data[2]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[2] = incoming_tri_state_bridge_0_data_bit_2_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[2];

  //incoming_tri_state_bridge_0_data_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_3_is_x = ^(incoming_tri_state_bridge_0_data[3]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[3] = incoming_tri_state_bridge_0_data_bit_3_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[3];

  //incoming_tri_state_bridge_0_data_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_4_is_x = ^(incoming_tri_state_bridge_0_data[4]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[4] = incoming_tri_state_bridge_0_data_bit_4_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[4];

  //incoming_tri_state_bridge_0_data_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_5_is_x = ^(incoming_tri_state_bridge_0_data[5]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[5] = incoming_tri_state_bridge_0_data_bit_5_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[5];

  //incoming_tri_state_bridge_0_data_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_6_is_x = ^(incoming_tri_state_bridge_0_data[6]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[6] = incoming_tri_state_bridge_0_data_bit_6_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[6];

  //incoming_tri_state_bridge_0_data_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_0_data_bit_7_is_x = ^(incoming_tri_state_bridge_0_data[7]) === 1'bx;

  //Crush incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0[7] = incoming_tri_state_bridge_0_data_bit_7_is_x ? 1'b0 : incoming_tri_state_bridge_0_data[7];

  //cfi_flash_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cfi_flash_0_s1 + cpu_0_instruction_master_granted_cfi_flash_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cfi_flash_0_s1 + cpu_0_instruction_master_saved_grant_cfi_flash_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_tri_state_bridge_0_data_with_Xs_converted_to_0 = incoming_tri_state_bridge_0_data;
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_0_bridge_arbitrator 
;



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module uart_0_s1_arbitrator (
                              // inputs:
                               clk,
                               cpu_0_data_master_address_to_slave,
                               cpu_0_data_master_read,
                               cpu_0_data_master_write,
                               cpu_0_data_master_writedata,
                               reset_n,
                               uart_0_s1_dataavailable,
                               uart_0_s1_irq,
                               uart_0_s1_readdata,
                               uart_0_s1_readyfordata,

                              // outputs:
                               cpu_0_data_master_granted_uart_0_s1,
                               cpu_0_data_master_qualified_request_uart_0_s1,
                               cpu_0_data_master_read_data_valid_uart_0_s1,
                               cpu_0_data_master_requests_uart_0_s1,
                               d1_uart_0_s1_end_xfer,
                               uart_0_s1_address,
                               uart_0_s1_begintransfer,
                               uart_0_s1_chipselect,
                               uart_0_s1_dataavailable_from_sa,
                               uart_0_s1_irq_from_sa,
                               uart_0_s1_read_n,
                               uart_0_s1_readdata_from_sa,
                               uart_0_s1_readyfordata_from_sa,
                               uart_0_s1_reset_n,
                               uart_0_s1_write_n,
                               uart_0_s1_writedata
                            )
;

  output           cpu_0_data_master_granted_uart_0_s1;
  output           cpu_0_data_master_qualified_request_uart_0_s1;
  output           cpu_0_data_master_read_data_valid_uart_0_s1;
  output           cpu_0_data_master_requests_uart_0_s1;
  output           d1_uart_0_s1_end_xfer;
  output  [  2: 0] uart_0_s1_address;
  output           uart_0_s1_begintransfer;
  output           uart_0_s1_chipselect;
  output           uart_0_s1_dataavailable_from_sa;
  output           uart_0_s1_irq_from_sa;
  output           uart_0_s1_read_n;
  output  [ 15: 0] uart_0_s1_readdata_from_sa;
  output           uart_0_s1_readyfordata_from_sa;
  output           uart_0_s1_reset_n;
  output           uart_0_s1_write_n;
  output  [ 15: 0] uart_0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input            uart_0_s1_dataavailable;
  input            uart_0_s1_irq;
  input   [ 15: 0] uart_0_s1_readdata;
  input            uart_0_s1_readyfordata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_uart_0_s1;
  wire             cpu_0_data_master_qualified_request_uart_0_s1;
  wire             cpu_0_data_master_read_data_valid_uart_0_s1;
  wire             cpu_0_data_master_requests_uart_0_s1;
  wire             cpu_0_data_master_saved_grant_uart_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_uart_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_uart_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_uart_0_s1_from_cpu_0_data_master;
  wire    [  2: 0] uart_0_s1_address;
  wire             uart_0_s1_allgrants;
  wire             uart_0_s1_allow_new_arb_cycle;
  wire             uart_0_s1_any_bursting_master_saved_grant;
  wire             uart_0_s1_any_continuerequest;
  wire             uart_0_s1_arb_counter_enable;
  reg     [  2: 0] uart_0_s1_arb_share_counter;
  wire    [  2: 0] uart_0_s1_arb_share_counter_next_value;
  wire    [  2: 0] uart_0_s1_arb_share_set_values;
  wire             uart_0_s1_beginbursttransfer_internal;
  wire             uart_0_s1_begins_xfer;
  wire             uart_0_s1_begintransfer;
  wire             uart_0_s1_chipselect;
  wire             uart_0_s1_dataavailable_from_sa;
  wire             uart_0_s1_end_xfer;
  wire             uart_0_s1_firsttransfer;
  wire             uart_0_s1_grant_vector;
  wire             uart_0_s1_in_a_read_cycle;
  wire             uart_0_s1_in_a_write_cycle;
  wire             uart_0_s1_irq_from_sa;
  wire             uart_0_s1_master_qreq_vector;
  wire             uart_0_s1_non_bursting_master_requests;
  wire             uart_0_s1_read_n;
  wire    [ 15: 0] uart_0_s1_readdata_from_sa;
  wire             uart_0_s1_readyfordata_from_sa;
  reg              uart_0_s1_reg_firsttransfer;
  wire             uart_0_s1_reset_n;
  reg              uart_0_s1_slavearbiterlockenable;
  wire             uart_0_s1_slavearbiterlockenable2;
  wire             uart_0_s1_unreg_firsttransfer;
  wire             uart_0_s1_waits_for_read;
  wire             uart_0_s1_waits_for_write;
  wire             uart_0_s1_write_n;
  wire    [ 15: 0] uart_0_s1_writedata;
  wire             wait_for_uart_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~uart_0_s1_end_xfer;
    end


  assign uart_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_uart_0_s1));
  //assign uart_0_s1_readdata_from_sa = uart_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_0_s1_readdata_from_sa = uart_0_s1_readdata;

  assign cpu_0_data_master_requests_uart_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h900040) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign uart_0_s1_dataavailable_from_sa = uart_0_s1_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_0_s1_dataavailable_from_sa = uart_0_s1_dataavailable;

  //assign uart_0_s1_readyfordata_from_sa = uart_0_s1_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_0_s1_readyfordata_from_sa = uart_0_s1_readyfordata;

  //uart_0_s1_arb_share_counter set values, which is an e_mux
  assign uart_0_s1_arb_share_set_values = 1;

  //uart_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign uart_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_uart_0_s1;

  //uart_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign uart_0_s1_any_bursting_master_saved_grant = 0;

  //uart_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign uart_0_s1_arb_share_counter_next_value = uart_0_s1_firsttransfer ? (uart_0_s1_arb_share_set_values - 1) : |uart_0_s1_arb_share_counter ? (uart_0_s1_arb_share_counter - 1) : 0;

  //uart_0_s1_allgrants all slave grants, which is an e_mux
  assign uart_0_s1_allgrants = |uart_0_s1_grant_vector;

  //uart_0_s1_end_xfer assignment, which is an e_assign
  assign uart_0_s1_end_xfer = ~(uart_0_s1_waits_for_read | uart_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_uart_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_uart_0_s1 = uart_0_s1_end_xfer & (~uart_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //uart_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign uart_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_uart_0_s1 & uart_0_s1_allgrants) | (end_xfer_arb_share_counter_term_uart_0_s1 & ~uart_0_s1_non_bursting_master_requests);

  //uart_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_0_s1_arb_share_counter <= 0;
      else if (uart_0_s1_arb_counter_enable)
          uart_0_s1_arb_share_counter <= uart_0_s1_arb_share_counter_next_value;
    end


  //uart_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_0_s1_slavearbiterlockenable <= 0;
      else if ((|uart_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_uart_0_s1) | (end_xfer_arb_share_counter_term_uart_0_s1 & ~uart_0_s1_non_bursting_master_requests))
          uart_0_s1_slavearbiterlockenable <= |uart_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master uart_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = uart_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //uart_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign uart_0_s1_slavearbiterlockenable2 = |uart_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master uart_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = uart_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //uart_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign uart_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_uart_0_s1 = cpu_0_data_master_requests_uart_0_s1;
  //uart_0_s1_writedata mux, which is an e_mux
  assign uart_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_uart_0_s1 = cpu_0_data_master_qualified_request_uart_0_s1;

  //cpu_0/data_master saved-grant uart_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_uart_0_s1 = cpu_0_data_master_requests_uart_0_s1;

  //allow new arb cycle for uart_0/s1, which is an e_assign
  assign uart_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign uart_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign uart_0_s1_master_qreq_vector = 1;

  assign uart_0_s1_begintransfer = uart_0_s1_begins_xfer;
  //uart_0_s1_reset_n assignment, which is an e_assign
  assign uart_0_s1_reset_n = reset_n;

  assign uart_0_s1_chipselect = cpu_0_data_master_granted_uart_0_s1;
  //uart_0_s1_firsttransfer first transaction, which is an e_assign
  assign uart_0_s1_firsttransfer = uart_0_s1_begins_xfer ? uart_0_s1_unreg_firsttransfer : uart_0_s1_reg_firsttransfer;

  //uart_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign uart_0_s1_unreg_firsttransfer = ~(uart_0_s1_slavearbiterlockenable & uart_0_s1_any_continuerequest);

  //uart_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          uart_0_s1_reg_firsttransfer <= 1'b1;
      else if (uart_0_s1_begins_xfer)
          uart_0_s1_reg_firsttransfer <= uart_0_s1_unreg_firsttransfer;
    end


  //uart_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign uart_0_s1_beginbursttransfer_internal = uart_0_s1_begins_xfer;

  //~uart_0_s1_read_n assignment, which is an e_mux
  assign uart_0_s1_read_n = ~(cpu_0_data_master_granted_uart_0_s1 & cpu_0_data_master_read);

  //~uart_0_s1_write_n assignment, which is an e_mux
  assign uart_0_s1_write_n = ~(cpu_0_data_master_granted_uart_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_uart_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //uart_0_s1_address mux, which is an e_mux
  assign uart_0_s1_address = shifted_address_to_uart_0_s1_from_cpu_0_data_master >> 2;

  //d1_uart_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_uart_0_s1_end_xfer <= 1;
      else 
        d1_uart_0_s1_end_xfer <= uart_0_s1_end_xfer;
    end


  //uart_0_s1_waits_for_read in a cycle, which is an e_mux
  assign uart_0_s1_waits_for_read = uart_0_s1_in_a_read_cycle & uart_0_s1_begins_xfer;

  //uart_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign uart_0_s1_in_a_read_cycle = cpu_0_data_master_granted_uart_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = uart_0_s1_in_a_read_cycle;

  //uart_0_s1_waits_for_write in a cycle, which is an e_mux
  assign uart_0_s1_waits_for_write = uart_0_s1_in_a_write_cycle & uart_0_s1_begins_xfer;

  //uart_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign uart_0_s1_in_a_write_cycle = cpu_0_data_master_granted_uart_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = uart_0_s1_in_a_write_cycle;

  assign wait_for_uart_0_s1_counter = 0;
  //assign uart_0_s1_irq_from_sa = uart_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign uart_0_s1_irq_from_sa = uart_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //uart_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module nios_0 (
                // 1) global signals:
                 clk,
                 reset_n,

                // the_DM9000A
                 ENET_CMD_from_the_DM9000A,
                 ENET_CS_N_from_the_DM9000A,
                 ENET_DATA_to_and_from_the_DM9000A,
                 ENET_INT_to_the_DM9000A,
                 ENET_RD_N_from_the_DM9000A,
                 ENET_RST_N_from_the_DM9000A,
                 ENET_WR_N_from_the_DM9000A,

                // the_I2C_0
                 scl_pad_i_to_the_I2C_0,
                 scl_pad_o_from_the_I2C_0,
                 scl_padoen_o_from_the_I2C_0,
                 sda_pad_i_to_the_I2C_0,
                 sda_pad_o_from_the_I2C_0,
                 sda_padoen_o_from_the_I2C_0,

                // the_ISP1362
                 OTG_ADDR_from_the_ISP1362,
                 OTG_CS_N_from_the_ISP1362,
                 OTG_DACK0_N_from_the_ISP1362,
                 OTG_DACK1_N_from_the_ISP1362,
                 OTG_DATA_to_and_from_the_ISP1362,
                 OTG_DREQ0_to_the_ISP1362,
                 OTG_DREQ1_to_the_ISP1362,
                 OTG_FSPEED_from_the_ISP1362,
                 OTG_INT0_to_the_ISP1362,
                 OTG_INT1_to_the_ISP1362,
                 OTG_LSPEED_from_the_ISP1362,
                 OTG_RD_N_from_the_ISP1362,
                 OTG_RST_N_from_the_ISP1362,
                 OTG_WR_N_from_the_ISP1362,
                 iFSPEED_to_the_ISP1362,
                 iLSPEED_to_the_ISP1362,

                // the_SEG7_Display
                 oSEG0_from_the_SEG7_Display,
                 oSEG1_from_the_SEG7_Display,
                 oSEG2_from_the_SEG7_Display,
                 oSEG3_from_the_SEG7_Display,
                 oSEG4_from_the_SEG7_Display,
                 oSEG5_from_the_SEG7_Display,
                 oSEG6_from_the_SEG7_Display,
                 oSEG7_from_the_SEG7_Display,

                // the_binary_vga_controller_0
                 VGA_BLANK_from_the_binary_vga_controller_0,
                 VGA_B_from_the_binary_vga_controller_0,
                 VGA_CLK_from_the_binary_vga_controller_0,
                 VGA_G_from_the_binary_vga_controller_0,
                 VGA_HS_from_the_binary_vga_controller_0,
                 VGA_R_from_the_binary_vga_controller_0,
                 VGA_SYNC_from_the_binary_vga_controller_0,
                 VGA_VS_from_the_binary_vga_controller_0,
                 iCLK_25_to_the_binary_vga_controller_0,

                // the_button_pio
                 in_port_to_the_button_pio,

                // the_lcd_16207_0
                 LCD_E_from_the_lcd_16207_0,
                 LCD_RS_from_the_lcd_16207_0,
                 LCD_RW_from_the_lcd_16207_0,
                 LCD_data_to_and_from_the_lcd_16207_0,

                // the_led_green
                 out_port_from_the_led_green,

                // the_led_red
                 out_port_from_the_led_red,

                // the_ps2_0
                 PS2_CLK_to_and_from_the_ps2_0,
                 PS2_DAT_to_and_from_the_ps2_0,

                // the_sdram_0
                 zs_addr_from_the_sdram_0,
                 zs_ba_from_the_sdram_0,
                 zs_cas_n_from_the_sdram_0,
                 zs_cke_from_the_sdram_0,
                 zs_cs_n_from_the_sdram_0,
                 zs_dq_to_and_from_the_sdram_0,
                 zs_dqm_from_the_sdram_0,
                 zs_ras_n_from_the_sdram_0,
                 zs_we_n_from_the_sdram_0,

                // the_sram_0
                 SRAM_ADDR_from_the_sram_0,
                 SRAM_CE_N_from_the_sram_0,
                 SRAM_DQ_to_and_from_the_sram_0,
                 SRAM_LB_N_from_the_sram_0,
                 SRAM_OE_N_from_the_sram_0,
                 SRAM_UB_N_from_the_sram_0,
                 SRAM_WE_N_from_the_sram_0,

                // the_switch_pio
                 in_port_to_the_switch_pio,

                // the_tri_state_bridge_0_avalon_slave
                 select_n_to_the_cfi_flash_0,
                 tri_state_bridge_0_address,
                 tri_state_bridge_0_data,
                 tri_state_bridge_0_readn,
                 write_n_to_the_cfi_flash_0,

                // the_uart_0
                 rxd_to_the_uart_0,
                 txd_from_the_uart_0
              )
;

  output           ENET_CMD_from_the_DM9000A;
  output           ENET_CS_N_from_the_DM9000A;
  inout   [ 15: 0] ENET_DATA_to_and_from_the_DM9000A;
  output           ENET_RD_N_from_the_DM9000A;
  output           ENET_RST_N_from_the_DM9000A;
  output           ENET_WR_N_from_the_DM9000A;
  output           LCD_E_from_the_lcd_16207_0;
  output           LCD_RS_from_the_lcd_16207_0;
  output           LCD_RW_from_the_lcd_16207_0;
  inout   [  7: 0] LCD_data_to_and_from_the_lcd_16207_0;
  output  [  1: 0] OTG_ADDR_from_the_ISP1362;
  output           OTG_CS_N_from_the_ISP1362;
  output           OTG_DACK0_N_from_the_ISP1362;
  output           OTG_DACK1_N_from_the_ISP1362;
  inout   [ 15: 0] OTG_DATA_to_and_from_the_ISP1362;
  output           OTG_FSPEED_from_the_ISP1362;
  output           OTG_LSPEED_from_the_ISP1362;
  output           OTG_RD_N_from_the_ISP1362;
  output           OTG_RST_N_from_the_ISP1362;
  output           OTG_WR_N_from_the_ISP1362;
  inout            PS2_CLK_to_and_from_the_ps2_0;
  inout            PS2_DAT_to_and_from_the_ps2_0;
  output  [ 17: 0] SRAM_ADDR_from_the_sram_0;
  output           SRAM_CE_N_from_the_sram_0;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  output           SRAM_LB_N_from_the_sram_0;
  output           SRAM_OE_N_from_the_sram_0;
  output           SRAM_UB_N_from_the_sram_0;
  output           SRAM_WE_N_from_the_sram_0;
  output           VGA_BLANK_from_the_binary_vga_controller_0;
  output  [  9: 0] VGA_B_from_the_binary_vga_controller_0;
  output           VGA_CLK_from_the_binary_vga_controller_0;
  output  [  9: 0] VGA_G_from_the_binary_vga_controller_0;
  output           VGA_HS_from_the_binary_vga_controller_0;
  output  [  9: 0] VGA_R_from_the_binary_vga_controller_0;
  output           VGA_SYNC_from_the_binary_vga_controller_0;
  output           VGA_VS_from_the_binary_vga_controller_0;
  output  [  6: 0] oSEG0_from_the_SEG7_Display;
  output  [  6: 0] oSEG1_from_the_SEG7_Display;
  output  [  6: 0] oSEG2_from_the_SEG7_Display;
  output  [  6: 0] oSEG3_from_the_SEG7_Display;
  output  [  6: 0] oSEG4_from_the_SEG7_Display;
  output  [  6: 0] oSEG5_from_the_SEG7_Display;
  output  [  6: 0] oSEG6_from_the_SEG7_Display;
  output  [  6: 0] oSEG7_from_the_SEG7_Display;
  output  [  8: 0] out_port_from_the_led_green;
  output  [ 17: 0] out_port_from_the_led_red;
  output           scl_pad_o_from_the_I2C_0;
  output           scl_padoen_o_from_the_I2C_0;
  output           sda_pad_o_from_the_I2C_0;
  output           sda_padoen_o_from_the_I2C_0;
  output           select_n_to_the_cfi_flash_0;
  output  [ 19: 0] tri_state_bridge_0_address;
  inout   [  7: 0] tri_state_bridge_0_data;
  output           tri_state_bridge_0_readn;
  output           txd_from_the_uart_0;
  output           write_n_to_the_cfi_flash_0;
  output  [ 11: 0] zs_addr_from_the_sdram_0;
  output  [  1: 0] zs_ba_from_the_sdram_0;
  output           zs_cas_n_from_the_sdram_0;
  output           zs_cke_from_the_sdram_0;
  output           zs_cs_n_from_the_sdram_0;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  output  [  1: 0] zs_dqm_from_the_sdram_0;
  output           zs_ras_n_from_the_sdram_0;
  output           zs_we_n_from_the_sdram_0;
  input            ENET_INT_to_the_DM9000A;
  input            OTG_DREQ0_to_the_ISP1362;
  input            OTG_DREQ1_to_the_ISP1362;
  input            OTG_INT0_to_the_ISP1362;
  input            OTG_INT1_to_the_ISP1362;
  input            clk;
  input            iCLK_25_to_the_binary_vga_controller_0;
  input            iFSPEED_to_the_ISP1362;
  input            iLSPEED_to_the_ISP1362;
  input   [  3: 0] in_port_to_the_button_pio;
  input   [ 17: 0] in_port_to_the_switch_pio;
  input            reset_n;
  input            rxd_to_the_uart_0;
  input            scl_pad_i_to_the_I2C_0;
  input            sda_pad_i_to_the_I2C_0;

  wire             DM9000A_avalonS_address;
  wire             DM9000A_avalonS_chipselect_n;
  wire             DM9000A_avalonS_irq;
  wire             DM9000A_avalonS_irq_from_sa;
  wire             DM9000A_avalonS_read_n;
  wire    [ 15: 0] DM9000A_avalonS_readdata;
  wire    [ 15: 0] DM9000A_avalonS_readdata_from_sa;
  wire             DM9000A_avalonS_reset_n;
  wire             DM9000A_avalonS_wait_counter_eq_0;
  wire             DM9000A_avalonS_write_n;
  wire    [ 15: 0] DM9000A_avalonS_writedata;
  wire             ENET_CMD_from_the_DM9000A;
  wire             ENET_CS_N_from_the_DM9000A;
  wire    [ 15: 0] ENET_DATA_to_and_from_the_DM9000A;
  wire             ENET_RD_N_from_the_DM9000A;
  wire             ENET_RST_N_from_the_DM9000A;
  wire             ENET_WR_N_from_the_DM9000A;
  wire    [  2: 0] I2C_0_avalonS_address;
  wire             I2C_0_avalonS_always0;
  wire             I2C_0_avalonS_chipselect;
  wire             I2C_0_avalonS_irq;
  wire             I2C_0_avalonS_irq_from_sa;
  wire    [  7: 0] I2C_0_avalonS_readdata;
  wire    [  7: 0] I2C_0_avalonS_readdata_from_sa;
  wire             I2C_0_avalonS_reset_n;
  wire             I2C_0_avalonS_waitrequest_n;
  wire             I2C_0_avalonS_waitrequest_n_from_sa;
  wire             I2C_0_avalonS_write;
  wire    [  7: 0] I2C_0_avalonS_writedata;
  wire    [  1: 0] ISP1362_avalonS_address;
  wire             ISP1362_avalonS_chipselect_n;
  wire             ISP1362_avalonS_irq_n;
  wire             ISP1362_avalonS_irq_n_from_sa;
  wire             ISP1362_avalonS_read_n;
  wire    [ 15: 0] ISP1362_avalonS_readdata;
  wire    [ 15: 0] ISP1362_avalonS_readdata_from_sa;
  wire             ISP1362_avalonS_wait_counter_eq_0;
  wire             ISP1362_avalonS_wait_counter_eq_1;
  wire             ISP1362_avalonS_write_n;
  wire    [ 15: 0] ISP1362_avalonS_writedata;
  wire             LCD_E_from_the_lcd_16207_0;
  wire             LCD_RS_from_the_lcd_16207_0;
  wire             LCD_RW_from_the_lcd_16207_0;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd_16207_0;
  wire    [  1: 0] OTG_ADDR_from_the_ISP1362;
  wire             OTG_CS_N_from_the_ISP1362;
  wire             OTG_DACK0_N_from_the_ISP1362;
  wire             OTG_DACK1_N_from_the_ISP1362;
  wire    [ 15: 0] OTG_DATA_to_and_from_the_ISP1362;
  wire             OTG_FSPEED_from_the_ISP1362;
  wire             OTG_LSPEED_from_the_ISP1362;
  wire             OTG_RD_N_from_the_ISP1362;
  wire             OTG_RST_N_from_the_ISP1362;
  wire             OTG_WR_N_from_the_ISP1362;
  wire             PS2_CLK_to_and_from_the_ps2_0;
  wire             PS2_DAT_to_and_from_the_ps2_0;
  wire             SEG7_Display_avalonS_reset_n;
  wire             SEG7_Display_avalonS_write;
  wire    [ 31: 0] SEG7_Display_avalonS_writedata;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram_0;
  wire             SRAM_CE_N_from_the_sram_0;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  wire             SRAM_LB_N_from_the_sram_0;
  wire             SRAM_OE_N_from_the_sram_0;
  wire             SRAM_UB_N_from_the_sram_0;
  wire             SRAM_WE_N_from_the_sram_0;
  wire             VGA_BLANK_from_the_binary_vga_controller_0;
  wire    [  9: 0] VGA_B_from_the_binary_vga_controller_0;
  wire             VGA_CLK_from_the_binary_vga_controller_0;
  wire    [  9: 0] VGA_G_from_the_binary_vga_controller_0;
  wire             VGA_HS_from_the_binary_vga_controller_0;
  wire    [  9: 0] VGA_R_from_the_binary_vga_controller_0;
  wire             VGA_SYNC_from_the_binary_vga_controller_0;
  wire             VGA_VS_from_the_binary_vga_controller_0;
  wire    [ 18: 0] binary_vga_controller_0_avalon_slave_0_address;
  wire             binary_vga_controller_0_avalon_slave_0_chipselect;
  wire             binary_vga_controller_0_avalon_slave_0_read;
  wire    [ 15: 0] binary_vga_controller_0_avalon_slave_0_readdata;
  wire    [ 15: 0] binary_vga_controller_0_avalon_slave_0_readdata_from_sa;
  wire             binary_vga_controller_0_avalon_slave_0_reset_n;
  wire             binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0;
  wire             binary_vga_controller_0_avalon_slave_0_write;
  wire    [ 15: 0] binary_vga_controller_0_avalon_slave_0_writedata;
  wire    [  1: 0] button_pio_s1_address;
  wire             button_pio_s1_chipselect;
  wire             button_pio_s1_irq;
  wire             button_pio_s1_irq_from_sa;
  wire    [ 31: 0] button_pio_s1_readdata;
  wire    [ 31: 0] button_pio_s1_readdata_from_sa;
  wire             button_pio_s1_reset_n;
  wire             button_pio_s1_write_n;
  wire    [ 31: 0] button_pio_s1_writedata;
  wire             cfi_flash_0_s1_wait_counter_eq_0;
  wire             cfi_flash_0_s1_wait_counter_eq_1;
  wire             clk_reset;
  wire             clk_reset_n;
  wire    [ 24: 0] cpu_0_data_master_address;
  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_byteenable_cfi_flash_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalonS;
  wire    [  1: 0] cpu_0_data_master_dbs_address;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [  7: 0] cpu_0_data_master_dbs_write_8;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_DM9000A_avalonS;
  wire             cpu_0_data_master_granted_I2C_0_avalonS;
  wire             cpu_0_data_master_granted_ISP1362_avalonS;
  wire             cpu_0_data_master_granted_SEG7_Display_avalonS;
  wire             cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0;
  wire             cpu_0_data_master_granted_button_pio_s1;
  wire             cpu_0_data_master_granted_cfi_flash_0_s1;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_epcs_controller_epcs_control_port;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_granted_lcd_16207_0_control_slave;
  wire             cpu_0_data_master_granted_led_green_s1;
  wire             cpu_0_data_master_granted_led_red_s1;
  wire             cpu_0_data_master_granted_ps2_0_avalon_PS2_slave;
  wire             cpu_0_data_master_granted_sdram_0_s1;
  wire             cpu_0_data_master_granted_sram_0_avalonS;
  wire             cpu_0_data_master_granted_switch_pio_s1;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire             cpu_0_data_master_granted_timer_1_s1;
  wire             cpu_0_data_master_granted_uart_0_s1;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_no_byte_enables_and_last_term;
  wire             cpu_0_data_master_qualified_request_DM9000A_avalonS;
  wire             cpu_0_data_master_qualified_request_I2C_0_avalonS;
  wire             cpu_0_data_master_qualified_request_ISP1362_avalonS;
  wire             cpu_0_data_master_qualified_request_SEG7_Display_avalonS;
  wire             cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0;
  wire             cpu_0_data_master_qualified_request_button_pio_s1;
  wire             cpu_0_data_master_qualified_request_cfi_flash_0_s1;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_lcd_16207_0_control_slave;
  wire             cpu_0_data_master_qualified_request_led_green_s1;
  wire             cpu_0_data_master_qualified_request_led_red_s1;
  wire             cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave;
  wire             cpu_0_data_master_qualified_request_sdram_0_s1;
  wire             cpu_0_data_master_qualified_request_sram_0_avalonS;
  wire             cpu_0_data_master_qualified_request_switch_pio_s1;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_qualified_request_timer_1_s1;
  wire             cpu_0_data_master_qualified_request_uart_0_s1;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_DM9000A_avalonS;
  wire             cpu_0_data_master_read_data_valid_I2C_0_avalonS;
  wire             cpu_0_data_master_read_data_valid_ISP1362_avalonS;
  wire             cpu_0_data_master_read_data_valid_SEG7_Display_avalonS;
  wire             cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0;
  wire             cpu_0_data_master_read_data_valid_button_pio_s1;
  wire             cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave;
  wire             cpu_0_data_master_read_data_valid_led_green_s1;
  wire             cpu_0_data_master_read_data_valid_led_red_s1;
  wire             cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalonS;
  wire             cpu_0_data_master_read_data_valid_switch_pio_s1;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire             cpu_0_data_master_read_data_valid_timer_1_s1;
  wire             cpu_0_data_master_read_data_valid_uart_0_s1;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_DM9000A_avalonS;
  wire             cpu_0_data_master_requests_I2C_0_avalonS;
  wire             cpu_0_data_master_requests_ISP1362_avalonS;
  wire             cpu_0_data_master_requests_SEG7_Display_avalonS;
  wire             cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0;
  wire             cpu_0_data_master_requests_button_pio_s1;
  wire             cpu_0_data_master_requests_cfi_flash_0_s1;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_epcs_controller_epcs_control_port;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_lcd_16207_0_control_slave;
  wire             cpu_0_data_master_requests_led_green_s1;
  wire             cpu_0_data_master_requests_led_red_s1;
  wire             cpu_0_data_master_requests_ps2_0_avalon_PS2_slave;
  wire             cpu_0_data_master_requests_sdram_0_s1;
  wire             cpu_0_data_master_requests_sram_0_avalonS;
  wire             cpu_0_data_master_requests_switch_pio_s1;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_requests_timer_1_s1;
  wire             cpu_0_data_master_requests_uart_0_s1;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 24: 0] cpu_0_instruction_master_address;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_0_instruction_master_dbs_address;
  wire             cpu_0_instruction_master_granted_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_granted_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_granted_sdram_0_s1;
  wire             cpu_0_instruction_master_granted_sram_0_avalonS;
  wire    [  1: 0] cpu_0_instruction_master_latency_counter;
  wire             cpu_0_instruction_master_qualified_request_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_qualified_request_sdram_0_s1;
  wire             cpu_0_instruction_master_qualified_request_sram_0_avalonS;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalonS;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_requests_cfi_flash_0_s1;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_epcs_controller_epcs_control_port;
  wire             cpu_0_instruction_master_requests_sdram_0_s1;
  wire             cpu_0_instruction_master_requests_sram_0_avalonS;
  wire             cpu_0_instruction_master_waitrequest;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  wire             d1_DM9000A_avalonS_end_xfer;
  wire             d1_I2C_0_avalonS_end_xfer;
  wire             d1_ISP1362_avalonS_end_xfer;
  wire             d1_SEG7_Display_avalonS_end_xfer;
  wire             d1_binary_vga_controller_0_avalon_slave_0_end_xfer;
  wire             d1_button_pio_s1_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_epcs_controller_epcs_control_port_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_lcd_16207_0_control_slave_end_xfer;
  wire             d1_led_green_s1_end_xfer;
  wire             d1_led_red_s1_end_xfer;
  wire             d1_ps2_0_avalon_PS2_slave_end_xfer;
  wire             d1_sdram_0_s1_end_xfer;
  wire             d1_sram_0_avalonS_end_xfer;
  wire             d1_switch_pio_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_0_s1_end_xfer;
  wire             d1_timer_1_s1_end_xfer;
  wire             d1_tri_state_bridge_0_avalon_slave_end_xfer;
  wire             d1_uart_0_s1_end_xfer;
  wire    [  8: 0] epcs_controller_epcs_control_port_address;
  wire             epcs_controller_epcs_control_port_chipselect;
  wire             epcs_controller_epcs_control_port_dataavailable;
  wire             epcs_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_controller_epcs_control_port_endofpacket;
  wire             epcs_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_controller_epcs_control_port_irq;
  wire             epcs_controller_epcs_control_port_irq_from_sa;
  wire             epcs_controller_epcs_control_port_read_n;
  wire    [ 31: 0] epcs_controller_epcs_control_port_readdata;
  wire    [ 31: 0] epcs_controller_epcs_control_port_readdata_from_sa;
  wire             epcs_controller_epcs_control_port_readyfordata;
  wire             epcs_controller_epcs_control_port_readyfordata_from_sa;
  wire             epcs_controller_epcs_control_port_reset_n;
  wire             epcs_controller_epcs_control_port_write_n;
  wire    [ 31: 0] epcs_controller_epcs_control_port_writedata;
  wire    [  7: 0] incoming_tri_state_bridge_0_data;
  wire    [  7: 0] incoming_tri_state_bridge_0_data_with_Xs_converted_to_0;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [  1: 0] lcd_16207_0_control_slave_address;
  wire             lcd_16207_0_control_slave_begintransfer;
  wire             lcd_16207_0_control_slave_read;
  wire    [  7: 0] lcd_16207_0_control_slave_readdata;
  wire    [  7: 0] lcd_16207_0_control_slave_readdata_from_sa;
  wire             lcd_16207_0_control_slave_reset_n;
  wire             lcd_16207_0_control_slave_wait_counter_eq_0;
  wire             lcd_16207_0_control_slave_wait_counter_eq_1;
  wire             lcd_16207_0_control_slave_write;
  wire    [  7: 0] lcd_16207_0_control_slave_writedata;
  wire    [  1: 0] led_green_s1_address;
  wire             led_green_s1_chipselect;
  wire    [ 31: 0] led_green_s1_readdata;
  wire    [ 31: 0] led_green_s1_readdata_from_sa;
  wire             led_green_s1_reset_n;
  wire             led_green_s1_write_n;
  wire    [ 31: 0] led_green_s1_writedata;
  wire    [  1: 0] led_red_s1_address;
  wire             led_red_s1_chipselect;
  wire    [ 31: 0] led_red_s1_readdata;
  wire    [ 31: 0] led_red_s1_readdata_from_sa;
  wire             led_red_s1_reset_n;
  wire             led_red_s1_write_n;
  wire    [ 31: 0] led_red_s1_writedata;
  wire    [  6: 0] oSEG0_from_the_SEG7_Display;
  wire    [  6: 0] oSEG1_from_the_SEG7_Display;
  wire    [  6: 0] oSEG2_from_the_SEG7_Display;
  wire    [  6: 0] oSEG3_from_the_SEG7_Display;
  wire    [  6: 0] oSEG4_from_the_SEG7_Display;
  wire    [  6: 0] oSEG5_from_the_SEG7_Display;
  wire    [  6: 0] oSEG6_from_the_SEG7_Display;
  wire    [  6: 0] oSEG7_from_the_SEG7_Display;
  wire    [  8: 0] out_port_from_the_led_green;
  wire    [ 17: 0] out_port_from_the_led_red;
  wire             ps2_0_avalon_PS2_slave_address;
  wire    [  3: 0] ps2_0_avalon_PS2_slave_byteenable;
  wire             ps2_0_avalon_PS2_slave_chipselect;
  wire             ps2_0_avalon_PS2_slave_irq;
  wire             ps2_0_avalon_PS2_slave_irq_from_sa;
  wire             ps2_0_avalon_PS2_slave_read;
  wire    [ 31: 0] ps2_0_avalon_PS2_slave_readdata;
  wire    [ 31: 0] ps2_0_avalon_PS2_slave_readdata_from_sa;
  wire             ps2_0_avalon_PS2_slave_waitrequest;
  wire             ps2_0_avalon_PS2_slave_waitrequest_from_sa;
  wire             ps2_0_avalon_PS2_slave_write;
  wire    [ 31: 0] ps2_0_avalon_PS2_slave_writedata;
  wire             registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1;
  wire             registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave;
  wire             reset_n_sources;
  wire             scl_pad_o_from_the_I2C_0;
  wire             scl_padoen_o_from_the_I2C_0;
  wire             sda_pad_o_from_the_I2C_0;
  wire             sda_padoen_o_from_the_I2C_0;
  wire    [ 21: 0] sdram_0_s1_address;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid;
  wire             sdram_0_s1_reset_n;
  wire             sdram_0_s1_waitrequest;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire             select_n_to_the_cfi_flash_0;
  wire    [ 17: 0] sram_0_avalonS_address;
  wire    [  1: 0] sram_0_avalonS_byteenable_n;
  wire             sram_0_avalonS_chipselect_n;
  wire             sram_0_avalonS_outputenable_n;
  wire    [ 15: 0] sram_0_avalonS_readdata;
  wire    [ 15: 0] sram_0_avalonS_readdata_from_sa;
  wire             sram_0_avalonS_reset_n;
  wire             sram_0_avalonS_wait_counter_eq_0;
  wire             sram_0_avalonS_write_n;
  wire    [ 15: 0] sram_0_avalonS_writedata;
  wire    [  1: 0] switch_pio_s1_address;
  wire    [ 31: 0] switch_pio_s1_readdata;
  wire    [ 31: 0] switch_pio_s1_readdata_from_sa;
  wire             switch_pio_s1_reset_n;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_irq;
  wire             timer_0_s1_irq_from_sa;
  wire    [ 15: 0] timer_0_s1_readdata;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  wire             timer_0_s1_reset_n;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire    [  2: 0] timer_1_s1_address;
  wire             timer_1_s1_chipselect;
  wire             timer_1_s1_irq;
  wire             timer_1_s1_irq_from_sa;
  wire    [ 15: 0] timer_1_s1_readdata;
  wire    [ 15: 0] timer_1_s1_readdata_from_sa;
  wire             timer_1_s1_reset_n;
  wire             timer_1_s1_write_n;
  wire    [ 15: 0] timer_1_s1_writedata;
  wire    [ 19: 0] tri_state_bridge_0_address;
  wire    [  7: 0] tri_state_bridge_0_data;
  wire             tri_state_bridge_0_readn;
  wire             txd_from_the_uart_0;
  wire    [  2: 0] uart_0_s1_address;
  wire             uart_0_s1_begintransfer;
  wire             uart_0_s1_chipselect;
  wire             uart_0_s1_dataavailable;
  wire             uart_0_s1_dataavailable_from_sa;
  wire             uart_0_s1_irq;
  wire             uart_0_s1_irq_from_sa;
  wire             uart_0_s1_read_n;
  wire    [ 15: 0] uart_0_s1_readdata;
  wire    [ 15: 0] uart_0_s1_readdata_from_sa;
  wire             uart_0_s1_readyfordata;
  wire             uart_0_s1_readyfordata_from_sa;
  wire             uart_0_s1_reset_n;
  wire             uart_0_s1_write_n;
  wire    [ 15: 0] uart_0_s1_writedata;
  wire             write_n_to_the_cfi_flash_0;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;
  DM9000A_avalonS_arbitrator the_DM9000A_avalonS
    (
      .DM9000A_avalonS_address                             (DM9000A_avalonS_address),
      .DM9000A_avalonS_chipselect_n                        (DM9000A_avalonS_chipselect_n),
      .DM9000A_avalonS_irq                                 (DM9000A_avalonS_irq),
      .DM9000A_avalonS_irq_from_sa                         (DM9000A_avalonS_irq_from_sa),
      .DM9000A_avalonS_read_n                              (DM9000A_avalonS_read_n),
      .DM9000A_avalonS_readdata                            (DM9000A_avalonS_readdata),
      .DM9000A_avalonS_readdata_from_sa                    (DM9000A_avalonS_readdata_from_sa),
      .DM9000A_avalonS_reset_n                             (DM9000A_avalonS_reset_n),
      .DM9000A_avalonS_wait_counter_eq_0                   (DM9000A_avalonS_wait_counter_eq_0),
      .DM9000A_avalonS_write_n                             (DM9000A_avalonS_write_n),
      .DM9000A_avalonS_writedata                           (DM9000A_avalonS_writedata),
      .clk                                                 (clk),
      .cpu_0_data_master_address_to_slave                  (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_DM9000A_avalonS           (cpu_0_data_master_granted_DM9000A_avalonS),
      .cpu_0_data_master_qualified_request_DM9000A_avalonS (cpu_0_data_master_qualified_request_DM9000A_avalonS),
      .cpu_0_data_master_read                              (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_DM9000A_avalonS   (cpu_0_data_master_read_data_valid_DM9000A_avalonS),
      .cpu_0_data_master_requests_DM9000A_avalonS          (cpu_0_data_master_requests_DM9000A_avalonS),
      .cpu_0_data_master_write                             (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                         (cpu_0_data_master_writedata),
      .d1_DM9000A_avalonS_end_xfer                         (d1_DM9000A_avalonS_end_xfer),
      .reset_n                                             (clk_reset_n)
    );

  DM9000A the_DM9000A
    (
      .ENET_CMD   (ENET_CMD_from_the_DM9000A),
      .ENET_CS_N  (ENET_CS_N_from_the_DM9000A),
      .ENET_DATA  (ENET_DATA_to_and_from_the_DM9000A),
      .ENET_INT   (ENET_INT_to_the_DM9000A),
      .ENET_RD_N  (ENET_RD_N_from_the_DM9000A),
      .ENET_RST_N (ENET_RST_N_from_the_DM9000A),
      .ENET_WR_N  (ENET_WR_N_from_the_DM9000A),
      .iCMD       (DM9000A_avalonS_address),
      .iCS_N      (DM9000A_avalonS_chipselect_n),
      .iDATA      (DM9000A_avalonS_writedata),
      .iRD_N      (DM9000A_avalonS_read_n),
      .iRST_N     (DM9000A_avalonS_reset_n),
      .iWR_N      (DM9000A_avalonS_write_n),
      .oDATA      (DM9000A_avalonS_readdata),
      .oINT       (DM9000A_avalonS_irq)
    );

  I2C_0_avalonS_arbitrator the_I2C_0_avalonS
    (
      .I2C_0_avalonS_address                             (I2C_0_avalonS_address),
      .I2C_0_avalonS_always0                             (I2C_0_avalonS_always0),
      .I2C_0_avalonS_chipselect                          (I2C_0_avalonS_chipselect),
      .I2C_0_avalonS_irq                                 (I2C_0_avalonS_irq),
      .I2C_0_avalonS_irq_from_sa                         (I2C_0_avalonS_irq_from_sa),
      .I2C_0_avalonS_readdata                            (I2C_0_avalonS_readdata),
      .I2C_0_avalonS_readdata_from_sa                    (I2C_0_avalonS_readdata_from_sa),
      .I2C_0_avalonS_reset_n                             (I2C_0_avalonS_reset_n),
      .I2C_0_avalonS_waitrequest_n                       (I2C_0_avalonS_waitrequest_n),
      .I2C_0_avalonS_waitrequest_n_from_sa               (I2C_0_avalonS_waitrequest_n_from_sa),
      .I2C_0_avalonS_write                               (I2C_0_avalonS_write),
      .I2C_0_avalonS_writedata                           (I2C_0_avalonS_writedata),
      .clk                                               (clk),
      .cpu_0_data_master_address_to_slave                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                      (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_I2C_0_avalonS           (cpu_0_data_master_granted_I2C_0_avalonS),
      .cpu_0_data_master_qualified_request_I2C_0_avalonS (cpu_0_data_master_qualified_request_I2C_0_avalonS),
      .cpu_0_data_master_read                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_I2C_0_avalonS   (cpu_0_data_master_read_data_valid_I2C_0_avalonS),
      .cpu_0_data_master_requests_I2C_0_avalonS          (cpu_0_data_master_requests_I2C_0_avalonS),
      .cpu_0_data_master_waitrequest                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                       (cpu_0_data_master_writedata),
      .d1_I2C_0_avalonS_end_xfer                         (d1_I2C_0_avalonS_end_xfer),
      .reset_n                                           (clk_reset_n)
    );

  I2C_0 the_I2C_0
    (
      .arst_i       (I2C_0_avalonS_reset_n),
      .scl_pad_i    (scl_pad_i_to_the_I2C_0),
      .scl_pad_o    (scl_pad_o_from_the_I2C_0),
      .scl_padoen_o (scl_padoen_o_from_the_I2C_0),
      .sda_pad_i    (sda_pad_i_to_the_I2C_0),
      .sda_pad_o    (sda_pad_o_from_the_I2C_0),
      .sda_padoen_o (sda_padoen_o_from_the_I2C_0),
      .wb_ack_o     (I2C_0_avalonS_waitrequest_n),
      .wb_adr_i     (I2C_0_avalonS_address),
      .wb_clk_i     (clk),
      .wb_cyc_i     (I2C_0_avalonS_chipselect),
      .wb_dat_i     (I2C_0_avalonS_writedata),
      .wb_dat_o     (I2C_0_avalonS_readdata),
      .wb_inta_o    (I2C_0_avalonS_irq),
      .wb_rst_i     (I2C_0_avalonS_always0),
      .wb_stb_i     (I2C_0_avalonS_chipselect),
      .wb_we_i      (I2C_0_avalonS_write)
    );

  ISP1362_avalonS_arbitrator the_ISP1362_avalonS
    (
      .ISP1362_avalonS_address                             (ISP1362_avalonS_address),
      .ISP1362_avalonS_chipselect_n                        (ISP1362_avalonS_chipselect_n),
      .ISP1362_avalonS_irq_n                               (ISP1362_avalonS_irq_n),
      .ISP1362_avalonS_irq_n_from_sa                       (ISP1362_avalonS_irq_n_from_sa),
      .ISP1362_avalonS_read_n                              (ISP1362_avalonS_read_n),
      .ISP1362_avalonS_readdata                            (ISP1362_avalonS_readdata),
      .ISP1362_avalonS_readdata_from_sa                    (ISP1362_avalonS_readdata_from_sa),
      .ISP1362_avalonS_wait_counter_eq_0                   (ISP1362_avalonS_wait_counter_eq_0),
      .ISP1362_avalonS_wait_counter_eq_1                   (ISP1362_avalonS_wait_counter_eq_1),
      .ISP1362_avalonS_write_n                             (ISP1362_avalonS_write_n),
      .ISP1362_avalonS_writedata                           (ISP1362_avalonS_writedata),
      .clk                                                 (clk),
      .cpu_0_data_master_address_to_slave                  (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_ISP1362_avalonS           (cpu_0_data_master_granted_ISP1362_avalonS),
      .cpu_0_data_master_qualified_request_ISP1362_avalonS (cpu_0_data_master_qualified_request_ISP1362_avalonS),
      .cpu_0_data_master_read                              (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_ISP1362_avalonS   (cpu_0_data_master_read_data_valid_ISP1362_avalonS),
      .cpu_0_data_master_requests_ISP1362_avalonS          (cpu_0_data_master_requests_ISP1362_avalonS),
      .cpu_0_data_master_write                             (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                         (cpu_0_data_master_writedata),
      .d1_ISP1362_avalonS_end_xfer                         (d1_ISP1362_avalonS_end_xfer),
      .reset_n                                             (clk_reset_n)
    );

  ISP1362 the_ISP1362
    (
      .OTG_ADDR    (OTG_ADDR_from_the_ISP1362),
      .OTG_CS_N    (OTG_CS_N_from_the_ISP1362),
      .OTG_DACK0_N (OTG_DACK0_N_from_the_ISP1362),
      .OTG_DACK1_N (OTG_DACK1_N_from_the_ISP1362),
      .OTG_DATA    (OTG_DATA_to_and_from_the_ISP1362),
      .OTG_DREQ0   (OTG_DREQ0_to_the_ISP1362),
      .OTG_DREQ1   (OTG_DREQ1_to_the_ISP1362),
      .OTG_FSPEED  (OTG_FSPEED_from_the_ISP1362),
      .OTG_INT0    (OTG_INT0_to_the_ISP1362),
      .OTG_INT1    (OTG_INT1_to_the_ISP1362),
      .OTG_LSPEED  (OTG_LSPEED_from_the_ISP1362),
      .OTG_RD_N    (OTG_RD_N_from_the_ISP1362),
      .OTG_RST_N   (OTG_RST_N_from_the_ISP1362),
      .OTG_WR_N    (OTG_WR_N_from_the_ISP1362),
      .iADDR       (ISP1362_avalonS_address),
      .iCS_N       (ISP1362_avalonS_chipselect_n),
      .iDATA       (ISP1362_avalonS_writedata),
      .iFSPEED     (iFSPEED_to_the_ISP1362),
      .iLSPEED     (iLSPEED_to_the_ISP1362),
      .iRD_N       (ISP1362_avalonS_read_n),
      .iWR_N       (ISP1362_avalonS_write_n),
      .oDATA       (ISP1362_avalonS_readdata),
      .oINT        (ISP1362_avalonS_irq_n)
    );

  SEG7_Display_avalonS_arbitrator the_SEG7_Display_avalonS
    (
      .SEG7_Display_avalonS_reset_n                             (SEG7_Display_avalonS_reset_n),
      .SEG7_Display_avalonS_write                               (SEG7_Display_avalonS_write),
      .SEG7_Display_avalonS_writedata                           (SEG7_Display_avalonS_writedata),
      .clk                                                      (clk),
      .cpu_0_data_master_address_to_slave                       (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_SEG7_Display_avalonS           (cpu_0_data_master_granted_SEG7_Display_avalonS),
      .cpu_0_data_master_qualified_request_SEG7_Display_avalonS (cpu_0_data_master_qualified_request_SEG7_Display_avalonS),
      .cpu_0_data_master_read                                   (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_SEG7_Display_avalonS   (cpu_0_data_master_read_data_valid_SEG7_Display_avalonS),
      .cpu_0_data_master_requests_SEG7_Display_avalonS          (cpu_0_data_master_requests_SEG7_Display_avalonS),
      .cpu_0_data_master_waitrequest                            (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                  (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                              (cpu_0_data_master_writedata),
      .d1_SEG7_Display_avalonS_end_xfer                         (d1_SEG7_Display_avalonS_end_xfer),
      .reset_n                                                  (clk_reset_n)
    );

  SEG7_Display the_SEG7_Display
    (
      .iCLK   (clk),
      .iDIG   (SEG7_Display_avalonS_writedata),
      .iRST_N (SEG7_Display_avalonS_reset_n),
      .iWR    (SEG7_Display_avalonS_write),
      .oSEG0  (oSEG0_from_the_SEG7_Display),
      .oSEG1  (oSEG1_from_the_SEG7_Display),
      .oSEG2  (oSEG2_from_the_SEG7_Display),
      .oSEG3  (oSEG3_from_the_SEG7_Display),
      .oSEG4  (oSEG4_from_the_SEG7_Display),
      .oSEG5  (oSEG5_from_the_SEG7_Display),
      .oSEG6  (oSEG6_from_the_SEG7_Display),
      .oSEG7  (oSEG7_from_the_SEG7_Display)
    );

  binary_vga_controller_0_avalon_slave_0_arbitrator the_binary_vga_controller_0_avalon_slave_0
    (
      .binary_vga_controller_0_avalon_slave_0_address                             (binary_vga_controller_0_avalon_slave_0_address),
      .binary_vga_controller_0_avalon_slave_0_chipselect                          (binary_vga_controller_0_avalon_slave_0_chipselect),
      .binary_vga_controller_0_avalon_slave_0_read                                (binary_vga_controller_0_avalon_slave_0_read),
      .binary_vga_controller_0_avalon_slave_0_readdata                            (binary_vga_controller_0_avalon_slave_0_readdata),
      .binary_vga_controller_0_avalon_slave_0_readdata_from_sa                    (binary_vga_controller_0_avalon_slave_0_readdata_from_sa),
      .binary_vga_controller_0_avalon_slave_0_reset_n                             (binary_vga_controller_0_avalon_slave_0_reset_n),
      .binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0                   (binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0),
      .binary_vga_controller_0_avalon_slave_0_write                               (binary_vga_controller_0_avalon_slave_0_write),
      .binary_vga_controller_0_avalon_slave_0_writedata                           (binary_vga_controller_0_avalon_slave_0_writedata),
      .clk                                                                        (clk),
      .cpu_0_data_master_address_to_slave                                         (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0           (cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0),
      .cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0 (cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0),
      .cpu_0_data_master_read                                                     (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0   (cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0),
      .cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0          (cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0),
      .cpu_0_data_master_write                                                    (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                (cpu_0_data_master_writedata),
      .d1_binary_vga_controller_0_avalon_slave_0_end_xfer                         (d1_binary_vga_controller_0_avalon_slave_0_end_xfer),
      .reset_n                                                                    (clk_reset_n)
    );

  binary_vga_controller_0 the_binary_vga_controller_0
    (
      .VGA_B     (VGA_B_from_the_binary_vga_controller_0),
      .VGA_BLANK (VGA_BLANK_from_the_binary_vga_controller_0),
      .VGA_CLK   (VGA_CLK_from_the_binary_vga_controller_0),
      .VGA_G     (VGA_G_from_the_binary_vga_controller_0),
      .VGA_HS    (VGA_HS_from_the_binary_vga_controller_0),
      .VGA_R     (VGA_R_from_the_binary_vga_controller_0),
      .VGA_SYNC  (VGA_SYNC_from_the_binary_vga_controller_0),
      .VGA_VS    (VGA_VS_from_the_binary_vga_controller_0),
      .iADDR     (binary_vga_controller_0_avalon_slave_0_address),
      .iCLK      (clk),
      .iCLK_25   (iCLK_25_to_the_binary_vga_controller_0),
      .iCS       (binary_vga_controller_0_avalon_slave_0_chipselect),
      .iDATA     (binary_vga_controller_0_avalon_slave_0_writedata),
      .iRD       (binary_vga_controller_0_avalon_slave_0_read),
      .iRST_N    (binary_vga_controller_0_avalon_slave_0_reset_n),
      .iWR       (binary_vga_controller_0_avalon_slave_0_write),
      .oDATA     (binary_vga_controller_0_avalon_slave_0_readdata)
    );

  button_pio_s1_arbitrator the_button_pio_s1
    (
      .button_pio_s1_address                             (button_pio_s1_address),
      .button_pio_s1_chipselect                          (button_pio_s1_chipselect),
      .button_pio_s1_irq                                 (button_pio_s1_irq),
      .button_pio_s1_irq_from_sa                         (button_pio_s1_irq_from_sa),
      .button_pio_s1_readdata                            (button_pio_s1_readdata),
      .button_pio_s1_readdata_from_sa                    (button_pio_s1_readdata_from_sa),
      .button_pio_s1_reset_n                             (button_pio_s1_reset_n),
      .button_pio_s1_write_n                             (button_pio_s1_write_n),
      .button_pio_s1_writedata                           (button_pio_s1_writedata),
      .clk                                               (clk),
      .cpu_0_data_master_address_to_slave                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_button_pio_s1           (cpu_0_data_master_granted_button_pio_s1),
      .cpu_0_data_master_qualified_request_button_pio_s1 (cpu_0_data_master_qualified_request_button_pio_s1),
      .cpu_0_data_master_read                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_button_pio_s1   (cpu_0_data_master_read_data_valid_button_pio_s1),
      .cpu_0_data_master_requests_button_pio_s1          (cpu_0_data_master_requests_button_pio_s1),
      .cpu_0_data_master_waitrequest                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                       (cpu_0_data_master_writedata),
      .d1_button_pio_s1_end_xfer                         (d1_button_pio_s1_end_xfer),
      .reset_n                                           (clk_reset_n)
    );

  button_pio the_button_pio
    (
      .address    (button_pio_s1_address),
      .chipselect (button_pio_s1_chipselect),
      .clk        (clk),
      .in_port    (in_port_to_the_button_pio),
      .irq        (button_pio_s1_irq),
      .readdata   (button_pio_s1_readdata),
      .reset_n    (button_pio_s1_reset_n),
      .write_n    (button_pio_s1_write_n),
      .writedata  (button_pio_s1_writedata)
    );

  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clk),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                      (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                  (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module        (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module          (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                 (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_waitrequest                                      (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_jtag_debug_module_address                                    (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                              (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                 (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                 (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                   (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset_n                                    (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                               (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                       (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                      (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                  (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .DM9000A_avalonS_irq_from_sa                                                (DM9000A_avalonS_irq_from_sa),
      .DM9000A_avalonS_readdata_from_sa                                           (DM9000A_avalonS_readdata_from_sa),
      .DM9000A_avalonS_wait_counter_eq_0                                          (DM9000A_avalonS_wait_counter_eq_0),
      .I2C_0_avalonS_irq_from_sa                                                  (I2C_0_avalonS_irq_from_sa),
      .I2C_0_avalonS_readdata_from_sa                                             (I2C_0_avalonS_readdata_from_sa),
      .I2C_0_avalonS_waitrequest_n_from_sa                                        (I2C_0_avalonS_waitrequest_n_from_sa),
      .ISP1362_avalonS_irq_n_from_sa                                              (ISP1362_avalonS_irq_n_from_sa),
      .ISP1362_avalonS_readdata_from_sa                                           (ISP1362_avalonS_readdata_from_sa),
      .ISP1362_avalonS_wait_counter_eq_0                                          (ISP1362_avalonS_wait_counter_eq_0),
      .ISP1362_avalonS_wait_counter_eq_1                                          (ISP1362_avalonS_wait_counter_eq_1),
      .binary_vga_controller_0_avalon_slave_0_readdata_from_sa                    (binary_vga_controller_0_avalon_slave_0_readdata_from_sa),
      .binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0                   (binary_vga_controller_0_avalon_slave_0_wait_counter_eq_0),
      .button_pio_s1_irq_from_sa                                                  (button_pio_s1_irq_from_sa),
      .button_pio_s1_readdata_from_sa                                             (button_pio_s1_readdata_from_sa),
      .cfi_flash_0_s1_wait_counter_eq_0                                           (cfi_flash_0_s1_wait_counter_eq_0),
      .cfi_flash_0_s1_wait_counter_eq_1                                           (cfi_flash_0_s1_wait_counter_eq_1),
      .clk                                                                        (clk),
      .cpu_0_data_master_address                                                  (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                                         (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable_cfi_flash_0_s1                                (cpu_0_data_master_byteenable_cfi_flash_0_s1),
      .cpu_0_data_master_byteenable_sdram_0_s1                                    (cpu_0_data_master_byteenable_sdram_0_s1),
      .cpu_0_data_master_byteenable_sram_0_avalonS                                (cpu_0_data_master_byteenable_sram_0_avalonS),
      .cpu_0_data_master_dbs_address                                              (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                             (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_dbs_write_8                                              (cpu_0_data_master_dbs_write_8),
      .cpu_0_data_master_granted_DM9000A_avalonS                                  (cpu_0_data_master_granted_DM9000A_avalonS),
      .cpu_0_data_master_granted_I2C_0_avalonS                                    (cpu_0_data_master_granted_I2C_0_avalonS),
      .cpu_0_data_master_granted_ISP1362_avalonS                                  (cpu_0_data_master_granted_ISP1362_avalonS),
      .cpu_0_data_master_granted_SEG7_Display_avalonS                             (cpu_0_data_master_granted_SEG7_Display_avalonS),
      .cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0           (cpu_0_data_master_granted_binary_vga_controller_0_avalon_slave_0),
      .cpu_0_data_master_granted_button_pio_s1                                    (cpu_0_data_master_granted_button_pio_s1),
      .cpu_0_data_master_granted_cfi_flash_0_s1                                   (cpu_0_data_master_granted_cfi_flash_0_s1),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                          (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_epcs_controller_epcs_control_port                (cpu_0_data_master_granted_epcs_controller_epcs_control_port),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave                    (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_granted_lcd_16207_0_control_slave                        (cpu_0_data_master_granted_lcd_16207_0_control_slave),
      .cpu_0_data_master_granted_led_green_s1                                     (cpu_0_data_master_granted_led_green_s1),
      .cpu_0_data_master_granted_led_red_s1                                       (cpu_0_data_master_granted_led_red_s1),
      .cpu_0_data_master_granted_ps2_0_avalon_PS2_slave                           (cpu_0_data_master_granted_ps2_0_avalon_PS2_slave),
      .cpu_0_data_master_granted_sdram_0_s1                                       (cpu_0_data_master_granted_sdram_0_s1),
      .cpu_0_data_master_granted_sram_0_avalonS                                   (cpu_0_data_master_granted_sram_0_avalonS),
      .cpu_0_data_master_granted_switch_pio_s1                                    (cpu_0_data_master_granted_switch_pio_s1),
      .cpu_0_data_master_granted_sysid_control_slave                              (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_granted_timer_0_s1                                       (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_granted_timer_1_s1                                       (cpu_0_data_master_granted_timer_1_s1),
      .cpu_0_data_master_granted_uart_0_s1                                        (cpu_0_data_master_granted_uart_0_s1),
      .cpu_0_data_master_irq                                                      (cpu_0_data_master_irq),
      .cpu_0_data_master_no_byte_enables_and_last_term                            (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_DM9000A_avalonS                        (cpu_0_data_master_qualified_request_DM9000A_avalonS),
      .cpu_0_data_master_qualified_request_I2C_0_avalonS                          (cpu_0_data_master_qualified_request_I2C_0_avalonS),
      .cpu_0_data_master_qualified_request_ISP1362_avalonS                        (cpu_0_data_master_qualified_request_ISP1362_avalonS),
      .cpu_0_data_master_qualified_request_SEG7_Display_avalonS                   (cpu_0_data_master_qualified_request_SEG7_Display_avalonS),
      .cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0 (cpu_0_data_master_qualified_request_binary_vga_controller_0_avalon_slave_0),
      .cpu_0_data_master_qualified_request_button_pio_s1                          (cpu_0_data_master_qualified_request_button_pio_s1),
      .cpu_0_data_master_qualified_request_cfi_flash_0_s1                         (cpu_0_data_master_qualified_request_cfi_flash_0_s1),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module                (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port      (cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_lcd_16207_0_control_slave              (cpu_0_data_master_qualified_request_lcd_16207_0_control_slave),
      .cpu_0_data_master_qualified_request_led_green_s1                           (cpu_0_data_master_qualified_request_led_green_s1),
      .cpu_0_data_master_qualified_request_led_red_s1                             (cpu_0_data_master_qualified_request_led_red_s1),
      .cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave                 (cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave),
      .cpu_0_data_master_qualified_request_sdram_0_s1                             (cpu_0_data_master_qualified_request_sdram_0_s1),
      .cpu_0_data_master_qualified_request_sram_0_avalonS                         (cpu_0_data_master_qualified_request_sram_0_avalonS),
      .cpu_0_data_master_qualified_request_switch_pio_s1                          (cpu_0_data_master_qualified_request_switch_pio_s1),
      .cpu_0_data_master_qualified_request_sysid_control_slave                    (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_qualified_request_timer_0_s1                             (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_qualified_request_timer_1_s1                             (cpu_0_data_master_qualified_request_timer_1_s1),
      .cpu_0_data_master_qualified_request_uart_0_s1                              (cpu_0_data_master_qualified_request_uart_0_s1),
      .cpu_0_data_master_read                                                     (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_DM9000A_avalonS                          (cpu_0_data_master_read_data_valid_DM9000A_avalonS),
      .cpu_0_data_master_read_data_valid_I2C_0_avalonS                            (cpu_0_data_master_read_data_valid_I2C_0_avalonS),
      .cpu_0_data_master_read_data_valid_ISP1362_avalonS                          (cpu_0_data_master_read_data_valid_ISP1362_avalonS),
      .cpu_0_data_master_read_data_valid_SEG7_Display_avalonS                     (cpu_0_data_master_read_data_valid_SEG7_Display_avalonS),
      .cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0   (cpu_0_data_master_read_data_valid_binary_vga_controller_0_avalon_slave_0),
      .cpu_0_data_master_read_data_valid_button_pio_s1                            (cpu_0_data_master_read_data_valid_button_pio_s1),
      .cpu_0_data_master_read_data_valid_cfi_flash_0_s1                           (cpu_0_data_master_read_data_valid_cfi_flash_0_s1),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module                  (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port        (cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave            (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave                (cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave),
      .cpu_0_data_master_read_data_valid_led_green_s1                             (cpu_0_data_master_read_data_valid_led_green_s1),
      .cpu_0_data_master_read_data_valid_led_red_s1                               (cpu_0_data_master_read_data_valid_led_red_s1),
      .cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave                   (cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1                               (cpu_0_data_master_read_data_valid_sdram_0_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_sram_0_avalonS                           (cpu_0_data_master_read_data_valid_sram_0_avalonS),
      .cpu_0_data_master_read_data_valid_switch_pio_s1                            (cpu_0_data_master_read_data_valid_switch_pio_s1),
      .cpu_0_data_master_read_data_valid_sysid_control_slave                      (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_read_data_valid_timer_0_s1                               (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_read_data_valid_timer_1_s1                               (cpu_0_data_master_read_data_valid_timer_1_s1),
      .cpu_0_data_master_read_data_valid_uart_0_s1                                (cpu_0_data_master_read_data_valid_uart_0_s1),
      .cpu_0_data_master_readdata                                                 (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_DM9000A_avalonS                                 (cpu_0_data_master_requests_DM9000A_avalonS),
      .cpu_0_data_master_requests_I2C_0_avalonS                                   (cpu_0_data_master_requests_I2C_0_avalonS),
      .cpu_0_data_master_requests_ISP1362_avalonS                                 (cpu_0_data_master_requests_ISP1362_avalonS),
      .cpu_0_data_master_requests_SEG7_Display_avalonS                            (cpu_0_data_master_requests_SEG7_Display_avalonS),
      .cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0          (cpu_0_data_master_requests_binary_vga_controller_0_avalon_slave_0),
      .cpu_0_data_master_requests_button_pio_s1                                   (cpu_0_data_master_requests_button_pio_s1),
      .cpu_0_data_master_requests_cfi_flash_0_s1                                  (cpu_0_data_master_requests_cfi_flash_0_s1),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                         (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_epcs_controller_epcs_control_port               (cpu_0_data_master_requests_epcs_controller_epcs_control_port),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave                   (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_lcd_16207_0_control_slave                       (cpu_0_data_master_requests_lcd_16207_0_control_slave),
      .cpu_0_data_master_requests_led_green_s1                                    (cpu_0_data_master_requests_led_green_s1),
      .cpu_0_data_master_requests_led_red_s1                                      (cpu_0_data_master_requests_led_red_s1),
      .cpu_0_data_master_requests_ps2_0_avalon_PS2_slave                          (cpu_0_data_master_requests_ps2_0_avalon_PS2_slave),
      .cpu_0_data_master_requests_sdram_0_s1                                      (cpu_0_data_master_requests_sdram_0_s1),
      .cpu_0_data_master_requests_sram_0_avalonS                                  (cpu_0_data_master_requests_sram_0_avalonS),
      .cpu_0_data_master_requests_switch_pio_s1                                   (cpu_0_data_master_requests_switch_pio_s1),
      .cpu_0_data_master_requests_sysid_control_slave                             (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_requests_timer_0_s1                                      (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_requests_timer_1_s1                                      (cpu_0_data_master_requests_timer_1_s1),
      .cpu_0_data_master_requests_uart_0_s1                                       (cpu_0_data_master_requests_uart_0_s1),
      .cpu_0_data_master_waitrequest                                              (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                                    (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                (cpu_0_data_master_writedata),
      .cpu_0_jtag_debug_module_readdata_from_sa                                   (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_DM9000A_avalonS_end_xfer                                                (d1_DM9000A_avalonS_end_xfer),
      .d1_I2C_0_avalonS_end_xfer                                                  (d1_I2C_0_avalonS_end_xfer),
      .d1_ISP1362_avalonS_end_xfer                                                (d1_ISP1362_avalonS_end_xfer),
      .d1_SEG7_Display_avalonS_end_xfer                                           (d1_SEG7_Display_avalonS_end_xfer),
      .d1_binary_vga_controller_0_avalon_slave_0_end_xfer                         (d1_binary_vga_controller_0_avalon_slave_0_end_xfer),
      .d1_button_pio_s1_end_xfer                                                  (d1_button_pio_s1_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                                        (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_epcs_controller_epcs_control_port_end_xfer                              (d1_epcs_controller_epcs_control_port_end_xfer),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                                  (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .d1_lcd_16207_0_control_slave_end_xfer                                      (d1_lcd_16207_0_control_slave_end_xfer),
      .d1_led_green_s1_end_xfer                                                   (d1_led_green_s1_end_xfer),
      .d1_led_red_s1_end_xfer                                                     (d1_led_red_s1_end_xfer),
      .d1_ps2_0_avalon_PS2_slave_end_xfer                                         (d1_ps2_0_avalon_PS2_slave_end_xfer),
      .d1_sdram_0_s1_end_xfer                                                     (d1_sdram_0_s1_end_xfer),
      .d1_sram_0_avalonS_end_xfer                                                 (d1_sram_0_avalonS_end_xfer),
      .d1_switch_pio_s1_end_xfer                                                  (d1_switch_pio_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                            (d1_sysid_control_slave_end_xfer),
      .d1_timer_0_s1_end_xfer                                                     (d1_timer_0_s1_end_xfer),
      .d1_timer_1_s1_end_xfer                                                     (d1_timer_1_s1_end_xfer),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                                (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .d1_uart_0_s1_end_xfer                                                      (d1_uart_0_s1_end_xfer),
      .epcs_controller_epcs_control_port_irq_from_sa                              (epcs_controller_epcs_control_port_irq_from_sa),
      .epcs_controller_epcs_control_port_readdata_from_sa                         (epcs_controller_epcs_control_port_readdata_from_sa),
      .incoming_tri_state_bridge_0_data_with_Xs_converted_to_0                    (incoming_tri_state_bridge_0_data_with_Xs_converted_to_0),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                                  (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                             (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                          (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .lcd_16207_0_control_slave_readdata_from_sa                                 (lcd_16207_0_control_slave_readdata_from_sa),
      .lcd_16207_0_control_slave_wait_counter_eq_0                                (lcd_16207_0_control_slave_wait_counter_eq_0),
      .lcd_16207_0_control_slave_wait_counter_eq_1                                (lcd_16207_0_control_slave_wait_counter_eq_1),
      .led_green_s1_readdata_from_sa                                              (led_green_s1_readdata_from_sa),
      .led_red_s1_readdata_from_sa                                                (led_red_s1_readdata_from_sa),
      .ps2_0_avalon_PS2_slave_irq_from_sa                                         (ps2_0_avalon_PS2_slave_irq_from_sa),
      .ps2_0_avalon_PS2_slave_readdata_from_sa                                    (ps2_0_avalon_PS2_slave_readdata_from_sa),
      .ps2_0_avalon_PS2_slave_waitrequest_from_sa                                 (ps2_0_avalon_PS2_slave_waitrequest_from_sa),
      .registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1                (registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1),
      .registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave        (registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave),
      .reset_n                                                                    (clk_reset_n),
      .sdram_0_s1_readdata_from_sa                                                (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                             (sdram_0_s1_waitrequest_from_sa),
      .sram_0_avalonS_readdata_from_sa                                            (sram_0_avalonS_readdata_from_sa),
      .sram_0_avalonS_wait_counter_eq_0                                           (sram_0_avalonS_wait_counter_eq_0),
      .switch_pio_s1_readdata_from_sa                                             (switch_pio_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                       (sysid_control_slave_readdata_from_sa),
      .timer_0_s1_irq_from_sa                                                     (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata_from_sa                                                (timer_0_s1_readdata_from_sa),
      .timer_1_s1_irq_from_sa                                                     (timer_1_s1_irq_from_sa),
      .timer_1_s1_readdata_from_sa                                                (timer_1_s1_readdata_from_sa),
      .uart_0_s1_irq_from_sa                                                      (uart_0_s1_irq_from_sa),
      .uart_0_s1_readdata_from_sa                                                 (uart_0_s1_readdata_from_sa)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .cfi_flash_0_s1_wait_counter_eq_0                                             (cfi_flash_0_s1_wait_counter_eq_0),
      .cfi_flash_0_s1_wait_counter_eq_1                                             (cfi_flash_0_s1_wait_counter_eq_1),
      .clk                                                                          (clk),
      .cpu_0_instruction_master_address                                             (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                                    (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                                         (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_cfi_flash_0_s1                              (cpu_0_instruction_master_granted_cfi_flash_0_s1),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module                     (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_granted_epcs_controller_epcs_control_port           (cpu_0_instruction_master_granted_epcs_controller_epcs_control_port),
      .cpu_0_instruction_master_granted_sdram_0_s1                                  (cpu_0_instruction_master_granted_sdram_0_s1),
      .cpu_0_instruction_master_granted_sram_0_avalonS                              (cpu_0_instruction_master_granted_sram_0_avalonS),
      .cpu_0_instruction_master_latency_counter                                     (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cfi_flash_0_s1                    (cpu_0_instruction_master_qualified_request_cfi_flash_0_s1),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module           (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port (cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port),
      .cpu_0_instruction_master_qualified_request_sdram_0_s1                        (cpu_0_instruction_master_qualified_request_sdram_0_s1),
      .cpu_0_instruction_master_qualified_request_sram_0_avalonS                    (cpu_0_instruction_master_qualified_request_sram_0_avalonS),
      .cpu_0_instruction_master_read                                                (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1                      (cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module             (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port   (cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1                          (cpu_0_instruction_master_read_data_valid_sdram_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register           (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_read_data_valid_sram_0_avalonS                      (cpu_0_instruction_master_read_data_valid_sram_0_avalonS),
      .cpu_0_instruction_master_readdata                                            (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_readdatavalid                                       (cpu_0_instruction_master_readdatavalid),
      .cpu_0_instruction_master_requests_cfi_flash_0_s1                             (cpu_0_instruction_master_requests_cfi_flash_0_s1),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module                    (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_epcs_controller_epcs_control_port          (cpu_0_instruction_master_requests_epcs_controller_epcs_control_port),
      .cpu_0_instruction_master_requests_sdram_0_s1                                 (cpu_0_instruction_master_requests_sdram_0_s1),
      .cpu_0_instruction_master_requests_sram_0_avalonS                             (cpu_0_instruction_master_requests_sram_0_avalonS),
      .cpu_0_instruction_master_waitrequest                                         (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                                     (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                                          (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_epcs_controller_epcs_control_port_end_xfer                                (d1_epcs_controller_epcs_control_port_end_xfer),
      .d1_sdram_0_s1_end_xfer                                                       (d1_sdram_0_s1_end_xfer),
      .d1_sram_0_avalonS_end_xfer                                                   (d1_sram_0_avalonS_end_xfer),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                                  (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .epcs_controller_epcs_control_port_readdata_from_sa                           (epcs_controller_epcs_control_port_readdata_from_sa),
      .incoming_tri_state_bridge_0_data                                             (incoming_tri_state_bridge_0_data),
      .reset_n                                                                      (clk_reset_n),
      .sdram_0_s1_readdata_from_sa                                                  (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                               (sdram_0_s1_waitrequest_from_sa),
      .sram_0_avalonS_readdata_from_sa                                              (sram_0_avalonS_readdata_from_sa),
      .sram_0_avalonS_wait_counter_eq_0                                             (sram_0_avalonS_wait_counter_eq_0)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk),
      .d_address                             (cpu_0_data_master_address),
      .d_byteenable                          (cpu_0_data_master_byteenable),
      .d_irq                                 (cpu_0_data_master_irq),
      .d_read                                (cpu_0_data_master_read),
      .d_readdata                            (cpu_0_data_master_readdata),
      .d_waitrequest                         (cpu_0_data_master_waitrequest),
      .d_write                               (cpu_0_data_master_write),
      .d_writedata                           (cpu_0_data_master_writedata),
      .i_address                             (cpu_0_instruction_master_address),
      .i_read                                (cpu_0_instruction_master_read),
      .i_readdata                            (cpu_0_instruction_master_readdata),
      .i_readdatavalid                       (cpu_0_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_0_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_0_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_0_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_0_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_0_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_0_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_0_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_0_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_0_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_0_jtag_debug_module_writedata),
      .reset_n                               (cpu_0_jtag_debug_module_reset_n)
    );

  epcs_controller_epcs_control_port_arbitrator the_epcs_controller_epcs_control_port
    (
      .clk                                                                          (clk),
      .cpu_0_data_master_address_to_slave                                           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_epcs_controller_epcs_control_port                  (cpu_0_data_master_granted_epcs_controller_epcs_control_port),
      .cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port        (cpu_0_data_master_qualified_request_epcs_controller_epcs_control_port),
      .cpu_0_data_master_read                                                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port          (cpu_0_data_master_read_data_valid_epcs_controller_epcs_control_port),
      .cpu_0_data_master_requests_epcs_controller_epcs_control_port                 (cpu_0_data_master_requests_epcs_controller_epcs_control_port),
      .cpu_0_data_master_write                                                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                  (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                                    (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_epcs_controller_epcs_control_port           (cpu_0_instruction_master_granted_epcs_controller_epcs_control_port),
      .cpu_0_instruction_master_latency_counter                                     (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port (cpu_0_instruction_master_qualified_request_epcs_controller_epcs_control_port),
      .cpu_0_instruction_master_read                                                (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port   (cpu_0_instruction_master_read_data_valid_epcs_controller_epcs_control_port),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register           (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_epcs_controller_epcs_control_port          (cpu_0_instruction_master_requests_epcs_controller_epcs_control_port),
      .d1_epcs_controller_epcs_control_port_end_xfer                                (d1_epcs_controller_epcs_control_port_end_xfer),
      .epcs_controller_epcs_control_port_address                                    (epcs_controller_epcs_control_port_address),
      .epcs_controller_epcs_control_port_chipselect                                 (epcs_controller_epcs_control_port_chipselect),
      .epcs_controller_epcs_control_port_dataavailable                              (epcs_controller_epcs_control_port_dataavailable),
      .epcs_controller_epcs_control_port_dataavailable_from_sa                      (epcs_controller_epcs_control_port_dataavailable_from_sa),
      .epcs_controller_epcs_control_port_endofpacket                                (epcs_controller_epcs_control_port_endofpacket),
      .epcs_controller_epcs_control_port_endofpacket_from_sa                        (epcs_controller_epcs_control_port_endofpacket_from_sa),
      .epcs_controller_epcs_control_port_irq                                        (epcs_controller_epcs_control_port_irq),
      .epcs_controller_epcs_control_port_irq_from_sa                                (epcs_controller_epcs_control_port_irq_from_sa),
      .epcs_controller_epcs_control_port_read_n                                     (epcs_controller_epcs_control_port_read_n),
      .epcs_controller_epcs_control_port_readdata                                   (epcs_controller_epcs_control_port_readdata),
      .epcs_controller_epcs_control_port_readdata_from_sa                           (epcs_controller_epcs_control_port_readdata_from_sa),
      .epcs_controller_epcs_control_port_readyfordata                               (epcs_controller_epcs_control_port_readyfordata),
      .epcs_controller_epcs_control_port_readyfordata_from_sa                       (epcs_controller_epcs_control_port_readyfordata_from_sa),
      .epcs_controller_epcs_control_port_reset_n                                    (epcs_controller_epcs_control_port_reset_n),
      .epcs_controller_epcs_control_port_write_n                                    (epcs_controller_epcs_control_port_write_n),
      .epcs_controller_epcs_control_port_writedata                                  (epcs_controller_epcs_control_port_writedata),
      .reset_n                                                                      (clk_reset_n)
    );

  epcs_controller the_epcs_controller
    (
      .address       (epcs_controller_epcs_control_port_address),
      .chipselect    (epcs_controller_epcs_control_port_chipselect),
      .clk           (clk),
      .dataavailable (epcs_controller_epcs_control_port_dataavailable),
      .endofpacket   (epcs_controller_epcs_control_port_endofpacket),
      .irq           (epcs_controller_epcs_control_port_irq),
      .read_n        (epcs_controller_epcs_control_port_read_n),
      .readdata      (epcs_controller_epcs_control_port_readdata),
      .readyfordata  (epcs_controller_epcs_control_port_readyfordata),
      .reset_n       (epcs_controller_epcs_control_port_reset_n),
      .write_n       (epcs_controller_epcs_control_port_write_n),
      .writedata     (epcs_controller_epcs_control_port_writedata)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                               (clk),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_waitrequest                                     (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                             (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                          (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                       (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa               (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                 (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                              (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                            (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                        (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                             (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                         (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                             (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                           (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                           (clk_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (clk),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  lcd_16207_0_control_slave_arbitrator the_lcd_16207_0_control_slave
    (
      .clk                                                           (clk),
      .cpu_0_data_master_address_to_slave                            (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                  (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_lcd_16207_0_control_slave           (cpu_0_data_master_granted_lcd_16207_0_control_slave),
      .cpu_0_data_master_qualified_request_lcd_16207_0_control_slave (cpu_0_data_master_qualified_request_lcd_16207_0_control_slave),
      .cpu_0_data_master_read                                        (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave   (cpu_0_data_master_read_data_valid_lcd_16207_0_control_slave),
      .cpu_0_data_master_requests_lcd_16207_0_control_slave          (cpu_0_data_master_requests_lcd_16207_0_control_slave),
      .cpu_0_data_master_write                                       (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                   (cpu_0_data_master_writedata),
      .d1_lcd_16207_0_control_slave_end_xfer                         (d1_lcd_16207_0_control_slave_end_xfer),
      .lcd_16207_0_control_slave_address                             (lcd_16207_0_control_slave_address),
      .lcd_16207_0_control_slave_begintransfer                       (lcd_16207_0_control_slave_begintransfer),
      .lcd_16207_0_control_slave_read                                (lcd_16207_0_control_slave_read),
      .lcd_16207_0_control_slave_readdata                            (lcd_16207_0_control_slave_readdata),
      .lcd_16207_0_control_slave_readdata_from_sa                    (lcd_16207_0_control_slave_readdata_from_sa),
      .lcd_16207_0_control_slave_reset_n                             (lcd_16207_0_control_slave_reset_n),
      .lcd_16207_0_control_slave_wait_counter_eq_0                   (lcd_16207_0_control_slave_wait_counter_eq_0),
      .lcd_16207_0_control_slave_wait_counter_eq_1                   (lcd_16207_0_control_slave_wait_counter_eq_1),
      .lcd_16207_0_control_slave_write                               (lcd_16207_0_control_slave_write),
      .lcd_16207_0_control_slave_writedata                           (lcd_16207_0_control_slave_writedata),
      .reset_n                                                       (clk_reset_n)
    );

  lcd_16207_0 the_lcd_16207_0
    (
      .LCD_E         (LCD_E_from_the_lcd_16207_0),
      .LCD_RS        (LCD_RS_from_the_lcd_16207_0),
      .LCD_RW        (LCD_RW_from_the_lcd_16207_0),
      .LCD_data      (LCD_data_to_and_from_the_lcd_16207_0),
      .address       (lcd_16207_0_control_slave_address),
      .begintransfer (lcd_16207_0_control_slave_begintransfer),
      .clk           (clk),
      .read          (lcd_16207_0_control_slave_read),
      .readdata      (lcd_16207_0_control_slave_readdata),
      .reset_n       (lcd_16207_0_control_slave_reset_n),
      .write         (lcd_16207_0_control_slave_write),
      .writedata     (lcd_16207_0_control_slave_writedata)
    );

  led_green_s1_arbitrator the_led_green_s1
    (
      .clk                                              (clk),
      .cpu_0_data_master_address_to_slave               (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_led_green_s1           (cpu_0_data_master_granted_led_green_s1),
      .cpu_0_data_master_qualified_request_led_green_s1 (cpu_0_data_master_qualified_request_led_green_s1),
      .cpu_0_data_master_read                           (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_led_green_s1   (cpu_0_data_master_read_data_valid_led_green_s1),
      .cpu_0_data_master_requests_led_green_s1          (cpu_0_data_master_requests_led_green_s1),
      .cpu_0_data_master_waitrequest                    (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                          (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                      (cpu_0_data_master_writedata),
      .d1_led_green_s1_end_xfer                         (d1_led_green_s1_end_xfer),
      .led_green_s1_address                             (led_green_s1_address),
      .led_green_s1_chipselect                          (led_green_s1_chipselect),
      .led_green_s1_readdata                            (led_green_s1_readdata),
      .led_green_s1_readdata_from_sa                    (led_green_s1_readdata_from_sa),
      .led_green_s1_reset_n                             (led_green_s1_reset_n),
      .led_green_s1_write_n                             (led_green_s1_write_n),
      .led_green_s1_writedata                           (led_green_s1_writedata),
      .reset_n                                          (clk_reset_n)
    );

  led_green the_led_green
    (
      .address    (led_green_s1_address),
      .chipselect (led_green_s1_chipselect),
      .clk        (clk),
      .out_port   (out_port_from_the_led_green),
      .readdata   (led_green_s1_readdata),
      .reset_n    (led_green_s1_reset_n),
      .write_n    (led_green_s1_write_n),
      .writedata  (led_green_s1_writedata)
    );

  led_red_s1_arbitrator the_led_red_s1
    (
      .clk                                            (clk),
      .cpu_0_data_master_address_to_slave             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_led_red_s1           (cpu_0_data_master_granted_led_red_s1),
      .cpu_0_data_master_qualified_request_led_red_s1 (cpu_0_data_master_qualified_request_led_red_s1),
      .cpu_0_data_master_read                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_led_red_s1   (cpu_0_data_master_read_data_valid_led_red_s1),
      .cpu_0_data_master_requests_led_red_s1          (cpu_0_data_master_requests_led_red_s1),
      .cpu_0_data_master_waitrequest                  (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                    (cpu_0_data_master_writedata),
      .d1_led_red_s1_end_xfer                         (d1_led_red_s1_end_xfer),
      .led_red_s1_address                             (led_red_s1_address),
      .led_red_s1_chipselect                          (led_red_s1_chipselect),
      .led_red_s1_readdata                            (led_red_s1_readdata),
      .led_red_s1_readdata_from_sa                    (led_red_s1_readdata_from_sa),
      .led_red_s1_reset_n                             (led_red_s1_reset_n),
      .led_red_s1_write_n                             (led_red_s1_write_n),
      .led_red_s1_writedata                           (led_red_s1_writedata),
      .reset_n                                        (clk_reset_n)
    );

  led_red the_led_red
    (
      .address    (led_red_s1_address),
      .chipselect (led_red_s1_chipselect),
      .clk        (clk),
      .out_port   (out_port_from_the_led_red),
      .readdata   (led_red_s1_readdata),
      .reset_n    (led_red_s1_reset_n),
      .write_n    (led_red_s1_write_n),
      .writedata  (led_red_s1_writedata)
    );

  ps2_0_avalon_PS2_slave_arbitrator the_ps2_0_avalon_PS2_slave
    (
      .clk                                                                 (clk),
      .cpu_0_data_master_address_to_slave                                  (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                        (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_ps2_0_avalon_PS2_slave                    (cpu_0_data_master_granted_ps2_0_avalon_PS2_slave),
      .cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave          (cpu_0_data_master_qualified_request_ps2_0_avalon_PS2_slave),
      .cpu_0_data_master_read                                              (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave            (cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave),
      .cpu_0_data_master_requests_ps2_0_avalon_PS2_slave                   (cpu_0_data_master_requests_ps2_0_avalon_PS2_slave),
      .cpu_0_data_master_waitrequest                                       (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                             (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                         (cpu_0_data_master_writedata),
      .d1_ps2_0_avalon_PS2_slave_end_xfer                                  (d1_ps2_0_avalon_PS2_slave_end_xfer),
      .ps2_0_avalon_PS2_slave_address                                      (ps2_0_avalon_PS2_slave_address),
      .ps2_0_avalon_PS2_slave_byteenable                                   (ps2_0_avalon_PS2_slave_byteenable),
      .ps2_0_avalon_PS2_slave_chipselect                                   (ps2_0_avalon_PS2_slave_chipselect),
      .ps2_0_avalon_PS2_slave_irq                                          (ps2_0_avalon_PS2_slave_irq),
      .ps2_0_avalon_PS2_slave_irq_from_sa                                  (ps2_0_avalon_PS2_slave_irq_from_sa),
      .ps2_0_avalon_PS2_slave_read                                         (ps2_0_avalon_PS2_slave_read),
      .ps2_0_avalon_PS2_slave_readdata                                     (ps2_0_avalon_PS2_slave_readdata),
      .ps2_0_avalon_PS2_slave_readdata_from_sa                             (ps2_0_avalon_PS2_slave_readdata_from_sa),
      .ps2_0_avalon_PS2_slave_waitrequest                                  (ps2_0_avalon_PS2_slave_waitrequest),
      .ps2_0_avalon_PS2_slave_waitrequest_from_sa                          (ps2_0_avalon_PS2_slave_waitrequest_from_sa),
      .ps2_0_avalon_PS2_slave_write                                        (ps2_0_avalon_PS2_slave_write),
      .ps2_0_avalon_PS2_slave_writedata                                    (ps2_0_avalon_PS2_slave_writedata),
      .registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave (registered_cpu_0_data_master_read_data_valid_ps2_0_avalon_PS2_slave),
      .reset_n                                                             (clk_reset_n)
    );

  //complemented clk_reset_n, which is an e_assign
  assign clk_reset = ~clk_reset_n;

  //reset is asserted asynchronously and deasserted synchronously
  nios_0_reset_clk_domain_synch_module nios_0_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_0_jtag_debug_module_resetrequest_from_sa);

  ps2_0 the_ps2_0
    (
      .PS2_CLK     (PS2_CLK_to_and_from_the_ps2_0),
      .PS2_DAT     (PS2_DAT_to_and_from_the_ps2_0),
      .address     (ps2_0_avalon_PS2_slave_address),
      .byteenable  (ps2_0_avalon_PS2_slave_byteenable),
      .chipselect  (ps2_0_avalon_PS2_slave_chipselect),
      .clk         (clk),
      .irq         (ps2_0_avalon_PS2_slave_irq),
      .read        (ps2_0_avalon_PS2_slave_read),
      .readdata    (ps2_0_avalon_PS2_slave_readdata),
      .reset       (clk_reset),
      .waitrequest (ps2_0_avalon_PS2_slave_waitrequest),
      .write       (ps2_0_avalon_PS2_slave_write),
      .writedata   (ps2_0_avalon_PS2_slave_writedata)
    );

  sdram_0_s1_arbitrator the_sdram_0_s1
    (
      .clk                                                                (clk),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sdram_0_s1                            (cpu_0_data_master_byteenable_sdram_0_s1),
      .cpu_0_data_master_dbs_address                                      (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                     (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_sdram_0_s1                               (cpu_0_data_master_granted_sdram_0_s1),
      .cpu_0_data_master_no_byte_enables_and_last_term                    (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_sdram_0_s1                     (cpu_0_data_master_qualified_request_sdram_0_s1),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1                       (cpu_0_data_master_read_data_valid_sdram_0_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register        (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_sdram_0_s1                              (cpu_0_data_master_requests_sdram_0_s1),
      .cpu_0_data_master_waitrequest                                      (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                               (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_sdram_0_s1                        (cpu_0_instruction_master_granted_sdram_0_s1),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_sdram_0_s1              (cpu_0_instruction_master_qualified_request_sdram_0_s1),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1                (cpu_0_instruction_master_read_data_valid_sdram_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_sdram_0_s1                       (cpu_0_instruction_master_requests_sdram_0_s1),
      .d1_sdram_0_s1_end_xfer                                             (d1_sdram_0_s1_end_xfer),
      .reset_n                                                            (clk_reset_n),
      .sdram_0_s1_address                                                 (sdram_0_s1_address),
      .sdram_0_s1_byteenable_n                                            (sdram_0_s1_byteenable_n),
      .sdram_0_s1_chipselect                                              (sdram_0_s1_chipselect),
      .sdram_0_s1_read_n                                                  (sdram_0_s1_read_n),
      .sdram_0_s1_readdata                                                (sdram_0_s1_readdata),
      .sdram_0_s1_readdata_from_sa                                        (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_readdatavalid                                           (sdram_0_s1_readdatavalid),
      .sdram_0_s1_reset_n                                                 (sdram_0_s1_reset_n),
      .sdram_0_s1_waitrequest                                             (sdram_0_s1_waitrequest),
      .sdram_0_s1_waitrequest_from_sa                                     (sdram_0_s1_waitrequest_from_sa),
      .sdram_0_s1_write_n                                                 (sdram_0_s1_write_n),
      .sdram_0_s1_writedata                                               (sdram_0_s1_writedata)
    );

  sdram_0 the_sdram_0
    (
      .az_addr        (sdram_0_s1_address),
      .az_be_n        (sdram_0_s1_byteenable_n),
      .az_cs          (sdram_0_s1_chipselect),
      .az_data        (sdram_0_s1_writedata),
      .az_rd_n        (sdram_0_s1_read_n),
      .az_wr_n        (sdram_0_s1_write_n),
      .clk            (clk),
      .reset_n        (sdram_0_s1_reset_n),
      .za_data        (sdram_0_s1_readdata),
      .za_valid       (sdram_0_s1_readdatavalid),
      .za_waitrequest (sdram_0_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram_0),
      .zs_ba          (zs_ba_from_the_sdram_0),
      .zs_cas_n       (zs_cas_n_from_the_sdram_0),
      .zs_cke         (zs_cke_from_the_sdram_0),
      .zs_cs_n        (zs_cs_n_from_the_sdram_0),
      .zs_dq          (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm         (zs_dqm_from_the_sdram_0),
      .zs_ras_n       (zs_ras_n_from_the_sdram_0),
      .zs_we_n        (zs_we_n_from_the_sdram_0)
    );

  sram_0_avalonS_arbitrator the_sram_0_avalonS
    (
      .clk                                                                (clk),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sram_0_avalonS                        (cpu_0_data_master_byteenable_sram_0_avalonS),
      .cpu_0_data_master_dbs_address                                      (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                     (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_sram_0_avalonS                           (cpu_0_data_master_granted_sram_0_avalonS),
      .cpu_0_data_master_no_byte_enables_and_last_term                    (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_sram_0_avalonS                 (cpu_0_data_master_qualified_request_sram_0_avalonS),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sram_0_avalonS                   (cpu_0_data_master_read_data_valid_sram_0_avalonS),
      .cpu_0_data_master_requests_sram_0_avalonS                          (cpu_0_data_master_requests_sram_0_avalonS),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                               (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_sram_0_avalonS                    (cpu_0_instruction_master_granted_sram_0_avalonS),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_sram_0_avalonS          (cpu_0_instruction_master_qualified_request_sram_0_avalonS),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_read_data_valid_sram_0_avalonS            (cpu_0_instruction_master_read_data_valid_sram_0_avalonS),
      .cpu_0_instruction_master_requests_sram_0_avalonS                   (cpu_0_instruction_master_requests_sram_0_avalonS),
      .d1_sram_0_avalonS_end_xfer                                         (d1_sram_0_avalonS_end_xfer),
      .reset_n                                                            (clk_reset_n),
      .sram_0_avalonS_address                                             (sram_0_avalonS_address),
      .sram_0_avalonS_byteenable_n                                        (sram_0_avalonS_byteenable_n),
      .sram_0_avalonS_chipselect_n                                        (sram_0_avalonS_chipselect_n),
      .sram_0_avalonS_outputenable_n                                      (sram_0_avalonS_outputenable_n),
      .sram_0_avalonS_readdata                                            (sram_0_avalonS_readdata),
      .sram_0_avalonS_readdata_from_sa                                    (sram_0_avalonS_readdata_from_sa),
      .sram_0_avalonS_reset_n                                             (sram_0_avalonS_reset_n),
      .sram_0_avalonS_wait_counter_eq_0                                   (sram_0_avalonS_wait_counter_eq_0),
      .sram_0_avalonS_write_n                                             (sram_0_avalonS_write_n),
      .sram_0_avalonS_writedata                                           (sram_0_avalonS_writedata)
    );

  sram_0 the_sram_0
    (
      .SRAM_ADDR (SRAM_ADDR_from_the_sram_0),
      .SRAM_CE_N (SRAM_CE_N_from_the_sram_0),
      .SRAM_DQ   (SRAM_DQ_to_and_from_the_sram_0),
      .SRAM_LB_N (SRAM_LB_N_from_the_sram_0),
      .SRAM_OE_N (SRAM_OE_N_from_the_sram_0),
      .SRAM_UB_N (SRAM_UB_N_from_the_sram_0),
      .SRAM_WE_N (SRAM_WE_N_from_the_sram_0),
      .iADDR     (sram_0_avalonS_address),
      .iCE_N     (sram_0_avalonS_chipselect_n),
      .iDATA     (sram_0_avalonS_writedata),
      .iLB_N     (sram_0_avalonS_byteenable_n),
      .iOE_N     (sram_0_avalonS_outputenable_n),
      .iRST_N    (sram_0_avalonS_reset_n),
      .iUB_N     (sram_0_avalonS_byteenable_n),
      .iWE_N     (sram_0_avalonS_write_n),
      .oDATA     (sram_0_avalonS_readdata)
    );

  switch_pio_s1_arbitrator the_switch_pio_s1
    (
      .clk                                               (clk),
      .cpu_0_data_master_address_to_slave                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_switch_pio_s1           (cpu_0_data_master_granted_switch_pio_s1),
      .cpu_0_data_master_qualified_request_switch_pio_s1 (cpu_0_data_master_qualified_request_switch_pio_s1),
      .cpu_0_data_master_read                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_switch_pio_s1   (cpu_0_data_master_read_data_valid_switch_pio_s1),
      .cpu_0_data_master_requests_switch_pio_s1          (cpu_0_data_master_requests_switch_pio_s1),
      .cpu_0_data_master_write                           (cpu_0_data_master_write),
      .d1_switch_pio_s1_end_xfer                         (d1_switch_pio_s1_end_xfer),
      .reset_n                                           (clk_reset_n),
      .switch_pio_s1_address                             (switch_pio_s1_address),
      .switch_pio_s1_readdata                            (switch_pio_s1_readdata),
      .switch_pio_s1_readdata_from_sa                    (switch_pio_s1_readdata_from_sa),
      .switch_pio_s1_reset_n                             (switch_pio_s1_reset_n)
    );

  switch_pio the_switch_pio
    (
      .address  (switch_pio_s1_address),
      .clk      (clk),
      .in_port  (in_port_to_the_switch_pio),
      .readdata (switch_pio_s1_readdata),
      .reset_n  (switch_pio_s1_reset_n)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                     (clk),
      .cpu_0_data_master_address_to_slave                      (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_sysid_control_slave           (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_qualified_request_sysid_control_slave (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                  (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sysid_control_slave   (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_requests_sysid_control_slave          (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_write                                 (cpu_0_data_master_write),
      .d1_sysid_control_slave_end_xfer                         (d1_sysid_control_slave_end_xfer),
      .reset_n                                                 (clk_reset_n),
      .sysid_control_slave_address                             (sysid_control_slave_address),
      .sysid_control_slave_readdata                            (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                    (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                             (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  timer_0_s1_arbitrator the_timer_0_s1
    (
      .clk                                            (clk),
      .cpu_0_data_master_address_to_slave             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_timer_0_s1           (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_qualified_request_timer_0_s1 (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_read                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_timer_0_s1   (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_requests_timer_0_s1          (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_waitrequest                  (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                    (cpu_0_data_master_writedata),
      .d1_timer_0_s1_end_xfer                         (d1_timer_0_s1_end_xfer),
      .reset_n                                        (clk_reset_n),
      .timer_0_s1_address                             (timer_0_s1_address),
      .timer_0_s1_chipselect                          (timer_0_s1_chipselect),
      .timer_0_s1_irq                                 (timer_0_s1_irq),
      .timer_0_s1_irq_from_sa                         (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata                            (timer_0_s1_readdata),
      .timer_0_s1_readdata_from_sa                    (timer_0_s1_readdata_from_sa),
      .timer_0_s1_reset_n                             (timer_0_s1_reset_n),
      .timer_0_s1_write_n                             (timer_0_s1_write_n),
      .timer_0_s1_writedata                           (timer_0_s1_writedata)
    );

  timer_0 the_timer_0
    (
      .address    (timer_0_s1_address),
      .chipselect (timer_0_s1_chipselect),
      .clk        (clk),
      .irq        (timer_0_s1_irq),
      .readdata   (timer_0_s1_readdata),
      .reset_n    (timer_0_s1_reset_n),
      .write_n    (timer_0_s1_write_n),
      .writedata  (timer_0_s1_writedata)
    );

  timer_1_s1_arbitrator the_timer_1_s1
    (
      .clk                                            (clk),
      .cpu_0_data_master_address_to_slave             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_timer_1_s1           (cpu_0_data_master_granted_timer_1_s1),
      .cpu_0_data_master_qualified_request_timer_1_s1 (cpu_0_data_master_qualified_request_timer_1_s1),
      .cpu_0_data_master_read                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_timer_1_s1   (cpu_0_data_master_read_data_valid_timer_1_s1),
      .cpu_0_data_master_requests_timer_1_s1          (cpu_0_data_master_requests_timer_1_s1),
      .cpu_0_data_master_waitrequest                  (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                    (cpu_0_data_master_writedata),
      .d1_timer_1_s1_end_xfer                         (d1_timer_1_s1_end_xfer),
      .reset_n                                        (clk_reset_n),
      .timer_1_s1_address                             (timer_1_s1_address),
      .timer_1_s1_chipselect                          (timer_1_s1_chipselect),
      .timer_1_s1_irq                                 (timer_1_s1_irq),
      .timer_1_s1_irq_from_sa                         (timer_1_s1_irq_from_sa),
      .timer_1_s1_readdata                            (timer_1_s1_readdata),
      .timer_1_s1_readdata_from_sa                    (timer_1_s1_readdata_from_sa),
      .timer_1_s1_reset_n                             (timer_1_s1_reset_n),
      .timer_1_s1_write_n                             (timer_1_s1_write_n),
      .timer_1_s1_writedata                           (timer_1_s1_writedata)
    );

  timer_1 the_timer_1
    (
      .address    (timer_1_s1_address),
      .chipselect (timer_1_s1_chipselect),
      .clk        (clk),
      .irq        (timer_1_s1_irq),
      .readdata   (timer_1_s1_readdata),
      .reset_n    (timer_1_s1_reset_n),
      .write_n    (timer_1_s1_write_n),
      .writedata  (timer_1_s1_writedata)
    );

  tri_state_bridge_0_avalon_slave_arbitrator the_tri_state_bridge_0_avalon_slave
    (
      .cfi_flash_0_s1_wait_counter_eq_0                                   (cfi_flash_0_s1_wait_counter_eq_0),
      .cfi_flash_0_s1_wait_counter_eq_1                                   (cfi_flash_0_s1_wait_counter_eq_1),
      .clk                                                                (clk),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_cfi_flash_0_s1                        (cpu_0_data_master_byteenable_cfi_flash_0_s1),
      .cpu_0_data_master_dbs_address                                      (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_8                                      (cpu_0_data_master_dbs_write_8),
      .cpu_0_data_master_granted_cfi_flash_0_s1                           (cpu_0_data_master_granted_cfi_flash_0_s1),
      .cpu_0_data_master_no_byte_enables_and_last_term                    (cpu_0_data_master_no_byte_enables_and_last_term),
      .cpu_0_data_master_qualified_request_cfi_flash_0_s1                 (cpu_0_data_master_qualified_request_cfi_flash_0_s1),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cfi_flash_0_s1                   (cpu_0_data_master_read_data_valid_cfi_flash_0_s1),
      .cpu_0_data_master_requests_cfi_flash_0_s1                          (cpu_0_data_master_requests_cfi_flash_0_s1),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                               (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_cfi_flash_0_s1                    (cpu_0_instruction_master_granted_cfi_flash_0_s1),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cfi_flash_0_s1          (cpu_0_instruction_master_qualified_request_cfi_flash_0_s1),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1            (cpu_0_instruction_master_read_data_valid_cfi_flash_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_cfi_flash_0_s1                   (cpu_0_instruction_master_requests_cfi_flash_0_s1),
      .d1_tri_state_bridge_0_avalon_slave_end_xfer                        (d1_tri_state_bridge_0_avalon_slave_end_xfer),
      .incoming_tri_state_bridge_0_data                                   (incoming_tri_state_bridge_0_data),
      .incoming_tri_state_bridge_0_data_with_Xs_converted_to_0            (incoming_tri_state_bridge_0_data_with_Xs_converted_to_0),
      .registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1        (registered_cpu_0_data_master_read_data_valid_cfi_flash_0_s1),
      .reset_n                                                            (clk_reset_n),
      .select_n_to_the_cfi_flash_0                                        (select_n_to_the_cfi_flash_0),
      .tri_state_bridge_0_address                                         (tri_state_bridge_0_address),
      .tri_state_bridge_0_data                                            (tri_state_bridge_0_data),
      .tri_state_bridge_0_readn                                           (tri_state_bridge_0_readn),
      .write_n_to_the_cfi_flash_0                                         (write_n_to_the_cfi_flash_0)
    );

  uart_0_s1_arbitrator the_uart_0_s1
    (
      .clk                                           (clk),
      .cpu_0_data_master_address_to_slave            (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_uart_0_s1           (cpu_0_data_master_granted_uart_0_s1),
      .cpu_0_data_master_qualified_request_uart_0_s1 (cpu_0_data_master_qualified_request_uart_0_s1),
      .cpu_0_data_master_read                        (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_uart_0_s1   (cpu_0_data_master_read_data_valid_uart_0_s1),
      .cpu_0_data_master_requests_uart_0_s1          (cpu_0_data_master_requests_uart_0_s1),
      .cpu_0_data_master_write                       (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                   (cpu_0_data_master_writedata),
      .d1_uart_0_s1_end_xfer                         (d1_uart_0_s1_end_xfer),
      .reset_n                                       (clk_reset_n),
      .uart_0_s1_address                             (uart_0_s1_address),
      .uart_0_s1_begintransfer                       (uart_0_s1_begintransfer),
      .uart_0_s1_chipselect                          (uart_0_s1_chipselect),
      .uart_0_s1_dataavailable                       (uart_0_s1_dataavailable),
      .uart_0_s1_dataavailable_from_sa               (uart_0_s1_dataavailable_from_sa),
      .uart_0_s1_irq                                 (uart_0_s1_irq),
      .uart_0_s1_irq_from_sa                         (uart_0_s1_irq_from_sa),
      .uart_0_s1_read_n                              (uart_0_s1_read_n),
      .uart_0_s1_readdata                            (uart_0_s1_readdata),
      .uart_0_s1_readdata_from_sa                    (uart_0_s1_readdata_from_sa),
      .uart_0_s1_readyfordata                        (uart_0_s1_readyfordata),
      .uart_0_s1_readyfordata_from_sa                (uart_0_s1_readyfordata_from_sa),
      .uart_0_s1_reset_n                             (uart_0_s1_reset_n),
      .uart_0_s1_write_n                             (uart_0_s1_write_n),
      .uart_0_s1_writedata                           (uart_0_s1_writedata)
    );

  uart_0 the_uart_0
    (
      .address       (uart_0_s1_address),
      .begintransfer (uart_0_s1_begintransfer),
      .chipselect    (uart_0_s1_chipselect),
      .clk           (clk),
      .dataavailable (uart_0_s1_dataavailable),
      .irq           (uart_0_s1_irq),
      .read_n        (uart_0_s1_read_n),
      .readdata      (uart_0_s1_readdata),
      .readyfordata  (uart_0_s1_readyfordata),
      .reset_n       (uart_0_s1_reset_n),
      .rxd           (rxd_to_the_uart_0),
      .txd           (txd_from_the_uart_0),
      .write_n       (uart_0_s1_write_n),
      .writedata     (uart_0_s1_writedata)
    );

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_0_lane0_module (
                                  // inputs:
                                   data,
                                   rdaddress,
                                   rdclken,
                                   wraddress,
                                   wrclock,
                                   wren,

                                  // outputs:
                                   q
                                )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 19: 0] rdaddress;
  input            rdclken;
  input   [ 19: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [1048575: 0];
  wire    [  7: 0] q;
  reg     [ 19: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash_0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash_0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 20,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_0 (
                     // inputs:
                      address,
                      read_n,
                      select_n,
                      write_n,

                     // outputs:
                      data
                   )
;

  inout   [  7: 0] data;
  input   [ 19: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [  7: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_0_lane0, which is an e_ram
  cfi_flash_0_lane0_module cfi_flash_0_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? q_0: {8{1'bz}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "/opt/altera/altera12.1/quartus/eda/sim_lib/altera_mf.v"
`include "/opt/altera/altera12.1/quartus/eda/sim_lib/220model.v"
`include "/opt/altera/altera12.1/quartus/eda/sim_lib/sgate.v"
`include "SRAM_16Bit_512K.v"
`include "sram_0.v"
`include "timer_0.v"
`include ""
`include "ISP1362.v"
`include "SEG7_LUT.v"
`include "SEG7_LUT_8.v"
`include "SEG7_Display.v"
`include "sysid.v"
`include "led_red.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_mult_cell.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "switch_pio.v"
`include "button_pio.v"
`include "timer_1.v"
`include "Img_DATA.hex"
`include "VGA_Param.h"
`include "Img_RAM.v"
`include "VGA_Controller.v"
`include "VGA_NIOS_CTRL.v"
`include "VGA_OSD_RAM.v"
`include "binary_vga_controller_0.v"
`include "uart_0.v"
`include "jtag_uart_0.v"
`include "Altera_UP_Avalon_PS2.v"
`include "Altera_UP_PS2.v"
`include "Altera_UP_PS2_Command_Out.v"
`include "Altera_UP_PS2_Data_In.v"
`include "ps2_0.v"
`include "i2c_master_bit_ctrl.v"
`include "i2c_master_byte_ctrl.v"
`include "i2c_master_defines.v"
`include "i2c_master_top.v"
`include "I2C_0.v"
`include "sdram_0.v"
`include "sdram_0_test_component.v"
`include "lcd_16207_0.v"
`include "DM9000A_IF.v"
`include "DM9000A.v"
`include "led_green.v"
`include "epcs_controller.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             ENET_CMD_from_the_DM9000A;
  wire             ENET_CS_N_from_the_DM9000A;
  wire    [ 15: 0] ENET_DATA_to_and_from_the_DM9000A;
  wire             ENET_INT_to_the_DM9000A;
  wire             ENET_RD_N_from_the_DM9000A;
  wire             ENET_RST_N_from_the_DM9000A;
  wire             ENET_WR_N_from_the_DM9000A;
  wire             LCD_E_from_the_lcd_16207_0;
  wire             LCD_RS_from_the_lcd_16207_0;
  wire             LCD_RW_from_the_lcd_16207_0;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd_16207_0;
  wire    [  1: 0] OTG_ADDR_from_the_ISP1362;
  wire             OTG_CS_N_from_the_ISP1362;
  wire             OTG_DACK0_N_from_the_ISP1362;
  wire             OTG_DACK1_N_from_the_ISP1362;
  wire    [ 15: 0] OTG_DATA_to_and_from_the_ISP1362;
  wire             OTG_DREQ0_to_the_ISP1362;
  wire             OTG_DREQ1_to_the_ISP1362;
  wire             OTG_FSPEED_from_the_ISP1362;
  wire             OTG_INT0_to_the_ISP1362;
  wire             OTG_INT1_to_the_ISP1362;
  wire             OTG_LSPEED_from_the_ISP1362;
  wire             OTG_RD_N_from_the_ISP1362;
  wire             OTG_RST_N_from_the_ISP1362;
  wire             OTG_WR_N_from_the_ISP1362;
  wire             PS2_CLK_to_and_from_the_ps2_0;
  wire             PS2_DAT_to_and_from_the_ps2_0;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram_0;
  wire             SRAM_CE_N_from_the_sram_0;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  wire             SRAM_LB_N_from_the_sram_0;
  wire             SRAM_OE_N_from_the_sram_0;
  wire             SRAM_UB_N_from_the_sram_0;
  wire             SRAM_WE_N_from_the_sram_0;
  wire             VGA_BLANK_from_the_binary_vga_controller_0;
  wire    [  9: 0] VGA_B_from_the_binary_vga_controller_0;
  wire             VGA_CLK_from_the_binary_vga_controller_0;
  wire    [  9: 0] VGA_G_from_the_binary_vga_controller_0;
  wire             VGA_HS_from_the_binary_vga_controller_0;
  wire    [  9: 0] VGA_R_from_the_binary_vga_controller_0;
  wire             VGA_SYNC_from_the_binary_vga_controller_0;
  wire             VGA_VS_from_the_binary_vga_controller_0;
  reg              clk;
  wire             epcs_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_controller_epcs_control_port_readyfordata_from_sa;
  wire             iCLK_25_to_the_binary_vga_controller_0;
  wire             iFSPEED_to_the_ISP1362;
  wire             iLSPEED_to_the_ISP1362;
  wire    [  3: 0] in_port_to_the_button_pio;
  wire    [ 17: 0] in_port_to_the_switch_pio;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire    [  6: 0] oSEG0_from_the_SEG7_Display;
  wire    [  6: 0] oSEG1_from_the_SEG7_Display;
  wire    [  6: 0] oSEG2_from_the_SEG7_Display;
  wire    [  6: 0] oSEG3_from_the_SEG7_Display;
  wire    [  6: 0] oSEG4_from_the_SEG7_Display;
  wire    [  6: 0] oSEG5_from_the_SEG7_Display;
  wire    [  6: 0] oSEG6_from_the_SEG7_Display;
  wire    [  6: 0] oSEG7_from_the_SEG7_Display;
  wire    [  8: 0] out_port_from_the_led_green;
  wire    [ 17: 0] out_port_from_the_led_red;
  reg              reset_n;
  wire             rxd_to_the_uart_0;
  wire             scl_pad_i_to_the_I2C_0;
  wire             scl_pad_o_from_the_I2C_0;
  wire             scl_padoen_o_from_the_I2C_0;
  wire             sda_pad_i_to_the_I2C_0;
  wire             sda_pad_o_from_the_I2C_0;
  wire             sda_padoen_o_from_the_I2C_0;
  wire             select_n_to_the_cfi_flash_0;
  wire             sysid_control_slave_clock;
  wire    [ 19: 0] tri_state_bridge_0_address;
  wire    [  7: 0] tri_state_bridge_0_data;
  wire             tri_state_bridge_0_readn;
  wire             txd_from_the_uart_0;
  wire             uart_0_s1_dataavailable_from_sa;
  wire             uart_0_s1_readyfordata_from_sa;
  wire             write_n_to_the_cfi_flash_0;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  nios_0 DUT
    (
      .ENET_CMD_from_the_DM9000A                  (ENET_CMD_from_the_DM9000A),
      .ENET_CS_N_from_the_DM9000A                 (ENET_CS_N_from_the_DM9000A),
      .ENET_DATA_to_and_from_the_DM9000A          (ENET_DATA_to_and_from_the_DM9000A),
      .ENET_INT_to_the_DM9000A                    (ENET_INT_to_the_DM9000A),
      .ENET_RD_N_from_the_DM9000A                 (ENET_RD_N_from_the_DM9000A),
      .ENET_RST_N_from_the_DM9000A                (ENET_RST_N_from_the_DM9000A),
      .ENET_WR_N_from_the_DM9000A                 (ENET_WR_N_from_the_DM9000A),
      .LCD_E_from_the_lcd_16207_0                 (LCD_E_from_the_lcd_16207_0),
      .LCD_RS_from_the_lcd_16207_0                (LCD_RS_from_the_lcd_16207_0),
      .LCD_RW_from_the_lcd_16207_0                (LCD_RW_from_the_lcd_16207_0),
      .LCD_data_to_and_from_the_lcd_16207_0       (LCD_data_to_and_from_the_lcd_16207_0),
      .OTG_ADDR_from_the_ISP1362                  (OTG_ADDR_from_the_ISP1362),
      .OTG_CS_N_from_the_ISP1362                  (OTG_CS_N_from_the_ISP1362),
      .OTG_DACK0_N_from_the_ISP1362               (OTG_DACK0_N_from_the_ISP1362),
      .OTG_DACK1_N_from_the_ISP1362               (OTG_DACK1_N_from_the_ISP1362),
      .OTG_DATA_to_and_from_the_ISP1362           (OTG_DATA_to_and_from_the_ISP1362),
      .OTG_DREQ0_to_the_ISP1362                   (OTG_DREQ0_to_the_ISP1362),
      .OTG_DREQ1_to_the_ISP1362                   (OTG_DREQ1_to_the_ISP1362),
      .OTG_FSPEED_from_the_ISP1362                (OTG_FSPEED_from_the_ISP1362),
      .OTG_INT0_to_the_ISP1362                    (OTG_INT0_to_the_ISP1362),
      .OTG_INT1_to_the_ISP1362                    (OTG_INT1_to_the_ISP1362),
      .OTG_LSPEED_from_the_ISP1362                (OTG_LSPEED_from_the_ISP1362),
      .OTG_RD_N_from_the_ISP1362                  (OTG_RD_N_from_the_ISP1362),
      .OTG_RST_N_from_the_ISP1362                 (OTG_RST_N_from_the_ISP1362),
      .OTG_WR_N_from_the_ISP1362                  (OTG_WR_N_from_the_ISP1362),
      .PS2_CLK_to_and_from_the_ps2_0              (PS2_CLK_to_and_from_the_ps2_0),
      .PS2_DAT_to_and_from_the_ps2_0              (PS2_DAT_to_and_from_the_ps2_0),
      .SRAM_ADDR_from_the_sram_0                  (SRAM_ADDR_from_the_sram_0),
      .SRAM_CE_N_from_the_sram_0                  (SRAM_CE_N_from_the_sram_0),
      .SRAM_DQ_to_and_from_the_sram_0             (SRAM_DQ_to_and_from_the_sram_0),
      .SRAM_LB_N_from_the_sram_0                  (SRAM_LB_N_from_the_sram_0),
      .SRAM_OE_N_from_the_sram_0                  (SRAM_OE_N_from_the_sram_0),
      .SRAM_UB_N_from_the_sram_0                  (SRAM_UB_N_from_the_sram_0),
      .SRAM_WE_N_from_the_sram_0                  (SRAM_WE_N_from_the_sram_0),
      .VGA_BLANK_from_the_binary_vga_controller_0 (VGA_BLANK_from_the_binary_vga_controller_0),
      .VGA_B_from_the_binary_vga_controller_0     (VGA_B_from_the_binary_vga_controller_0),
      .VGA_CLK_from_the_binary_vga_controller_0   (VGA_CLK_from_the_binary_vga_controller_0),
      .VGA_G_from_the_binary_vga_controller_0     (VGA_G_from_the_binary_vga_controller_0),
      .VGA_HS_from_the_binary_vga_controller_0    (VGA_HS_from_the_binary_vga_controller_0),
      .VGA_R_from_the_binary_vga_controller_0     (VGA_R_from_the_binary_vga_controller_0),
      .VGA_SYNC_from_the_binary_vga_controller_0  (VGA_SYNC_from_the_binary_vga_controller_0),
      .VGA_VS_from_the_binary_vga_controller_0    (VGA_VS_from_the_binary_vga_controller_0),
      .clk                                        (clk),
      .iCLK_25_to_the_binary_vga_controller_0     (iCLK_25_to_the_binary_vga_controller_0),
      .iFSPEED_to_the_ISP1362                     (iFSPEED_to_the_ISP1362),
      .iLSPEED_to_the_ISP1362                     (iLSPEED_to_the_ISP1362),
      .in_port_to_the_button_pio                  (in_port_to_the_button_pio),
      .in_port_to_the_switch_pio                  (in_port_to_the_switch_pio),
      .oSEG0_from_the_SEG7_Display                (oSEG0_from_the_SEG7_Display),
      .oSEG1_from_the_SEG7_Display                (oSEG1_from_the_SEG7_Display),
      .oSEG2_from_the_SEG7_Display                (oSEG2_from_the_SEG7_Display),
      .oSEG3_from_the_SEG7_Display                (oSEG3_from_the_SEG7_Display),
      .oSEG4_from_the_SEG7_Display                (oSEG4_from_the_SEG7_Display),
      .oSEG5_from_the_SEG7_Display                (oSEG5_from_the_SEG7_Display),
      .oSEG6_from_the_SEG7_Display                (oSEG6_from_the_SEG7_Display),
      .oSEG7_from_the_SEG7_Display                (oSEG7_from_the_SEG7_Display),
      .out_port_from_the_led_green                (out_port_from_the_led_green),
      .out_port_from_the_led_red                  (out_port_from_the_led_red),
      .reset_n                                    (reset_n),
      .rxd_to_the_uart_0                          (rxd_to_the_uart_0),
      .scl_pad_i_to_the_I2C_0                     (scl_pad_i_to_the_I2C_0),
      .scl_pad_o_from_the_I2C_0                   (scl_pad_o_from_the_I2C_0),
      .scl_padoen_o_from_the_I2C_0                (scl_padoen_o_from_the_I2C_0),
      .sda_pad_i_to_the_I2C_0                     (sda_pad_i_to_the_I2C_0),
      .sda_pad_o_from_the_I2C_0                   (sda_pad_o_from_the_I2C_0),
      .sda_padoen_o_from_the_I2C_0                (sda_padoen_o_from_the_I2C_0),
      .select_n_to_the_cfi_flash_0                (select_n_to_the_cfi_flash_0),
      .tri_state_bridge_0_address                 (tri_state_bridge_0_address),
      .tri_state_bridge_0_data                    (tri_state_bridge_0_data),
      .tri_state_bridge_0_readn                   (tri_state_bridge_0_readn),
      .txd_from_the_uart_0                        (txd_from_the_uart_0),
      .write_n_to_the_cfi_flash_0                 (write_n_to_the_cfi_flash_0),
      .zs_addr_from_the_sdram_0                   (zs_addr_from_the_sdram_0),
      .zs_ba_from_the_sdram_0                     (zs_ba_from_the_sdram_0),
      .zs_cas_n_from_the_sdram_0                  (zs_cas_n_from_the_sdram_0),
      .zs_cke_from_the_sdram_0                    (zs_cke_from_the_sdram_0),
      .zs_cs_n_from_the_sdram_0                   (zs_cs_n_from_the_sdram_0),
      .zs_dq_to_and_from_the_sdram_0              (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm_from_the_sdram_0                    (zs_dqm_from_the_sdram_0),
      .zs_ras_n_from_the_sdram_0                  (zs_ras_n_from_the_sdram_0),
      .zs_we_n_from_the_sdram_0                   (zs_we_n_from_the_sdram_0)
    );

  cfi_flash_0 the_cfi_flash_0
    (
      .address  (tri_state_bridge_0_address),
      .data     (tri_state_bridge_0_data),
      .read_n   (tri_state_bridge_0_readn),
      .select_n (select_n_to_the_cfi_flash_0),
      .write_n  (write_n_to_the_cfi_flash_0)
    );

  sdram_0_test_component the_sdram_0_test_component
    (
      .clk      (clk),
      .zs_addr  (zs_addr_from_the_sdram_0),
      .zs_ba    (zs_ba_from_the_sdram_0),
      .zs_cas_n (zs_cas_n_from_the_sdram_0),
      .zs_cke   (zs_cke_from_the_sdram_0),
      .zs_cs_n  (zs_cs_n_from_the_sdram_0),
      .zs_dq    (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm   (zs_dqm_from_the_sdram_0),
      .zs_ras_n (zs_ras_n_from_the_sdram_0),
      .zs_we_n  (zs_we_n_from_the_sdram_0)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on