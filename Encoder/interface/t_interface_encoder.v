`timescale 1ns / 1ps
module t_interface_encoder;
reg clock = 0'b0;
wire [7:0] out;
interface_encoder e1 (.clock(clock),.out5(out));

initial
begin
    forever
        #10
        clock = ~clock;
end
endmodule
