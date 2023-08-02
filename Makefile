CC = gcc
FLAGS = -std=c17 -Wall

TARGET = run

BUILD_DIR = ./build
SRC_DIR = ./src

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(SRCS:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
DEPS = $(OBJS:.o=.d)

$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CC) $(FLAGS) $^ -o $@
	
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(FLAGS) -MMD -MP -c $< -o $@ 

-include $(DEPS)

.PHONY: clean dirs

OUT_DIRS = build src

dirs:
	mkdir -p $(OUT_DIRS)

clean:
	rm -f $(BUILD_DIR)/*.*