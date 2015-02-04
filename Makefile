#============================================================================#
#                  EAGLE 2014, IEETA/DETI, UNIVERSITY OF AVEIRO              #
#============================================================================#
BIN    = .
CC     = gcc
CPLP   = -fstrict-aliasing -ffast-math -msse2
#-----------------------------------------------------------------------------
CFLAGS = -O3 -Wall $(CPLP) -DPROGRESS 
#-----------------------------------------------------------------------------
LIBS   = -lm -lpthread
DEPS   = defs.h
PROGS  = $(BIN)/EAGLE $(BIN)/mink $(BIN)/rebat
OBJS   = mem.o common.o context.o
#-----------------------------------------------------------------------------
all:
	$(MAKE) progs
progs: $(PROGS)
$(BIN)/EAGLE: eagle.c $(DEPS) $(OBJS)
	$(CC) $(CFLAGS) -o $(BIN)/EAGLE eagle.c $(OBJS) $(LIBS)
$(BIN)/mink: mink.c $(DEPS)
	$(CC) $(CFLAGS) -o $(BIN)/mink mink.c $(LIBS)
$(BIN)/rebat: rebat.c $(DEPS)
	$(CC) $(CFLAGS) -o $(BIN)/rebat rebat.c $(LIBS)
mem.o: mem.c mem.h $(DEPS)
	$(CC) -c $(CFLAGS) mem.c
common.o: common.c common.h $(DEPS)
	$(CC) -c $(CFLAGS) common.c
context.o: context.c context.h $(DEPS)
	$(CC) -c $(CFLAGS) context.c
clean:
	/bin/rm -f *.o
cleanall:
	/bin/rm -f *.o $(PROGS)
#-----------------------------------------------------------------------------
