#include "Vtop.h"
#include "verilated.h"
#include <iostream>

int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    Vtop* top = new Vtop;

    top->CLK = 0;
    top->eval();

    // Write data to address 10
    top->CLK = 1;
    top->WE = 1;
    top->ADDR = 10;
    top->DI = 12345;
    top->eval();

    // Read data from address 10
    top->CLK = 0;
    top->eval();
    top->CLK = 1;
    top->WE = 0;
    top->ADDR = 10;
    top->eval();

    if (top->DO == 12345) {
        std::cout << "Test Passed!" << std::endl;
    } else {
        std::cout << "Test Failed!" << std::endl;
        std::cout << "Expected: 12345, Got: " << top->DO << std::endl;
    }

    delete top;
    return 0;
}
