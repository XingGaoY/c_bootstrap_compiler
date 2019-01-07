LEX := flex
YACC := bison
YFLAGS := -d
LEX := flex
CC := $gcc
CFLAGS := -Wall -g -I src/include

CUR_DIR := $(shell pwd)
OBJ_DIR := $(CUR_DIR)/obj

vpath %.o $(OBJ_DIR)

DIRS := src/core

#SRC := $(foreach n, $(DIRS), $(wildcard $(n)/*.c))

#OBJS := $(patsubst src/%.c, obj/%.o, $(SRC))

#ccompiler : $(OBJS)
#	$(CC) $(CFLAGS) -o ccompiler $(OBJS)

#$(OBJS):obj/%.o:src/%.c
#obj/parser.o: $(DIRS)/parser.tab.c
#	$(CC) -c $(DIRS)/parser.tab.c -o $@

#obj/lex.yy.o: $(DIRS)/lex.yy.o parser.tab.h
#	$(CC) -c $(DIRS)/lex.yy.c -o $@

$(DIRS)/scanner.yy.c: $(DIRS)/scanner.lex $(DIRS)/parser.tab.h
	$(LEX) -o $@ $(DIRS)/scanner.lex
$(DIRS)/parser.tab.c $(DIRS)/parser.tab.h: $(DIRS)/parser.y
	cd ./src/core
	$(YACC) $(YFLAGS) $< -o $(DIRS)/parser.tab.c

.PHONY: clean

clean:
	find . -name *.o | xargs rm -f
	rm src/core/parser.tab.*
	rm src/core/scanner.yy.c
