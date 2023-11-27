CROSS_COMPILE :=
CC := $(CROSS_COMPILE)gcc
SRC := writer.c
TARGET := writer
all: $(TARGET)

$(TARGET) : $(SRC)
	$(CC) $(SRC) $(CFLAGS) $(INCLUDES) -o $(TARGET) $(LDFLAGS)
	
clean:
	rm -f $(TARGET)