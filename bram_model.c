// In bram_model.c
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

// A static array to represent the BRAM's storage.
// In a real model, this would be dynamically sized based on parameters.
static unsigned int ram_storage[1024];

// The function we will export to Verilog via DPI-C
// In a real model, this would have more ports (clocks, enables, etc.)
void bram_update(int write_enable, int address, int data_in, int* data_out) {
    // Read-before-write behavior is common
    if (address < 1024) {
        *data_out = ram_storage[address];

        if (write_enable) {
            ram_storage[address] = data_in;
        }
    }
}

#ifdef __cplusplus
}
#endif
