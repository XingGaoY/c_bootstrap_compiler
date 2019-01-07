LEX := flex
YACC := bison
YFLAGS := -d
LEX := flex
CXX := g++
CXXFLAGS := -Wall -g -Isrc/include -std=c++11


CUR_DIR := $(shell pwd)
OBJ_DIR := $(CUR_DIR)/obj

vpath %.o $(OBJ_DIR)

DIRS := src/core

#SRC := $(foreach n, $(DIRS), $(wildcard $(n)/*.c))

#OBJS := $(patsubst src/%.c, obj/%.o, $(SRC))

ccompiler : $(DIRS)/scanner.yy.cpp $(DIRS)/parser.tab.cpp $(DIRS)/kern.cpp
	$(CXX) $(CXXFLAGS) -o $@ $(DIRS)/scanner.yy.cpp $(DIRS)/parser.tab.cpp $(DIRS)/kern.cpp

#$(OBJS):obj/%.o:src/%.c
#obj/parser.o: $(DIRS)/parser.tab.c
#	$(CC) -c $(DIRS)/parser.tab.c -o $@

#obj/kern.o: $(DIRS)/kern.cpp
#	$(CXX) $(CXXFLAGS) -c $(DIRS)/kern.cpp -o $@

#obj/scanner.yy.o: $(DIRS)/scanner.yy.cpp $(DIRS)/parser.tab.hpp
#	$(CXX) $(CXXFLAGS) -c $(DIRS)/scanner.yy.cpp -o $@

#obj/parser.tab.o: $(DIRS)/parser.tab.cpp
#	$(CXX) $(CXXFLAGS) $(DIRS)/parser.tab.cpp -o $@

$(DIRS)/scanner.yy.cpp: $(DIRS)/scanner.lex $(DIRS)/parser.tab.hpp
	$(LEX) -o $@ $(DIRS)/scanner.lex

$(DIRS)/parser.tab.cpp $(DIRS)/parser.tab.hpp: $(DIRS)/parser.y
	cd ./src/core
	$(YACC) $(YFLAGS) $< -o $(DIRS)/parser.tab.cpp

.PHONY: clean

clean:
	find . -name *.o | xargs rm -f
	rm src/core/parser.tab.*
	rm src/core/scanner.yy.cpp
	rm ccompiler
