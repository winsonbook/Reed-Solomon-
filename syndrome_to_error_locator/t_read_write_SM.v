`timescale 1ps / 1ps

module t_read_write_SM;

//Output
wire [7:0] final_value;
wire MOSI;
wire SS;
wire clock_out;

//Input
reg MISO = 1'b0;
reg clock_in = 1'b0;  
    
read_write_SM rw_SM (.final_value(final_value),.MOSI(MOSI),.SS(SS),.clock_out(clock_out),.MISO(MISO),.clock_in(clock_in));

initial
begin
    forever
    begin
        #10000 MISO = ~MISO;
    end
end

initial
begin
    forever
    begin
        #1 clock_in = ~clock_in;
    end
end

endmodule
