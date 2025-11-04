`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2025 15:53:57
// Design Name: 
// Module Name: rra
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


module rra(
 input clk,          
 input reset,          
 input [3:0] req,    
 output reg [3:0] gnt
 );
 reg [1:0] priority;
 wire [1:0] next_priority;
 wire req_active;
 reg [1:0] granted_index; 
 always @(posedge clk or posedge reset) begin
 if (reset || !gnt_active )
 priority<= 2'd0; 
 else 
 priority<= next_priority;
 end
 assign gnt_active = | gnt;
 always @(*) 
 begin
 gnt = 4'b0000;
 granted_index = 2'b00; 
 case (priority)
 2'd0: begin 
 if (req[0])
 begin 
 gnt[0] = 1; 
 granted_index = 2'd0; 
 end
 else if (req[1])
 begin 
 gnt[1] = 1; 
 granted_index = 2'd1; 
 end
 else if 
 (req[2]) 
 begin 
 gnt[2] = 1; 
 granted_index = 2'd2; 
 end
 else if 
 (req[3]) 
 begin 
 gnt[3] = 1; 
 granted_index = 2'd3; 
 end
 end
 2'd1: 
 begin
 if (req[1]) 
 begin 
 gnt[1] = 1; 
 granted_index = 2'd1; 
 end
 else if (req[2]) 
 begin 
 gnt[2] = 1; 
 granted_index = 2'd2; 
 end
 else if (req[3]) 
 begin 
 gnt[3] = 1; 
 granted_index = 2'd3; 
 end
 else if (req[0]) 
 begin 
 gnt[0] = 1; 
 granted_index = 2'd0; 
 end
 end
 2'd2: begin
 if (req[2]) 
 begin 
 gnt[2] = 1; 
 granted_index = 2'd2; 
 end
 else if (req[3]) 
 begin 
 gnt[3] = 1; 
 granted_index = 2'd3; 
 end
 else if (req[0]) 
 begin 
 gnt[0] = 1; 
 granted_index = 2'd0; 
 end
 else if (req[1]) 
 begin 
 gnt[1] = 1; 
 granted_index = 2'd1; 
 end
 end
 2'd3: begin
 if (req[3]) 
 begin 
 gnt[3] = 1; 
 granted_index = 2'd3; 
 end
 else if (req[0]) 
 begin 
 gnt[0] = 1; 
 granted_index = 2'd0; 
 end
 else if (req[1]) 
 begin 
 gnt[1] = 1; 
 granted_index = 2'd1; 
 end
 else if (req[2]) 
 begin 
 gnt[2] = 1; 
 granted_index = 2'd2; 
 end
 end
 endcase
 end
 assign next_priority = (granted_index + 2'd1);
 endmodule
