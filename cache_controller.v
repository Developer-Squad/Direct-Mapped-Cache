`include "cache_memory"
`include "main_memory"
`include "cache_decoder"

module cache_controller(clk,AddressTagBits,tagBits,flag);
    input [19:0] AddressTagBits;
    input [19:0] CompareTagBits;
    input clk;

    output flag;

    reg flag;

    always@(posedge clk)
    begin
        if(AddressTagBits == CompareTagBits){           
            flag <= 1;
        }
        else{
            flag <= 0;
        }
    end
endmodule