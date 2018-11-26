module main_tb();
    reg [31:0] address;
    reg clk;

    wire [31:0] dataOut;

    main uut(
    .clk(clk),
    .hit(hit),
    .address(address),
    .dataOut(dataOut)
    );
    initial begin 
        $monitor("clk = %b hit = %b dataout = %b",clk,hit,dataOut);
        clk = 0;
        // address = 32'h1fffff50; #20;
        // $display("clk = %b  dataout = %b",clk,dataOut);
        address = 32'h1fffff10; #20;
        
        #200; $finish;
    end

    always 
    #2 clk = ~clk;
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