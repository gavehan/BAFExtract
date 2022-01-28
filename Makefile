all: BAFExtract 

ifeq ($(strip $(GXX)),)
	_gxx = ${GXX}
else
	_gxx = g++
endif
comp_flags =-c -Wall -O3
exec_name = BAFExtract

# Define pattern rule for building object files.
%.o: %.cpp
	${_gxx} ${comp_flags} $< -o $@

objs = src/main.o \
src/utils.o \
src/ansi_string.o \
src/genomics_coords.o \

BAFExtract: ${objs}
	${_gxx} -O3 ${objs} -o bin/${exec_name}

clean:
	rm -f *.o ${objs} bin/${exec_name} 
