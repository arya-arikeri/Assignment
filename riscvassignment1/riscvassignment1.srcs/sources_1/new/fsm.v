`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2025 00:29:10
// Design Name: 
// Module Name: fsm
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


module fsm(clk,reset,xin,yout );
input clk, reset, xin;
output reg yout;
parameter [2:0] s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
reg [2:0]cur_state , next_state;
always @ ( posedge clk )
begin
if(reset)
cur_state<=s0;
else
cur_state<=next_state;
end
always @ (*)
begin
next_state=s0;
case(cur_state)
s0: begin
if(xin)
next_state = s1;
else
next_state = s0;
end
s1: begin
if(xin)
next_state = s2;
else
next_state = s0;
end
s2: begin
if(xin)
next_state = s2;
else
next_state = s3;
end
s3: begin
if(xin)
next_state = s4;
else
next_state = s0;
end
s4: begin
if(xin)
next_state = s2;
else
next_state = s0;
end
endcase
end
always @ (posedge clk)
begin
yout = 1'b0;
case(cur_state)
s0: yout = 0;
s1: yout = 0;
s2: yout = 0;
s3: begin
if(xin)
yout = 1;
else 
yout = 0;
end
s4: yout = 1;
endcase
end 
endmodule
