module tb_top();
  
  export "DPI-C" function display_in_sv;
  // Funtion call is from C file so export is used
	
  import "DPI-C" function int c_add(int a, int b);
  // function definition is in c file so import
	
  import "DPI-C" context function void display();
  // In c definition for display() function and inside display
  // function display_in_sv() is called so context is used
	
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
