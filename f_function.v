// f_function.v
`timescale 1ns/1ps

module f_function (
    input  wire v, w, x, y, z,
    output wire F
);

    wire [4:0] in;
    assign in = {v,w,x,y,z};

    // Output = 1 only for listed minterms
    assign F = (in == 5'd0)  |
               (in == 5'd2)  |
               (in == 5'd3)  |
               (in == 5'd4)  |
               (in == 5'd8)  |
               (in == 5'd21) |
               (in == 5'd22) |
               (in == 5'd29) |
               (in == 5'd31);

endmodule


// ---------------- TESTBENCH ----------------
module tb_f_function;
    reg v, w, x, y, z;
    wire F;

    f_function dut (.v(v), .w(w), .x(x), .y(y), .z(z), .F(F));

    integer i;

    initial begin
        // dump for waveform viewing
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_f_function);

        $display("Time\tv w x y z | F");

        // exhaustively test all 32 inputs
        for (i = 0; i < 32; i = i + 1) begin
            {v,w,x,y,z} = i[4:0];
            #5 $display("%0t\t%b %b %b %b %b | %b",
                        $time, v,w,x,y,z,F);
        end

        #10 $finish;
    end
endmodule
