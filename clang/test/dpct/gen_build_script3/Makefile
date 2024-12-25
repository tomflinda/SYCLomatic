# This Makefile is used to verify intercept-build to work in the environment where tool chain is not installed.
TARGET = hello

# Define a variable that checks for nvcc
CHECK_NVCC := $(shell command -v nvcc >/dev/null 2>&1 && echo "available" || echo "not available")

# Target to check nvcc
ifeq ($(CHECK_NVCC), available)
	COMPILER = nvcc
else
	COMPILER = echo "dump compiler"
endif

all: 
	CPATH=;$(COMPILER) -o $(TARGET) *.cu
	CPATH=; $(COMPILER) -o $(TARGET) *.cu
	/usr/local/cuda-12.0/bin/nvcc -o $(TARGET) *.cu
	@echo " " $(COMPILER) -o $(TARGET) *.cu
	$(COMPILER) -o $(TARGET) *.cu

clean:
	rm -f $(TARGET)
