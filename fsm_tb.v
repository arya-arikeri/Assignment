`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2025 12:06:53
// Design Name: 
// Module Name: fsm_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_fsm;
 reg clk;
 reg reset;
 reg xin;
 wire yout;
  fsm dut (
    .clk(clk),
    .reset(reset),
    .xin(xin),
    .yout(yout)
  );
   initial begin
    clk = 1;
    reset = 1;
    xin = 0;
    end
  initial
  forever #5 clk = ~clk;

 initial begin
    #10 reset = 0;
    #10 xin = 0;
    #10 xin = 1;
    #10 xin = 1;
    #10 xin = 0;
    #10 xin = 1;
    #10 xin = 1;
    #10 xin = 0;
    #10 xin = 1;
    #10 xin = 0;
    #10 xin = 1;
    #10 xin = 1;
    #10 xin = 0;
    #10 xin = 1;
    #10 xin = 0;
    #20;
    $finish;
 end
endmodule





