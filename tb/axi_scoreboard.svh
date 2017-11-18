////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2017, Matt Dew
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
/*! \class axi_scoreboard
 *  \brief scoreboard
 *
 * Tracks number of Write Address transactions and Write Response transactions
 *
 */
class axi_scoreboard extends uvm_subscriber #(axi_seq_item);
  `uvm_component_utils(axi_scoreboard)



  extern function new (string name="axi_scoreboard", uvm_component parent=null);

  extern function void build_phase              (uvm_phase phase);
  extern function void connect_phase            (uvm_phase phase);
  extern task          run_phase                (uvm_phase phase);


  extern virtual function void write                    (axi_seq_item t);

  int write_address_cntr=0;
  int write_response_cntr=0;

endclass : axi_scoreboard

/*! \brief Constructor
 *
 * Doesn't actually do anything except call parent constructor */
function axi_scoreboard::new (string name="axi_scoreboard", uvm_component parent=null);
  super.new(name, parent);
endfunction : new

/*! \brief currently does nothing
 *
 * Doesn't actually do anything except call parent build_phase */
function void axi_scoreboard::build_phase (uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

/*! \brief currently does nothing
 *
 * Doesn't actually do anything except call parent connect_phase */
function void axi_scoreboard::connect_phase (uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

/*! \brief currently does nothing
 *
 */
task axi_scoreboard::run_phase(uvm_phase phase);
endtask : run_phase

/*! \brief Updates counters
 *
 * Currently just updates two counters. */
function void axi_scoreboard::write(axi_seq_item t);
  `uvm_info("SCOREBOARD", $sformatf("%s", t.convert2string()), UVM_HIGH)

  case(t.cmd)
     e_WRITE : begin
       write_address_cntr++;
       `uvm_info("SCOREBOARD",
                 $sformatf("write_address_cntr=%0d", write_address_cntr),
                 UVM_HIGH)
     end
     e_WRITE_RESPONSE : begin
       write_response_cntr++;
       `uvm_info("SCOREBOARD",
                 $sformatf("write_response_cntr=%0d", write_response_cntr),
                 UVM_HIGH)

     end

  endcase

endfunction : write
