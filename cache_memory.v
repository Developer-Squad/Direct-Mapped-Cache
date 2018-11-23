`define BLOCKS 256
`define WORDS 16
`define SIZE 32


module cache_memory(
    input clk,
    input mode,
    input [7:0] index,
    input [3:0] blkOffset,
    input [19:0] tagin,
    input [`SIZE*`WORDS-1:0] datain,
    output reg [`SIZE-1:0] dataout,
    output reg [19:0] tagout,
    output reg valid
    );

    reg[`BLOCKS-1:0] cache [`WORDS*`SIZE+20:0];

    reg [532:0] out;

    always @(posedge clk)
        begin
        if(mode == 1)
            begin
                out[0] <= 1;
                out[20:1] <= tagin;
                out[532:21] <= datain;
                cache[index] <= out;
            end
        else
            begin
                out <= cache[index];
                valid <= out[0];
                dataout = out[32*(blkOffset)+:32];
                tagout <= out[20:1];
            end
        end

endmodule