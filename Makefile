# VMP_WEB_SERVER Makefile 

######################### COMPILER #########################

CC	=	g++
CCFLAGS	+=	-W -Wall -ansi -pedantic -O3 -std=c++11

EXEC	=	vmp_web_server
SRC	= 	$(wildcard src/*.cpp)
OBJ	= 	$(SRC:.cpp=.o)

######################## LIBS FLAGS ########################

####################### BOOST FLAGS ########################

LDLIB_BOOST	+=	-lboost_random -lboost_regex
LDLIB_BOOST	+=	-lboost_signals -lboost_system -lboost_thread -lboost_filesystem
LDLIB_BOOST	+=	-lboost_program_options -lboost_date_time

######################### WT FLAGS #########################

LDLIB_WT	+=	-lwthttp -lwt

LDLIBS		+=	$(LDLIB_BOOST) $(LDLIB_WT)
LDFLAGS		+=	 


###################### BUILD COMMANDS ######################

all: $(EXEC)

$(EXEC): $(OBJ)
	@$(CC) -o $@ $^ $(LDFLAGS) $(LDLIBS)

%.o: %.cpp
	@$(CC) -o $@ -c $< $(CCFLAGS)
	


###################### SERVER PARAMS ######################

HTTP_ADDR   =   0.0.0.0
HTTP_PORT   =   8080
DOC_ROOT    =   .

##################### SERVER COMMANDS ######################

run: $(EXEC)
	./$(EXEC) --http-address $(HTTP_ADDR) --http-port $(HTTP_PORT) --docroot $(DOC_ROOT)


########################## CLEAN ##########################

.PHONY: clean mrproper

clean:
	@rm -rf $(OBJ)

mrproper: clean
	@rm -rf $(EXEC)


