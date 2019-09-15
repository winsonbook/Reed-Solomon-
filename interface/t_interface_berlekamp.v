module t_berleykamp_messey;
reg clock;
wire [7:0] s3;

interface_berlekamp b2 (.clock(clock),.s3(s3));

initial
begin
clock=1;
forever
    begin
        #10
        clock = ~clock;
    end
end

endmodule
