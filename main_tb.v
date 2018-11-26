module main_tb();
    reg [31:0] address;
    reg clk;

    wire [31:0] dataOut;
    wire hit;

    integer count = 0;

    main uut(
    .clk(clk),
    .hit(hit),
    .address(address),
    .dataOut(dataOut)
    );
    initial begin 
        // $monitor("clk = %b hit = %b dataout = %b",clk,hit,dataOut);
        clk = 0;
        count = 1;
        // address = 32'h1fffff50; #20;
        // $display("clk = %b  dataout = %b",clk,dataOut);
        address = 32'h1fffff17; #10;
        address = 32'h1fffff85; #10;
        address = 32'h1fffff87; #10;
        address = 32'h1fffff25; #10;
        address = 32'h1ff4ff85; #10;
        address = 32'h1ff7ff85; #10;
        address = 32'h1fffff80; #10;
        
        #200; $finish;
    end

    always begin
        #1 clk = ~clk;
        if(clk == 1 && hit == 0)
            count = count + 1;
        $display("clk = %b hit = %b read = %b dataout = %h count = %d",clk,hit,uut.read,dataOut,count);
    end
    // integer fp1;
    // integer temp;
    // reg[31:0]A;
    // initial begin
      // fp1 = $fopen("gcc.trace", "r");
      // while(!$feof(fp1)) begin
      //   temp = $fscanf(fp1,"%h\n",A);
      //   $display("%h",A);
      //   #10;
      // end
      // $fclose(fp1);
      // #100 $finish;
    // end
endmodule