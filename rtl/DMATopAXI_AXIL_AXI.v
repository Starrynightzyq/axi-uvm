module AXI4LiteCSR( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_ctl_aw_awaddr, // @[:@6.4]
  input         io_ctl_aw_awvalid, // @[:@6.4]
  output        io_ctl_aw_awready, // @[:@6.4]
  input  [31:0] io_ctl_w_wdata, // @[:@6.4]
  input         io_ctl_w_wvalid, // @[:@6.4]
  output        io_ctl_w_wready, // @[:@6.4]
  output        io_ctl_b_bvalid, // @[:@6.4]
  input         io_ctl_b_bready, // @[:@6.4]
  input  [31:0] io_ctl_ar_araddr, // @[:@6.4]
  input         io_ctl_ar_arvalid, // @[:@6.4]
  output        io_ctl_ar_arready, // @[:@6.4]
  output [31:0] io_ctl_r_rdata, // @[:@6.4]
  output        io_ctl_r_rvalid, // @[:@6.4]
  input         io_ctl_r_rready, // @[:@6.4]
  output [3:0]  io_bus_addr, // @[:@6.4]
  output [31:0] io_bus_dataOut, // @[:@6.4]
  input  [31:0] io_bus_dataIn, // @[:@6.4]
  output        io_bus_write, // @[:@6.4]
  output        io_bus_read // @[:@6.4]
);
  reg [2:0] state; // @[AXI4LiteCSR.scala 31:22:@8.4]
  reg [31:0] _RAND_0;
  reg  awready; // @[AXI4LiteCSR.scala 33:24:@9.4]
  reg [31:0] _RAND_1;
  reg  wready; // @[AXI4LiteCSR.scala 34:23:@10.4]
  reg [31:0] _RAND_2;
  reg  bvalid; // @[AXI4LiteCSR.scala 35:23:@11.4]
  reg [31:0] _RAND_3;
  reg  arready; // @[AXI4LiteCSR.scala 38:24:@14.4]
  reg [31:0] _RAND_4;
  reg  rvalid; // @[AXI4LiteCSR.scala 39:23:@15.4]
  reg [31:0] _RAND_5;
  reg [31:0] addr; // @[AXI4LiteCSR.scala 42:21:@18.4]
  reg [31:0] _RAND_6;
  wire  _T_110; // @[AXI4LiteCSR.scala 56:34:@28.4]
  wire  _T_111; // @[AXI4LiteCSR.scala 57:35:@30.4]
  wire  _T_112; // @[Conditional.scala 37:30:@33.4]
  wire [3:0] _T_113; // @[AXI4LiteCSR.scala 64:33:@37.8]
  wire [3:0] _T_115; // @[AXI4LiteCSR.scala 69:33:@44.10]
  wire [2:0] _GEN_0; // @[AXI4LiteCSR.scala 67:36:@42.8]
  wire [31:0] _GEN_1; // @[AXI4LiteCSR.scala 67:36:@42.8]
  wire  _GEN_2; // @[AXI4LiteCSR.scala 67:36:@42.8]
  wire [2:0] _GEN_3; // @[AXI4LiteCSR.scala 62:30:@35.6]
  wire [31:0] _GEN_4; // @[AXI4LiteCSR.scala 62:30:@35.6]
  wire  _GEN_5; // @[AXI4LiteCSR.scala 62:30:@35.6]
  wire  _GEN_6; // @[AXI4LiteCSR.scala 62:30:@35.6]
  wire  _T_117; // @[Conditional.scala 37:30:@50.6]
  wire  _T_118; // @[AXI4LiteCSR.scala 74:30:@52.8]
  wire [2:0] _GEN_7; // @[AXI4LiteCSR.scala 74:41:@53.8]
  wire  _GEN_8; // @[AXI4LiteCSR.scala 74:41:@53.8]
  wire  _GEN_9; // @[AXI4LiteCSR.scala 74:41:@53.8]
  wire  _T_121; // @[Conditional.scala 37:30:@60.8]
  wire [2:0] _GEN_10; // @[AXI4LiteCSR.scala 81:38:@63.10]
  wire  _GEN_11; // @[AXI4LiteCSR.scala 81:38:@63.10]
  wire  _T_124; // @[Conditional.scala 37:30:@69.10]
  wire  _T_125; // @[AXI4LiteCSR.scala 87:30:@71.12]
  wire [2:0] _GEN_12; // @[AXI4LiteCSR.scala 87:41:@72.12]
  wire  _GEN_13; // @[AXI4LiteCSR.scala 87:41:@72.12]
  wire  _GEN_14; // @[AXI4LiteCSR.scala 87:41:@72.12]
  wire  _T_128; // @[Conditional.scala 37:30:@79.12]
  wire [2:0] _GEN_15; // @[AXI4LiteCSR.scala 94:38:@82.14]
  wire  _GEN_16; // @[AXI4LiteCSR.scala 94:38:@82.14]
  wire  _GEN_17; // @[AXI4LiteCSR.scala 94:38:@82.14]
  wire  _T_132; // @[Conditional.scala 37:30:@89.14]
  wire  _T_133; // @[AXI4LiteCSR.scala 101:28:@91.16]
  wire [2:0] _GEN_18; // @[AXI4LiteCSR.scala 101:38:@92.16]
  wire  _GEN_19; // @[AXI4LiteCSR.scala 101:38:@92.16]
  wire [2:0] _GEN_20; // @[Conditional.scala 39:67:@90.14]
  wire  _GEN_21; // @[Conditional.scala 39:67:@90.14]
  wire [2:0] _GEN_22; // @[Conditional.scala 39:67:@80.12]
  wire  _GEN_23; // @[Conditional.scala 39:67:@80.12]
  wire  _GEN_24; // @[Conditional.scala 39:67:@80.12]
  wire [2:0] _GEN_25; // @[Conditional.scala 39:67:@70.10]
  wire  _GEN_26; // @[Conditional.scala 39:67:@70.10]
  wire  _GEN_27; // @[Conditional.scala 39:67:@70.10]
  wire  _GEN_28; // @[Conditional.scala 39:67:@70.10]
  wire [2:0] _GEN_29; // @[Conditional.scala 39:67:@61.8]
  wire  _GEN_30; // @[Conditional.scala 39:67:@61.8]
  wire  _GEN_31; // @[Conditional.scala 39:67:@61.8]
  wire  _GEN_32; // @[Conditional.scala 39:67:@61.8]
  wire  _GEN_33; // @[Conditional.scala 39:67:@61.8]
  wire [2:0] _GEN_34; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_35; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_36; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_37; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_38; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_39; // @[Conditional.scala 39:67:@51.6]
  wire [2:0] _GEN_40; // @[Conditional.scala 40:58:@34.4]
  wire [31:0] _GEN_41; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_42; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_43; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_44; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_45; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_46; // @[Conditional.scala 40:58:@34.4]
  assign _T_110 = io_ctl_r_rready & rvalid; // @[AXI4LiteCSR.scala 56:34:@28.4]
  assign _T_111 = io_ctl_w_wvalid & wready; // @[AXI4LiteCSR.scala 57:35:@30.4]
  assign _T_112 = 3'h0 == state; // @[Conditional.scala 37:30:@33.4]
  assign _T_113 = io_ctl_aw_awaddr[5:2]; // @[AXI4LiteCSR.scala 64:33:@37.8]
  assign _T_115 = io_ctl_ar_araddr[5:2]; // @[AXI4LiteCSR.scala 69:33:@44.10]
  assign _GEN_0 = io_ctl_ar_arvalid ? 3'h1 : state; // @[AXI4LiteCSR.scala 67:36:@42.8]
  assign _GEN_1 = io_ctl_ar_arvalid ? {{28'd0}, _T_115} : addr; // @[AXI4LiteCSR.scala 67:36:@42.8]
  assign _GEN_2 = io_ctl_ar_arvalid ? 1'h1 : arready; // @[AXI4LiteCSR.scala 67:36:@42.8]
  assign _GEN_3 = io_ctl_aw_awvalid ? 3'h3 : _GEN_0; // @[AXI4LiteCSR.scala 62:30:@35.6]
  assign _GEN_4 = io_ctl_aw_awvalid ? {{28'd0}, _T_113} : _GEN_1; // @[AXI4LiteCSR.scala 62:30:@35.6]
  assign _GEN_5 = io_ctl_aw_awvalid ? 1'h1 : awready; // @[AXI4LiteCSR.scala 62:30:@35.6]
  assign _GEN_6 = io_ctl_aw_awvalid ? arready : _GEN_2; // @[AXI4LiteCSR.scala 62:30:@35.6]
  assign _T_117 = 3'h1 == state; // @[Conditional.scala 37:30:@50.6]
  assign _T_118 = io_ctl_ar_arvalid & arready; // @[AXI4LiteCSR.scala 74:30:@52.8]
  assign _GEN_7 = _T_118 ? 3'h2 : state; // @[AXI4LiteCSR.scala 74:41:@53.8]
  assign _GEN_8 = _T_118 ? 1'h0 : arready; // @[AXI4LiteCSR.scala 74:41:@53.8]
  assign _GEN_9 = _T_118 ? 1'h1 : rvalid; // @[AXI4LiteCSR.scala 74:41:@53.8]
  assign _T_121 = 3'h2 == state; // @[Conditional.scala 37:30:@60.8]
  assign _GEN_10 = _T_110 ? 3'h0 : state; // @[AXI4LiteCSR.scala 81:38:@63.10]
  assign _GEN_11 = _T_110 ? 1'h0 : rvalid; // @[AXI4LiteCSR.scala 81:38:@63.10]
  assign _T_124 = 3'h3 == state; // @[Conditional.scala 37:30:@69.10]
  assign _T_125 = io_ctl_aw_awvalid & awready; // @[AXI4LiteCSR.scala 87:30:@71.12]
  assign _GEN_12 = _T_125 ? 3'h4 : state; // @[AXI4LiteCSR.scala 87:41:@72.12]
  assign _GEN_13 = _T_125 ? 1'h0 : awready; // @[AXI4LiteCSR.scala 87:41:@72.12]
  assign _GEN_14 = _T_125 ? 1'h1 : wready; // @[AXI4LiteCSR.scala 87:41:@72.12]
  assign _T_128 = 3'h4 == state; // @[Conditional.scala 37:30:@79.12]
  assign _GEN_15 = _T_111 ? 3'h5 : state; // @[AXI4LiteCSR.scala 94:38:@82.14]
  assign _GEN_16 = _T_111 ? 1'h0 : wready; // @[AXI4LiteCSR.scala 94:38:@82.14]
  assign _GEN_17 = _T_111 ? 1'h1 : bvalid; // @[AXI4LiteCSR.scala 94:38:@82.14]
  assign _T_132 = 3'h5 == state; // @[Conditional.scala 37:30:@89.14]
  assign _T_133 = io_ctl_b_bready & bvalid; // @[AXI4LiteCSR.scala 101:28:@91.16]
  assign _GEN_18 = _T_133 ? 3'h0 : state; // @[AXI4LiteCSR.scala 101:38:@92.16]
  assign _GEN_19 = _T_133 ? 1'h0 : bvalid; // @[AXI4LiteCSR.scala 101:38:@92.16]
  assign _GEN_20 = _T_132 ? _GEN_18 : state; // @[Conditional.scala 39:67:@90.14]
  assign _GEN_21 = _T_132 ? _GEN_19 : bvalid; // @[Conditional.scala 39:67:@90.14]
  assign _GEN_22 = _T_128 ? _GEN_15 : _GEN_20; // @[Conditional.scala 39:67:@80.12]
  assign _GEN_23 = _T_128 ? _GEN_16 : wready; // @[Conditional.scala 39:67:@80.12]
  assign _GEN_24 = _T_128 ? _GEN_17 : _GEN_21; // @[Conditional.scala 39:67:@80.12]
  assign _GEN_25 = _T_124 ? _GEN_12 : _GEN_22; // @[Conditional.scala 39:67:@70.10]
  assign _GEN_26 = _T_124 ? _GEN_13 : awready; // @[Conditional.scala 39:67:@70.10]
  assign _GEN_27 = _T_124 ? _GEN_14 : _GEN_23; // @[Conditional.scala 39:67:@70.10]
  assign _GEN_28 = _T_124 ? bvalid : _GEN_24; // @[Conditional.scala 39:67:@70.10]
  assign _GEN_29 = _T_121 ? _GEN_10 : _GEN_25; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_30 = _T_121 ? _GEN_11 : rvalid; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_31 = _T_121 ? awready : _GEN_26; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_32 = _T_121 ? wready : _GEN_27; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_33 = _T_121 ? bvalid : _GEN_28; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_34 = _T_117 ? _GEN_7 : _GEN_29; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_35 = _T_117 ? _GEN_8 : arready; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_36 = _T_117 ? _GEN_9 : _GEN_30; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_37 = _T_117 ? awready : _GEN_31; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_38 = _T_117 ? wready : _GEN_32; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_39 = _T_117 ? bvalid : _GEN_33; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_40 = _T_112 ? _GEN_3 : _GEN_34; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_41 = _T_112 ? _GEN_4 : addr; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_42 = _T_112 ? _GEN_5 : _GEN_37; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_43 = _T_112 ? _GEN_6 : _GEN_35; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_44 = _T_112 ? rvalid : _GEN_36; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_45 = _T_112 ? wready : _GEN_38; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_46 = _T_112 ? bvalid : _GEN_39; // @[Conditional.scala 40:58:@34.4]
  assign io_ctl_aw_awready = awready; // @[AXI4LiteCSR.scala 47:21:@21.4]
  assign io_ctl_w_wready = wready; // @[AXI4LiteCSR.scala 48:19:@22.4]
  assign io_ctl_b_bvalid = bvalid; // @[AXI4LiteCSR.scala 49:19:@23.4]
  assign io_ctl_ar_arready = arready; // @[AXI4LiteCSR.scala 52:21:@25.4]
  assign io_ctl_r_rdata = io_bus_dataIn; // @[AXI4LiteCSR.scala 44:18:@19.4]
  assign io_ctl_r_rvalid = rvalid; // @[AXI4LiteCSR.scala 53:19:@26.4]
  assign io_bus_addr = addr[3:0]; // @[AXI4LiteCSR.scala 58:15:@32.4]
  assign io_bus_dataOut = io_ctl_w_wdata; // @[AXI4LiteCSR.scala 45:18:@20.4]
  assign io_bus_write = io_ctl_w_wvalid & wready; // @[AXI4LiteCSR.scala 57:16:@31.4]
  assign io_bus_read = io_ctl_r_rready & rvalid; // @[AXI4LiteCSR.scala 56:15:@29.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  awready = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  wready = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  bvalid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  arready = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  rvalid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  addr = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_112) begin
        if (io_ctl_aw_awvalid) begin
          state <= 3'h3;
        end else begin
          if (io_ctl_ar_arvalid) begin
            state <= 3'h1;
          end
        end
      end else begin
        if (_T_117) begin
          if (_T_118) begin
            state <= 3'h2;
          end
        end else begin
          if (_T_121) begin
            if (_T_110) begin
              state <= 3'h0;
            end
          end else begin
            if (_T_124) begin
              if (_T_125) begin
                state <= 3'h4;
              end
            end else begin
              if (_T_128) begin
                if (_T_111) begin
                  state <= 3'h5;
                end
              end else begin
                if (_T_132) begin
                  if (_T_133) begin
                    state <= 3'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      awready <= 1'h0;
    end else begin
      if (_T_112) begin
        if (io_ctl_aw_awvalid) begin
          awready <= 1'h1;
        end
      end else begin
        if (!(_T_117)) begin
          if (!(_T_121)) begin
            if (_T_124) begin
              if (_T_125) begin
                awready <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      wready <= 1'h0;
    end else begin
      if (!(_T_112)) begin
        if (!(_T_117)) begin
          if (!(_T_121)) begin
            if (_T_124) begin
              if (_T_125) begin
                wready <= 1'h1;
              end
            end else begin
              if (_T_128) begin
                if (_T_111) begin
                  wready <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      bvalid <= 1'h0;
    end else begin
      if (!(_T_112)) begin
        if (!(_T_117)) begin
          if (!(_T_121)) begin
            if (!(_T_124)) begin
              if (_T_128) begin
                if (_T_111) begin
                  bvalid <= 1'h1;
                end
              end else begin
                if (_T_132) begin
                  if (_T_133) begin
                    bvalid <= 1'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      arready <= 1'h0;
    end else begin
      if (_T_112) begin
        if (!(io_ctl_aw_awvalid)) begin
          if (io_ctl_ar_arvalid) begin
            arready <= 1'h1;
          end
        end
      end else begin
        if (_T_117) begin
          if (_T_118) begin
            arready <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      rvalid <= 1'h0;
    end else begin
      if (!(_T_112)) begin
        if (_T_117) begin
          if (_T_118) begin
            rvalid <= 1'h1;
          end
        end else begin
          if (_T_121) begin
            if (_T_110) begin
              rvalid <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      addr <= 32'h0;
    end else begin
      if (_T_112) begin
        if (io_ctl_aw_awvalid) begin
          addr <= {{28'd0}, _T_113};
        end else begin
          if (io_ctl_ar_arvalid) begin
            addr <= {{28'd0}, _T_115};
          end
        end
      end
    end
  end
endmodule
module AXI4Reader( // @[:@98.2]
  input         clock, // @[:@99.4]
  input         reset, // @[:@100.4]
  output [31:0] io_bus_ar_araddr, // @[:@101.4]
  output [7:0]  io_bus_ar_arlen, // @[:@101.4]
  output        io_bus_ar_arvalid, // @[:@101.4]
  input         io_bus_ar_arready, // @[:@101.4]
  input  [31:0] io_bus_r_rdata, // @[:@101.4]
  input         io_bus_r_rlast, // @[:@101.4]
  input         io_bus_r_rvalid, // @[:@101.4]
  output        io_bus_r_rready, // @[:@101.4]
  input         io_dataIO_ready, // @[:@101.4]
  output        io_dataIO_valid, // @[:@101.4]
  output [31:0] io_dataIO_bits, // @[:@101.4]
  output        io_xfer_done, // @[:@101.4]
  input  [31:0] io_xfer_address, // @[:@101.4]
  input  [31:0] io_xfer_length, // @[:@101.4]
  input         io_xfer_valid // @[:@101.4]
);
  reg [1:0] state; // @[AXI4Reader.scala 34:22:@103.4]
  reg [31:0] _RAND_0;
  reg  done; // @[AXI4Reader.scala 36:21:@104.4]
  reg [31:0] _RAND_1;
  reg  enable; // @[AXI4Reader.scala 37:23:@105.4]
  reg [31:0] _RAND_2;
  reg [31:0] araddr; // @[AXI4Reader.scala 39:23:@107.4]
  reg [31:0] _RAND_3;
  reg [7:0] arlen; // @[AXI4Reader.scala 40:22:@108.4]
  reg [31:0] _RAND_4;
  reg  arvalid; // @[AXI4Reader.scala 41:24:@109.4]
  reg [31:0] _RAND_5;
  wire  ready; // @[AXI4Reader.scala 44:40:@112.4]
  wire  valid; // @[AXI4Reader.scala 45:40:@115.4]
  wire  _T_231; // @[Conditional.scala 37:30:@189.4]
  wire [32:0] _T_235; // @[AXI4Reader.scala 64:33:@196.8]
  wire [32:0] _T_236; // @[AXI4Reader.scala 64:33:@197.8]
  wire [31:0] _T_237; // @[AXI4Reader.scala 64:33:@198.8]
  wire [1:0] _GEN_0; // @[AXI4Reader.scala 60:26:@192.6]
  wire  _GEN_1; // @[AXI4Reader.scala 60:26:@192.6]
  wire [31:0] _GEN_2; // @[AXI4Reader.scala 60:26:@192.6]
  wire [31:0] _GEN_3; // @[AXI4Reader.scala 60:26:@192.6]
  wire  _T_238; // @[Conditional.scala 37:30:@203.6]
  wire  _T_239; // @[AXI4Reader.scala 68:20:@205.8]
  wire [1:0] _GEN_4; // @[AXI4Reader.scala 68:41:@206.8]
  wire  _GEN_5; // @[AXI4Reader.scala 68:41:@206.8]
  wire  _GEN_6; // @[AXI4Reader.scala 68:41:@206.8]
  wire  _T_242; // @[Conditional.scala 37:30:@213.8]
  wire  _T_243; // @[AXI4Reader.scala 75:18:@215.10]
  wire [1:0] _GEN_7; // @[AXI4Reader.scala 76:29:@217.12]
  wire  _GEN_8; // @[AXI4Reader.scala 76:29:@217.12]
  wire [1:0] _GEN_9; // @[AXI4Reader.scala 75:27:@216.10]
  wire  _GEN_10; // @[AXI4Reader.scala 75:27:@216.10]
  wire  _T_245; // @[Conditional.scala 37:30:@224.10]
  wire  _GEN_11; // @[Conditional.scala 39:67:@225.10]
  wire [1:0] _GEN_12; // @[Conditional.scala 39:67:@225.10]
  wire [1:0] _GEN_13; // @[Conditional.scala 39:67:@214.8]
  wire  _GEN_14; // @[Conditional.scala 39:67:@214.8]
  wire  _GEN_15; // @[Conditional.scala 39:67:@214.8]
  wire [1:0] _GEN_16; // @[Conditional.scala 39:67:@204.6]
  wire  _GEN_17; // @[Conditional.scala 39:67:@204.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@204.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@204.6]
  wire  _GEN_20; // @[Conditional.scala 40:58:@190.4]
  wire [1:0] _GEN_21; // @[Conditional.scala 40:58:@190.4]
  wire  _GEN_22; // @[Conditional.scala 40:58:@190.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@190.4]
  wire [31:0] _GEN_24; // @[Conditional.scala 40:58:@190.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@190.4]
  assign ready = io_dataIO_ready & enable; // @[AXI4Reader.scala 44:40:@112.4]
  assign valid = io_bus_r_rvalid & enable; // @[AXI4Reader.scala 45:40:@115.4]
  assign _T_231 = 2'h0 == state; // @[Conditional.scala 37:30:@189.4]
  assign _T_235 = io_xfer_length - 32'h1; // @[AXI4Reader.scala 64:33:@196.8]
  assign _T_236 = $unsigned(_T_235); // @[AXI4Reader.scala 64:33:@197.8]
  assign _T_237 = _T_236[31:0]; // @[AXI4Reader.scala 64:33:@198.8]
  assign _GEN_0 = io_xfer_valid ? 2'h1 : state; // @[AXI4Reader.scala 60:26:@192.6]
  assign _GEN_1 = io_xfer_valid ? 1'h1 : arvalid; // @[AXI4Reader.scala 60:26:@192.6]
  assign _GEN_2 = io_xfer_valid ? io_xfer_address : araddr; // @[AXI4Reader.scala 60:26:@192.6]
  assign _GEN_3 = io_xfer_valid ? _T_237 : {{24'd0}, arlen}; // @[AXI4Reader.scala 60:26:@192.6]
  assign _T_238 = 2'h1 == state; // @[Conditional.scala 37:30:@203.6]
  assign _T_239 = arvalid & io_bus_ar_arready; // @[AXI4Reader.scala 68:20:@205.8]
  assign _GEN_4 = _T_239 ? 2'h2 : state; // @[AXI4Reader.scala 68:41:@206.8]
  assign _GEN_5 = _T_239 ? 1'h0 : arvalid; // @[AXI4Reader.scala 68:41:@206.8]
  assign _GEN_6 = _T_239 ? 1'h1 : enable; // @[AXI4Reader.scala 68:41:@206.8]
  assign _T_242 = 2'h2 == state; // @[Conditional.scala 37:30:@213.8]
  assign _T_243 = ready & valid; // @[AXI4Reader.scala 75:18:@215.10]
  assign _GEN_7 = io_bus_r_rlast ? 2'h3 : state; // @[AXI4Reader.scala 76:29:@217.12]
  assign _GEN_8 = io_bus_r_rlast ? 1'h0 : enable; // @[AXI4Reader.scala 76:29:@217.12]
  assign _GEN_9 = _T_243 ? _GEN_7 : state; // @[AXI4Reader.scala 75:27:@216.10]
  assign _GEN_10 = _T_243 ? _GEN_8 : enable; // @[AXI4Reader.scala 75:27:@216.10]
  assign _T_245 = 2'h3 == state; // @[Conditional.scala 37:30:@224.10]
  assign _GEN_11 = _T_245 ? 1'h1 : done; // @[Conditional.scala 39:67:@225.10]
  assign _GEN_12 = _T_245 ? 2'h0 : state; // @[Conditional.scala 39:67:@225.10]
  assign _GEN_13 = _T_242 ? _GEN_9 : _GEN_12; // @[Conditional.scala 39:67:@214.8]
  assign _GEN_14 = _T_242 ? _GEN_10 : enable; // @[Conditional.scala 39:67:@214.8]
  assign _GEN_15 = _T_242 ? done : _GEN_11; // @[Conditional.scala 39:67:@214.8]
  assign _GEN_16 = _T_238 ? _GEN_4 : _GEN_13; // @[Conditional.scala 39:67:@204.6]
  assign _GEN_17 = _T_238 ? _GEN_5 : arvalid; // @[Conditional.scala 39:67:@204.6]
  assign _GEN_18 = _T_238 ? _GEN_6 : _GEN_14; // @[Conditional.scala 39:67:@204.6]
  assign _GEN_19 = _T_238 ? done : _GEN_15; // @[Conditional.scala 39:67:@204.6]
  assign _GEN_20 = _T_231 ? 1'h0 : _GEN_19; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_21 = _T_231 ? _GEN_0 : _GEN_16; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_22 = _T_231 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_23 = _T_231 ? _GEN_2 : araddr; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_24 = _T_231 ? _GEN_3 : {{24'd0}, arlen}; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_25 = _T_231 ? enable : _GEN_18; // @[Conditional.scala 40:58:@190.4]
  assign io_bus_ar_araddr = araddr; // @[AXI4Reader.scala 50:13:@176.4]
  assign io_bus_ar_arlen = arlen; // @[AXI4Reader.scala 50:13:@175.4]
  assign io_bus_ar_arvalid = arvalid; // @[AXI4Reader.scala 50:13:@168.4]
  assign io_bus_r_rready = io_dataIO_ready & enable; // @[AXI4Reader.scala 51:12:@180.4]
  assign io_dataIO_valid = io_bus_r_rvalid & enable; // @[AXI4Reader.scala 53:19:@186.4]
  assign io_dataIO_bits = io_bus_r_rdata; // @[AXI4Reader.scala 54:18:@187.4]
  assign io_xfer_done = done; // @[AXI4Reader.scala 55:16:@188.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  done = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  araddr = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  arlen = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  arvalid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_231) begin
        if (io_xfer_valid) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_238) begin
          if (_T_239) begin
            state <= 2'h2;
          end
        end else begin
          if (_T_242) begin
            if (_T_243) begin
              if (io_bus_r_rlast) begin
                state <= 2'h3;
              end
            end
          end else begin
            if (_T_245) begin
              state <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      done <= 1'h0;
    end else begin
      if (_T_231) begin
        done <= 1'h0;
      end else begin
        if (!(_T_238)) begin
          if (!(_T_242)) begin
            if (_T_245) begin
              done <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (!(_T_231)) begin
        if (_T_238) begin
          if (_T_239) begin
            enable <= 1'h1;
          end
        end else begin
          if (_T_242) begin
            if (_T_243) begin
              if (io_bus_r_rlast) begin
                enable <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      araddr <= 32'h0;
    end else begin
      if (_T_231) begin
        if (io_xfer_valid) begin
          araddr <= io_xfer_address;
        end
      end
    end
    if (reset) begin
      arlen <= 8'h0;
    end else begin
      arlen <= _GEN_24[7:0];
    end
    if (reset) begin
      arvalid <= 1'h0;
    end else begin
      if (_T_231) begin
        if (io_xfer_valid) begin
          arvalid <= 1'h1;
        end
      end else begin
        if (_T_238) begin
          if (_T_239) begin
            arvalid <= 1'h0;
          end
        end
      end
    end
  end
endmodule
module AXI4Writer( // @[:@230.2]
  input         clock, // @[:@231.4]
  input         reset, // @[:@232.4]
  output [31:0] io_bus_aw_awaddr, // @[:@233.4]
  output [7:0]  io_bus_aw_awlen, // @[:@233.4]
  output        io_bus_aw_awvalid, // @[:@233.4]
  input         io_bus_aw_awready, // @[:@233.4]
  output [31:0] io_bus_w_wdata, // @[:@233.4]
  output        io_bus_w_wlast, // @[:@233.4]
  output        io_bus_w_wvalid, // @[:@233.4]
  input         io_bus_w_wready, // @[:@233.4]
  input         io_bus_b_bvalid, // @[:@233.4]
  output        io_bus_b_bready, // @[:@233.4]
  output        io_dataIO_ready, // @[:@233.4]
  input         io_dataIO_valid, // @[:@233.4]
  input  [31:0] io_dataIO_bits, // @[:@233.4]
  output        io_xfer_done, // @[:@233.4]
  input  [31:0] io_xfer_address, // @[:@233.4]
  input  [31:0] io_xfer_length, // @[:@233.4]
  input         io_xfer_valid // @[:@233.4]
);
  reg [1:0] dataState; // @[AXI4Writer.scala 35:26:@235.4]
  reg [31:0] _RAND_0;
  reg [1:0] addrState; // @[AXI4Writer.scala 36:26:@236.4]
  reg [31:0] _RAND_1;
  reg  done; // @[AXI4Writer.scala 38:21:@237.4]
  reg [31:0] _RAND_2;
  reg  enable; // @[AXI4Writer.scala 39:23:@238.4]
  reg [31:0] _RAND_3;
  reg [31:0] length; // @[AXI4Writer.scala 41:23:@241.4]
  reg [31:0] _RAND_4;
  reg [31:0] awlen; // @[AXI4Writer.scala 42:22:@242.4]
  reg [31:0] _RAND_5;
  reg [31:0] awaddr; // @[AXI4Writer.scala 43:23:@243.4]
  reg [31:0] _RAND_6;
  reg  awvalid; // @[AXI4Writer.scala 48:24:@249.4]
  reg [31:0] _RAND_7;
  reg  bready; // @[AXI4Writer.scala 49:23:@250.4]
  reg [31:0] _RAND_8;
  wire  ready; // @[AXI4Writer.scala 51:40:@251.4]
  wire  valid; // @[AXI4Writer.scala 52:40:@254.4]
  wire  _T_243; // @[Conditional.scala 37:30:@329.4]
  wire [31:0] _GEN_0; // @[AXI4Writer.scala 69:26:@332.6]
  wire [1:0] _GEN_1; // @[AXI4Writer.scala 69:26:@332.6]
  wire  _GEN_2; // @[AXI4Writer.scala 69:26:@332.6]
  wire  _T_246; // @[Conditional.scala 37:30:@339.6]
  wire  _T_247; // @[AXI4Writer.scala 76:18:@341.8]
  wire  _T_249; // @[AXI4Writer.scala 77:21:@343.10]
  wire [32:0] _T_251; // @[AXI4Writer.scala 78:28:@345.12]
  wire [32:0] _T_252; // @[AXI4Writer.scala 78:28:@346.12]
  wire [31:0] _T_253; // @[AXI4Writer.scala 78:28:@347.12]
  wire [31:0] _GEN_3; // @[AXI4Writer.scala 77:27:@344.10]
  wire [1:0] _GEN_4; // @[AXI4Writer.scala 77:27:@344.10]
  wire  _GEN_5; // @[AXI4Writer.scala 77:27:@344.10]
  wire  _GEN_6; // @[AXI4Writer.scala 77:27:@344.10]
  wire [31:0] _GEN_7; // @[AXI4Writer.scala 76:27:@342.8]
  wire [1:0] _GEN_8; // @[AXI4Writer.scala 76:27:@342.8]
  wire  _GEN_9; // @[AXI4Writer.scala 76:27:@342.8]
  wire  _GEN_10; // @[AXI4Writer.scala 76:27:@342.8]
  wire  _T_256; // @[Conditional.scala 37:30:@358.8]
  wire  _T_257; // @[AXI4Writer.scala 87:19:@360.10]
  wire  _GEN_11; // @[AXI4Writer.scala 87:38:@361.10]
  wire [1:0] _GEN_12; // @[AXI4Writer.scala 87:38:@361.10]
  wire  _T_259; // @[Conditional.scala 37:30:@367.10]
  wire  _GEN_13; // @[Conditional.scala 39:67:@368.10]
  wire [1:0] _GEN_14; // @[Conditional.scala 39:67:@368.10]
  wire  _GEN_15; // @[Conditional.scala 39:67:@359.8]
  wire [1:0] _GEN_16; // @[Conditional.scala 39:67:@359.8]
  wire  _GEN_17; // @[Conditional.scala 39:67:@359.8]
  wire [31:0] _GEN_18; // @[Conditional.scala 39:67:@340.6]
  wire [1:0] _GEN_19; // @[Conditional.scala 39:67:@340.6]
  wire  _GEN_20; // @[Conditional.scala 39:67:@340.6]
  wire  _GEN_21; // @[Conditional.scala 39:67:@340.6]
  wire  _GEN_22; // @[Conditional.scala 39:67:@340.6]
  wire  _GEN_23; // @[Conditional.scala 40:58:@330.4]
  wire [31:0] _GEN_24; // @[Conditional.scala 40:58:@330.4]
  wire [1:0] _GEN_25; // @[Conditional.scala 40:58:@330.4]
  wire  _GEN_26; // @[Conditional.scala 40:58:@330.4]
  wire  _GEN_27; // @[Conditional.scala 40:58:@330.4]
  wire  _T_261; // @[Conditional.scala 37:30:@372.4]
  wire [32:0] _T_263; // @[AXI4Writer.scala 102:33:@376.8]
  wire [32:0] _T_264; // @[AXI4Writer.scala 102:33:@377.8]
  wire [31:0] _T_265; // @[AXI4Writer.scala 102:33:@378.8]
  wire [31:0] _GEN_28; // @[AXI4Writer.scala 100:26:@374.6]
  wire [31:0] _GEN_29; // @[AXI4Writer.scala 100:26:@374.6]
  wire  _GEN_30; // @[AXI4Writer.scala 100:26:@374.6]
  wire [1:0] _GEN_31; // @[AXI4Writer.scala 100:26:@374.6]
  wire  _T_267; // @[Conditional.scala 37:30:@385.6]
  wire  _T_268; // @[AXI4Writer.scala 108:20:@387.8]
  wire [1:0] _GEN_32; // @[AXI4Writer.scala 108:41:@388.8]
  wire  _GEN_33; // @[AXI4Writer.scala 108:41:@388.8]
  wire  _T_270; // @[Conditional.scala 37:30:@394.8]
  wire [1:0] _GEN_34; // @[AXI4Writer.scala 114:17:@396.10]
  wire [1:0] _GEN_35; // @[Conditional.scala 39:67:@395.8]
  wire [1:0] _GEN_36; // @[Conditional.scala 39:67:@386.6]
  wire  _GEN_37; // @[Conditional.scala 39:67:@386.6]
  wire [31:0] _GEN_38; // @[Conditional.scala 40:58:@373.4]
  wire [31:0] _GEN_39; // @[Conditional.scala 40:58:@373.4]
  wire  _GEN_40; // @[Conditional.scala 40:58:@373.4]
  wire [1:0] _GEN_41; // @[Conditional.scala 40:58:@373.4]
  assign ready = io_bus_w_wready & enable; // @[AXI4Writer.scala 51:40:@251.4]
  assign valid = io_dataIO_valid & enable; // @[AXI4Writer.scala 52:40:@254.4]
  assign _T_243 = 2'h0 == dataState; // @[Conditional.scala 37:30:@329.4]
  assign _GEN_0 = io_xfer_valid ? io_xfer_length : length; // @[AXI4Writer.scala 69:26:@332.6]
  assign _GEN_1 = io_xfer_valid ? 2'h1 : dataState; // @[AXI4Writer.scala 69:26:@332.6]
  assign _GEN_2 = io_xfer_valid ? 1'h1 : enable; // @[AXI4Writer.scala 69:26:@332.6]
  assign _T_246 = 2'h1 == dataState; // @[Conditional.scala 37:30:@339.6]
  assign _T_247 = ready & valid; // @[AXI4Writer.scala 76:18:@341.8]
  assign _T_249 = length > 32'h1; // @[AXI4Writer.scala 77:21:@343.10]
  assign _T_251 = length - 32'h1; // @[AXI4Writer.scala 78:28:@345.12]
  assign _T_252 = $unsigned(_T_251); // @[AXI4Writer.scala 78:28:@346.12]
  assign _T_253 = _T_252[31:0]; // @[AXI4Writer.scala 78:28:@347.12]
  assign _GEN_3 = _T_249 ? _T_253 : length; // @[AXI4Writer.scala 77:27:@344.10]
  assign _GEN_4 = _T_249 ? dataState : 2'h2; // @[AXI4Writer.scala 77:27:@344.10]
  assign _GEN_5 = _T_249 ? enable : 1'h0; // @[AXI4Writer.scala 77:27:@344.10]
  assign _GEN_6 = _T_249 ? bready : 1'h1; // @[AXI4Writer.scala 77:27:@344.10]
  assign _GEN_7 = _T_247 ? _GEN_3 : length; // @[AXI4Writer.scala 76:27:@342.8]
  assign _GEN_8 = _T_247 ? _GEN_4 : dataState; // @[AXI4Writer.scala 76:27:@342.8]
  assign _GEN_9 = _T_247 ? _GEN_5 : enable; // @[AXI4Writer.scala 76:27:@342.8]
  assign _GEN_10 = _T_247 ? _GEN_6 : bready; // @[AXI4Writer.scala 76:27:@342.8]
  assign _T_256 = 2'h2 == dataState; // @[Conditional.scala 37:30:@358.8]
  assign _T_257 = bready & io_bus_b_bvalid; // @[AXI4Writer.scala 87:19:@360.10]
  assign _GEN_11 = _T_257 ? 1'h0 : bready; // @[AXI4Writer.scala 87:38:@361.10]
  assign _GEN_12 = _T_257 ? 2'h3 : dataState; // @[AXI4Writer.scala 87:38:@361.10]
  assign _T_259 = 2'h3 == dataState; // @[Conditional.scala 37:30:@367.10]
  assign _GEN_13 = _T_259 ? 1'h1 : done; // @[Conditional.scala 39:67:@368.10]
  assign _GEN_14 = _T_259 ? 2'h0 : dataState; // @[Conditional.scala 39:67:@368.10]
  assign _GEN_15 = _T_256 ? _GEN_11 : bready; // @[Conditional.scala 39:67:@359.8]
  assign _GEN_16 = _T_256 ? _GEN_12 : _GEN_14; // @[Conditional.scala 39:67:@359.8]
  assign _GEN_17 = _T_256 ? done : _GEN_13; // @[Conditional.scala 39:67:@359.8]
  assign _GEN_18 = _T_246 ? _GEN_7 : length; // @[Conditional.scala 39:67:@340.6]
  assign _GEN_19 = _T_246 ? _GEN_8 : _GEN_16; // @[Conditional.scala 39:67:@340.6]
  assign _GEN_20 = _T_246 ? _GEN_9 : enable; // @[Conditional.scala 39:67:@340.6]
  assign _GEN_21 = _T_246 ? _GEN_10 : _GEN_15; // @[Conditional.scala 39:67:@340.6]
  assign _GEN_22 = _T_246 ? done : _GEN_17; // @[Conditional.scala 39:67:@340.6]
  assign _GEN_23 = _T_243 ? 1'h0 : _GEN_22; // @[Conditional.scala 40:58:@330.4]
  assign _GEN_24 = _T_243 ? _GEN_0 : _GEN_18; // @[Conditional.scala 40:58:@330.4]
  assign _GEN_25 = _T_243 ? _GEN_1 : _GEN_19; // @[Conditional.scala 40:58:@330.4]
  assign _GEN_26 = _T_243 ? _GEN_2 : _GEN_20; // @[Conditional.scala 40:58:@330.4]
  assign _GEN_27 = _T_243 ? bready : _GEN_21; // @[Conditional.scala 40:58:@330.4]
  assign _T_261 = 2'h0 == addrState; // @[Conditional.scala 37:30:@372.4]
  assign _T_263 = io_xfer_length - 32'h1; // @[AXI4Writer.scala 102:33:@376.8]
  assign _T_264 = $unsigned(_T_263); // @[AXI4Writer.scala 102:33:@377.8]
  assign _T_265 = _T_264[31:0]; // @[AXI4Writer.scala 102:33:@378.8]
  assign _GEN_28 = io_xfer_valid ? io_xfer_address : awaddr; // @[AXI4Writer.scala 100:26:@374.6]
  assign _GEN_29 = io_xfer_valid ? _T_265 : awlen; // @[AXI4Writer.scala 100:26:@374.6]
  assign _GEN_30 = io_xfer_valid ? 1'h1 : awvalid; // @[AXI4Writer.scala 100:26:@374.6]
  assign _GEN_31 = io_xfer_valid ? 2'h1 : addrState; // @[AXI4Writer.scala 100:26:@374.6]
  assign _T_267 = 2'h1 == addrState; // @[Conditional.scala 37:30:@385.6]
  assign _T_268 = awvalid & io_bus_aw_awready; // @[AXI4Writer.scala 108:20:@387.8]
  assign _GEN_32 = _T_268 ? 2'h2 : addrState; // @[AXI4Writer.scala 108:41:@388.8]
  assign _GEN_33 = _T_268 ? 1'h0 : awvalid; // @[AXI4Writer.scala 108:41:@388.8]
  assign _T_270 = 2'h2 == addrState; // @[Conditional.scala 37:30:@394.8]
  assign _GEN_34 = done ? 2'h0 : addrState; // @[AXI4Writer.scala 114:17:@396.10]
  assign _GEN_35 = _T_270 ? _GEN_34 : addrState; // @[Conditional.scala 39:67:@395.8]
  assign _GEN_36 = _T_267 ? _GEN_32 : _GEN_35; // @[Conditional.scala 39:67:@386.6]
  assign _GEN_37 = _T_267 ? _GEN_33 : awvalid; // @[Conditional.scala 39:67:@386.6]
  assign _GEN_38 = _T_261 ? _GEN_28 : awaddr; // @[Conditional.scala 40:58:@373.4]
  assign _GEN_39 = _T_261 ? _GEN_29 : awlen; // @[Conditional.scala 40:58:@373.4]
  assign _GEN_40 = _T_261 ? _GEN_30 : _GEN_37; // @[Conditional.scala 40:58:@373.4]
  assign _GEN_41 = _T_261 ? _GEN_31 : _GEN_36; // @[Conditional.scala 40:58:@373.4]
  assign io_bus_aw_awaddr = awaddr; // @[AXI4Writer.scala 54:13:@277.4]
  assign io_bus_aw_awlen = awlen[7:0]; // @[AXI4Writer.scala 54:13:@276.4]
  assign io_bus_aw_awvalid = awvalid; // @[AXI4Writer.scala 54:13:@269.4]
  assign io_bus_w_wdata = io_dataIO_bits; // @[AXI4Writer.scala 55:12:@288.4]
  assign io_bus_w_wlast = length == 32'h1; // @[AXI4Writer.scala 55:12:@286.4]
  assign io_bus_w_wvalid = io_dataIO_valid & enable; // @[AXI4Writer.scala 55:12:@285.4]
  assign io_bus_b_bready = bready; // @[AXI4Writer.scala 56:12:@291.4]
  assign io_dataIO_ready = io_bus_w_wready & enable; // @[AXI4Writer.scala 60:19:@325.4]
  assign io_xfer_done = done; // @[AXI4Writer.scala 62:16:@326.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  dataState = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  addrState = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  done = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  enable = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  length = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  awlen = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  awaddr = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  awvalid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  bready = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      dataState <= 2'h0;
    end else begin
      if (_T_243) begin
        if (io_xfer_valid) begin
          dataState <= 2'h1;
        end
      end else begin
        if (_T_246) begin
          if (_T_247) begin
            if (!(_T_249)) begin
              dataState <= 2'h2;
            end
          end
        end else begin
          if (_T_256) begin
            if (_T_257) begin
              dataState <= 2'h3;
            end
          end else begin
            if (_T_259) begin
              dataState <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      addrState <= 2'h0;
    end else begin
      if (_T_261) begin
        if (io_xfer_valid) begin
          addrState <= 2'h1;
        end
      end else begin
        if (_T_267) begin
          if (_T_268) begin
            addrState <= 2'h2;
          end
        end else begin
          if (_T_270) begin
            if (done) begin
              addrState <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      done <= 1'h0;
    end else begin
      if (_T_243) begin
        done <= 1'h0;
      end else begin
        if (!(_T_246)) begin
          if (!(_T_256)) begin
            if (_T_259) begin
              done <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (_T_243) begin
        if (io_xfer_valid) begin
          enable <= 1'h1;
        end
      end else begin
        if (_T_246) begin
          if (_T_247) begin
            if (!(_T_249)) begin
              enable <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      length <= 32'h0;
    end else begin
      if (_T_243) begin
        if (io_xfer_valid) begin
          length <= io_xfer_length;
        end
      end else begin
        if (_T_246) begin
          if (_T_247) begin
            if (_T_249) begin
              length <= _T_253;
            end
          end
        end
      end
    end
    if (reset) begin
      awlen <= 32'h0;
    end else begin
      if (_T_261) begin
        if (io_xfer_valid) begin
          awlen <= _T_265;
        end
      end
    end
    if (reset) begin
      awaddr <= 32'h0;
    end else begin
      if (_T_261) begin
        if (io_xfer_valid) begin
          awaddr <= io_xfer_address;
        end
      end
    end
    if (reset) begin
      awvalid <= 1'h0;
    end else begin
      if (_T_261) begin
        if (io_xfer_valid) begin
          awvalid <= 1'h1;
        end
      end else begin
        if (_T_267) begin
          if (_T_268) begin
            awvalid <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      bready <= 1'h0;
    end else begin
      if (!(_T_243)) begin
        if (_T_246) begin
          if (_T_247) begin
            if (!(_T_249)) begin
              bready <= 1'h1;
            end
          end
        end else begin
          if (_T_256) begin
            if (_T_257) begin
              bready <= 1'h0;
            end
          end
        end
      end
    end
  end
endmodule
module CSR( // @[:@401.2]
  output [31:0] io_csr_0_dataOut, // @[:@404.4]
  output        io_csr_0_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_0_dataIn, // @[:@404.4]
  input  [31:0] io_csr_1_dataIn, // @[:@404.4]
  output [31:0] io_csr_2_dataOut, // @[:@404.4]
  output        io_csr_2_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_2_dataIn, // @[:@404.4]
  output [31:0] io_csr_3_dataOut, // @[:@404.4]
  output        io_csr_3_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_3_dataIn, // @[:@404.4]
  output [31:0] io_csr_4_dataOut, // @[:@404.4]
  output        io_csr_4_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_4_dataIn, // @[:@404.4]
  output [31:0] io_csr_5_dataOut, // @[:@404.4]
  output        io_csr_5_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_5_dataIn, // @[:@404.4]
  output [31:0] io_csr_6_dataOut, // @[:@404.4]
  output        io_csr_6_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_6_dataIn, // @[:@404.4]
  output [31:0] io_csr_7_dataOut, // @[:@404.4]
  output        io_csr_7_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_7_dataIn, // @[:@404.4]
  output [31:0] io_csr_8_dataOut, // @[:@404.4]
  output        io_csr_8_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_8_dataIn, // @[:@404.4]
  output [31:0] io_csr_9_dataOut, // @[:@404.4]
  output        io_csr_9_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_9_dataIn, // @[:@404.4]
  output [31:0] io_csr_10_dataOut, // @[:@404.4]
  output        io_csr_10_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_10_dataIn, // @[:@404.4]
  output [31:0] io_csr_11_dataOut, // @[:@404.4]
  output        io_csr_11_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_11_dataIn, // @[:@404.4]
  input  [31:0] io_csr_12_dataIn, // @[:@404.4]
  input  [31:0] io_csr_13_dataIn, // @[:@404.4]
  output [31:0] io_csr_14_dataOut, // @[:@404.4]
  output        io_csr_14_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_14_dataIn, // @[:@404.4]
  output [31:0] io_csr_15_dataOut, // @[:@404.4]
  output        io_csr_15_dataWrite, // @[:@404.4]
  input  [31:0] io_csr_15_dataIn, // @[:@404.4]
  input  [3:0]  io_bus_addr, // @[:@404.4]
  input  [31:0] io_bus_dataOut, // @[:@404.4]
  output [31:0] io_bus_dataIn, // @[:@404.4]
  input         io_bus_write, // @[:@404.4]
  input         io_bus_read // @[:@404.4]
);
  wire  _T_178; // @[CSR.scala 31:22:@409.4]
  wire  _T_179; // @[CSR.scala 31:30:@410.4]
  wire [31:0] _GEN_0; // @[CSR.scala 31:45:@411.4]
  wire  _T_184; // @[CSR.scala 38:30:@419.4]
  wire  _T_189; // @[CSR.scala 31:22:@428.4]
  wire  _T_190; // @[CSR.scala 31:30:@429.4]
  wire [31:0] _GEN_4; // @[CSR.scala 31:45:@430.4]
  wire  _T_200; // @[CSR.scala 31:22:@447.4]
  wire  _T_201; // @[CSR.scala 31:30:@448.4]
  wire [31:0] _GEN_8; // @[CSR.scala 31:45:@449.4]
  wire  _T_206; // @[CSR.scala 38:30:@457.4]
  wire  _T_211; // @[CSR.scala 31:22:@466.4]
  wire  _T_212; // @[CSR.scala 31:30:@467.4]
  wire [31:0] _GEN_12; // @[CSR.scala 31:45:@468.4]
  wire  _T_217; // @[CSR.scala 38:30:@476.4]
  wire  _T_222; // @[CSR.scala 31:22:@485.4]
  wire  _T_223; // @[CSR.scala 31:30:@486.4]
  wire [31:0] _GEN_16; // @[CSR.scala 31:45:@487.4]
  wire  _T_228; // @[CSR.scala 38:30:@495.4]
  wire  _T_233; // @[CSR.scala 31:22:@504.4]
  wire  _T_234; // @[CSR.scala 31:30:@505.4]
  wire [31:0] _GEN_20; // @[CSR.scala 31:45:@506.4]
  wire  _T_239; // @[CSR.scala 38:30:@514.4]
  wire  _T_244; // @[CSR.scala 31:22:@523.4]
  wire  _T_245; // @[CSR.scala 31:30:@524.4]
  wire [31:0] _GEN_24; // @[CSR.scala 31:45:@525.4]
  wire  _T_250; // @[CSR.scala 38:30:@533.4]
  wire  _T_255; // @[CSR.scala 31:22:@542.4]
  wire  _T_256; // @[CSR.scala 31:30:@543.4]
  wire [31:0] _GEN_28; // @[CSR.scala 31:45:@544.4]
  wire  _T_261; // @[CSR.scala 38:30:@552.4]
  wire  _T_266; // @[CSR.scala 31:22:@561.4]
  wire  _T_267; // @[CSR.scala 31:30:@562.4]
  wire [31:0] _GEN_32; // @[CSR.scala 31:45:@563.4]
  wire  _T_272; // @[CSR.scala 38:30:@571.4]
  wire  _T_277; // @[CSR.scala 31:22:@580.4]
  wire  _T_278; // @[CSR.scala 31:30:@581.4]
  wire [31:0] _GEN_36; // @[CSR.scala 31:45:@582.4]
  wire  _T_283; // @[CSR.scala 38:30:@590.4]
  wire  _T_288; // @[CSR.scala 31:22:@599.4]
  wire  _T_289; // @[CSR.scala 31:30:@600.4]
  wire [31:0] _GEN_40; // @[CSR.scala 31:45:@601.4]
  wire  _T_294; // @[CSR.scala 38:30:@609.4]
  wire  _T_299; // @[CSR.scala 31:22:@618.4]
  wire  _T_300; // @[CSR.scala 31:30:@619.4]
  wire [31:0] _GEN_44; // @[CSR.scala 31:45:@620.4]
  wire  _T_305; // @[CSR.scala 38:30:@628.4]
  wire  _T_310; // @[CSR.scala 31:22:@637.4]
  wire  _T_311; // @[CSR.scala 31:30:@638.4]
  wire [31:0] _GEN_48; // @[CSR.scala 31:45:@639.4]
  wire  _T_321; // @[CSR.scala 31:22:@656.4]
  wire  _T_322; // @[CSR.scala 31:30:@657.4]
  wire [31:0] _GEN_52; // @[CSR.scala 31:45:@658.4]
  wire  _T_332; // @[CSR.scala 31:22:@675.4]
  wire  _T_333; // @[CSR.scala 31:30:@676.4]
  wire [31:0] _GEN_56; // @[CSR.scala 31:45:@677.4]
  wire  _T_338; // @[CSR.scala 38:30:@685.4]
  wire  _T_343; // @[CSR.scala 31:22:@694.4]
  wire  _T_344; // @[CSR.scala 31:30:@695.4]
  wire  _T_349; // @[CSR.scala 38:30:@704.4]
  assign _T_178 = io_bus_addr == 4'h0; // @[CSR.scala 31:22:@409.4]
  assign _T_179 = _T_178 & io_bus_read; // @[CSR.scala 31:30:@410.4]
  assign _GEN_0 = _T_179 ? io_csr_0_dataIn : 32'h0; // @[CSR.scala 31:45:@411.4]
  assign _T_184 = _T_178 & io_bus_write; // @[CSR.scala 38:30:@419.4]
  assign _T_189 = io_bus_addr == 4'h1; // @[CSR.scala 31:22:@428.4]
  assign _T_190 = _T_189 & io_bus_read; // @[CSR.scala 31:30:@429.4]
  assign _GEN_4 = _T_190 ? io_csr_1_dataIn : _GEN_0; // @[CSR.scala 31:45:@430.4]
  assign _T_200 = io_bus_addr == 4'h2; // @[CSR.scala 31:22:@447.4]
  assign _T_201 = _T_200 & io_bus_read; // @[CSR.scala 31:30:@448.4]
  assign _GEN_8 = _T_201 ? io_csr_2_dataIn : _GEN_4; // @[CSR.scala 31:45:@449.4]
  assign _T_206 = _T_200 & io_bus_write; // @[CSR.scala 38:30:@457.4]
  assign _T_211 = io_bus_addr == 4'h3; // @[CSR.scala 31:22:@466.4]
  assign _T_212 = _T_211 & io_bus_read; // @[CSR.scala 31:30:@467.4]
  assign _GEN_12 = _T_212 ? io_csr_3_dataIn : _GEN_8; // @[CSR.scala 31:45:@468.4]
  assign _T_217 = _T_211 & io_bus_write; // @[CSR.scala 38:30:@476.4]
  assign _T_222 = io_bus_addr == 4'h4; // @[CSR.scala 31:22:@485.4]
  assign _T_223 = _T_222 & io_bus_read; // @[CSR.scala 31:30:@486.4]
  assign _GEN_16 = _T_223 ? io_csr_4_dataIn : _GEN_12; // @[CSR.scala 31:45:@487.4]
  assign _T_228 = _T_222 & io_bus_write; // @[CSR.scala 38:30:@495.4]
  assign _T_233 = io_bus_addr == 4'h5; // @[CSR.scala 31:22:@504.4]
  assign _T_234 = _T_233 & io_bus_read; // @[CSR.scala 31:30:@505.4]
  assign _GEN_20 = _T_234 ? io_csr_5_dataIn : _GEN_16; // @[CSR.scala 31:45:@506.4]
  assign _T_239 = _T_233 & io_bus_write; // @[CSR.scala 38:30:@514.4]
  assign _T_244 = io_bus_addr == 4'h6; // @[CSR.scala 31:22:@523.4]
  assign _T_245 = _T_244 & io_bus_read; // @[CSR.scala 31:30:@524.4]
  assign _GEN_24 = _T_245 ? io_csr_6_dataIn : _GEN_20; // @[CSR.scala 31:45:@525.4]
  assign _T_250 = _T_244 & io_bus_write; // @[CSR.scala 38:30:@533.4]
  assign _T_255 = io_bus_addr == 4'h7; // @[CSR.scala 31:22:@542.4]
  assign _T_256 = _T_255 & io_bus_read; // @[CSR.scala 31:30:@543.4]
  assign _GEN_28 = _T_256 ? io_csr_7_dataIn : _GEN_24; // @[CSR.scala 31:45:@544.4]
  assign _T_261 = _T_255 & io_bus_write; // @[CSR.scala 38:30:@552.4]
  assign _T_266 = io_bus_addr == 4'h8; // @[CSR.scala 31:22:@561.4]
  assign _T_267 = _T_266 & io_bus_read; // @[CSR.scala 31:30:@562.4]
  assign _GEN_32 = _T_267 ? io_csr_8_dataIn : _GEN_28; // @[CSR.scala 31:45:@563.4]
  assign _T_272 = _T_266 & io_bus_write; // @[CSR.scala 38:30:@571.4]
  assign _T_277 = io_bus_addr == 4'h9; // @[CSR.scala 31:22:@580.4]
  assign _T_278 = _T_277 & io_bus_read; // @[CSR.scala 31:30:@581.4]
  assign _GEN_36 = _T_278 ? io_csr_9_dataIn : _GEN_32; // @[CSR.scala 31:45:@582.4]
  assign _T_283 = _T_277 & io_bus_write; // @[CSR.scala 38:30:@590.4]
  assign _T_288 = io_bus_addr == 4'ha; // @[CSR.scala 31:22:@599.4]
  assign _T_289 = _T_288 & io_bus_read; // @[CSR.scala 31:30:@600.4]
  assign _GEN_40 = _T_289 ? io_csr_10_dataIn : _GEN_36; // @[CSR.scala 31:45:@601.4]
  assign _T_294 = _T_288 & io_bus_write; // @[CSR.scala 38:30:@609.4]
  assign _T_299 = io_bus_addr == 4'hb; // @[CSR.scala 31:22:@618.4]
  assign _T_300 = _T_299 & io_bus_read; // @[CSR.scala 31:30:@619.4]
  assign _GEN_44 = _T_300 ? io_csr_11_dataIn : _GEN_40; // @[CSR.scala 31:45:@620.4]
  assign _T_305 = _T_299 & io_bus_write; // @[CSR.scala 38:30:@628.4]
  assign _T_310 = io_bus_addr == 4'hc; // @[CSR.scala 31:22:@637.4]
  assign _T_311 = _T_310 & io_bus_read; // @[CSR.scala 31:30:@638.4]
  assign _GEN_48 = _T_311 ? io_csr_12_dataIn : _GEN_44; // @[CSR.scala 31:45:@639.4]
  assign _T_321 = io_bus_addr == 4'hd; // @[CSR.scala 31:22:@656.4]
  assign _T_322 = _T_321 & io_bus_read; // @[CSR.scala 31:30:@657.4]
  assign _GEN_52 = _T_322 ? io_csr_13_dataIn : _GEN_48; // @[CSR.scala 31:45:@658.4]
  assign _T_332 = io_bus_addr == 4'he; // @[CSR.scala 31:22:@675.4]
  assign _T_333 = _T_332 & io_bus_read; // @[CSR.scala 31:30:@676.4]
  assign _GEN_56 = _T_333 ? io_csr_14_dataIn : _GEN_52; // @[CSR.scala 31:45:@677.4]
  assign _T_338 = _T_332 & io_bus_write; // @[CSR.scala 38:30:@685.4]
  assign _T_343 = io_bus_addr == 4'hf; // @[CSR.scala 31:22:@694.4]
  assign _T_344 = _T_343 & io_bus_read; // @[CSR.scala 31:30:@695.4]
  assign _T_349 = _T_343 & io_bus_write; // @[CSR.scala 38:30:@704.4]
  assign io_csr_0_dataOut = _T_184 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@421.6 CSR.scala 43:25:@426.6]
  assign io_csr_0_dataWrite = _T_178 & io_bus_write; // @[CSR.scala 40:27:@422.6 CSR.scala 42:27:@425.6]
  assign io_csr_2_dataOut = _T_206 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@459.6 CSR.scala 43:25:@464.6]
  assign io_csr_2_dataWrite = _T_200 & io_bus_write; // @[CSR.scala 40:27:@460.6 CSR.scala 42:27:@463.6]
  assign io_csr_3_dataOut = _T_217 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@478.6 CSR.scala 43:25:@483.6]
  assign io_csr_3_dataWrite = _T_211 & io_bus_write; // @[CSR.scala 40:27:@479.6 CSR.scala 42:27:@482.6]
  assign io_csr_4_dataOut = _T_228 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@497.6 CSR.scala 43:25:@502.6]
  assign io_csr_4_dataWrite = _T_222 & io_bus_write; // @[CSR.scala 40:27:@498.6 CSR.scala 42:27:@501.6]
  assign io_csr_5_dataOut = _T_239 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@516.6 CSR.scala 43:25:@521.6]
  assign io_csr_5_dataWrite = _T_233 & io_bus_write; // @[CSR.scala 40:27:@517.6 CSR.scala 42:27:@520.6]
  assign io_csr_6_dataOut = _T_250 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@535.6 CSR.scala 43:25:@540.6]
  assign io_csr_6_dataWrite = _T_244 & io_bus_write; // @[CSR.scala 40:27:@536.6 CSR.scala 42:27:@539.6]
  assign io_csr_7_dataOut = _T_261 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@554.6 CSR.scala 43:25:@559.6]
  assign io_csr_7_dataWrite = _T_255 & io_bus_write; // @[CSR.scala 40:27:@555.6 CSR.scala 42:27:@558.6]
  assign io_csr_8_dataOut = _T_272 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@573.6 CSR.scala 43:25:@578.6]
  assign io_csr_8_dataWrite = _T_266 & io_bus_write; // @[CSR.scala 40:27:@574.6 CSR.scala 42:27:@577.6]
  assign io_csr_9_dataOut = _T_283 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@592.6 CSR.scala 43:25:@597.6]
  assign io_csr_9_dataWrite = _T_277 & io_bus_write; // @[CSR.scala 40:27:@593.6 CSR.scala 42:27:@596.6]
  assign io_csr_10_dataOut = _T_294 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@611.6 CSR.scala 43:25:@616.6]
  assign io_csr_10_dataWrite = _T_288 & io_bus_write; // @[CSR.scala 40:27:@612.6 CSR.scala 42:27:@615.6]
  assign io_csr_11_dataOut = _T_305 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@630.6 CSR.scala 43:25:@635.6]
  assign io_csr_11_dataWrite = _T_299 & io_bus_write; // @[CSR.scala 40:27:@631.6 CSR.scala 42:27:@634.6]
  assign io_csr_14_dataOut = _T_338 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@687.6 CSR.scala 43:25:@692.6]
  assign io_csr_14_dataWrite = _T_332 & io_bus_write; // @[CSR.scala 40:27:@688.6 CSR.scala 42:27:@691.6]
  assign io_csr_15_dataOut = _T_349 ? io_bus_dataOut : 32'h0; // @[CSR.scala 39:25:@706.6 CSR.scala 43:25:@711.6]
  assign io_csr_15_dataWrite = _T_343 & io_bus_write; // @[CSR.scala 40:27:@707.6 CSR.scala 42:27:@710.6]
  assign io_bus_dataIn = _T_344 ? io_csr_15_dataIn : _GEN_56; // @[CSR.scala 28:17:@408.4]
endmodule
module AddressGenerator( // @[:@714.2]
  input         clock, // @[:@715.4]
  input         reset, // @[:@716.4]
  input         io_ctl_start, // @[:@717.4]
  output        io_ctl_busy, // @[:@717.4]
  input  [31:0] io_ctl_startAddress, // @[:@717.4]
  input  [31:0] io_ctl_lineLength, // @[:@717.4]
  input  [31:0] io_ctl_lineCount, // @[:@717.4]
  input  [31:0] io_ctl_lineGap, // @[:@717.4]
  input         io_xfer_done, // @[:@717.4]
  output [31:0] io_xfer_address, // @[:@717.4]
  output [31:0] io_xfer_length, // @[:@717.4]
  output        io_xfer_valid // @[:@717.4]
);
  reg [1:0] state; // @[AddressGenerator.scala 28:22:@719.4]
  reg [31:0] _RAND_0;
  reg [31:0] lineCount; // @[AddressGenerator.scala 30:26:@720.4]
  reg [31:0] _RAND_1;
  reg [31:0] lineGap; // @[AddressGenerator.scala 31:24:@721.4]
  reg [31:0] _RAND_2;
  reg [31:0] address_o; // @[AddressGenerator.scala 33:26:@722.4]
  reg [31:0] _RAND_3;
  reg [31:0] address_i; // @[AddressGenerator.scala 34:26:@723.4]
  reg [31:0] _RAND_4;
  reg [31:0] length_o; // @[AddressGenerator.scala 35:25:@724.4]
  reg [31:0] _RAND_5;
  reg [31:0] length_i; // @[AddressGenerator.scala 36:25:@725.4]
  reg [31:0] _RAND_6;
  reg  valid; // @[AddressGenerator.scala 37:22:@726.4]
  reg [31:0] _RAND_7;
  reg  busy; // @[AddressGenerator.scala 39:21:@728.4]
  reg [31:0] _RAND_8;
  wire  _T_46; // @[AddressGenerator.scala 47:14:@734.4]
  wire  _GEN_0; // @[AddressGenerator.scala 47:24:@735.4]
  wire  _T_49; // @[Conditional.scala 37:30:@741.4]
  wire [1:0] _GEN_1; // @[AddressGenerator.scala 55:25:@743.6]
  wire [31:0] _GEN_2; // @[AddressGenerator.scala 55:25:@743.6]
  wire [31:0] _GEN_3; // @[AddressGenerator.scala 55:25:@743.6]
  wire [31:0] _GEN_4; // @[AddressGenerator.scala 55:25:@743.6]
  wire [31:0] _GEN_5; // @[AddressGenerator.scala 55:25:@743.6]
  wire  _T_51; // @[Conditional.scala 37:30:@753.6]
  wire [34:0] _T_54; // @[AddressGenerator.scala 70:42:@758.8]
  wire [34:0] _GEN_28; // @[AddressGenerator.scala 70:30:@759.8]
  wire [35:0] _T_55; // @[AddressGenerator.scala 70:30:@759.8]
  wire [34:0] _T_56; // @[AddressGenerator.scala 70:30:@760.8]
  wire [34:0] _T_58; // @[AddressGenerator.scala 70:74:@761.8]
  wire [35:0] _T_59; // @[AddressGenerator.scala 70:63:@762.8]
  wire [34:0] _T_60; // @[AddressGenerator.scala 70:63:@763.8]
  wire [32:0] _T_62; // @[AddressGenerator.scala 72:30:@765.8]
  wire [32:0] _T_63; // @[AddressGenerator.scala 72:30:@766.8]
  wire [31:0] _T_64; // @[AddressGenerator.scala 72:30:@767.8]
  wire  _T_65; // @[Conditional.scala 37:30:@772.8]
  wire  _T_69; // @[AddressGenerator.scala 79:24:@777.12]
  wire [1:0] _GEN_7; // @[AddressGenerator.scala 79:30:@778.12]
  wire [1:0] _GEN_8; // @[AddressGenerator.scala 78:25:@776.10]
  wire  _GEN_9; // @[Conditional.scala 39:67:@773.8]
  wire [1:0] _GEN_11; // @[Conditional.scala 39:67:@773.8]
  wire  _GEN_12; // @[Conditional.scala 39:67:@754.6]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@754.6]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@754.6]
  wire [34:0] _GEN_15; // @[Conditional.scala 39:67:@754.6]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@754.6]
  wire [1:0] _GEN_17; // @[Conditional.scala 39:67:@754.6]
  wire [1:0] _GEN_19; // @[Conditional.scala 40:58:@742.4]
  wire [34:0] _GEN_20; // @[Conditional.scala 40:58:@742.4]
  wire [31:0] _GEN_21; // @[Conditional.scala 40:58:@742.4]
  wire [31:0] _GEN_22; // @[Conditional.scala 40:58:@742.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@742.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@742.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@742.4]
  wire [31:0] _GEN_27; // @[Conditional.scala 40:58:@742.4]
  assign _T_46 = state == 2'h0; // @[AddressGenerator.scala 47:14:@734.4]
  assign _GEN_0 = _T_46 ? 1'h0 : 1'h1; // @[AddressGenerator.scala 47:24:@735.4]
  assign _T_49 = 2'h0 == state; // @[Conditional.scala 37:30:@741.4]
  assign _GEN_1 = io_ctl_start ? 2'h1 : state; // @[AddressGenerator.scala 55:25:@743.6]
  assign _GEN_2 = io_ctl_start ? io_ctl_startAddress : address_i; // @[AddressGenerator.scala 55:25:@743.6]
  assign _GEN_3 = io_ctl_start ? io_ctl_lineLength : length_i; // @[AddressGenerator.scala 55:25:@743.6]
  assign _GEN_4 = io_ctl_start ? io_ctl_lineCount : lineCount; // @[AddressGenerator.scala 55:25:@743.6]
  assign _GEN_5 = io_ctl_start ? io_ctl_lineGap : lineGap; // @[AddressGenerator.scala 55:25:@743.6]
  assign _T_51 = 2'h1 == state; // @[Conditional.scala 37:30:@753.6]
  assign _T_54 = length_i * 32'h4; // @[AddressGenerator.scala 70:42:@758.8]
  assign _GEN_28 = {{3'd0}, address_i}; // @[AddressGenerator.scala 70:30:@759.8]
  assign _T_55 = _GEN_28 + _T_54; // @[AddressGenerator.scala 70:30:@759.8]
  assign _T_56 = _GEN_28 + _T_54; // @[AddressGenerator.scala 70:30:@760.8]
  assign _T_58 = lineGap * 32'h4; // @[AddressGenerator.scala 70:74:@761.8]
  assign _T_59 = _T_56 + _T_58; // @[AddressGenerator.scala 70:63:@762.8]
  assign _T_60 = _T_56 + _T_58; // @[AddressGenerator.scala 70:63:@763.8]
  assign _T_62 = lineCount - 32'h1; // @[AddressGenerator.scala 72:30:@765.8]
  assign _T_63 = $unsigned(_T_62); // @[AddressGenerator.scala 72:30:@766.8]
  assign _T_64 = _T_63[31:0]; // @[AddressGenerator.scala 72:30:@767.8]
  assign _T_65 = 2'h2 == state; // @[Conditional.scala 37:30:@772.8]
  assign _T_69 = lineCount > 32'h0; // @[AddressGenerator.scala 79:24:@777.12]
  assign _GEN_7 = _T_69 ? 2'h1 : 2'h0; // @[AddressGenerator.scala 79:30:@778.12]
  assign _GEN_8 = io_xfer_done ? _GEN_7 : state; // @[AddressGenerator.scala 78:25:@776.10]
  assign _GEN_9 = _T_65 ? 1'h0 : valid; // @[Conditional.scala 39:67:@773.8]
  assign _GEN_11 = _T_65 ? _GEN_8 : state; // @[Conditional.scala 39:67:@773.8]
  assign _GEN_12 = _T_51 ? 1'h1 : _GEN_9; // @[Conditional.scala 39:67:@754.6]
  assign _GEN_13 = _T_51 ? address_i : address_o; // @[Conditional.scala 39:67:@754.6]
  assign _GEN_14 = _T_51 ? length_i : length_o; // @[Conditional.scala 39:67:@754.6]
  assign _GEN_15 = _T_51 ? _T_60 : {{3'd0}, address_i}; // @[Conditional.scala 39:67:@754.6]
  assign _GEN_16 = _T_51 ? _T_64 : lineCount; // @[Conditional.scala 39:67:@754.6]
  assign _GEN_17 = _T_51 ? 2'h2 : _GEN_11; // @[Conditional.scala 39:67:@754.6]
  assign _GEN_19 = _T_49 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@742.4]
  assign _GEN_20 = _T_49 ? {{3'd0}, _GEN_2} : _GEN_15; // @[Conditional.scala 40:58:@742.4]
  assign _GEN_21 = _T_49 ? _GEN_3 : length_i; // @[Conditional.scala 40:58:@742.4]
  assign _GEN_22 = _T_49 ? _GEN_4 : _GEN_16; // @[Conditional.scala 40:58:@742.4]
  assign _GEN_23 = _T_49 ? _GEN_5 : lineGap; // @[Conditional.scala 40:58:@742.4]
  assign _GEN_25 = _T_49 ? valid : _GEN_12; // @[Conditional.scala 40:58:@742.4]
  assign _GEN_26 = _T_49 ? address_o : _GEN_13; // @[Conditional.scala 40:58:@742.4]
  assign _GEN_27 = _T_49 ? length_o : _GEN_14; // @[Conditional.scala 40:58:@742.4]
  assign io_ctl_busy = busy; // @[AddressGenerator.scala 45:15:@733.4]
  assign io_xfer_address = address_o; // @[AddressGenerator.scala 41:19:@729.4]
  assign io_xfer_length = length_o; // @[AddressGenerator.scala 42:18:@730.4]
  assign io_xfer_valid = valid; // @[AddressGenerator.scala 43:17:@731.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  lineCount = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  lineGap = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  address_o = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  address_i = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  length_o = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  length_i = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  busy = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_51) begin
          state <= 2'h2;
        end else begin
          if (_T_65) begin
            if (io_xfer_done) begin
              if (_T_69) begin
                state <= 2'h1;
              end else begin
                state <= 2'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      lineCount <= 32'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          lineCount <= io_ctl_lineCount;
        end
      end else begin
        if (_T_51) begin
          lineCount <= _T_64;
        end
      end
    end
    if (reset) begin
      lineGap <= 32'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          lineGap <= io_ctl_lineGap;
        end
      end
    end
    if (reset) begin
      address_o <= 32'h0;
    end else begin
      if (!(_T_49)) begin
        if (_T_51) begin
          address_o <= address_i;
        end
      end
    end
    if (reset) begin
      address_i <= 32'h0;
    end else begin
      address_i <= _GEN_20[31:0];
    end
    if (reset) begin
      length_o <= 32'h0;
    end else begin
      if (!(_T_49)) begin
        if (_T_51) begin
          length_o <= length_i;
        end
      end
    end
    if (reset) begin
      length_i <= 32'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          length_i <= io_ctl_lineLength;
        end
      end
    end
    if (reset) begin
      valid <= 1'h0;
    end else begin
      if (!(_T_49)) begin
        if (_T_51) begin
          valid <= 1'h1;
        end else begin
          if (_T_65) begin
            valid <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      busy <= 1'h0;
    end else begin
      if (_T_46) begin
        busy <= 1'h0;
      end else begin
        busy <= 1'h1;
      end
    end
  end
endmodule
module TransferSplitter( // @[:@787.2]
  output        io_xferIn_done, // @[:@790.4]
  input  [31:0] io_xferIn_address, // @[:@790.4]
  input  [31:0] io_xferIn_length, // @[:@790.4]
  input         io_xferIn_valid, // @[:@790.4]
  input         io_xferOut_done, // @[:@790.4]
  output [31:0] io_xferOut_address, // @[:@790.4]
  output [31:0] io_xferOut_length, // @[:@790.4]
  output        io_xferOut_valid // @[:@790.4]
);
  assign io_xferIn_done = io_xferOut_done; // @[TransferSplitter.scala 123:16:@796.4]
  assign io_xferOut_address = io_xferIn_address; // @[TransferSplitter.scala 123:16:@795.4]
  assign io_xferOut_length = io_xferIn_length; // @[TransferSplitter.scala 123:16:@794.4]
  assign io_xferOut_valid = io_xferIn_valid; // @[TransferSplitter.scala 123:16:@793.4]
endmodule
module TransferSplitter_1( // @[:@871.2]
  input         clock, // @[:@872.4]
  input         reset, // @[:@873.4]
  output        io_xferIn_done, // @[:@874.4]
  input  [31:0] io_xferIn_address, // @[:@874.4]
  input  [31:0] io_xferIn_length, // @[:@874.4]
  input         io_xferIn_valid, // @[:@874.4]
  input         io_xferOut_done, // @[:@874.4]
  output [31:0] io_xferOut_address, // @[:@874.4]
  output [31:0] io_xferOut_length, // @[:@874.4]
  output        io_xferOut_valid // @[:@874.4]
);
  reg [31:0] _T_42; // @[TransferSplitter.scala 34:28:@876.4]
  reg [31:0] _RAND_0;
  reg [31:0] _T_45; // @[TransferSplitter.scala 35:27:@877.4]
  reg [31:0] _RAND_1;
  reg [31:0] _T_48; // @[TransferSplitter.scala 37:28:@878.4]
  reg [31:0] _RAND_2;
  reg [31:0] _T_51; // @[TransferSplitter.scala 38:27:@879.4]
  reg [31:0] _RAND_3;
  reg  _T_60; // @[TransferSplitter.scala 43:23:@882.4]
  reg [31:0] _RAND_4;
  reg  _T_63; // @[TransferSplitter.scala 44:24:@883.4]
  reg [31:0] _RAND_5;
  reg [1:0] _T_65; // @[TransferSplitter.scala 46:24:@884.4]
  reg [31:0] _RAND_6;
  wire  _T_66; // @[Conditional.scala 37:30:@890.4]
  wire [31:0] _GEN_0; // @[TransferSplitter.scala 59:31:@893.6]
  wire [31:0] _GEN_1; // @[TransferSplitter.scala 59:31:@893.6]
  wire [1:0] _GEN_3; // @[TransferSplitter.scala 59:31:@893.6]
  wire  _T_68; // @[Conditional.scala 37:30:@901.6]
  wire  _T_71; // @[TransferSplitter.scala 72:23:@907.8]
  wire [32:0] _T_74; // @[TransferSplitter.scala 75:34:@910.10]
  wire [32:0] _T_75; // @[TransferSplitter.scala 75:34:@911.10]
  wire [31:0] _T_76; // @[TransferSplitter.scala 75:34:@912.10]
  wire [11:0] _T_79; // @[TransferSplitter.scala 76:50:@914.10]
  wire [31:0] _GEN_33; // @[TransferSplitter.scala 76:36:@915.10]
  wire [32:0] _T_80; // @[TransferSplitter.scala 76:36:@915.10]
  wire [31:0] _T_81; // @[TransferSplitter.scala 76:36:@916.10]
  wire [34:0] _T_84; // @[TransferSplitter.scala 94:47:@922.10]
  wire [34:0] _GEN_34; // @[TransferSplitter.scala 94:36:@923.10]
  wire [35:0] _T_85; // @[TransferSplitter.scala 94:36:@923.10]
  wire [34:0] _T_86; // @[TransferSplitter.scala 94:36:@924.10]
  wire [31:0] _GEN_4; // @[TransferSplitter.scala 72:38:@908.8]
  wire [31:0] _GEN_5; // @[TransferSplitter.scala 72:38:@908.8]
  wire [34:0] _GEN_6; // @[TransferSplitter.scala 72:38:@908.8]
  wire  _T_87; // @[Conditional.scala 37:30:@929.8]
  wire  _T_91; // @[TransferSplitter.scala 113:25:@934.12]
  wire [1:0] _GEN_7; // @[TransferSplitter.scala 113:32:@935.12]
  wire  _GEN_8; // @[TransferSplitter.scala 113:32:@935.12]
  wire [1:0] _GEN_9; // @[TransferSplitter.scala 112:31:@933.10]
  wire  _GEN_10; // @[TransferSplitter.scala 112:31:@933.10]
  wire  _GEN_11; // @[Conditional.scala 39:67:@930.8]
  wire [1:0] _GEN_13; // @[Conditional.scala 39:67:@930.8]
  wire  _GEN_14; // @[Conditional.scala 39:67:@930.8]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@902.6]
  wire  _GEN_17; // @[Conditional.scala 39:67:@902.6]
  wire [1:0] _GEN_18; // @[Conditional.scala 39:67:@902.6]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@902.6]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@902.6]
  wire [34:0] _GEN_21; // @[Conditional.scala 39:67:@902.6]
  wire  _GEN_23; // @[Conditional.scala 39:67:@902.6]
  wire  _GEN_24; // @[Conditional.scala 40:58:@891.4]
  wire [34:0] _GEN_25; // @[Conditional.scala 40:58:@891.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@891.4]
  wire [1:0] _GEN_28; // @[Conditional.scala 40:58:@891.4]
  wire [31:0] _GEN_29; // @[Conditional.scala 40:58:@891.4]
  wire  _GEN_31; // @[Conditional.scala 40:58:@891.4]
  wire [31:0] _GEN_32; // @[Conditional.scala 40:58:@891.4]
  assign _T_66 = 2'h0 == _T_65; // @[Conditional.scala 37:30:@890.4]
  assign _GEN_0 = io_xferIn_valid ? io_xferIn_address : _T_42; // @[TransferSplitter.scala 59:31:@893.6]
  assign _GEN_1 = io_xferIn_valid ? io_xferIn_length : _T_45; // @[TransferSplitter.scala 59:31:@893.6]
  assign _GEN_3 = io_xferIn_valid ? 2'h1 : _T_65; // @[TransferSplitter.scala 59:31:@893.6]
  assign _T_68 = 2'h1 == _T_65; // @[Conditional.scala 37:30:@901.6]
  assign _T_71 = _T_45 > 32'h100; // @[TransferSplitter.scala 72:23:@907.8]
  assign _T_74 = _T_45 - 32'h100; // @[TransferSplitter.scala 75:34:@910.10]
  assign _T_75 = $unsigned(_T_74); // @[TransferSplitter.scala 75:34:@911.10]
  assign _T_76 = _T_75[31:0]; // @[TransferSplitter.scala 75:34:@912.10]
  assign _T_79 = 9'h100 * 9'h4; // @[TransferSplitter.scala 76:50:@914.10]
  assign _GEN_33 = {{20'd0}, _T_79}; // @[TransferSplitter.scala 76:36:@915.10]
  assign _T_80 = _T_42 + _GEN_33; // @[TransferSplitter.scala 76:36:@915.10]
  assign _T_81 = _T_42 + _GEN_33; // @[TransferSplitter.scala 76:36:@916.10]
  assign _T_84 = _T_45 * 32'h4; // @[TransferSplitter.scala 94:47:@922.10]
  assign _GEN_34 = {{3'd0}, _T_42}; // @[TransferSplitter.scala 94:36:@923.10]
  assign _T_85 = _GEN_34 + _T_84; // @[TransferSplitter.scala 94:36:@923.10]
  assign _T_86 = _GEN_34 + _T_84; // @[TransferSplitter.scala 94:36:@924.10]
  assign _GEN_4 = _T_71 ? 32'h100 : _T_45; // @[TransferSplitter.scala 72:38:@908.8]
  assign _GEN_5 = _T_71 ? _T_76 : 32'h0; // @[TransferSplitter.scala 72:38:@908.8]
  assign _GEN_6 = _T_71 ? {{3'd0}, _T_81} : _T_86; // @[TransferSplitter.scala 72:38:@908.8]
  assign _T_87 = 2'h2 == _T_65; // @[Conditional.scala 37:30:@929.8]
  assign _T_91 = _T_45 > 32'h0; // @[TransferSplitter.scala 113:25:@934.12]
  assign _GEN_7 = _T_91 ? 2'h1 : 2'h0; // @[TransferSplitter.scala 113:32:@935.12]
  assign _GEN_8 = _T_91 ? _T_60 : 1'h1; // @[TransferSplitter.scala 113:32:@935.12]
  assign _GEN_9 = io_xferOut_done ? _GEN_7 : _T_65; // @[TransferSplitter.scala 112:31:@933.10]
  assign _GEN_10 = io_xferOut_done ? _GEN_8 : _T_60; // @[TransferSplitter.scala 112:31:@933.10]
  assign _GEN_11 = _T_87 ? 1'h0 : _T_63; // @[Conditional.scala 39:67:@930.8]
  assign _GEN_13 = _T_87 ? _GEN_9 : _T_65; // @[Conditional.scala 39:67:@930.8]
  assign _GEN_14 = _T_87 ? _GEN_10 : _T_60; // @[Conditional.scala 39:67:@930.8]
  assign _GEN_15 = _T_68 ? _T_42 : _T_48; // @[Conditional.scala 39:67:@902.6]
  assign _GEN_17 = _T_68 ? 1'h1 : _GEN_11; // @[Conditional.scala 39:67:@902.6]
  assign _GEN_18 = _T_68 ? 2'h2 : _GEN_13; // @[Conditional.scala 39:67:@902.6]
  assign _GEN_19 = _T_68 ? _GEN_4 : _T_51; // @[Conditional.scala 39:67:@902.6]
  assign _GEN_20 = _T_68 ? _GEN_5 : _T_45; // @[Conditional.scala 39:67:@902.6]
  assign _GEN_21 = _T_68 ? _GEN_6 : {{3'd0}, _T_42}; // @[Conditional.scala 39:67:@902.6]
  assign _GEN_23 = _T_68 ? _T_60 : _GEN_14; // @[Conditional.scala 39:67:@902.6]
  assign _GEN_24 = _T_66 ? 1'h0 : _GEN_23; // @[Conditional.scala 40:58:@891.4]
  assign _GEN_25 = _T_66 ? {{3'd0}, _GEN_0} : _GEN_21; // @[Conditional.scala 40:58:@891.4]
  assign _GEN_26 = _T_66 ? _GEN_1 : _GEN_20; // @[Conditional.scala 40:58:@891.4]
  assign _GEN_28 = _T_66 ? _GEN_3 : _GEN_18; // @[Conditional.scala 40:58:@891.4]
  assign _GEN_29 = _T_66 ? _T_48 : _GEN_15; // @[Conditional.scala 40:58:@891.4]
  assign _GEN_31 = _T_66 ? _T_63 : _GEN_17; // @[Conditional.scala 40:58:@891.4]
  assign _GEN_32 = _T_66 ? _T_51 : _GEN_19; // @[Conditional.scala 40:58:@891.4]
  assign io_xferIn_done = _T_60; // @[TransferSplitter.scala 48:20:@885.4]
  assign io_xferOut_address = _T_48; // @[TransferSplitter.scala 52:24:@888.4]
  assign io_xferOut_length = _T_51; // @[TransferSplitter.scala 53:23:@889.4]
  assign io_xferOut_valid = _T_63; // @[TransferSplitter.scala 49:22:@886.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_42 = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_45 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_48 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_51 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_60 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_63 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_65 = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_42 <= 32'h0;
    end else begin
      _T_42 <= _GEN_25[31:0];
    end
    if (reset) begin
      _T_45 <= 32'h0;
    end else begin
      if (_T_66) begin
        if (io_xferIn_valid) begin
          _T_45 <= io_xferIn_length;
        end
      end else begin
        if (_T_68) begin
          if (_T_71) begin
            _T_45 <= _T_76;
          end else begin
            _T_45 <= 32'h0;
          end
        end
      end
    end
    if (reset) begin
      _T_48 <= 32'h0;
    end else begin
      if (!(_T_66)) begin
        if (_T_68) begin
          _T_48 <= _T_42;
        end
      end
    end
    if (reset) begin
      _T_51 <= 32'h0;
    end else begin
      if (!(_T_66)) begin
        if (_T_68) begin
          if (_T_71) begin
            _T_51 <= 32'h100;
          end else begin
            _T_51 <= _T_45;
          end
        end
      end
    end
    if (reset) begin
      _T_60 <= 1'h0;
    end else begin
      if (_T_66) begin
        _T_60 <= 1'h0;
      end else begin
        if (!(_T_68)) begin
          if (_T_87) begin
            if (io_xferOut_done) begin
              if (!(_T_91)) begin
                _T_60 <= 1'h1;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      _T_63 <= 1'h0;
    end else begin
      if (!(_T_66)) begin
        if (_T_68) begin
          _T_63 <= 1'h1;
        end else begin
          if (_T_87) begin
            _T_63 <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      _T_65 <= 2'h0;
    end else begin
      if (_T_66) begin
        if (io_xferIn_valid) begin
          _T_65 <= 2'h1;
        end
      end else begin
        if (_T_68) begin
          _T_65 <= 2'h2;
        end else begin
          if (_T_87) begin
            if (io_xferOut_done) begin
              if (_T_91) begin
                _T_65 <= 2'h1;
              end else begin
                _T_65 <= 2'h0;
              end
            end
          end
        end
      end
    end
  end
endmodule
module ClearCSR( // @[:@945.2]
  input         clock, // @[:@946.4]
  input         reset, // @[:@947.4]
  input  [31:0] io_csr_dataOut, // @[:@948.4]
  input         io_csr_dataWrite, // @[:@948.4]
  output [31:0] io_csr_dataIn, // @[:@948.4]
  output [31:0] io_value, // @[:@948.4]
  input  [31:0] io_clear // @[:@948.4]
);
  reg [31:0] reg$; // @[ClearCSR.scala 27:20:@950.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[ClearCSR.scala 35:19:@957.6]
  wire [31:0] _T_30; // @[ClearCSR.scala 35:16:@958.6]
  wire [31:0] _GEN_0; // @[ClearCSR.scala 32:25:@953.4]
  assign _T_29 = ~ io_clear; // @[ClearCSR.scala 35:19:@957.6]
  assign _T_30 = reg$ & _T_29; // @[ClearCSR.scala 35:16:@958.6]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : _T_30; // @[ClearCSR.scala 32:25:@953.4]
  assign io_csr_dataIn = reg$; // @[ClearCSR.scala 29:17:@951.4]
  assign io_value = reg$; // @[ClearCSR.scala 30:12:@952.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= io_csr_dataOut;
      end else begin
        reg$ <= _T_30;
      end
    end
  end
endmodule
module StatusCSR( // @[:@962.2]
  input         clock, // @[:@963.4]
  output [31:0] io_csr_dataIn, // @[:@965.4]
  input  [31:0] io_value // @[:@965.4]
);
  reg [31:0] reg$; // @[StatusCSR.scala 26:20:@967.4]
  reg [31:0] _RAND_0;
  assign io_csr_dataIn = reg$; // @[StatusCSR.scala 28:17:@969.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    reg$ <= io_value;
  end
endmodule
module SimpleCSR( // @[:@971.2]
  input         clock, // @[:@972.4]
  input         reset, // @[:@973.4]
  input  [31:0] io_csr_dataOut, // @[:@974.4]
  input         io_csr_dataWrite, // @[:@974.4]
  output [31:0] io_csr_dataIn, // @[:@974.4]
  output [31:0] io_value // @[:@974.4]
);
  reg [31:0] reg$; // @[SimpleCSR.scala 26:20:@976.4]
  reg [31:0] _RAND_0;
  wire [31:0] _GEN_0; // @[SimpleCSR.scala 31:25:@979.4]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : reg$; // @[SimpleCSR.scala 31:25:@979.4]
  assign io_csr_dataIn = reg$; // @[SimpleCSR.scala 28:17:@977.4]
  assign io_value = reg$; // @[SimpleCSR.scala 29:12:@978.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= io_csr_dataOut;
      end
    end
  end
endmodule
module SetCSR( // @[:@983.2]
  input         clock, // @[:@984.4]
  input         reset, // @[:@985.4]
  input  [31:0] io_csr_dataOut, // @[:@986.4]
  input         io_csr_dataWrite, // @[:@986.4]
  output [31:0] io_csr_dataIn, // @[:@986.4]
  output [31:0] io_value, // @[:@986.4]
  input  [31:0] io_set // @[:@986.4]
);
  reg [31:0] reg$; // @[SetCSR.scala 27:20:@988.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[SetCSR.scala 33:20:@992.6]
  wire [31:0] _T_30; // @[SetCSR.scala 33:17:@993.6]
  wire [31:0] _T_31; // @[SetCSR.scala 33:45:@994.6]
  wire [31:0] _T_32; // @[SetCSR.scala 35:16:@998.6]
  wire [31:0] _GEN_0; // @[SetCSR.scala 32:25:@991.4]
  assign _T_29 = ~ io_csr_dataOut; // @[SetCSR.scala 33:20:@992.6]
  assign _T_30 = reg$ & _T_29; // @[SetCSR.scala 33:17:@993.6]
  assign _T_31 = _T_30 | io_set; // @[SetCSR.scala 33:45:@994.6]
  assign _T_32 = reg$ | io_set; // @[SetCSR.scala 35:16:@998.6]
  assign _GEN_0 = io_csr_dataWrite ? _T_31 : _T_32; // @[SetCSR.scala 32:25:@991.4]
  assign io_csr_dataIn = reg$; // @[SetCSR.scala 29:17:@989.4]
  assign io_value = reg$; // @[SetCSR.scala 30:12:@990.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= _T_31;
      end else begin
        reg$ <= _T_32;
      end
    end
  end
endmodule
module InterruptController( // @[:@1002.2]
  input         clock, // @[:@1003.4]
  input         reset, // @[:@1004.4]
  output        io_irq_readerDone, // @[:@1005.4]
  output        io_irq_writerDone, // @[:@1005.4]
  input         io_readBusy, // @[:@1005.4]
  input         io_writeBusy, // @[:@1005.4]
  input  [31:0] io_imr_dataOut, // @[:@1005.4]
  input         io_imr_dataWrite, // @[:@1005.4]
  output [31:0] io_imr_dataIn, // @[:@1005.4]
  input  [31:0] io_isr_dataOut, // @[:@1005.4]
  input         io_isr_dataWrite, // @[:@1005.4]
  output [31:0] io_isr_dataIn // @[:@1005.4]
);
  wire  SimpleCSR_clock; // @[SimpleCSR.scala 39:21:@1007.4]
  wire  SimpleCSR_reset; // @[SimpleCSR.scala 39:21:@1007.4]
  wire [31:0] SimpleCSR_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1007.4]
  wire  SimpleCSR_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1007.4]
  wire [31:0] SimpleCSR_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1007.4]
  wire [31:0] SimpleCSR_io_value; // @[SimpleCSR.scala 39:21:@1007.4]
  wire  SetCSR_clock; // @[SetCSR.scala 42:21:@1039.4]
  wire  SetCSR_reset; // @[SetCSR.scala 42:21:@1039.4]
  wire [31:0] SetCSR_io_csr_dataOut; // @[SetCSR.scala 42:21:@1039.4]
  wire  SetCSR_io_csr_dataWrite; // @[SetCSR.scala 42:21:@1039.4]
  wire [31:0] SetCSR_io_csr_dataIn; // @[SetCSR.scala 42:21:@1039.4]
  wire [31:0] SetCSR_io_value; // @[SetCSR.scala 42:21:@1039.4]
  wire [31:0] SetCSR_io_set; // @[SetCSR.scala 42:21:@1039.4]
  reg  readBusy; // @[InterruptController.scala 32:25:@1016.4]
  reg [31:0] _RAND_0;
  reg  readBusyOld; // @[InterruptController.scala 33:28:@1018.4]
  reg [31:0] _RAND_1;
  reg  writeBusy; // @[InterruptController.scala 35:26:@1020.4]
  reg [31:0] _RAND_2;
  reg  writeBusyOld; // @[InterruptController.scala 36:29:@1022.4]
  reg [31:0] _RAND_3;
  reg  writeBusyIrq; // @[InterruptController.scala 38:29:@1024.4]
  reg [31:0] _RAND_4;
  reg  readBusyIrq; // @[InterruptController.scala 39:28:@1025.4]
  reg [31:0] _RAND_5;
  wire  _T_59; // @[InterruptController.scala 41:35:@1026.4]
  wire  _T_60; // @[InterruptController.scala 41:32:@1027.4]
  wire [31:0] mask; // @[:@1014.4 :@1015.4]
  wire  _T_61; // @[InterruptController.scala 41:53:@1028.4]
  wire  _T_62; // @[InterruptController.scala 41:46:@1029.4]
  wire  _T_64; // @[InterruptController.scala 42:33:@1031.4]
  wire  _T_65; // @[InterruptController.scala 42:30:@1032.4]
  wire  _T_66; // @[InterruptController.scala 42:50:@1033.4]
  wire  _T_67; // @[InterruptController.scala 42:43:@1034.4]
  wire [1:0] irq; // @[Cat.scala 30:58:@1036.4]
  wire [31:0] isr; // @[:@1047.4 :@1048.4]
  SimpleCSR SimpleCSR ( // @[SimpleCSR.scala 39:21:@1007.4]
    .clock(SimpleCSR_clock),
    .reset(SimpleCSR_reset),
    .io_csr_dataOut(SimpleCSR_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_io_csr_dataIn),
    .io_value(SimpleCSR_io_value)
  );
  SetCSR SetCSR ( // @[SetCSR.scala 42:21:@1039.4]
    .clock(SetCSR_clock),
    .reset(SetCSR_reset),
    .io_csr_dataOut(SetCSR_io_csr_dataOut),
    .io_csr_dataWrite(SetCSR_io_csr_dataWrite),
    .io_csr_dataIn(SetCSR_io_csr_dataIn),
    .io_value(SetCSR_io_value),
    .io_set(SetCSR_io_set)
  );
  assign _T_59 = writeBusy == 1'h0; // @[InterruptController.scala 41:35:@1026.4]
  assign _T_60 = writeBusyOld & _T_59; // @[InterruptController.scala 41:32:@1027.4]
  assign mask = SimpleCSR_io_value; // @[:@1014.4 :@1015.4]
  assign _T_61 = mask[0]; // @[InterruptController.scala 41:53:@1028.4]
  assign _T_62 = _T_60 & _T_61; // @[InterruptController.scala 41:46:@1029.4]
  assign _T_64 = readBusy == 1'h0; // @[InterruptController.scala 42:33:@1031.4]
  assign _T_65 = readBusyOld & _T_64; // @[InterruptController.scala 42:30:@1032.4]
  assign _T_66 = mask[1]; // @[InterruptController.scala 42:50:@1033.4]
  assign _T_67 = _T_65 & _T_66; // @[InterruptController.scala 42:43:@1034.4]
  assign irq = {readBusyIrq,writeBusyIrq}; // @[Cat.scala 30:58:@1036.4]
  assign isr = SetCSR_io_value; // @[:@1047.4 :@1048.4]
  assign io_irq_readerDone = isr[1]; // @[InterruptController.scala 49:21:@1052.4]
  assign io_irq_writerDone = isr[0]; // @[InterruptController.scala 48:21:@1050.4]
  assign io_imr_dataIn = SimpleCSR_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1010.4]
  assign io_isr_dataIn = SetCSR_io_csr_dataIn; // @[SetCSR.scala 46:16:@1043.4]
  assign SimpleCSR_clock = clock; // @[:@1008.4]
  assign SimpleCSR_reset = reset; // @[:@1009.4]
  assign SimpleCSR_io_csr_dataOut = io_imr_dataOut; // @[SimpleCSR.scala 41:16:@1012.4]
  assign SimpleCSR_io_csr_dataWrite = io_imr_dataWrite; // @[SimpleCSR.scala 41:16:@1011.4]
  assign SetCSR_clock = clock; // @[:@1040.4]
  assign SetCSR_reset = reset; // @[:@1041.4]
  assign SetCSR_io_csr_dataOut = io_isr_dataOut; // @[SetCSR.scala 46:16:@1045.4]
  assign SetCSR_io_csr_dataWrite = io_isr_dataWrite; // @[SetCSR.scala 46:16:@1044.4]
  assign SetCSR_io_set = {{30'd0}, irq}; // @[SetCSR.scala 44:16:@1042.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  readBusy = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  readBusyOld = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  writeBusy = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  writeBusyOld = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  writeBusyIrq = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  readBusyIrq = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    readBusy <= io_readBusy;
    readBusyOld <= readBusy;
    writeBusy <= io_writeBusy;
    writeBusyOld <= writeBusy;
    if (reset) begin
      writeBusyIrq <= 1'h0;
    end else begin
      writeBusyIrq <= _T_62;
    end
    if (reset) begin
      readBusyIrq <= 1'h0;
    end else begin
      readBusyIrq <= _T_67;
    end
  end
endmodule
module WorkerCSRWrapper( // @[:@1192.2]
  input         clock, // @[:@1193.4]
  input         reset, // @[:@1194.4]
  input  [31:0] io_csr_0_dataOut, // @[:@1195.4]
  input         io_csr_0_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_0_dataIn, // @[:@1195.4]
  output [31:0] io_csr_1_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_2_dataOut, // @[:@1195.4]
  input         io_csr_2_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_2_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_3_dataOut, // @[:@1195.4]
  input         io_csr_3_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_3_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_4_dataOut, // @[:@1195.4]
  input         io_csr_4_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_4_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_5_dataOut, // @[:@1195.4]
  input         io_csr_5_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_5_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_6_dataOut, // @[:@1195.4]
  input         io_csr_6_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_6_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_7_dataOut, // @[:@1195.4]
  input         io_csr_7_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_7_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_8_dataOut, // @[:@1195.4]
  input         io_csr_8_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_8_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_9_dataOut, // @[:@1195.4]
  input         io_csr_9_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_9_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_10_dataOut, // @[:@1195.4]
  input         io_csr_10_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_10_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_11_dataOut, // @[:@1195.4]
  input         io_csr_11_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_11_dataIn, // @[:@1195.4]
  output [31:0] io_csr_12_dataIn, // @[:@1195.4]
  output [31:0] io_csr_13_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_14_dataOut, // @[:@1195.4]
  input         io_csr_14_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_14_dataIn, // @[:@1195.4]
  input  [31:0] io_csr_15_dataOut, // @[:@1195.4]
  input         io_csr_15_dataWrite, // @[:@1195.4]
  output [31:0] io_csr_15_dataIn, // @[:@1195.4]
  output        io_irq_readerDone, // @[:@1195.4]
  output        io_irq_writerDone, // @[:@1195.4]
  input         io_sync_readerSync, // @[:@1195.4]
  input         io_sync_writerSync, // @[:@1195.4]
  input         io_xferRead_done, // @[:@1195.4]
  output [31:0] io_xferRead_address, // @[:@1195.4]
  output [31:0] io_xferRead_length, // @[:@1195.4]
  output        io_xferRead_valid, // @[:@1195.4]
  input         io_xferWrite_done, // @[:@1195.4]
  output [31:0] io_xferWrite_address, // @[:@1195.4]
  output [31:0] io_xferWrite_length, // @[:@1195.4]
  output        io_xferWrite_valid // @[:@1195.4]
);
  wire  addressGeneratorRead_clock; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire  addressGeneratorRead_reset; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire  addressGeneratorRead_io_ctl_start; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire  addressGeneratorRead_io_ctl_busy; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire [31:0] addressGeneratorRead_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire  addressGeneratorRead_io_xfer_done; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire [31:0] addressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire [31:0] addressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire  addressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 32:36:@1197.4]
  wire  transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 33:36:@1200.4]
  wire [31:0] transferSplitterRead_io_xferIn_address; // @[WorkerCSRWrapper.scala 33:36:@1200.4]
  wire [31:0] transferSplitterRead_io_xferIn_length; // @[WorkerCSRWrapper.scala 33:36:@1200.4]
  wire  transferSplitterRead_io_xferIn_valid; // @[WorkerCSRWrapper.scala 33:36:@1200.4]
  wire  transferSplitterRead_io_xferOut_done; // @[WorkerCSRWrapper.scala 33:36:@1200.4]
  wire [31:0] transferSplitterRead_io_xferOut_address; // @[WorkerCSRWrapper.scala 33:36:@1200.4]
  wire [31:0] transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 33:36:@1200.4]
  wire  transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 33:36:@1200.4]
  wire  addressGeneratorWrite_clock; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire  addressGeneratorWrite_reset; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire  addressGeneratorWrite_io_ctl_start; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire  addressGeneratorWrite_io_ctl_busy; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire [31:0] addressGeneratorWrite_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire  addressGeneratorWrite_io_xfer_done; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire [31:0] addressGeneratorWrite_io_xfer_address; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire [31:0] addressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire  addressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 35:37:@1203.4]
  wire  transferSplitterWrite_clock; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire  transferSplitterWrite_reset; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire  transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire [31:0] transferSplitterWrite_io_xferIn_address; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire [31:0] transferSplitterWrite_io_xferIn_length; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire  transferSplitterWrite_io_xferIn_valid; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire  transferSplitterWrite_io_xferOut_done; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire [31:0] transferSplitterWrite_io_xferOut_address; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire [31:0] transferSplitterWrite_io_xferOut_length; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire  transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 36:37:@1206.4]
  wire  ClearCSR_clock; // @[ClearCSR.scala 41:21:@1226.4]
  wire  ClearCSR_reset; // @[ClearCSR.scala 41:21:@1226.4]
  wire [31:0] ClearCSR_io_csr_dataOut; // @[ClearCSR.scala 41:21:@1226.4]
  wire  ClearCSR_io_csr_dataWrite; // @[ClearCSR.scala 41:21:@1226.4]
  wire [31:0] ClearCSR_io_csr_dataIn; // @[ClearCSR.scala 41:21:@1226.4]
  wire [31:0] ClearCSR_io_value; // @[ClearCSR.scala 41:21:@1226.4]
  wire [31:0] ClearCSR_io_clear; // @[ClearCSR.scala 41:21:@1226.4]
  wire  StatusCSR_clock; // @[StatusCSR.scala 33:21:@1235.4]
  wire [31:0] StatusCSR_io_csr_dataIn; // @[StatusCSR.scala 33:21:@1235.4]
  wire [31:0] StatusCSR_io_value; // @[StatusCSR.scala 33:21:@1235.4]
  wire  InterruptController_clock; // @[InterruptController.scala 54:22:@1243.4]
  wire  InterruptController_reset; // @[InterruptController.scala 54:22:@1243.4]
  wire  InterruptController_io_irq_readerDone; // @[InterruptController.scala 54:22:@1243.4]
  wire  InterruptController_io_irq_writerDone; // @[InterruptController.scala 54:22:@1243.4]
  wire  InterruptController_io_readBusy; // @[InterruptController.scala 54:22:@1243.4]
  wire  InterruptController_io_writeBusy; // @[InterruptController.scala 54:22:@1243.4]
  wire [31:0] InterruptController_io_imr_dataOut; // @[InterruptController.scala 54:22:@1243.4]
  wire  InterruptController_io_imr_dataWrite; // @[InterruptController.scala 54:22:@1243.4]
  wire [31:0] InterruptController_io_imr_dataIn; // @[InterruptController.scala 54:22:@1243.4]
  wire [31:0] InterruptController_io_isr_dataOut; // @[InterruptController.scala 54:22:@1243.4]
  wire  InterruptController_io_isr_dataWrite; // @[InterruptController.scala 54:22:@1243.4]
  wire [31:0] InterruptController_io_isr_dataIn; // @[InterruptController.scala 54:22:@1243.4]
  wire  SimpleCSR_clock; // @[SimpleCSR.scala 39:21:@1280.4]
  wire  SimpleCSR_reset; // @[SimpleCSR.scala 39:21:@1280.4]
  wire [31:0] SimpleCSR_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1280.4]
  wire  SimpleCSR_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1280.4]
  wire [31:0] SimpleCSR_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1280.4]
  wire [31:0] SimpleCSR_io_value; // @[SimpleCSR.scala 39:21:@1280.4]
  wire  SimpleCSR_1_clock; // @[SimpleCSR.scala 39:21:@1288.4]
  wire  SimpleCSR_1_reset; // @[SimpleCSR.scala 39:21:@1288.4]
  wire [31:0] SimpleCSR_1_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1288.4]
  wire  SimpleCSR_1_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1288.4]
  wire [31:0] SimpleCSR_1_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1288.4]
  wire [31:0] SimpleCSR_1_io_value; // @[SimpleCSR.scala 39:21:@1288.4]
  wire  SimpleCSR_2_clock; // @[SimpleCSR.scala 39:21:@1296.4]
  wire  SimpleCSR_2_reset; // @[SimpleCSR.scala 39:21:@1296.4]
  wire [31:0] SimpleCSR_2_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1296.4]
  wire  SimpleCSR_2_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1296.4]
  wire [31:0] SimpleCSR_2_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1296.4]
  wire [31:0] SimpleCSR_2_io_value; // @[SimpleCSR.scala 39:21:@1296.4]
  wire  SimpleCSR_3_clock; // @[SimpleCSR.scala 39:21:@1304.4]
  wire  SimpleCSR_3_reset; // @[SimpleCSR.scala 39:21:@1304.4]
  wire [31:0] SimpleCSR_3_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1304.4]
  wire  SimpleCSR_3_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1304.4]
  wire [31:0] SimpleCSR_3_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1304.4]
  wire [31:0] SimpleCSR_3_io_value; // @[SimpleCSR.scala 39:21:@1304.4]
  wire  SimpleCSR_4_clock; // @[SimpleCSR.scala 39:21:@1313.4]
  wire  SimpleCSR_4_reset; // @[SimpleCSR.scala 39:21:@1313.4]
  wire [31:0] SimpleCSR_4_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1313.4]
  wire  SimpleCSR_4_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1313.4]
  wire [31:0] SimpleCSR_4_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1313.4]
  wire [31:0] SimpleCSR_4_io_value; // @[SimpleCSR.scala 39:21:@1313.4]
  wire  SimpleCSR_5_clock; // @[SimpleCSR.scala 39:21:@1321.4]
  wire  SimpleCSR_5_reset; // @[SimpleCSR.scala 39:21:@1321.4]
  wire [31:0] SimpleCSR_5_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1321.4]
  wire  SimpleCSR_5_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1321.4]
  wire [31:0] SimpleCSR_5_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1321.4]
  wire [31:0] SimpleCSR_5_io_value; // @[SimpleCSR.scala 39:21:@1321.4]
  wire  SimpleCSR_6_clock; // @[SimpleCSR.scala 39:21:@1329.4]
  wire  SimpleCSR_6_reset; // @[SimpleCSR.scala 39:21:@1329.4]
  wire [31:0] SimpleCSR_6_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1329.4]
  wire  SimpleCSR_6_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1329.4]
  wire [31:0] SimpleCSR_6_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1329.4]
  wire [31:0] SimpleCSR_6_io_value; // @[SimpleCSR.scala 39:21:@1329.4]
  wire  SimpleCSR_7_clock; // @[SimpleCSR.scala 39:21:@1337.4]
  wire  SimpleCSR_7_reset; // @[SimpleCSR.scala 39:21:@1337.4]
  wire [31:0] SimpleCSR_7_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1337.4]
  wire  SimpleCSR_7_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1337.4]
  wire [31:0] SimpleCSR_7_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1337.4]
  wire [31:0] SimpleCSR_7_io_value; // @[SimpleCSR.scala 39:21:@1337.4]
  wire  StatusCSR_1_clock; // @[StatusCSR.scala 33:21:@1345.4]
  wire [31:0] StatusCSR_1_io_csr_dataIn; // @[StatusCSR.scala 33:21:@1345.4]
  wire [31:0] StatusCSR_1_io_value; // @[StatusCSR.scala 33:21:@1345.4]
  wire  StatusCSR_2_clock; // @[StatusCSR.scala 33:21:@1353.4]
  wire [31:0] StatusCSR_2_io_csr_dataIn; // @[StatusCSR.scala 33:21:@1353.4]
  wire [31:0] StatusCSR_2_io_value; // @[StatusCSR.scala 33:21:@1353.4]
  wire  SimpleCSR_8_clock; // @[SimpleCSR.scala 39:21:@1361.4]
  wire  SimpleCSR_8_reset; // @[SimpleCSR.scala 39:21:@1361.4]
  wire [31:0] SimpleCSR_8_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1361.4]
  wire  SimpleCSR_8_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1361.4]
  wire [31:0] SimpleCSR_8_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1361.4]
  wire [31:0] SimpleCSR_8_io_value; // @[SimpleCSR.scala 39:21:@1361.4]
  wire  SimpleCSR_9_clock; // @[SimpleCSR.scala 39:21:@1368.4]
  wire  SimpleCSR_9_reset; // @[SimpleCSR.scala 39:21:@1368.4]
  wire [31:0] SimpleCSR_9_io_csr_dataOut; // @[SimpleCSR.scala 39:21:@1368.4]
  wire  SimpleCSR_9_io_csr_dataWrite; // @[SimpleCSR.scala 39:21:@1368.4]
  wire [31:0] SimpleCSR_9_io_csr_dataIn; // @[SimpleCSR.scala 39:21:@1368.4]
  wire [31:0] SimpleCSR_9_io_value; // @[SimpleCSR.scala 39:21:@1368.4]
  reg [1:0] status; // @[WorkerCSRWrapper.scala 38:23:@1210.4]
  reg [31:0] _RAND_0;
  reg  readerSync; // @[WorkerCSRWrapper.scala 40:27:@1212.4]
  reg [31:0] _RAND_1;
  reg  readerSyncOld; // @[WorkerCSRWrapper.scala 41:30:@1214.4]
  reg [31:0] _RAND_2;
  reg  writerSync; // @[WorkerCSRWrapper.scala 43:27:@1216.4]
  reg [31:0] _RAND_3;
  reg  writerSyncOld; // @[WorkerCSRWrapper.scala 44:30:@1218.4]
  reg [31:0] _RAND_4;
  reg  readerStart; // @[WorkerCSRWrapper.scala 46:28:@1220.4]
  reg [31:0] _RAND_5;
  reg  writerStart; // @[WorkerCSRWrapper.scala 47:28:@1221.4]
  reg [31:0] _RAND_6;
  wire [1:0] _T_207; // @[Cat.scala 30:58:@1258.4]
  wire [31:0] control; // @[WorkerCSRWrapper.scala 49:21:@1222.4 WorkerCSRWrapper.scala 58:11:@1234.4]
  wire  _T_208; // @[WorkerCSRWrapper.scala 65:56:@1259.4]
  wire  _T_209; // @[WorkerCSRWrapper.scala 65:68:@1260.4]
  wire [1:0] _T_210; // @[Cat.scala 30:58:@1261.4]
  wire [1:0] _T_211; // @[WorkerCSRWrapper.scala 65:44:@1262.4]
  wire [1:0] clear; // @[WorkerCSRWrapper.scala 65:42:@1263.4]
  wire  _T_214; // @[WorkerCSRWrapper.scala 67:20:@1265.4]
  wire  _T_215; // @[WorkerCSRWrapper.scala 67:35:@1266.4]
  wire  _T_216; // @[WorkerCSRWrapper.scala 67:60:@1267.4]
  wire  _T_217; // @[WorkerCSRWrapper.scala 67:50:@1268.4]
  wire  _T_218; // @[WorkerCSRWrapper.scala 67:75:@1269.4]
  wire  _T_219; // @[WorkerCSRWrapper.scala 67:65:@1270.4]
  wire  _T_221; // @[WorkerCSRWrapper.scala 68:20:@1272.4]
  wire  _T_222; // @[WorkerCSRWrapper.scala 68:35:@1273.4]
  wire  _T_223; // @[WorkerCSRWrapper.scala 68:60:@1274.4]
  wire  _T_224; // @[WorkerCSRWrapper.scala 68:50:@1275.4]
  wire  _T_225; // @[WorkerCSRWrapper.scala 68:75:@1276.4]
  wire  _T_226; // @[WorkerCSRWrapper.scala 68:65:@1277.4]
  AddressGenerator addressGeneratorRead ( // @[WorkerCSRWrapper.scala 32:36:@1197.4]
    .clock(addressGeneratorRead_clock),
    .reset(addressGeneratorRead_reset),
    .io_ctl_start(addressGeneratorRead_io_ctl_start),
    .io_ctl_busy(addressGeneratorRead_io_ctl_busy),
    .io_ctl_startAddress(addressGeneratorRead_io_ctl_startAddress),
    .io_ctl_lineLength(addressGeneratorRead_io_ctl_lineLength),
    .io_ctl_lineCount(addressGeneratorRead_io_ctl_lineCount),
    .io_ctl_lineGap(addressGeneratorRead_io_ctl_lineGap),
    .io_xfer_done(addressGeneratorRead_io_xfer_done),
    .io_xfer_address(addressGeneratorRead_io_xfer_address),
    .io_xfer_length(addressGeneratorRead_io_xfer_length),
    .io_xfer_valid(addressGeneratorRead_io_xfer_valid)
  );
  TransferSplitter transferSplitterRead ( // @[WorkerCSRWrapper.scala 33:36:@1200.4]
    .io_xferIn_done(transferSplitterRead_io_xferIn_done),
    .io_xferIn_address(transferSplitterRead_io_xferIn_address),
    .io_xferIn_length(transferSplitterRead_io_xferIn_length),
    .io_xferIn_valid(transferSplitterRead_io_xferIn_valid),
    .io_xferOut_done(transferSplitterRead_io_xferOut_done),
    .io_xferOut_address(transferSplitterRead_io_xferOut_address),
    .io_xferOut_length(transferSplitterRead_io_xferOut_length),
    .io_xferOut_valid(transferSplitterRead_io_xferOut_valid)
  );
  AddressGenerator addressGeneratorWrite ( // @[WorkerCSRWrapper.scala 35:37:@1203.4]
    .clock(addressGeneratorWrite_clock),
    .reset(addressGeneratorWrite_reset),
    .io_ctl_start(addressGeneratorWrite_io_ctl_start),
    .io_ctl_busy(addressGeneratorWrite_io_ctl_busy),
    .io_ctl_startAddress(addressGeneratorWrite_io_ctl_startAddress),
    .io_ctl_lineLength(addressGeneratorWrite_io_ctl_lineLength),
    .io_ctl_lineCount(addressGeneratorWrite_io_ctl_lineCount),
    .io_ctl_lineGap(addressGeneratorWrite_io_ctl_lineGap),
    .io_xfer_done(addressGeneratorWrite_io_xfer_done),
    .io_xfer_address(addressGeneratorWrite_io_xfer_address),
    .io_xfer_length(addressGeneratorWrite_io_xfer_length),
    .io_xfer_valid(addressGeneratorWrite_io_xfer_valid)
  );
  TransferSplitter_1 transferSplitterWrite ( // @[WorkerCSRWrapper.scala 36:37:@1206.4]
    .clock(transferSplitterWrite_clock),
    .reset(transferSplitterWrite_reset),
    .io_xferIn_done(transferSplitterWrite_io_xferIn_done),
    .io_xferIn_address(transferSplitterWrite_io_xferIn_address),
    .io_xferIn_length(transferSplitterWrite_io_xferIn_length),
    .io_xferIn_valid(transferSplitterWrite_io_xferIn_valid),
    .io_xferOut_done(transferSplitterWrite_io_xferOut_done),
    .io_xferOut_address(transferSplitterWrite_io_xferOut_address),
    .io_xferOut_length(transferSplitterWrite_io_xferOut_length),
    .io_xferOut_valid(transferSplitterWrite_io_xferOut_valid)
  );
  ClearCSR ClearCSR ( // @[ClearCSR.scala 41:21:@1226.4]
    .clock(ClearCSR_clock),
    .reset(ClearCSR_reset),
    .io_csr_dataOut(ClearCSR_io_csr_dataOut),
    .io_csr_dataWrite(ClearCSR_io_csr_dataWrite),
    .io_csr_dataIn(ClearCSR_io_csr_dataIn),
    .io_value(ClearCSR_io_value),
    .io_clear(ClearCSR_io_clear)
  );
  StatusCSR StatusCSR ( // @[StatusCSR.scala 33:21:@1235.4]
    .clock(StatusCSR_clock),
    .io_csr_dataIn(StatusCSR_io_csr_dataIn),
    .io_value(StatusCSR_io_value)
  );
  InterruptController InterruptController ( // @[InterruptController.scala 54:22:@1243.4]
    .clock(InterruptController_clock),
    .reset(InterruptController_reset),
    .io_irq_readerDone(InterruptController_io_irq_readerDone),
    .io_irq_writerDone(InterruptController_io_irq_writerDone),
    .io_readBusy(InterruptController_io_readBusy),
    .io_writeBusy(InterruptController_io_writeBusy),
    .io_imr_dataOut(InterruptController_io_imr_dataOut),
    .io_imr_dataWrite(InterruptController_io_imr_dataWrite),
    .io_imr_dataIn(InterruptController_io_imr_dataIn),
    .io_isr_dataOut(InterruptController_io_isr_dataOut),
    .io_isr_dataWrite(InterruptController_io_isr_dataWrite),
    .io_isr_dataIn(InterruptController_io_isr_dataIn)
  );
  SimpleCSR SimpleCSR ( // @[SimpleCSR.scala 39:21:@1280.4]
    .clock(SimpleCSR_clock),
    .reset(SimpleCSR_reset),
    .io_csr_dataOut(SimpleCSR_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_io_csr_dataIn),
    .io_value(SimpleCSR_io_value)
  );
  SimpleCSR SimpleCSR_1 ( // @[SimpleCSR.scala 39:21:@1288.4]
    .clock(SimpleCSR_1_clock),
    .reset(SimpleCSR_1_reset),
    .io_csr_dataOut(SimpleCSR_1_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_1_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_1_io_csr_dataIn),
    .io_value(SimpleCSR_1_io_value)
  );
  SimpleCSR SimpleCSR_2 ( // @[SimpleCSR.scala 39:21:@1296.4]
    .clock(SimpleCSR_2_clock),
    .reset(SimpleCSR_2_reset),
    .io_csr_dataOut(SimpleCSR_2_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_2_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_2_io_csr_dataIn),
    .io_value(SimpleCSR_2_io_value)
  );
  SimpleCSR SimpleCSR_3 ( // @[SimpleCSR.scala 39:21:@1304.4]
    .clock(SimpleCSR_3_clock),
    .reset(SimpleCSR_3_reset),
    .io_csr_dataOut(SimpleCSR_3_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_3_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_3_io_csr_dataIn),
    .io_value(SimpleCSR_3_io_value)
  );
  SimpleCSR SimpleCSR_4 ( // @[SimpleCSR.scala 39:21:@1313.4]
    .clock(SimpleCSR_4_clock),
    .reset(SimpleCSR_4_reset),
    .io_csr_dataOut(SimpleCSR_4_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_4_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_4_io_csr_dataIn),
    .io_value(SimpleCSR_4_io_value)
  );
  SimpleCSR SimpleCSR_5 ( // @[SimpleCSR.scala 39:21:@1321.4]
    .clock(SimpleCSR_5_clock),
    .reset(SimpleCSR_5_reset),
    .io_csr_dataOut(SimpleCSR_5_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_5_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_5_io_csr_dataIn),
    .io_value(SimpleCSR_5_io_value)
  );
  SimpleCSR SimpleCSR_6 ( // @[SimpleCSR.scala 39:21:@1329.4]
    .clock(SimpleCSR_6_clock),
    .reset(SimpleCSR_6_reset),
    .io_csr_dataOut(SimpleCSR_6_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_6_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_6_io_csr_dataIn),
    .io_value(SimpleCSR_6_io_value)
  );
  SimpleCSR SimpleCSR_7 ( // @[SimpleCSR.scala 39:21:@1337.4]
    .clock(SimpleCSR_7_clock),
    .reset(SimpleCSR_7_reset),
    .io_csr_dataOut(SimpleCSR_7_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_7_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_7_io_csr_dataIn),
    .io_value(SimpleCSR_7_io_value)
  );
  StatusCSR StatusCSR_1 ( // @[StatusCSR.scala 33:21:@1345.4]
    .clock(StatusCSR_1_clock),
    .io_csr_dataIn(StatusCSR_1_io_csr_dataIn),
    .io_value(StatusCSR_1_io_value)
  );
  StatusCSR StatusCSR_2 ( // @[StatusCSR.scala 33:21:@1353.4]
    .clock(StatusCSR_2_clock),
    .io_csr_dataIn(StatusCSR_2_io_csr_dataIn),
    .io_value(StatusCSR_2_io_value)
  );
  SimpleCSR SimpleCSR_8 ( // @[SimpleCSR.scala 39:21:@1361.4]
    .clock(SimpleCSR_8_clock),
    .reset(SimpleCSR_8_reset),
    .io_csr_dataOut(SimpleCSR_8_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_8_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_8_io_csr_dataIn),
    .io_value(SimpleCSR_8_io_value)
  );
  SimpleCSR SimpleCSR_9 ( // @[SimpleCSR.scala 39:21:@1368.4]
    .clock(SimpleCSR_9_clock),
    .reset(SimpleCSR_9_reset),
    .io_csr_dataOut(SimpleCSR_9_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_9_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_9_io_csr_dataIn),
    .io_value(SimpleCSR_9_io_value)
  );
  assign _T_207 = {readerStart,writerStart}; // @[Cat.scala 30:58:@1258.4]
  assign control = ClearCSR_io_value; // @[WorkerCSRWrapper.scala 49:21:@1222.4 WorkerCSRWrapper.scala 58:11:@1234.4]
  assign _T_208 = control[5]; // @[WorkerCSRWrapper.scala 65:56:@1259.4]
  assign _T_209 = control[4]; // @[WorkerCSRWrapper.scala 65:68:@1260.4]
  assign _T_210 = {_T_208,_T_209}; // @[Cat.scala 30:58:@1261.4]
  assign _T_211 = ~ _T_210; // @[WorkerCSRWrapper.scala 65:44:@1262.4]
  assign clear = _T_207 & _T_211; // @[WorkerCSRWrapper.scala 65:42:@1263.4]
  assign _T_214 = readerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 67:20:@1265.4]
  assign _T_215 = _T_214 & readerSync; // @[WorkerCSRWrapper.scala 67:35:@1266.4]
  assign _T_216 = control[3]; // @[WorkerCSRWrapper.scala 67:60:@1267.4]
  assign _T_217 = _T_215 | _T_216; // @[WorkerCSRWrapper.scala 67:50:@1268.4]
  assign _T_218 = control[1]; // @[WorkerCSRWrapper.scala 67:75:@1269.4]
  assign _T_219 = _T_217 & _T_218; // @[WorkerCSRWrapper.scala 67:65:@1270.4]
  assign _T_221 = writerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 68:20:@1272.4]
  assign _T_222 = _T_221 & writerSync; // @[WorkerCSRWrapper.scala 68:35:@1273.4]
  assign _T_223 = control[2]; // @[WorkerCSRWrapper.scala 68:60:@1274.4]
  assign _T_224 = _T_222 | _T_223; // @[WorkerCSRWrapper.scala 68:50:@1275.4]
  assign _T_225 = control[0]; // @[WorkerCSRWrapper.scala 68:75:@1276.4]
  assign _T_226 = _T_224 & _T_225; // @[WorkerCSRWrapper.scala 68:65:@1277.4]
  assign io_csr_0_dataIn = ClearCSR_io_csr_dataIn; // @[ClearCSR.scala 45:16:@1230.4]
  assign io_csr_1_dataIn = StatusCSR_io_csr_dataIn; // @[StatusCSR.scala 35:16:@1238.4]
  assign io_csr_2_dataIn = InterruptController_io_imr_dataIn; // @[InterruptController.scala 59:17:@1248.4]
  assign io_csr_3_dataIn = InterruptController_io_isr_dataIn; // @[InterruptController.scala 60:17:@1252.4]
  assign io_csr_4_dataIn = SimpleCSR_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1283.4]
  assign io_csr_5_dataIn = SimpleCSR_1_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1291.4]
  assign io_csr_6_dataIn = SimpleCSR_2_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1299.4]
  assign io_csr_7_dataIn = SimpleCSR_3_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1307.4]
  assign io_csr_8_dataIn = SimpleCSR_4_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1316.4]
  assign io_csr_9_dataIn = SimpleCSR_5_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1324.4]
  assign io_csr_10_dataIn = SimpleCSR_6_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1332.4]
  assign io_csr_11_dataIn = SimpleCSR_7_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1340.4]
  assign io_csr_12_dataIn = StatusCSR_1_io_csr_dataIn; // @[StatusCSR.scala 35:16:@1348.4]
  assign io_csr_13_dataIn = StatusCSR_2_io_csr_dataIn; // @[StatusCSR.scala 35:16:@1356.4]
  assign io_csr_14_dataIn = SimpleCSR_8_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1364.4]
  assign io_csr_15_dataIn = SimpleCSR_9_io_csr_dataIn; // @[SimpleCSR.scala 41:16:@1371.4]
  assign io_irq_readerDone = InterruptController_io_irq_readerDone; // @[WorkerCSRWrapper.scala 62:10:@1257.4]
  assign io_irq_writerDone = InterruptController_io_irq_writerDone; // @[WorkerCSRWrapper.scala 62:10:@1256.4]
  assign io_xferRead_address = transferSplitterRead_io_xferOut_address; // @[WorkerCSRWrapper.scala 90:15:@1383.4]
  assign io_xferRead_length = transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 90:15:@1382.4]
  assign io_xferRead_valid = transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 90:15:@1381.4]
  assign io_xferWrite_address = transferSplitterWrite_io_xferOut_address; // @[WorkerCSRWrapper.scala 93:16:@1393.4]
  assign io_xferWrite_length = transferSplitterWrite_io_xferOut_length; // @[WorkerCSRWrapper.scala 93:16:@1392.4]
  assign io_xferWrite_valid = transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 93:16:@1391.4]
  assign addressGeneratorRead_clock = clock; // @[:@1198.4]
  assign addressGeneratorRead_reset = reset; // @[:@1199.4]
  assign addressGeneratorRead_io_ctl_start = readerStart; // @[WorkerCSRWrapper.scala 70:37:@1279.4]
  assign addressGeneratorRead_io_ctl_startAddress = SimpleCSR_io_value; // @[WorkerCSRWrapper.scala 71:44:@1287.4]
  assign addressGeneratorRead_io_ctl_lineLength = SimpleCSR_1_io_value; // @[WorkerCSRWrapper.scala 72:42:@1295.4]
  assign addressGeneratorRead_io_ctl_lineCount = SimpleCSR_2_io_value; // @[WorkerCSRWrapper.scala 73:41:@1303.4]
  assign addressGeneratorRead_io_ctl_lineGap = SimpleCSR_3_io_value; // @[WorkerCSRWrapper.scala 74:39:@1311.4]
  assign addressGeneratorRead_io_xfer_done = transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 89:34:@1379.4]
  assign transferSplitterRead_io_xferIn_address = addressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 89:34:@1378.4]
  assign transferSplitterRead_io_xferIn_length = addressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 89:34:@1377.4]
  assign transferSplitterRead_io_xferIn_valid = addressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 89:34:@1376.4]
  assign transferSplitterRead_io_xferOut_done = io_xferRead_done; // @[WorkerCSRWrapper.scala 90:15:@1384.4]
  assign addressGeneratorWrite_clock = clock; // @[:@1204.4]
  assign addressGeneratorWrite_reset = reset; // @[:@1205.4]
  assign addressGeneratorWrite_io_ctl_start = writerStart; // @[WorkerCSRWrapper.scala 76:38:@1312.4]
  assign addressGeneratorWrite_io_ctl_startAddress = SimpleCSR_4_io_value; // @[WorkerCSRWrapper.scala 77:45:@1320.4]
  assign addressGeneratorWrite_io_ctl_lineLength = SimpleCSR_5_io_value; // @[WorkerCSRWrapper.scala 78:43:@1328.4]
  assign addressGeneratorWrite_io_ctl_lineCount = SimpleCSR_6_io_value; // @[WorkerCSRWrapper.scala 79:42:@1336.4]
  assign addressGeneratorWrite_io_ctl_lineGap = SimpleCSR_7_io_value; // @[WorkerCSRWrapper.scala 80:40:@1344.4]
  assign addressGeneratorWrite_io_xfer_done = transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 92:35:@1389.4]
  assign transferSplitterWrite_clock = clock; // @[:@1207.4]
  assign transferSplitterWrite_reset = reset; // @[:@1208.4]
  assign transferSplitterWrite_io_xferIn_address = addressGeneratorWrite_io_xfer_address; // @[WorkerCSRWrapper.scala 92:35:@1388.4]
  assign transferSplitterWrite_io_xferIn_length = addressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 92:35:@1387.4]
  assign transferSplitterWrite_io_xferIn_valid = addressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 92:35:@1386.4]
  assign transferSplitterWrite_io_xferOut_done = io_xferWrite_done; // @[WorkerCSRWrapper.scala 93:16:@1394.4]
  assign ClearCSR_clock = clock; // @[:@1227.4]
  assign ClearCSR_reset = reset; // @[:@1228.4]
  assign ClearCSR_io_csr_dataOut = io_csr_0_dataOut; // @[ClearCSR.scala 45:16:@1232.4]
  assign ClearCSR_io_csr_dataWrite = io_csr_0_dataWrite; // @[ClearCSR.scala 45:16:@1231.4]
  assign ClearCSR_io_clear = {{30'd0}, clear}; // @[ClearCSR.scala 43:18:@1229.4]
  assign StatusCSR_clock = clock; // @[:@1236.4]
  assign StatusCSR_io_value = {{30'd0}, status}; // @[StatusCSR.scala 37:18:@1242.4]
  assign InterruptController_clock = clock; // @[:@1244.4]
  assign InterruptController_reset = reset; // @[:@1245.4]
  assign InterruptController_io_readBusy = addressGeneratorRead_io_ctl_busy; // @[InterruptController.scala 56:22:@1246.4]
  assign InterruptController_io_writeBusy = addressGeneratorWrite_io_ctl_busy; // @[InterruptController.scala 57:23:@1247.4]
  assign InterruptController_io_imr_dataOut = io_csr_2_dataOut; // @[InterruptController.scala 59:17:@1250.4]
  assign InterruptController_io_imr_dataWrite = io_csr_2_dataWrite; // @[InterruptController.scala 59:17:@1249.4]
  assign InterruptController_io_isr_dataOut = io_csr_3_dataOut; // @[InterruptController.scala 60:17:@1254.4]
  assign InterruptController_io_isr_dataWrite = io_csr_3_dataWrite; // @[InterruptController.scala 60:17:@1253.4]
  assign SimpleCSR_clock = clock; // @[:@1281.4]
  assign SimpleCSR_reset = reset; // @[:@1282.4]
  assign SimpleCSR_io_csr_dataOut = io_csr_4_dataOut; // @[SimpleCSR.scala 41:16:@1285.4]
  assign SimpleCSR_io_csr_dataWrite = io_csr_4_dataWrite; // @[SimpleCSR.scala 41:16:@1284.4]
  assign SimpleCSR_1_clock = clock; // @[:@1289.4]
  assign SimpleCSR_1_reset = reset; // @[:@1290.4]
  assign SimpleCSR_1_io_csr_dataOut = io_csr_5_dataOut; // @[SimpleCSR.scala 41:16:@1293.4]
  assign SimpleCSR_1_io_csr_dataWrite = io_csr_5_dataWrite; // @[SimpleCSR.scala 41:16:@1292.4]
  assign SimpleCSR_2_clock = clock; // @[:@1297.4]
  assign SimpleCSR_2_reset = reset; // @[:@1298.4]
  assign SimpleCSR_2_io_csr_dataOut = io_csr_6_dataOut; // @[SimpleCSR.scala 41:16:@1301.4]
  assign SimpleCSR_2_io_csr_dataWrite = io_csr_6_dataWrite; // @[SimpleCSR.scala 41:16:@1300.4]
  assign SimpleCSR_3_clock = clock; // @[:@1305.4]
  assign SimpleCSR_3_reset = reset; // @[:@1306.4]
  assign SimpleCSR_3_io_csr_dataOut = io_csr_7_dataOut; // @[SimpleCSR.scala 41:16:@1309.4]
  assign SimpleCSR_3_io_csr_dataWrite = io_csr_7_dataWrite; // @[SimpleCSR.scala 41:16:@1308.4]
  assign SimpleCSR_4_clock = clock; // @[:@1314.4]
  assign SimpleCSR_4_reset = reset; // @[:@1315.4]
  assign SimpleCSR_4_io_csr_dataOut = io_csr_8_dataOut; // @[SimpleCSR.scala 41:16:@1318.4]
  assign SimpleCSR_4_io_csr_dataWrite = io_csr_8_dataWrite; // @[SimpleCSR.scala 41:16:@1317.4]
  assign SimpleCSR_5_clock = clock; // @[:@1322.4]
  assign SimpleCSR_5_reset = reset; // @[:@1323.4]
  assign SimpleCSR_5_io_csr_dataOut = io_csr_9_dataOut; // @[SimpleCSR.scala 41:16:@1326.4]
  assign SimpleCSR_5_io_csr_dataWrite = io_csr_9_dataWrite; // @[SimpleCSR.scala 41:16:@1325.4]
  assign SimpleCSR_6_clock = clock; // @[:@1330.4]
  assign SimpleCSR_6_reset = reset; // @[:@1331.4]
  assign SimpleCSR_6_io_csr_dataOut = io_csr_10_dataOut; // @[SimpleCSR.scala 41:16:@1334.4]
  assign SimpleCSR_6_io_csr_dataWrite = io_csr_10_dataWrite; // @[SimpleCSR.scala 41:16:@1333.4]
  assign SimpleCSR_7_clock = clock; // @[:@1338.4]
  assign SimpleCSR_7_reset = reset; // @[:@1339.4]
  assign SimpleCSR_7_io_csr_dataOut = io_csr_11_dataOut; // @[SimpleCSR.scala 41:16:@1342.4]
  assign SimpleCSR_7_io_csr_dataWrite = io_csr_11_dataWrite; // @[SimpleCSR.scala 41:16:@1341.4]
  assign StatusCSR_1_clock = clock; // @[:@1346.4]
  assign StatusCSR_1_io_value = 32'h0; // @[StatusCSR.scala 37:18:@1352.4]
  assign StatusCSR_2_clock = clock; // @[:@1354.4]
  assign StatusCSR_2_io_value = 32'h0; // @[StatusCSR.scala 37:18:@1360.4]
  assign SimpleCSR_8_clock = clock; // @[:@1362.4]
  assign SimpleCSR_8_reset = reset; // @[:@1363.4]
  assign SimpleCSR_8_io_csr_dataOut = io_csr_14_dataOut; // @[SimpleCSR.scala 41:16:@1366.4]
  assign SimpleCSR_8_io_csr_dataWrite = io_csr_14_dataWrite; // @[SimpleCSR.scala 41:16:@1365.4]
  assign SimpleCSR_9_clock = clock; // @[:@1369.4]
  assign SimpleCSR_9_reset = reset; // @[:@1370.4]
  assign SimpleCSR_9_io_csr_dataOut = io_csr_15_dataOut; // @[SimpleCSR.scala 41:16:@1373.4]
  assign SimpleCSR_9_io_csr_dataWrite = io_csr_15_dataWrite; // @[SimpleCSR.scala 41:16:@1372.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  status = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  readerSync = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  readerSyncOld = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  writerSync = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  writerSyncOld = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  readerStart = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  writerStart = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    status <= {addressGeneratorRead_io_ctl_busy,addressGeneratorWrite_io_ctl_busy};
    readerSync <= io_sync_readerSync;
    readerSyncOld <= readerSync;
    writerSync <= io_sync_writerSync;
    writerSyncOld <= writerSync;
    if (reset) begin
      readerStart <= 1'h0;
    end else begin
      readerStart <= _T_219;
    end
    if (reset) begin
      writerStart <= 1'h0;
    end else begin
      writerStart <= _T_226;
    end
  end
endmodule
module Queue( // @[:@1396.2]
  input         clock, // @[:@1397.4]
  input         reset, // @[:@1398.4]
  output        io_enq_ready, // @[:@1399.4]
  input         io_enq_valid, // @[:@1399.4]
  input  [31:0] io_enq_bits, // @[:@1399.4]
  input         io_deq_ready, // @[:@1399.4]
  output        io_deq_valid, // @[:@1399.4]
  output [31:0] io_deq_bits // @[:@1399.4]
);
  reg [31:0] ram [0:511]; // @[Decoupled.scala 215:24:@1401.4]
  reg [31:0] _RAND_0;
  wire [31:0] ram__T_63_data; // @[Decoupled.scala 215:24:@1401.4]
  wire [8:0] ram__T_63_addr; // @[Decoupled.scala 215:24:@1401.4]
  wire [31:0] ram__T_49_data; // @[Decoupled.scala 215:24:@1401.4]
  wire [8:0] ram__T_49_addr; // @[Decoupled.scala 215:24:@1401.4]
  wire  ram__T_49_mask; // @[Decoupled.scala 215:24:@1401.4]
  wire  ram__T_49_en; // @[Decoupled.scala 215:24:@1401.4]
  reg [8:0] value; // @[Counter.scala 26:33:@1402.4]
  reg [31:0] _RAND_1;
  reg [8:0] value_1; // @[Counter.scala 26:33:@1403.4]
  reg [31:0] _RAND_2;
  reg  maybe_full; // @[Decoupled.scala 218:35:@1404.4]
  reg [31:0] _RAND_3;
  wire  _T_41; // @[Decoupled.scala 220:41:@1405.4]
  wire  _T_43; // @[Decoupled.scala 221:36:@1406.4]
  wire  empty; // @[Decoupled.scala 221:33:@1407.4]
  wire  _T_44; // @[Decoupled.scala 222:32:@1408.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@1409.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@1412.4]
  wire [9:0] _T_52; // @[Counter.scala 35:22:@1419.6]
  wire [8:0] _T_53; // @[Counter.scala 35:22:@1420.6]
  wire [8:0] _GEN_5; // @[Decoupled.scala 226:17:@1415.4]
  wire [9:0] _T_56; // @[Counter.scala 35:22:@1425.6]
  wire [8:0] _T_57; // @[Counter.scala 35:22:@1426.6]
  wire [8:0] _GEN_6; // @[Decoupled.scala 230:17:@1423.4]
  wire  _T_58; // @[Decoupled.scala 233:16:@1429.4]
  wire  _GEN_7; // @[Decoupled.scala 233:28:@1430.4]
  assign ram__T_63_addr = value_1;
  assign ram__T_63_data = ram[ram__T_63_addr]; // @[Decoupled.scala 215:24:@1401.4]
  assign ram__T_49_data = io_enq_bits;
  assign ram__T_49_addr = value;
  assign ram__T_49_mask = 1'h1;
  assign ram__T_49_en = io_enq_ready & io_enq_valid;
  assign _T_41 = value == value_1; // @[Decoupled.scala 220:41:@1405.4]
  assign _T_43 = maybe_full == 1'h0; // @[Decoupled.scala 221:36:@1406.4]
  assign empty = _T_41 & _T_43; // @[Decoupled.scala 221:33:@1407.4]
  assign _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 222:32:@1408.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:@1409.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:@1412.4]
  assign _T_52 = value + 9'h1; // @[Counter.scala 35:22:@1419.6]
  assign _T_53 = value + 9'h1; // @[Counter.scala 35:22:@1420.6]
  assign _GEN_5 = do_enq ? _T_53 : value; // @[Decoupled.scala 226:17:@1415.4]
  assign _T_56 = value_1 + 9'h1; // @[Counter.scala 35:22:@1425.6]
  assign _T_57 = value_1 + 9'h1; // @[Counter.scala 35:22:@1426.6]
  assign _GEN_6 = do_deq ? _T_57 : value_1; // @[Decoupled.scala 230:17:@1423.4]
  assign _T_58 = do_enq != do_deq; // @[Decoupled.scala 233:16:@1429.4]
  assign _GEN_7 = _T_58 ? do_enq : maybe_full; // @[Decoupled.scala 233:28:@1430.4]
  assign io_enq_ready = _T_44 == 1'h0; // @[Decoupled.scala 238:16:@1436.4]
  assign io_deq_valid = empty == 1'h0; // @[Decoupled.scala 237:16:@1434.4]
  assign io_deq_bits = ram__T_63_data; // @[Decoupled.scala 239:15:@1438.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(ram__T_49_en & ram__T_49_mask) begin
      ram[ram__T_49_addr] <= ram__T_49_data; // @[Decoupled.scala 215:24:@1401.4]
    end
    if (reset) begin
      value <= 9'h0;
    end else begin
      if (do_enq) begin
        value <= _T_53;
      end
    end
    if (reset) begin
      value_1 <= 9'h0;
    end else begin
      if (do_deq) begin
        value_1 <= _T_57;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_58) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module DMATopAXI_AXIL_AXI( // @[:@1447.2]
  input         clock, // @[:@1448.4]
  input         reset, // @[:@1449.4]
  input  [31:0] io_control_aw_awaddr, // @[:@1450.4]
  input  [2:0]  io_control_aw_awprot, // @[:@1450.4]
  input         io_control_aw_awvalid, // @[:@1450.4]
  output        io_control_aw_awready, // @[:@1450.4]
  input  [31:0] io_control_w_wdata, // @[:@1450.4]
  input  [3:0]  io_control_w_wstrb, // @[:@1450.4]
  input         io_control_w_wvalid, // @[:@1450.4]
  output        io_control_w_wready, // @[:@1450.4]
  output [1:0]  io_control_b_bresp, // @[:@1450.4]
  output        io_control_b_bvalid, // @[:@1450.4]
  input         io_control_b_bready, // @[:@1450.4]
  input  [31:0] io_control_ar_araddr, // @[:@1450.4]
  input  [2:0]  io_control_ar_arprot, // @[:@1450.4]
  input         io_control_ar_arvalid, // @[:@1450.4]
  output        io_control_ar_arready, // @[:@1450.4]
  output [31:0] io_control_r_rdata, // @[:@1450.4]
  output [1:0]  io_control_r_rresp, // @[:@1450.4]
  output        io_control_r_rvalid, // @[:@1450.4]
  input         io_control_r_rready, // @[:@1450.4]
  output [3:0]  io_read_aw_awid, // @[:@1450.4]
  output [31:0] io_read_aw_awaddr, // @[:@1450.4]
  output [7:0]  io_read_aw_awlen, // @[:@1450.4]
  output [2:0]  io_read_aw_awsize, // @[:@1450.4]
  output [1:0]  io_read_aw_awburst, // @[:@1450.4]
  output        io_read_aw_awlock, // @[:@1450.4]
  output [3:0]  io_read_aw_awcache, // @[:@1450.4]
  output [2:0]  io_read_aw_awprot, // @[:@1450.4]
  output [3:0]  io_read_aw_awqos, // @[:@1450.4]
  output        io_read_aw_awvalid, // @[:@1450.4]
  input         io_read_aw_awready, // @[:@1450.4]
  output [31:0] io_read_w_wdata, // @[:@1450.4]
  output [3:0]  io_read_w_wstrb, // @[:@1450.4]
  output        io_read_w_wlast, // @[:@1450.4]
  output        io_read_w_wvalid, // @[:@1450.4]
  input         io_read_w_wready, // @[:@1450.4]
  input  [3:0]  io_read_b_bid, // @[:@1450.4]
  input  [1:0]  io_read_b_bresp, // @[:@1450.4]
  input         io_read_b_bvalid, // @[:@1450.4]
  output        io_read_b_bready, // @[:@1450.4]
  output [3:0]  io_read_ar_arid, // @[:@1450.4]
  output [31:0] io_read_ar_araddr, // @[:@1450.4]
  output [7:0]  io_read_ar_arlen, // @[:@1450.4]
  output [2:0]  io_read_ar_arsize, // @[:@1450.4]
  output [1:0]  io_read_ar_arburst, // @[:@1450.4]
  output        io_read_ar_arlock, // @[:@1450.4]
  output [3:0]  io_read_ar_arcache, // @[:@1450.4]
  output [2:0]  io_read_ar_arprot, // @[:@1450.4]
  output [3:0]  io_read_ar_arqos, // @[:@1450.4]
  output        io_read_ar_arvalid, // @[:@1450.4]
  input         io_read_ar_arready, // @[:@1450.4]
  input  [3:0]  io_read_r_rid, // @[:@1450.4]
  input  [31:0] io_read_r_rdata, // @[:@1450.4]
  input  [1:0]  io_read_r_rresp, // @[:@1450.4]
  input         io_read_r_rlast, // @[:@1450.4]
  input         io_read_r_rvalid, // @[:@1450.4]
  output        io_read_r_rready, // @[:@1450.4]
  output [3:0]  io_write_aw_awid, // @[:@1450.4]
  output [31:0] io_write_aw_awaddr, // @[:@1450.4]
  output [7:0]  io_write_aw_awlen, // @[:@1450.4]
  output [2:0]  io_write_aw_awsize, // @[:@1450.4]
  output [1:0]  io_write_aw_awburst, // @[:@1450.4]
  output        io_write_aw_awlock, // @[:@1450.4]
  output [3:0]  io_write_aw_awcache, // @[:@1450.4]
  output [2:0]  io_write_aw_awprot, // @[:@1450.4]
  output [3:0]  io_write_aw_awqos, // @[:@1450.4]
  output        io_write_aw_awvalid, // @[:@1450.4]
  input         io_write_aw_awready, // @[:@1450.4]
  output [31:0] io_write_w_wdata, // @[:@1450.4]
  output [3:0]  io_write_w_wstrb, // @[:@1450.4]
  output        io_write_w_wlast, // @[:@1450.4]
  output        io_write_w_wvalid, // @[:@1450.4]
  input         io_write_w_wready, // @[:@1450.4]
  input  [3:0]  io_write_b_bid, // @[:@1450.4]
  input  [1:0]  io_write_b_bresp, // @[:@1450.4]
  input         io_write_b_bvalid, // @[:@1450.4]
  output        io_write_b_bready, // @[:@1450.4]
  output [3:0]  io_write_ar_arid, // @[:@1450.4]
  output [31:0] io_write_ar_araddr, // @[:@1450.4]
  output [7:0]  io_write_ar_arlen, // @[:@1450.4]
  output [2:0]  io_write_ar_arsize, // @[:@1450.4]
  output [1:0]  io_write_ar_arburst, // @[:@1450.4]
  output        io_write_ar_arlock, // @[:@1450.4]
  output [3:0]  io_write_ar_arcache, // @[:@1450.4]
  output [2:0]  io_write_ar_arprot, // @[:@1450.4]
  output [3:0]  io_write_ar_arqos, // @[:@1450.4]
  output        io_write_ar_arvalid, // @[:@1450.4]
  input         io_write_ar_arready, // @[:@1450.4]
  input  [3:0]  io_write_r_rid, // @[:@1450.4]
  input  [31:0] io_write_r_rdata, // @[:@1450.4]
  input  [1:0]  io_write_r_rresp, // @[:@1450.4]
  input         io_write_r_rlast, // @[:@1450.4]
  input         io_write_r_rvalid, // @[:@1450.4]
  output        io_write_r_rready, // @[:@1450.4]
  output        io_irq_readerDone, // @[:@1450.4]
  output        io_irq_writerDone, // @[:@1450.4]
  input         io_sync_readerSync, // @[:@1450.4]
  input         io_sync_writerSync // @[:@1450.4]
);
  wire  csrFrontend_clock; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_reset; // @[DMATop.scala 40:27:@1452.4]
  wire [31:0] csrFrontend_io_ctl_aw_awaddr; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_aw_awvalid; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_aw_awready; // @[DMATop.scala 40:27:@1452.4]
  wire [31:0] csrFrontend_io_ctl_w_wdata; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_w_wvalid; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_w_wready; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_b_bvalid; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_b_bready; // @[DMATop.scala 40:27:@1452.4]
  wire [31:0] csrFrontend_io_ctl_ar_araddr; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_ar_arvalid; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_ar_arready; // @[DMATop.scala 40:27:@1452.4]
  wire [31:0] csrFrontend_io_ctl_r_rdata; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_r_rvalid; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_ctl_r_rready; // @[DMATop.scala 40:27:@1452.4]
  wire [3:0] csrFrontend_io_bus_addr; // @[DMATop.scala 40:27:@1452.4]
  wire [31:0] csrFrontend_io_bus_dataOut; // @[DMATop.scala 40:27:@1452.4]
  wire [31:0] csrFrontend_io_bus_dataIn; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_bus_write; // @[DMATop.scala 40:27:@1452.4]
  wire  csrFrontend_io_bus_read; // @[DMATop.scala 40:27:@1452.4]
  wire  readerFrontend_clock; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_reset; // @[DMATop.scala 42:30:@1455.4]
  wire [31:0] readerFrontend_io_bus_ar_araddr; // @[DMATop.scala 42:30:@1455.4]
  wire [7:0] readerFrontend_io_bus_ar_arlen; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_bus_ar_arvalid; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_bus_ar_arready; // @[DMATop.scala 42:30:@1455.4]
  wire [31:0] readerFrontend_io_bus_r_rdata; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_bus_r_rlast; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_bus_r_rvalid; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_bus_r_rready; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_dataIO_ready; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_dataIO_valid; // @[DMATop.scala 42:30:@1455.4]
  wire [31:0] readerFrontend_io_dataIO_bits; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_xfer_done; // @[DMATop.scala 42:30:@1455.4]
  wire [31:0] readerFrontend_io_xfer_address; // @[DMATop.scala 42:30:@1455.4]
  wire [31:0] readerFrontend_io_xfer_length; // @[DMATop.scala 42:30:@1455.4]
  wire  readerFrontend_io_xfer_valid; // @[DMATop.scala 42:30:@1455.4]
  wire  writerFrontend_clock; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_reset; // @[DMATop.scala 44:30:@1458.4]
  wire [31:0] writerFrontend_io_bus_aw_awaddr; // @[DMATop.scala 44:30:@1458.4]
  wire [7:0] writerFrontend_io_bus_aw_awlen; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_bus_aw_awvalid; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_bus_aw_awready; // @[DMATop.scala 44:30:@1458.4]
  wire [31:0] writerFrontend_io_bus_w_wdata; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_bus_w_wlast; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_bus_w_wvalid; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_bus_w_wready; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_bus_b_bvalid; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_bus_b_bready; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_dataIO_ready; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_dataIO_valid; // @[DMATop.scala 44:30:@1458.4]
  wire [31:0] writerFrontend_io_dataIO_bits; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_xfer_done; // @[DMATop.scala 44:30:@1458.4]
  wire [31:0] writerFrontend_io_xfer_address; // @[DMATop.scala 44:30:@1458.4]
  wire [31:0] writerFrontend_io_xfer_length; // @[DMATop.scala 44:30:@1458.4]
  wire  writerFrontend_io_xfer_valid; // @[DMATop.scala 44:30:@1458.4]
  wire [31:0] csr_io_csr_0_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_0_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_0_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_1_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_2_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_2_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_2_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_3_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_3_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_3_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_4_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_4_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_4_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_5_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_5_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_5_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_6_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_6_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_6_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_7_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_7_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_7_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_8_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_8_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_8_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_9_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_9_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_9_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_10_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_10_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_10_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_11_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_11_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_11_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_12_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_13_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_14_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_14_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_14_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_15_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_csr_15_dataWrite; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_csr_15_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire [3:0] csr_io_bus_addr; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_bus_dataOut; // @[DMATop.scala 46:19:@1461.4]
  wire [31:0] csr_io_bus_dataIn; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_bus_write; // @[DMATop.scala 46:19:@1461.4]
  wire  csr_io_bus_read; // @[DMATop.scala 46:19:@1461.4]
  wire  ctl_clock; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_reset; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_0_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_0_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_0_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_1_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_2_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_2_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_2_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_3_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_3_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_3_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_4_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_4_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_4_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_5_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_5_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_5_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_6_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_6_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_6_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_7_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_7_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_7_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_8_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_8_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_8_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_9_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_9_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_9_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_10_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_10_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_10_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_11_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_11_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_11_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_12_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_13_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_14_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_14_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_14_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_15_dataOut; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_csr_15_dataWrite; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_csr_15_dataIn; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_irq_readerDone; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_irq_writerDone; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_sync_readerSync; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_sync_writerSync; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_xferRead_done; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_xferRead_address; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_xferRead_length; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_xferRead_valid; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_xferWrite_done; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_xferWrite_address; // @[DMATop.scala 48:19:@1464.4]
  wire [31:0] ctl_io_xferWrite_length; // @[DMATop.scala 48:19:@1464.4]
  wire  ctl_io_xferWrite_valid; // @[DMATop.scala 48:19:@1464.4]
  wire  queue_clock; // @[Decoupled.scala 294:21:@1467.4]
  wire  queue_reset; // @[Decoupled.scala 294:21:@1467.4]
  wire  queue_io_enq_ready; // @[Decoupled.scala 294:21:@1467.4]
  wire  queue_io_enq_valid; // @[Decoupled.scala 294:21:@1467.4]
  wire [31:0] queue_io_enq_bits; // @[Decoupled.scala 294:21:@1467.4]
  wire  queue_io_deq_ready; // @[Decoupled.scala 294:21:@1467.4]
  wire  queue_io_deq_valid; // @[Decoupled.scala 294:21:@1467.4]
  wire [31:0] queue_io_deq_bits; // @[Decoupled.scala 294:21:@1467.4]
  AXI4LiteCSR csrFrontend ( // @[DMATop.scala 40:27:@1452.4]
    .clock(csrFrontend_clock),
    .reset(csrFrontend_reset),
    .io_ctl_aw_awaddr(csrFrontend_io_ctl_aw_awaddr),
    .io_ctl_aw_awvalid(csrFrontend_io_ctl_aw_awvalid),
    .io_ctl_aw_awready(csrFrontend_io_ctl_aw_awready),
    .io_ctl_w_wdata(csrFrontend_io_ctl_w_wdata),
    .io_ctl_w_wvalid(csrFrontend_io_ctl_w_wvalid),
    .io_ctl_w_wready(csrFrontend_io_ctl_w_wready),
    .io_ctl_b_bvalid(csrFrontend_io_ctl_b_bvalid),
    .io_ctl_b_bready(csrFrontend_io_ctl_b_bready),
    .io_ctl_ar_araddr(csrFrontend_io_ctl_ar_araddr),
    .io_ctl_ar_arvalid(csrFrontend_io_ctl_ar_arvalid),
    .io_ctl_ar_arready(csrFrontend_io_ctl_ar_arready),
    .io_ctl_r_rdata(csrFrontend_io_ctl_r_rdata),
    .io_ctl_r_rvalid(csrFrontend_io_ctl_r_rvalid),
    .io_ctl_r_rready(csrFrontend_io_ctl_r_rready),
    .io_bus_addr(csrFrontend_io_bus_addr),
    .io_bus_dataOut(csrFrontend_io_bus_dataOut),
    .io_bus_dataIn(csrFrontend_io_bus_dataIn),
    .io_bus_write(csrFrontend_io_bus_write),
    .io_bus_read(csrFrontend_io_bus_read)
  );
  AXI4Reader readerFrontend ( // @[DMATop.scala 42:30:@1455.4]
    .clock(readerFrontend_clock),
    .reset(readerFrontend_reset),
    .io_bus_ar_araddr(readerFrontend_io_bus_ar_araddr),
    .io_bus_ar_arlen(readerFrontend_io_bus_ar_arlen),
    .io_bus_ar_arvalid(readerFrontend_io_bus_ar_arvalid),
    .io_bus_ar_arready(readerFrontend_io_bus_ar_arready),
    .io_bus_r_rdata(readerFrontend_io_bus_r_rdata),
    .io_bus_r_rlast(readerFrontend_io_bus_r_rlast),
    .io_bus_r_rvalid(readerFrontend_io_bus_r_rvalid),
    .io_bus_r_rready(readerFrontend_io_bus_r_rready),
    .io_dataIO_ready(readerFrontend_io_dataIO_ready),
    .io_dataIO_valid(readerFrontend_io_dataIO_valid),
    .io_dataIO_bits(readerFrontend_io_dataIO_bits),
    .io_xfer_done(readerFrontend_io_xfer_done),
    .io_xfer_address(readerFrontend_io_xfer_address),
    .io_xfer_length(readerFrontend_io_xfer_length),
    .io_xfer_valid(readerFrontend_io_xfer_valid)
  );
  AXI4Writer writerFrontend ( // @[DMATop.scala 44:30:@1458.4]
    .clock(writerFrontend_clock),
    .reset(writerFrontend_reset),
    .io_bus_aw_awaddr(writerFrontend_io_bus_aw_awaddr),
    .io_bus_aw_awlen(writerFrontend_io_bus_aw_awlen),
    .io_bus_aw_awvalid(writerFrontend_io_bus_aw_awvalid),
    .io_bus_aw_awready(writerFrontend_io_bus_aw_awready),
    .io_bus_w_wdata(writerFrontend_io_bus_w_wdata),
    .io_bus_w_wlast(writerFrontend_io_bus_w_wlast),
    .io_bus_w_wvalid(writerFrontend_io_bus_w_wvalid),
    .io_bus_w_wready(writerFrontend_io_bus_w_wready),
    .io_bus_b_bvalid(writerFrontend_io_bus_b_bvalid),
    .io_bus_b_bready(writerFrontend_io_bus_b_bready),
    .io_dataIO_ready(writerFrontend_io_dataIO_ready),
    .io_dataIO_valid(writerFrontend_io_dataIO_valid),
    .io_dataIO_bits(writerFrontend_io_dataIO_bits),
    .io_xfer_done(writerFrontend_io_xfer_done),
    .io_xfer_address(writerFrontend_io_xfer_address),
    .io_xfer_length(writerFrontend_io_xfer_length),
    .io_xfer_valid(writerFrontend_io_xfer_valid)
  );
  CSR csr ( // @[DMATop.scala 46:19:@1461.4]
    .io_csr_0_dataOut(csr_io_csr_0_dataOut),
    .io_csr_0_dataWrite(csr_io_csr_0_dataWrite),
    .io_csr_0_dataIn(csr_io_csr_0_dataIn),
    .io_csr_1_dataIn(csr_io_csr_1_dataIn),
    .io_csr_2_dataOut(csr_io_csr_2_dataOut),
    .io_csr_2_dataWrite(csr_io_csr_2_dataWrite),
    .io_csr_2_dataIn(csr_io_csr_2_dataIn),
    .io_csr_3_dataOut(csr_io_csr_3_dataOut),
    .io_csr_3_dataWrite(csr_io_csr_3_dataWrite),
    .io_csr_3_dataIn(csr_io_csr_3_dataIn),
    .io_csr_4_dataOut(csr_io_csr_4_dataOut),
    .io_csr_4_dataWrite(csr_io_csr_4_dataWrite),
    .io_csr_4_dataIn(csr_io_csr_4_dataIn),
    .io_csr_5_dataOut(csr_io_csr_5_dataOut),
    .io_csr_5_dataWrite(csr_io_csr_5_dataWrite),
    .io_csr_5_dataIn(csr_io_csr_5_dataIn),
    .io_csr_6_dataOut(csr_io_csr_6_dataOut),
    .io_csr_6_dataWrite(csr_io_csr_6_dataWrite),
    .io_csr_6_dataIn(csr_io_csr_6_dataIn),
    .io_csr_7_dataOut(csr_io_csr_7_dataOut),
    .io_csr_7_dataWrite(csr_io_csr_7_dataWrite),
    .io_csr_7_dataIn(csr_io_csr_7_dataIn),
    .io_csr_8_dataOut(csr_io_csr_8_dataOut),
    .io_csr_8_dataWrite(csr_io_csr_8_dataWrite),
    .io_csr_8_dataIn(csr_io_csr_8_dataIn),
    .io_csr_9_dataOut(csr_io_csr_9_dataOut),
    .io_csr_9_dataWrite(csr_io_csr_9_dataWrite),
    .io_csr_9_dataIn(csr_io_csr_9_dataIn),
    .io_csr_10_dataOut(csr_io_csr_10_dataOut),
    .io_csr_10_dataWrite(csr_io_csr_10_dataWrite),
    .io_csr_10_dataIn(csr_io_csr_10_dataIn),
    .io_csr_11_dataOut(csr_io_csr_11_dataOut),
    .io_csr_11_dataWrite(csr_io_csr_11_dataWrite),
    .io_csr_11_dataIn(csr_io_csr_11_dataIn),
    .io_csr_12_dataIn(csr_io_csr_12_dataIn),
    .io_csr_13_dataIn(csr_io_csr_13_dataIn),
    .io_csr_14_dataOut(csr_io_csr_14_dataOut),
    .io_csr_14_dataWrite(csr_io_csr_14_dataWrite),
    .io_csr_14_dataIn(csr_io_csr_14_dataIn),
    .io_csr_15_dataOut(csr_io_csr_15_dataOut),
    .io_csr_15_dataWrite(csr_io_csr_15_dataWrite),
    .io_csr_15_dataIn(csr_io_csr_15_dataIn),
    .io_bus_addr(csr_io_bus_addr),
    .io_bus_dataOut(csr_io_bus_dataOut),
    .io_bus_dataIn(csr_io_bus_dataIn),
    .io_bus_write(csr_io_bus_write),
    .io_bus_read(csr_io_bus_read)
  );
  WorkerCSRWrapper ctl ( // @[DMATop.scala 48:19:@1464.4]
    .clock(ctl_clock),
    .reset(ctl_reset),
    .io_csr_0_dataOut(ctl_io_csr_0_dataOut),
    .io_csr_0_dataWrite(ctl_io_csr_0_dataWrite),
    .io_csr_0_dataIn(ctl_io_csr_0_dataIn),
    .io_csr_1_dataIn(ctl_io_csr_1_dataIn),
    .io_csr_2_dataOut(ctl_io_csr_2_dataOut),
    .io_csr_2_dataWrite(ctl_io_csr_2_dataWrite),
    .io_csr_2_dataIn(ctl_io_csr_2_dataIn),
    .io_csr_3_dataOut(ctl_io_csr_3_dataOut),
    .io_csr_3_dataWrite(ctl_io_csr_3_dataWrite),
    .io_csr_3_dataIn(ctl_io_csr_3_dataIn),
    .io_csr_4_dataOut(ctl_io_csr_4_dataOut),
    .io_csr_4_dataWrite(ctl_io_csr_4_dataWrite),
    .io_csr_4_dataIn(ctl_io_csr_4_dataIn),
    .io_csr_5_dataOut(ctl_io_csr_5_dataOut),
    .io_csr_5_dataWrite(ctl_io_csr_5_dataWrite),
    .io_csr_5_dataIn(ctl_io_csr_5_dataIn),
    .io_csr_6_dataOut(ctl_io_csr_6_dataOut),
    .io_csr_6_dataWrite(ctl_io_csr_6_dataWrite),
    .io_csr_6_dataIn(ctl_io_csr_6_dataIn),
    .io_csr_7_dataOut(ctl_io_csr_7_dataOut),
    .io_csr_7_dataWrite(ctl_io_csr_7_dataWrite),
    .io_csr_7_dataIn(ctl_io_csr_7_dataIn),
    .io_csr_8_dataOut(ctl_io_csr_8_dataOut),
    .io_csr_8_dataWrite(ctl_io_csr_8_dataWrite),
    .io_csr_8_dataIn(ctl_io_csr_8_dataIn),
    .io_csr_9_dataOut(ctl_io_csr_9_dataOut),
    .io_csr_9_dataWrite(ctl_io_csr_9_dataWrite),
    .io_csr_9_dataIn(ctl_io_csr_9_dataIn),
    .io_csr_10_dataOut(ctl_io_csr_10_dataOut),
    .io_csr_10_dataWrite(ctl_io_csr_10_dataWrite),
    .io_csr_10_dataIn(ctl_io_csr_10_dataIn),
    .io_csr_11_dataOut(ctl_io_csr_11_dataOut),
    .io_csr_11_dataWrite(ctl_io_csr_11_dataWrite),
    .io_csr_11_dataIn(ctl_io_csr_11_dataIn),
    .io_csr_12_dataIn(ctl_io_csr_12_dataIn),
    .io_csr_13_dataIn(ctl_io_csr_13_dataIn),
    .io_csr_14_dataOut(ctl_io_csr_14_dataOut),
    .io_csr_14_dataWrite(ctl_io_csr_14_dataWrite),
    .io_csr_14_dataIn(ctl_io_csr_14_dataIn),
    .io_csr_15_dataOut(ctl_io_csr_15_dataOut),
    .io_csr_15_dataWrite(ctl_io_csr_15_dataWrite),
    .io_csr_15_dataIn(ctl_io_csr_15_dataIn),
    .io_irq_readerDone(ctl_io_irq_readerDone),
    .io_irq_writerDone(ctl_io_irq_writerDone),
    .io_sync_readerSync(ctl_io_sync_readerSync),
    .io_sync_writerSync(ctl_io_sync_writerSync),
    .io_xferRead_done(ctl_io_xferRead_done),
    .io_xferRead_address(ctl_io_xferRead_address),
    .io_xferRead_length(ctl_io_xferRead_length),
    .io_xferRead_valid(ctl_io_xferRead_valid),
    .io_xferWrite_done(ctl_io_xferWrite_done),
    .io_xferWrite_address(ctl_io_xferWrite_address),
    .io_xferWrite_length(ctl_io_xferWrite_length),
    .io_xferWrite_valid(ctl_io_xferWrite_valid)
  );
  Queue queue ( // @[Decoupled.scala 294:21:@1467.4]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits(queue_io_enq_bits),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits(queue_io_deq_bits)
  );
  assign io_control_aw_awready = csrFrontend_io_ctl_aw_awready; // @[DMATop.scala 54:22:@1491.4]
  assign io_control_w_wready = csrFrontend_io_ctl_w_wready; // @[DMATop.scala 54:22:@1487.4]
  assign io_control_b_bresp = 2'h0; // @[DMATop.scala 54:22:@1486.4]
  assign io_control_b_bvalid = csrFrontend_io_ctl_b_bvalid; // @[DMATop.scala 54:22:@1485.4]
  assign io_control_ar_arready = csrFrontend_io_ctl_ar_arready; // @[DMATop.scala 54:22:@1480.4]
  assign io_control_r_rdata = csrFrontend_io_ctl_r_rdata; // @[DMATop.scala 54:22:@1479.4]
  assign io_control_r_rresp = 2'h0; // @[DMATop.scala 54:22:@1478.4]
  assign io_control_r_rvalid = csrFrontend_io_ctl_r_rvalid; // @[DMATop.scala 54:22:@1477.4]
  assign io_read_aw_awid = 4'h0; // @[DMATop.scala 60:11:@1610.4]
  assign io_read_aw_awaddr = 32'h0; // @[DMATop.scala 60:11:@1609.4]
  assign io_read_aw_awlen = 8'h0; // @[DMATop.scala 60:11:@1608.4]
  assign io_read_aw_awsize = 3'h0; // @[DMATop.scala 60:11:@1607.4]
  assign io_read_aw_awburst = 2'h0; // @[DMATop.scala 60:11:@1606.4]
  assign io_read_aw_awlock = 1'h0; // @[DMATop.scala 60:11:@1605.4]
  assign io_read_aw_awcache = 4'h0; // @[DMATop.scala 60:11:@1604.4]
  assign io_read_aw_awprot = 3'h0; // @[DMATop.scala 60:11:@1603.4]
  assign io_read_aw_awqos = 4'h0; // @[DMATop.scala 60:11:@1602.4]
  assign io_read_aw_awvalid = 1'h0; // @[DMATop.scala 60:11:@1601.4]
  assign io_read_w_wdata = 32'h0; // @[DMATop.scala 60:11:@1599.4]
  assign io_read_w_wstrb = 4'h0; // @[DMATop.scala 60:11:@1598.4]
  assign io_read_w_wlast = 1'h0; // @[DMATop.scala 60:11:@1597.4]
  assign io_read_w_wvalid = 1'h0; // @[DMATop.scala 60:11:@1596.4]
  assign io_read_b_bready = 1'h0; // @[DMATop.scala 60:11:@1591.4]
  assign io_read_ar_arid = 4'h0; // @[DMATop.scala 60:11:@1590.4]
  assign io_read_ar_araddr = readerFrontend_io_bus_ar_araddr; // @[DMATop.scala 60:11:@1589.4]
  assign io_read_ar_arlen = readerFrontend_io_bus_ar_arlen; // @[DMATop.scala 60:11:@1588.4]
  assign io_read_ar_arsize = 3'h2; // @[DMATop.scala 60:11:@1587.4]
  assign io_read_ar_arburst = 2'h1; // @[DMATop.scala 60:11:@1586.4]
  assign io_read_ar_arlock = 1'h0; // @[DMATop.scala 60:11:@1585.4]
  assign io_read_ar_arcache = 4'h2; // @[DMATop.scala 60:11:@1584.4]
  assign io_read_ar_arprot = 3'h0; // @[DMATop.scala 60:11:@1583.4]
  assign io_read_ar_arqos = 4'h0; // @[DMATop.scala 60:11:@1582.4]
  assign io_read_ar_arvalid = readerFrontend_io_bus_ar_arvalid; // @[DMATop.scala 60:11:@1581.4]
  assign io_read_r_rready = readerFrontend_io_bus_r_rready; // @[DMATop.scala 60:11:@1574.4]
  assign io_write_aw_awid = 4'h0; // @[DMATop.scala 61:12:@1647.4]
  assign io_write_aw_awaddr = writerFrontend_io_bus_aw_awaddr; // @[DMATop.scala 61:12:@1646.4]
  assign io_write_aw_awlen = writerFrontend_io_bus_aw_awlen; // @[DMATop.scala 61:12:@1645.4]
  assign io_write_aw_awsize = 3'h2; // @[DMATop.scala 61:12:@1644.4]
  assign io_write_aw_awburst = 2'h1; // @[DMATop.scala 61:12:@1643.4]
  assign io_write_aw_awlock = 1'h0; // @[DMATop.scala 61:12:@1642.4]
  assign io_write_aw_awcache = 4'h2; // @[DMATop.scala 61:12:@1641.4]
  assign io_write_aw_awprot = 3'h0; // @[DMATop.scala 61:12:@1640.4]
  assign io_write_aw_awqos = 4'h0; // @[DMATop.scala 61:12:@1639.4]
  assign io_write_aw_awvalid = writerFrontend_io_bus_aw_awvalid; // @[DMATop.scala 61:12:@1638.4]
  assign io_write_w_wdata = writerFrontend_io_bus_w_wdata; // @[DMATop.scala 61:12:@1636.4]
  assign io_write_w_wstrb = 4'hf; // @[DMATop.scala 61:12:@1635.4]
  assign io_write_w_wlast = writerFrontend_io_bus_w_wlast; // @[DMATop.scala 61:12:@1634.4]
  assign io_write_w_wvalid = writerFrontend_io_bus_w_wvalid; // @[DMATop.scala 61:12:@1633.4]
  assign io_write_b_bready = writerFrontend_io_bus_b_bready; // @[DMATop.scala 61:12:@1628.4]
  assign io_write_ar_arid = 4'h0; // @[DMATop.scala 61:12:@1627.4]
  assign io_write_ar_araddr = 32'h0; // @[DMATop.scala 61:12:@1626.4]
  assign io_write_ar_arlen = 8'h0; // @[DMATop.scala 61:12:@1625.4]
  assign io_write_ar_arsize = 3'h0; // @[DMATop.scala 61:12:@1624.4]
  assign io_write_ar_arburst = 2'h0; // @[DMATop.scala 61:12:@1623.4]
  assign io_write_ar_arlock = 1'h0; // @[DMATop.scala 61:12:@1622.4]
  assign io_write_ar_arcache = 4'h0; // @[DMATop.scala 61:12:@1621.4]
  assign io_write_ar_arprot = 3'h0; // @[DMATop.scala 61:12:@1620.4]
  assign io_write_ar_arqos = 4'h0; // @[DMATop.scala 61:12:@1619.4]
  assign io_write_ar_arvalid = 1'h0; // @[DMATop.scala 61:12:@1618.4]
  assign io_write_r_rready = 1'h0; // @[DMATop.scala 61:12:@1611.4]
  assign io_irq_readerDone = ctl_io_irq_readerDone; // @[DMATop.scala 63:10:@1649.4]
  assign io_irq_writerDone = ctl_io_irq_writerDone; // @[DMATop.scala 63:10:@1648.4]
  assign csrFrontend_clock = clock; // @[:@1453.4]
  assign csrFrontend_reset = reset; // @[:@1454.4]
  assign csrFrontend_io_ctl_aw_awaddr = io_control_aw_awaddr; // @[DMATop.scala 54:22:@1494.4]
  assign csrFrontend_io_ctl_aw_awvalid = io_control_aw_awvalid; // @[DMATop.scala 54:22:@1492.4]
  assign csrFrontend_io_ctl_w_wdata = io_control_w_wdata; // @[DMATop.scala 54:22:@1490.4]
  assign csrFrontend_io_ctl_w_wvalid = io_control_w_wvalid; // @[DMATop.scala 54:22:@1488.4]
  assign csrFrontend_io_ctl_b_bready = io_control_b_bready; // @[DMATop.scala 54:22:@1484.4]
  assign csrFrontend_io_ctl_ar_araddr = io_control_ar_araddr; // @[DMATop.scala 54:22:@1483.4]
  assign csrFrontend_io_ctl_ar_arvalid = io_control_ar_arvalid; // @[DMATop.scala 54:22:@1481.4]
  assign csrFrontend_io_ctl_r_rready = io_control_r_rready; // @[DMATop.scala 54:22:@1476.4]
  assign csrFrontend_io_bus_dataIn = csr_io_bus_dataIn; // @[DMATop.scala 55:14:@1497.4]
  assign readerFrontend_clock = clock; // @[:@1456.4]
  assign readerFrontend_reset = reset; // @[:@1457.4]
  assign readerFrontend_io_bus_ar_arready = io_read_ar_arready; // @[DMATop.scala 60:11:@1580.4]
  assign readerFrontend_io_bus_r_rdata = io_read_r_rdata; // @[DMATop.scala 60:11:@1578.4]
  assign readerFrontend_io_bus_r_rlast = io_read_r_rlast; // @[DMATop.scala 60:11:@1576.4]
  assign readerFrontend_io_bus_r_rvalid = io_read_r_rvalid; // @[DMATop.scala 60:11:@1575.4]
  assign readerFrontend_io_dataIO_ready = queue_io_enq_ready; // @[Decoupled.scala 297:17:@1472.4]
  assign readerFrontend_io_xfer_address = ctl_io_xferRead_address; // @[DMATop.scala 57:26:@1567.4]
  assign readerFrontend_io_xfer_length = ctl_io_xferRead_length; // @[DMATop.scala 57:26:@1566.4]
  assign readerFrontend_io_xfer_valid = ctl_io_xferRead_valid; // @[DMATop.scala 57:26:@1565.4]
  assign writerFrontend_clock = clock; // @[:@1459.4]
  assign writerFrontend_reset = reset; // @[:@1460.4]
  assign writerFrontend_io_bus_aw_awready = io_write_aw_awready; // @[DMATop.scala 61:12:@1637.4]
  assign writerFrontend_io_bus_w_wready = io_write_w_wready; // @[DMATop.scala 61:12:@1632.4]
  assign writerFrontend_io_bus_b_bvalid = io_write_b_bvalid; // @[DMATop.scala 61:12:@1629.4]
  assign writerFrontend_io_dataIO_valid = queue_io_deq_valid; // @[DMATop.scala 52:9:@1474.4]
  assign writerFrontend_io_dataIO_bits = queue_io_deq_bits; // @[DMATop.scala 52:9:@1473.4]
  assign writerFrontend_io_xfer_address = ctl_io_xferWrite_address; // @[DMATop.scala 58:26:@1572.4]
  assign writerFrontend_io_xfer_length = ctl_io_xferWrite_length; // @[DMATop.scala 58:26:@1571.4]
  assign writerFrontend_io_xfer_valid = ctl_io_xferWrite_valid; // @[DMATop.scala 58:26:@1570.4]
  assign csr_io_csr_0_dataIn = ctl_io_csr_0_dataIn; // @[DMATop.scala 56:14:@1500.4]
  assign csr_io_csr_1_dataIn = ctl_io_csr_1_dataIn; // @[DMATop.scala 56:14:@1504.4]
  assign csr_io_csr_2_dataIn = ctl_io_csr_2_dataIn; // @[DMATop.scala 56:14:@1508.4]
  assign csr_io_csr_3_dataIn = ctl_io_csr_3_dataIn; // @[DMATop.scala 56:14:@1512.4]
  assign csr_io_csr_4_dataIn = ctl_io_csr_4_dataIn; // @[DMATop.scala 56:14:@1516.4]
  assign csr_io_csr_5_dataIn = ctl_io_csr_5_dataIn; // @[DMATop.scala 56:14:@1520.4]
  assign csr_io_csr_6_dataIn = ctl_io_csr_6_dataIn; // @[DMATop.scala 56:14:@1524.4]
  assign csr_io_csr_7_dataIn = ctl_io_csr_7_dataIn; // @[DMATop.scala 56:14:@1528.4]
  assign csr_io_csr_8_dataIn = ctl_io_csr_8_dataIn; // @[DMATop.scala 56:14:@1532.4]
  assign csr_io_csr_9_dataIn = ctl_io_csr_9_dataIn; // @[DMATop.scala 56:14:@1536.4]
  assign csr_io_csr_10_dataIn = ctl_io_csr_10_dataIn; // @[DMATop.scala 56:14:@1540.4]
  assign csr_io_csr_11_dataIn = ctl_io_csr_11_dataIn; // @[DMATop.scala 56:14:@1544.4]
  assign csr_io_csr_12_dataIn = ctl_io_csr_12_dataIn; // @[DMATop.scala 56:14:@1548.4]
  assign csr_io_csr_13_dataIn = ctl_io_csr_13_dataIn; // @[DMATop.scala 56:14:@1552.4]
  assign csr_io_csr_14_dataIn = ctl_io_csr_14_dataIn; // @[DMATop.scala 56:14:@1556.4]
  assign csr_io_csr_15_dataIn = ctl_io_csr_15_dataIn; // @[DMATop.scala 56:14:@1560.4]
  assign csr_io_bus_addr = csrFrontend_io_bus_addr; // @[DMATop.scala 55:14:@1499.4]
  assign csr_io_bus_dataOut = csrFrontend_io_bus_dataOut; // @[DMATop.scala 55:14:@1498.4]
  assign csr_io_bus_write = csrFrontend_io_bus_write; // @[DMATop.scala 55:14:@1496.4]
  assign csr_io_bus_read = csrFrontend_io_bus_read; // @[DMATop.scala 55:14:@1495.4]
  assign ctl_clock = clock; // @[:@1465.4]
  assign ctl_reset = reset; // @[:@1466.4]
  assign ctl_io_csr_0_dataOut = csr_io_csr_0_dataOut; // @[DMATop.scala 56:14:@1502.4]
  assign ctl_io_csr_0_dataWrite = csr_io_csr_0_dataWrite; // @[DMATop.scala 56:14:@1501.4]
  assign ctl_io_csr_2_dataOut = csr_io_csr_2_dataOut; // @[DMATop.scala 56:14:@1510.4]
  assign ctl_io_csr_2_dataWrite = csr_io_csr_2_dataWrite; // @[DMATop.scala 56:14:@1509.4]
  assign ctl_io_csr_3_dataOut = csr_io_csr_3_dataOut; // @[DMATop.scala 56:14:@1514.4]
  assign ctl_io_csr_3_dataWrite = csr_io_csr_3_dataWrite; // @[DMATop.scala 56:14:@1513.4]
  assign ctl_io_csr_4_dataOut = csr_io_csr_4_dataOut; // @[DMATop.scala 56:14:@1518.4]
  assign ctl_io_csr_4_dataWrite = csr_io_csr_4_dataWrite; // @[DMATop.scala 56:14:@1517.4]
  assign ctl_io_csr_5_dataOut = csr_io_csr_5_dataOut; // @[DMATop.scala 56:14:@1522.4]
  assign ctl_io_csr_5_dataWrite = csr_io_csr_5_dataWrite; // @[DMATop.scala 56:14:@1521.4]
  assign ctl_io_csr_6_dataOut = csr_io_csr_6_dataOut; // @[DMATop.scala 56:14:@1526.4]
  assign ctl_io_csr_6_dataWrite = csr_io_csr_6_dataWrite; // @[DMATop.scala 56:14:@1525.4]
  assign ctl_io_csr_7_dataOut = csr_io_csr_7_dataOut; // @[DMATop.scala 56:14:@1530.4]
  assign ctl_io_csr_7_dataWrite = csr_io_csr_7_dataWrite; // @[DMATop.scala 56:14:@1529.4]
  assign ctl_io_csr_8_dataOut = csr_io_csr_8_dataOut; // @[DMATop.scala 56:14:@1534.4]
  assign ctl_io_csr_8_dataWrite = csr_io_csr_8_dataWrite; // @[DMATop.scala 56:14:@1533.4]
  assign ctl_io_csr_9_dataOut = csr_io_csr_9_dataOut; // @[DMATop.scala 56:14:@1538.4]
  assign ctl_io_csr_9_dataWrite = csr_io_csr_9_dataWrite; // @[DMATop.scala 56:14:@1537.4]
  assign ctl_io_csr_10_dataOut = csr_io_csr_10_dataOut; // @[DMATop.scala 56:14:@1542.4]
  assign ctl_io_csr_10_dataWrite = csr_io_csr_10_dataWrite; // @[DMATop.scala 56:14:@1541.4]
  assign ctl_io_csr_11_dataOut = csr_io_csr_11_dataOut; // @[DMATop.scala 56:14:@1546.4]
  assign ctl_io_csr_11_dataWrite = csr_io_csr_11_dataWrite; // @[DMATop.scala 56:14:@1545.4]
  assign ctl_io_csr_14_dataOut = csr_io_csr_14_dataOut; // @[DMATop.scala 56:14:@1558.4]
  assign ctl_io_csr_14_dataWrite = csr_io_csr_14_dataWrite; // @[DMATop.scala 56:14:@1557.4]
  assign ctl_io_csr_15_dataOut = csr_io_csr_15_dataOut; // @[DMATop.scala 56:14:@1562.4]
  assign ctl_io_csr_15_dataWrite = csr_io_csr_15_dataWrite; // @[DMATop.scala 56:14:@1561.4]
  assign ctl_io_sync_readerSync = io_sync_readerSync; // @[DMATop.scala 64:11:@1651.4]
  assign ctl_io_sync_writerSync = io_sync_writerSync; // @[DMATop.scala 64:11:@1650.4]
  assign ctl_io_xferRead_done = readerFrontend_io_xfer_done; // @[DMATop.scala 57:26:@1568.4]
  assign ctl_io_xferWrite_done = writerFrontend_io_xfer_done; // @[DMATop.scala 58:26:@1573.4]
  assign queue_clock = clock; // @[:@1468.4]
  assign queue_reset = reset; // @[:@1469.4]
  assign queue_io_enq_valid = readerFrontend_io_dataIO_valid; // @[Decoupled.scala 295:22:@1470.4]
  assign queue_io_enq_bits = readerFrontend_io_dataIO_bits; // @[Decoupled.scala 296:21:@1471.4]
  assign queue_io_deq_ready = writerFrontend_io_dataIO_ready; // @[DMATop.scala 52:9:@1475.4]
endmodule
