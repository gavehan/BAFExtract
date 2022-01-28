all: BAFExtract 

ifdef $(GXX)
	gxx = ${GXX}
else
	gxx = g++
endif
comp_flags = -c -Wall -O3
exec_name = BAFExtract

# Define pattern rule for building object files.
%.o: %.cpp
	${gxx} ${comp_flags} $< -o $@

objs = src/main.o \
src/utils.o \
src/ansi_string.o \
src/genomics_coords.o \

BAFExtract: ${objs}
	${gxx} -O3 ${objs} -o bin/${exec_name}

clean:
	rm -f *.o ${objs} bin/${exec_name} 
