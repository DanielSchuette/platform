# Make the examples.
TARGET := bounce
SRC_DIR := examples

.PHONY: all test clean

all: objs
	gcc -lm -lX11 -lGL -lGLU -lglut $(SRC_DIR)/$(TARGET).o -o $(TARGET)

objs: $(SRC_DIR)/$(TARGET).c
	gcc -c $< -o $(SRC_DIR)/$(TARGET).o

test: $(TARGET)
	./$<

clean:
	rm -f $(TARGET) *.o
