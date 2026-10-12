`timescale 1ns/1ps
module tb_i2c_simple;
 reg clk = 0;
 reg rst_n = 0;
 reg mode = 0; // 0 = WRITE, 1 = READ
 reg [7:0] data_wr = 8'h3C; // write data to show
 reg [7:0] data_rd = 8'h3C; // same data for read (to show consistency)
 wire sda, scl;
 always #50 clk = ~clk; // 100ns clock
 i2c_simple dut(
 .clk(clk),
 .rst_n(rst_n),
 .mode(mode),
 .data_wr(data_wr),
 .data_rd(data_rd),
 .sda(sda),
 .scl(scl)
 );
  initial begin
 $dumpfile("i2c_simple.vcd");
 $dumpvars(0, tb_i2c_simple);

// reset
 rst_n = 0;
 #200;
 rst_n = 1;
 // FIRST: WRITE
 mode = 0; // show write
 data_wr = 8'h3C;
 #2000;

// SECOND: READ
 mode = 1; // show read
 data_rd = 8'h3C;
 #2000;
$finish;
 end
endmodule
