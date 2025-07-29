# Makefile

# Variables
VERILATOR = verilator
TOP_MODULE = top
TOP_DESIGN = your_top_design.sv
BRAM_WRAPPER = RAMB36E2.sv
BRAM_MODEL_C = bram_model.c
SIM_MAIN = sim_main.cpp
BUILD_DIR = obj_dir

# Default target
all: $(BUILD_DIR)/V$(TOP_MODULE)
	./$(BUILD_DIR)/V$(TOP_MODULE)

# Verilator compilation
$(BUILD_DIR)/V$(TOP_MODULE): $(TOP_DESIGN) $(BRAM_WRAPPER) $(BRAM_MODEL_C) $(SIM_MAIN)
	$(VERILATOR) --cc --exe --build -j 0 \
	             -o V$(TOP_MODULE) \
	             --top-module $(TOP_MODULE) \
	             $(TOP_DESIGN) \
	             $(BRAM_WRAPPER) \
	             $(SIM_MAIN) \
	             bram_model_wrapper.cpp

# Clean rule
clean:
	rm -rf $(BUILD_DIR) V$(TOP_MODULE)

.PHONY: all clean
