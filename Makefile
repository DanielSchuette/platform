# Make the examples.
# Most of the compiler flags are `pkg-config --static --libs glfw3`.
SRC_DIR = src
BIN     = prog
SRCS    = $(wildcard $(SRC_DIR)/*.c)
OBJS    = $(patsubst $(SRC_DIR)/%.c, $(SRC_DIR)/%.o, $(SRCS))
LIBS    = -lm -lX11 -lglfw -lrt -lxcb -lXau -lGL -lpthread -lXrandr -lXi -ldl
DEBUG   = -DDEBUG
CONFIG  = -DCOLORS_ENABLED

.PHONY: all test clean

all: $(BIN)

$(BIN): $(OBJS)
	gcc $(LIBS) $(OBJS) -o $@

$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	gcc $(DEBUG) $(CONFIG) -c $< -o $@

test: $(BIN)
	@./$<

clean:
	rm -f $(BIN) $(SRC_DIR)/*.o
