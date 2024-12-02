CC = nvcc
TARGET = hello

all: $(TARGET)

$(TARGET).o:$(TARGET).cu
	$(CC) $(CFLAGS) -c -o $(TARGET).o $(TARGET).cu

$(TARGET): $(TARGET).o
	$(CC) $(CFLAGS) -o `pwd`/$(TARGET) $(TARGET).o

clean:
	rm -f $(TARGET) $(TARGET).o


   
