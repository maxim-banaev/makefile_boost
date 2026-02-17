# Compiler settings
CXX = g++

CXXFLAGS = -std=c++17 -Wall -Wextra -g -O0 -I/opt/homebrew/Cellar/boost/1.90.0_1/include
LDFLAGS = -L/opt/homebrew/Cellar/boost/1.90.0_1/lib

# Directories
SRC_DIR = src
TEST_DIR = tests
BUILD_DIR = build

# Source files
SOURCES = $(SRC_DIR)/calculator.cpp
MAIN_SOURCE = $(SRC_DIR)/main.cpp
TEST_SOURCE = $(TEST_DIR)/test_calculator.cpp

# Object files
OBJECTS = $(BUILD_DIR)/calculator.o
MAIN_OBJECT = $(BUILD_DIR)/main.o
TEST_OBJECT = $(BUILD_DIR)/test_calculator.o

# Targets
EXECUTABLE = $(BUILD_DIR)/calculator
TEST_EXECUTABLE = $(BUILD_DIR)/test_calculator

.PHONY: all clean test run

# Default target
all: $(EXECUTABLE)

# Build main executable
$(EXECUTABLE): $(OBJECTS) $(MAIN_OBJECT)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

# Build test executable
$(TEST_EXECUTABLE): $(OBJECTS) $(TEST_OBJECT)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

# Compile calculator object
$(BUILD_DIR)/calculator.o: $(SRC_DIR)/calculator.cpp $(SRC_DIR)/calculator.h | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile main object
$(BUILD_DIR)/main.o: $(MAIN_SOURCE) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile test object
$(BUILD_DIR)/test_calculator.o: $(TEST_SOURCE) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Run main executable
run: $(EXECUTABLE)
	./$(EXECUTABLE)

# Build and run tests
test: $(TEST_EXECUTABLE)
	./$(TEST_EXECUTABLE)

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Help target
help:
	@echo "Available targets:"
	@echo "  all    - Build the main executable (default)"
	@echo "  test   - Build and run unit tests"
	@echo "  run    - Build and run the main executable"
	@echo "  clean  - Remove build artifacts"
	@echo "  help   - Show this help message"
