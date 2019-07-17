# Make the platformer.
# The following configuration flags conditionally compile features.
DEBUG   = -DDEBUG # debugging mode
CONFIG  = -DCOLORS_ENABLED # colorful terminal output

# source files and compilation flags
SRC_DIR = src
BIN     = platform
SRCS    = $(wildcard $(SRC_DIR)/*.c)
OBJS    = $(patsubst $(SRC_DIR)/%.c, $(SRC_DIR)/%.o, $(SRCS))
LIBS    = -lm -lX11 -lglfw -lrt -lxcb -lXau -lGL -lpthread -lXrandr -lXi -ldl

.PHONY: all test clean help

all: $(BIN)

$(BIN): $(OBJS)
	gcc $(LIBS) $(OBJS) -o $@

$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	gcc $(DEBUG) $(CONFIG) -c $< -o $@

test: $(BIN)
	@./$<

clean:
	rm -f $(BIN) $(SRC_DIR)/*.o

help:
	@echo "Compile the platformer with 'make all'."
	@echo "For a non-default build, comment/uncomment"
	@echo "the appropriate options in './Makefile'."
