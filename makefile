#OBJS specifies which files to compile as part of the project 
TEXI =  node-00.texi  node-05.texi  node-10.texi  node-15.texi  node-20.texi  node-25.texi \
        node-01.texi  node-06.texi  node-11.texi  node-16.texi  node-21.texi \
        node-02.texi  node-07.texi  node-12.texi  node-17.texi  node-22.texi \
        node-03.texi  node-08.texi  node-13.texi  node-18.texi  node-23.texi \
        node-04.texi  node-09.texi  node-14.texi  node-19.texi  node-24.texi

%.texi : %.po
	po2txt -i $*.po -o $*.texi


onlisp-ru.pdf : $(TEXI)
	echo $(TEXI)
	PDFTEX=luatex TEXINDEX=./rutexindex texi2pdf onlisp-ru.texi


#CC specifies which compiler we're using 
CC = g++ 

#COMPILER_FLAGS specifies the additional compilation options we're using 
# -w suppresses all warnings 
COMPILER_FLAGS = -w `pkg-config --cflags sdl2`

#LINKER_FLAGS specifies the libraries we're linking against 
LINKER_FLAGS = -lSDL2 

#OBJ_NAME specifies the name of our exectuable 
OBJ_NAME = 01_hello_SDL 

#This is the target that compiles our executable 

all : $(OBJS) 
	$(CC) $(OBJS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)

#CC=gcc
#LDLIBS=`gnome-config --libs gnomeui`
#CFLAGS=-Wall -g `gnome-config --cflags gnomeui`
#LDLIBS=`gnome-config --libs gnomeui`
#CFLAGS=-Wall -g -I /usr/include/glib-2.0
#	bash -c "echo 1"

#make 1.o
#bash -c "echo 1.c 1.c 1.o 1"
#1.c 1.c 1.o 1
#1.o: 1.c
#	bash -c "echo $< $? $@ $*"


