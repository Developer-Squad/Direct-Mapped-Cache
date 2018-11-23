module cache_tb();
    integer fp1;
    integer temp;
    reg[31:0]A;
    initial begin
      fp1 = $fopen("gcc.trace", "r");
      while(!$feof(fp1)) begin
        temp = $fscanf(fp1,"%h\n",A);
        $display("%h",A);
        #10;
      end
      $fclose(fp1);
      #100 $finish;
    end
endmodule