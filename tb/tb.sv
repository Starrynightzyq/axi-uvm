////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2017, Matt Dew @ Dew Technologies, LLC
//
// This program is free software (logic verification): you can redistribute it
// and/or modify it under the terms of the GNU Lesser General Public License (LGPL)
// as published by the Free Software Foundation, either version 3 of the License,
// or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
// for more details.
//
// License:	LGPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/lgpl.html
//
//
// Author's intent:  If you use this AXI verification code and find or fix bugs
//                   or make improvements, then share those fixes or improvements.
//                   If you use this in a bigger project, I don't care about,
//                   or want, any changes or code outside this block.
//                   Example: If you use this in an SoC simulation/testbench
//                            I don't want, or care about, your SoC or other blocks.
//                            I just care about the enhancements to these AXI files.
//                   That's why I have choosen the LGPL instead of the GPL.
////////////////////////////////////////////////////////////////////////////////
//
//
/*! \module tb
 * \brief  Top Level.
 *
 * This is a dual-top environment.This is the top level module that instantiates DUT and TB tops.
 * Here though the DUT is two axi_if interfaces wired together with one configured as master
 * and the other configured as a slave/responder.
 */
module tb;

   import params_pkg::*;

   parameter C_AXI_ID_WIDTH   = params_pkg::AXI_ID_WIDTH;
   parameter C_AXI_ADDR_WIDTH = params_pkg::AXI_ADDR_WIDTH;
   parameter C_AXI_DATA_WIDTH = params_pkg::AXI_DATA_WIDTH;
   parameter C_AXI_LEN_WIDTH  = params_pkg::AXI_LEN_WIDTH;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import axi_uvm_pkg::*;


  logic clk;
  logic reset;

  wire                          axi_awready;
  wire [C_AXI_ID_WIDTH-1:0]	    axi_awid;
  wire [C_AXI_ADDR_WIDTH-1:0]   axi_awaddr;
  wire [C_AXI_LEN_WIDTH-1:0]    axi_awlen;    // Write Burst Length
  wire [2:0]                    axi_awsize;	  // Write Burst size
  wire [1:0]                    axi_awburst;  // Write Burst type
  wire [0:0]                    axi_awlock;   // Write lock type
  wire [3:0]                    axi_awcache;  // Write Cache type
  wire [2:0]                    axi_awprot;   // Write Protection type
  wire [3:0]                    axi_awqos;    // Write Quality of Svc
  wire                          axi_awvalid;  // Write address valid

  // AXI write data channel signals
  wire                          axi_wready;   // Write data ready
  wire [C_AXI_DATA_WIDTH-1:0]   axi_wdata;    // Write data
  wire [C_AXI_DATA_WIDTH/8-1:0] axi_wstrb;    // Write strobes
  wire                          axi_wlast;    // Last write transaction
  wire                          axi_wvalid;   // Write valid

  // AXI write response channel signals
  wire [C_AXI_ID_WIDTH-1:0]     axi_bid;      // Response ID
  wire [1:0]                    axi_bresp;    // Write response
  wire                          axi_bvalid;   // Write reponse valid
  wire                          axi_bready;   // Response ready

  // AXI read address channel signals
  wire                         axi_arready; // Read address ready
  wire [C_AXI_ID_WIDTH-1:0]    axi_arid;    // Read ID
  wire [C_AXI_ADDR_WIDTH-1:0]  axi_araddr;  // Read address
  wire [C_AXI_LEN_WIDTH-1:0]   axi_arlen;  // Read Burst Length
  wire [2:0]                   axi_arsize;  // Read Burst size
  wire [1:0]                   axi_arburst; // Read Burst type
  wire [0:0]                   axi_arlock;  // Read lock type
  wire [3:0]                   axi_arcache; // Read Cache type
  wire [2:0]                   axi_arprot;  // Read Protection type
  wire [3:0]                   axi_arqos;   // Read Protection type
  wire                         axi_arvalid; // Read address valid

// AXI read data channel signals
  wire [C_AXI_ID_WIDTH-1:0]    axi_rid;     // Response ID
  wire [1:0]		           axi_rresp;   // Read response
  wire                         axi_rvalid;  // Read reponse valid
  wire [C_AXI_DATA_WIDTH-1:0]  axi_rdata;   // Read data
  wire                         axi_rlast;   // Read last
  wire                         axi_rready;  // Read Response ready

//  wire                            o_reset;
  wire                            wb_cyc;
  wire                            wb_stb;
  wire                            wb_we;
  wire [(C_AXI_ADDR_WIDTH-1):0]   wb_addr;
  wire [(C_AXI_DATA_WIDTH-1):0]   wb_indata;
  wire [(C_AXI_DATA_WIDTH-1):0]   wb_outdata;
  wire [(C_AXI_DATA_WIDTH/8-1):0] wb_sel;
  wire                            wb_ack;
  wire                            wb_stall;
  wire                            wb_err;
  int transactions;                    

  /*! Driver instantiation */
  axi_if #(.C_AXI_ID_WIDTH      (C_AXI_ID_WIDTH),
              .C_AXI_DATA_WIDTH (C_AXI_DATA_WIDTH),
              .C_AXI_ADDR_WIDTH (C_AXI_ADDR_WIDTH),
              .C_AXI_LEN_WIDTH  (C_AXI_LEN_WIDTH)
          ) axi_driver_vif (.clk   (clk),
               .reset (reset),
               .awready(axi_awready),
               .awid(axi_awid),
               .awaddr(axi_awaddr),
               .awlen(axi_awlen),
               .awsize(axi_awsize),
               .awburst(axi_awburst),
               .awlock(axi_awlock),
               .awcache(axi_awcache),
               .awprot(axi_awprot),
               .awqos(axi_awqos),
               .awvalid(axi_awvalid),

               .wready(axi_wready),
               .wdata(axi_wdata),
               .wstrb(axi_wstrb),
               .wlast(axi_wlast),
               .wvalid(axi_wvalid),

               .bid(axi_bid),
               .bresp(axi_bresp),
               .bvalid(axi_bvalid),
               .bready(axi_bready),

               .arready(axi_arready),
               .arid(axi_arid),
               .araddr(axi_araddr),
               .arlen(axi_arlen),
               .arsize(axi_arsize),
               .arburst(axi_arburst),
               .arlock(axi_arlock),
               .arcache(axi_arcache),
               .arprot(axi_arprot),
               .arqos(axi_arqos),
               .arvalid(axi_arvalid),

               .rid(axi_rid),
               .rresp(axi_rresp),
               .rvalid(axi_rvalid),
               .rdata(axi_rdata),
               .rlast(axi_rlast),
               .rready(axi_rready)
             );

  /*! Slave/responder instantiation */
    axi_if #(.C_AXI_ID_WIDTH   (C_AXI_ID_WIDTH),
             .C_AXI_DATA_WIDTH (C_AXI_DATA_WIDTH),
             .C_AXI_ADDR_WIDTH (C_AXI_ADDR_WIDTH),
             .C_AXI_LEN_WIDTH  (C_AXI_LEN_WIDTH)
            ) axi_responder_vif (.clk   (clk),
               .reset (reset),
               .awready(axi_awready),
               .awid(axi_awid),
               .awaddr(axi_awaddr),
               .awlen(axi_awlen),
               .awsize(axi_awsize),
               .awburst(axi_awburst),
               .awlock(axi_awlock),
               .awcache(axi_awcache),
               .awprot(axi_awprot),
               .awqos(axi_awqos),
               .awvalid(axi_awvalid),

               .wready(axi_wready),
               .wdata(axi_wdata),
               .wstrb(axi_wstrb),
               .wlast(axi_wlast),
               .wvalid(axi_wvalid),

               .bid(axi_bid),
               .bresp(axi_bresp),
               .bvalid(axi_bvalid),
               .bready(axi_bready),

               .arready(axi_arready),
               .arid(axi_arid),
               .araddr(axi_araddr),
               .arlen(axi_arlen),
               .arsize(axi_arsize),
               .arburst(axi_arburst),
               .arlock(axi_arlock),
               .arcache(axi_arcache),
               .arprot(axi_arprot),
               .arqos(axi_arqos),
               .arvalid(axi_arvalid),

               .rid(axi_rid),
               .rresp(axi_rresp),
               .rvalid(axi_rvalid),
               .rdata(axi_rdata),
               .rlast(axi_rlast),
               .rready(axi_rready)
             );

//     DMATopAXI_AXIL_AXI dut(
//     .clock                 ( clk                   ),
//     .reset                 ( reset                 ),
//     .io_control_aw_awaddr  (                       ),
//     .io_control_aw_awprot  (                       ),
//     .io_control_aw_awvalid (                       ),
//     .io_control_aw_awready (                       ),
//     .io_control_w_wdata    (                       ),
//     .io_control_w_wstrb    (                       ),
//     .io_control_w_wvalid   (                       ),
//     .io_control_w_wready   (                       ),
//     .io_control_b_bresp    (                       ),
//     .io_control_b_bvalid   (                       ),
//     .io_control_b_bready   (                       ),
//     .io_control_ar_araddr  (                       ),
//     .io_control_ar_arprot  (                       ),
//     .io_control_ar_arvalid (                       ),
//     .io_control_ar_arready (                       ),
//     .io_control_r_rdata    (                       ),
//     .io_control_r_rresp    (                       ),
//     .io_control_r_rvalid   (                       ),
//     .io_control_r_rready   (                       ),
//     .io_read_aw_awid       (                       ),
//     .io_read_aw_awaddr     (                       ),
//     .io_read_aw_awlen      (                       ),
//     .io_read_aw_awsize     (                       ),
//     .io_read_aw_awburst    (                       ),
//     .io_read_aw_awlock     (                       ),
//     .io_read_aw_awcache    (                       ),
//     .io_read_aw_awprot     (                       ),
//     .io_read_aw_awqos      (                       ),
//     .io_read_aw_awvalid    (                       ),
//     .io_read_aw_awready    (                       ),
//     .io_read_w_wdata       (                       ),
//     .io_read_w_wstrb       (                       ),
//     .io_read_w_wlast       (                       ),
//     .io_read_w_wvalid      (                       ),
//     .io_read_w_wready      (                       ),
//     .io_read_b_bid         (                       ),
//     .io_read_b_bresp       (                       ),
//     .io_read_b_bvalid      (                       ),
//     .io_read_b_bready      (                       ),
//     .io_read_ar_arid       (                       ),
//     .io_read_ar_araddr     (                       ),
//     .io_read_ar_arlen      (                       ),
//     .io_read_ar_arsize     (                       ),
//     .io_read_ar_arburst    (                       ),
//     .io_read_ar_arlock     (                       ),
//     .io_read_ar_arcache    (                       ),
//     .io_read_ar_arprot     (                       ),
//     .io_read_ar_arqos      (                       ),
//     .io_read_ar_arvalid    (                       ),
//     .io_read_ar_arready    (                       ),
//     .io_read_r_rid         (                       ),
//     .io_read_r_rdata       (                       ),
//     .io_read_r_rresp       (                       ),
//     .io_read_r_rlast       (                       ),
//     .io_read_r_rvalid      (                       ),
//     .io_read_r_rready      (                       ),
//     .io_write_aw_awid      ( axi_awid              ),
//     .io_write_aw_awaddr    ( axi_awaddr            ),
//     .io_write_aw_awlen     ( axi_awlen             ),
//     .io_write_aw_awsize    ( axi_awsize            ),
//     .io_write_aw_awburst   ( axi_awburst           ),
//     .io_write_aw_awlock    ( axi_awlock            ),
//     .io_write_aw_awcache   ( axi_awcache           ),
//     .io_write_aw_awprot    ( axi_awprot            ),
//     .io_write_aw_awqos     ( axi_awqos             ),
//     .io_write_aw_awvalid   ( axi_awvalid           ),
//     .io_write_aw_awready   ( axi_awready           ),
//     .io_write_w_wdata      ( axi_wdata             ),
//     .io_write_w_wstrb      ( axi_wstrb             ),
//     .io_write_w_wlast      ( axi_wlast             ),
//     .io_write_w_wvalid     ( axi_wvalid            ),
//     .io_write_w_wready     ( axi_wready            ),
//     .io_write_b_bid        ( axi_bid               ),
//     .io_write_b_bresp      ( axi_bresp             ),
//     .io_write_b_bvalid     ( axi_bvalid            ),
//     .io_write_b_bready     ( axi_bready            ),
//     .io_write_ar_arid      ( axi_arid              ),
//     .io_write_ar_araddr    ( axi_araddr            ),
//     .io_write_ar_arlen     ( axi_arlen             ),
//     .io_write_ar_arsize    ( axi_arsize            ),
//     .io_write_ar_arburst   ( axi_arburst           ),
//     .io_write_ar_arlock    ( axi_arlock            ),
//     .io_write_ar_arcache   ( axi_arcache           ),
//     .io_write_ar_arprot    ( axi_arprot            ),
//     .io_write_ar_arqos     ( axi_arqos             ),
//     .io_write_ar_arvalid   ( axi_arvalid           ),
//     .io_write_ar_arready   ( axi_arready           ),
//     .io_write_r_rid        ( axi_rid               ),
//     .io_write_r_rdata      ( axi_rdata             ),
//     .io_write_r_rresp      ( axi_rresp             ),
//     .io_write_r_rlast      ( axi_rlast             ),
//     .io_write_r_rvalid     ( axi_rvalid            ),
//     .io_write_r_rready     ( axi_rready            ),
//     .io_irq_readerDone     (                       ),
//     .io_irq_writerDone     (                       ),
//     .io_sync_readerSync    (                       ),
//     .io_sync_writerSync    (                       )
// );
          

  // tbx clkgen
initial begin
   clk = 0;
   forever begin
      #(10/2) clk = ~clk;
   end
end

// tbx clkgen
initial begin
   reset = 1;
   #100 reset = 0;
end

initial begin

  if ($value$plusargs("transactions=%d", transactions)) begin
    `uvm_info("plusargs", $sformatf("TRANSACTIONS: %0d", transactions), UVM_INFO)
  end

  uvm_config_db #(int)::set(null, "*", "AXI_ADDR_WIDTH", C_AXI_ADDR_WIDTH);
  uvm_config_db #(int)::set(null, "*", "AXI_DATA_WIDTH", C_AXI_DATA_WIDTH);
  uvm_config_db #(int)::set(null, "*", "AXI_ID_WIDTH",   C_AXI_ID_WIDTH);
  uvm_config_db #(int)::set(null, "*", "AXI_LEN_WIDTH",  C_AXI_LEN_WIDTH);

  axi_driver_vif.use_concrete_class();
  axi_responder_vif.use_concrete_class();

  //run_test("axi_sequential_writes_test");
  run_test();

end

// dump wave for modesim
// initial begin
  // $dumpfile("dump.vcd");
  // //$dumpvars(0, dut.axi_write_decoder); //(1);
  // $dumpvars(1); //(1);
// end

// dump wave for VCS
initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars();
    $fsdbDumpon;
end

endmodule : tb
