`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2025 18:11:37
// Design Name: 
// Module Name: rra_tb
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


module rra_tb();
reg clk;
reg reset;
reg [3:0] req;
wire [3:0] gnt;
rra dut (
.clk(clk),
.reset(reset),
.req(req),
.gnt(gnt)
 );
 initial begin
 clk = 1;
 reset = 1;    
 req = 4'b0000;
 end
 initial 
 forever #5 clk = ~clk;
 initial begin
#10 reset = 0;
#10 req = 4'b1111;
#40;
#10 req = 4'b1011;
#30;
#10 req = 4'b1110;
#30;
#10 req = 4'b1100;
#20;
#10 req = 4'b0101;
#20;
#10 req = 4'b0000;
#2.5;
$finish;
end
endmodule
