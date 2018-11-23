// In our main memory, data at address location 'x' which is 32-bits, is 'x' itself
module main_memory(clk,address,data_out);
    input [31:0] address;
    input clk;

    output [31:0] data_out;

    reg [31:0] data_out;

    always@(posedge clk)
    begin
        data_out <= address;
    end
endmodule
