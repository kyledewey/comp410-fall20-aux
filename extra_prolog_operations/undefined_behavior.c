// C code
int x = 1 + 2; // x = 3
int y = x++; // x = 4; y = 3
y = y++; // y = <<YUH OH>> - undefined behavior

// unspecified behavior (implementation-defined)
int x = 1 + 2;
if (x & 1) { // 000011
  // 

// Java code
int x = 1 + 2; // x = 3
int y = x++; // x = 4; y = 3
y = y++; // y = 3

y++ // returns 3, THEN increments y (y = 4)
y = y++ // assigns 3 to y
