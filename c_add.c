#include <stdio.h>
#include <svdpi.h>  // Required for DPI functions


extern void display_in_sv(); // to call a method in SV from C need to use extern keyword.

void display() {
	printf("INSIDE THE C FILE ACCESSING FROM SYSTEM VERILOG FILE");
	display_in_sv(); // triggering the display_in_sv method in this file .. (extern void display_in_sv();)
	
}

int c_add(int a, int b) {
    return a + b;
	
}
