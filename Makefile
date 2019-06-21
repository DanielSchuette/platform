TARGET := bounce

.PHONY: all test clean

all:
	gcc -lm -lX11 -lGL -lGLU -lglut $(TARGET).c -o prog

test:
	./prog

clean:
	rm prog *.o
