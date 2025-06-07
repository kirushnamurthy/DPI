module tb_top();
  
  
  export "DPI-C" function display_in_sv;
  import "DPI-C" function int c_add(int a, int b);
  import "DPI-C" context function void display();

  
  function void display_in_sv();
    $display("\nINSIDE THE SYSTEM VERILOG FILE ACCESSING FROM C FILE");
  endfunction
  
  
  initial begin
    bit[7:0] res;
    res = c_add(10,20);
    $display("RESULT IS %0d",res);
	display();
  end
  
endmodule : tb_top