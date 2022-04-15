#Executable Name
EXENAME = final_project
TEST = test

# Add all object files needed for compiling:
EXE_OBJ = main.o
OBJS = parseDat.o main.o  

# PageRank.o airport_graph.o Flight.o Djikstras.o BFS.o Landmark.o

# Compilation Flags
CXX = clang++
CXXFLAGS = $(CS225) -std=c++14 -stdlib=libc++ -c -g -O0 -Wall -Wextra -pedantic
LD = clang++
LDFLAGS = -std=c++14 -stdlib=libc++ -lc++abi -lm

# Custom Clang Enforcement
include make/make.mk

# Define Makefile Rules
.PHONY: all test clean output_msg

project : $(EXENAME)

output_msg: ; $(CLANG_VERSION_MSG)

$(EXENAME): output_msg $(OBJS)
	$(LD) $(OBJS) $(LDFLAGS) -o $(EXENAME)

test: output_msg catch/catchmain.cpp tests/tests.cpp parseDat.cpp
	$(LD) catch/catchmain.cpp tests/tests.cpp parseDat.cpp $(LDFLAGS) -o test_output

clean:
	-rm -f *.o $(EXENAME) test
