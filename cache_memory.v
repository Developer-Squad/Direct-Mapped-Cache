`def BLOCKS = 256
`def WORDS = 16
`def SIZE = 32


module cache_memory(
    input clk,
    input mode,
    input [7:0] index,
    input [3:0] blkOffset,
    input [19:0] tagin;
    input [SIZE*WORDS-1:0] datain,
    output [SIZE-1:0] dataout,
    output [19:0] tagout,
    output valid
    );

    reg[BLOCKS-1:0] cache [WORDS*SIZE+20:0]
    always @(posedge clk)
        begin
        if(mode == 1)
            begin
                cache[index][0] = 1;
                cache[index][20:1] = tagin;
                cache[index][255:21] = datain;
            end
        else
            begin
                valid = cache[index][0];
                dataout = cache[index][blkOffset*(SIZE+1)-1:blkOffset*SIZE];
                tagout = cache[index][20:1] 
            end
        end

endmodule