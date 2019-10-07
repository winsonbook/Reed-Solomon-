`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Patna
// Engineer: Azam
// Create Date: 07.10.2019 11:25:12
// Design Name: Read and write to SPI flash memory through state machine flow
// Module Name: read_write_SM
// Project Name: Read and write to SPI flash memory through state machine flow
// Target Devices: Spartan 3E
//////////////////////////////////////////////////////////////////////////////////

module read_write_SM(
    output [7:0] final_value,
    output MOSI,
    output SS,
    output clock_out,
    input MISO,
    input clock_in
    );
    reg [9:0] clock_counter = 10'b0000_0000_00;
    always @ (posedge clock_in)
        clock_counter <= clock_counter + 1;
    assign clock_out = clock_counter[9];
    wire clock = clock_counter[9];
    
    parameter [23:0] address = {24'h1FFFF0};
    parameter [7:0] WREN =  8'b0000_0110;
    parameter [7:0] READ  = 8'b0000_0011;
    parameter [7:0] PP = 8'b0000_0010;
    parameter [7:0] RDSR = 8'b0000_0101;
    parameter [7:0] data = 8'b1010_1010;
     
    wire SS1,SS2;
    reg listening = 1'b0;
    read r2 (.final_value(final_value),.SS(SS1),.MISO(MISO),.clock(clock),.listening(listening));
    
        
    reg activate_MOSI = 1'b0;
    reg [7:0] message = 8'b1111_1111;
    write w2 (.MOSI(MOSI),.SS(SS2),.message(message),.activate_MOSI(activate_MOSI),.clock(clock));
    
    assign SS = SS1&SS2; 
     
    parameter [3:0] S_idle      = 4'b0000,
                    write_wren  = 4'b0001,
                    S_wait      = 4'b0010,
                    write_pp    = 4'b0011,
                    write_ad3   = 4'b0100,
                    write_ad2   = 4'b0101,
                    write_ad1   = 4'b0110,
                    write_data  = 4'b0111,
                    write_read  = 4'b1000,
                    S_read      = 4'b1001;
                    
   reg [3:0] state = 4'b0000;
   
   reg [7:0] in = 8'b00_00_00_10;  //Later this has to be made input 
   reg status = 1'b0;               //status = 0 for read operation and status = 1 for write operation
   reg [3:0] counter = 4'b0000;
   
   always@(posedge clock)           //Defining states for various conditions
   begin
   in <= {in[5:0],2'b00};
   case(state)
    S_idle     :begin 
                    counter <= 4'b0000;
                    case({in[7],in[6]})
                    2'b01:  begin       //case for enabling writing sequence
                                state <= write_wren;
                                status <= 1'b1;
                            end
                        
                    2'b10:  begin       //case for enabling reading sequence
                                state <= write_read;
                                status <= 1'b0;
                            end 
                            
                    default : state <= S_idle;
                    endcase   
                end
    write_wren :begin               //Giving write enable command
                   if(counter<7)
                   begin
                        state <= write_wren;                       
                        counter <= counter + 1;
                   end
                   
                   else                  
                   begin
                       state <= S_wait;
                       counter <= 4'b0000;
                   end
                end
    S_wait     :begin               //to wait for 8 clock pulse like to execute the wren command 
                   if(counter<7)
                   begin
                        counter <= counter + 1;
                        state <= S_wait;
                   end
                   
                   else                  
                   begin
                       state <= write_pp;
                       counter <= 4'b0000;
                   end
                end
    write_pp   :begin                   //Giving page program instruction
                   if(counter<7)
                   begin
                        counter <= counter + 1;
                        state <= write_pp;
                   end
                   else
                   
                   begin
                       state <= write_ad3;
                       counter <= 4'b0000;
                   end
                end
    write_ad3  :begin                   //MSB of the address
                   if(counter<7)
                   begin
                       counter <= counter + 1;
                       state <= write_ad3;
                   end
                   
                   else                  
                   begin
                       state <= write_ad2;
                       counter <= 4'b0000;
                   end
                end
    write_ad2  :begin 
                   if(counter<7)
                   begin
                        counter <= counter + 1;
                        state <= write_ad2;                       
                   end
                   
                   else                   
                   begin
                       state <= write_ad1;
                       counter <= 4'b0000;
                   end
                end
    write_ad1  :begin                 //LSB of the address 
                   if(counter<7)
                   begin             
                       counter <= counter + 1;
                       state <= write_ad1;
                   end
                   
                   else                   
                   begin                                    
                       counter <= 4'b0000;
                       if(status == 1'b1)
                           state <= write_data;
                       else
                           state <= S_read;
                   end
                end
    write_data :begin               //Giving data to be written on the memory
                   if(counter<7)
                   begin
                       counter <= counter + 1;
                       state <= write_data;
                   end
                       
                   else                  
                   begin
                       state <= S_idle;
                       counter <= 4'b0000;
                   end
                end
    write_read :begin               //For giving read instruction                
                   if(counter<7)
                   begin
                       counter <= counter + 1;
                       state <= write_read;
                   end
                   
                   else
                   begin
                       state <= write_ad3;
                       counter <= 4'b0000;
                   end
                end
    S_read     :begin               //Reading the data from MISO signal during this state
                   if(counter<7)
                   begin
                       counter <= counter + 1;
                       state <= S_read;
                   end
                   
                   else
                   begin
                       state <= S_idle;
                       counter <= 4'b0000;
                   end
                end
    default    :state<=S_idle;
   endcase
   end
   
   always@(state)       //For assigning the values to variable -> listening,[7:0]message,activate_MOSI as per state
   begin
   case(state)
    S_idle     : begin
                    listening = 1'b0;
                    message = 8'b1111_1111;
                    activate_MOSI = 1'b0;
                 end
    write_wren : begin
                    listening = 1'b0;
                    message = WREN;
                    activate_MOSI = 1'b1;
                 end
    S_wait     : begin
                    listening = 1'b0;
                    message = 8'b1111_1111;
                    activate_MOSI = 1'b0;
                 end
    write_pp   : begin
                    listening = 1'b0;
                    message = PP;
                    activate_MOSI = 1'b1;
                 end
    write_ad3  : begin
                    listening = 1'b0;
                    message = address[23:16];
                    activate_MOSI = 1'b1;
                 end
    write_ad2  : begin
                    listening = 1'b0;
                    message = address[15:8];
                    activate_MOSI = 1'b1;
                 end
    write_ad1  : begin
                    listening = 1'b0;
                    message = address[7:0];
                    activate_MOSI = 1'b1;
                 end
    write_data : begin
                    listening = 1'b0;
                    message = data;
                    activate_MOSI = 1'b1;
                 end
    write_read : begin
                    listening = 1'b0;
                    message = READ;
                    activate_MOSI = 1'b1;
                 end
    S_read     : begin
                    listening = 1'b1;
                    message = 8'b1111_1111;
                    activate_MOSI = 1'b0;
                 end
    default    : begin
                    listening = 1'b0;
                    message = 8'b1111_1111;
                    activate_MOSI = 1'b0;
                 end
   endcase
   end

endmodule


module read(
    output reg [7:0] final_value,
    output SS,
    input MISO,
    input listening,
    input clock
    );   
assign SS = ~listening;
always@(posedge clock)
begin
    if(listening==1'b1)
    begin
        final_value[0]<=MISO;
        final_value[1]<=final_value[0];
        final_value[2]<=final_value[1];
        final_value[3]<=final_value[2];
        final_value[4]<=final_value[3];
        final_value[5]<=final_value[4];
        final_value[6]<=final_value[5];
        final_value[7]<=final_value[6];
    end
end   
endmodule

module write(
    output reg MOSI,
    output reg SS,
    input [7:0] message,
    input activate_MOSI,
    input clock
); 
   
reg [2:0] counter = 3'b000;
always@(negedge clock)
begin
    if(activate_MOSI == 1'b1)
    begin
        SS <= 1'b0;
        case(counter)
        3'b000: begin
                    MOSI <= message[7];
                    counter <= counter+1;
                end
        3'b001: begin
                    MOSI<= message[6];
                    counter <= counter+1;
                end
        3'b010: begin
                    MOSI <= message[5];
                    counter <= counter+1;
                end
        3'b011: begin
                    MOSI<= message[4];
                    counter <= counter+1;
                end
        3'b100: begin
                    MOSI <= message[3];
                    counter <= counter+1;
                end
        3'b101: begin
                    MOSI<= message[2];
                    counter <= counter+1;
                end
        3'b110: begin
                    MOSI <= message[1];
                    counter <= counter+1;
                end
        3'b111: begin
                    MOSI<= message[0];
                    counter <= counter+1;
                end
        default begin
                    MOSI <= 1'b1;
                    counter = 3'b000;
                end
        endcase
    end
    
    else
    begin
        SS = 1'b1;
        counter <= 3'b000;
        MOSI <= 1'b1;
    end
end            

endmodule