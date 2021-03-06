OBJECTS     = Simulation.cpp Visualization.cpp Application.cpp
CFILES      = $(OBJECTS:.o=.cpp)
EXECFILE    = smoke
INCLUDEDIRS = -I./fftw-2.1.5/include/
LIBDIRS     = -L./fftw-2.1.5/lib/
LIBS        = -lrfftw -lfftw -lglut -lGL -lGLU -lGLEW -lm
#Possible flags for release (ffast-math uses less precision for floating-point numbers, check that your application can handle this)
#CFLAGS      = -O3 -march=x86-64 -mtune=generic -DNDEBUG -mfpmath=sse -ffast-math -Wall -pipe
#Debug flags
CFLAGS      = -ggdb -Wall -pipe
LINKFLAGS   = -no-pie


.SILENT:

all: $(EXECFILE)

$(EXECFILE): $(OBJECTS)
		g++ $(CFLAGS) $(LINKFLAGS) $(OBJECTS) -o $(EXECFILE) $(LIBDIRS) $(LIBS) 
