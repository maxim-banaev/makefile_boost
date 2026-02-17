# Simple Makefile Project with Boost.Test

A simple C++ project demonstrating a Calculator class with Boost.Test unit tests.

## Project Structure

```
.
├── Makefile
├── README.md
├── src/
│   ├── calculator.h
│   ├── calculator.cpp
│   └── main.cpp
└── tests/
    └── test_calculator.cpp
```

## Prerequisites

- C++ compiler (g++)
- Boost library (installed at /opt/homebrew/Cellar/boost/1.90.0_1)

## Building

Build the main application:
```bash
make
```

Build and run tests:
```bash
make test
```

Build and run the main application:
```bash
make run
```

Clean build artifacts:
```bash
make clean
```

## Features

- Simple Calculator class with add, subtract, multiply, and divide operations
- Comprehensive unit tests using Boost.Test framework
- Clean Makefile-based build system
