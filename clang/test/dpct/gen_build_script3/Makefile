# This Makefile is used to verify intercept-build to work in the environment where tool chain is not installed
# or installed in the default path, but not adding into environment path.
TARGET = hello

CHECK_INSTALL_PATH := $(shell command -v ls /usr/local | grep -E "^cuda-[0-9]+\.[0-9]+" && echo "available" || echo "not available")
CHECK_NVCC_FROM_PATH := $(shell command -v nvcc >/dev/null 2>&1 && echo "available" || echo "not available")

ifeq ($(CHECK_INSTALL_PATH), available)
	COMPILER = nvcc
else ifeq  ($(CHECK_NVCC_FROM_PATH), available)
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
