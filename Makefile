# If your application is in a file named myapp.cpp or myapp.c
# this is the line you will need to build the binary.
all: main.cpp
	g++ -o pjtest main.cpp `pkg-config --cflags --libs libpjproject`  -Wno-write-strings -lstdc++ -lm -lpthread -lz -lcrypto -lssl -g -std=c++11  -lz -g
#	g++ -o pjtest main.cpp $< `pkg-config --cflags --libs libpjproject` -lbz2 -lz -lcrypto -lssl -g -std=c++11 -lc++ -lz -g
#	g++ -o pjtest main.cpp  -Wno-write-strings -DPJ_AUTOCONF=1 -O2 -DPJ_IS_BIG_ENDIAN=0 -DPJ_IS_LITTLE_ENDIAN=1 -I/usr/local/include -L/usr/local/lib -lpjsua2-x86_64-apple-darwin14.0.0 -lstdc++ -lpjsua-x86_64-apple-darwin14.0.0 -lpjsip-ua-x86_64-apple-darwin14.0.0 -lpjsip-simple-x86_64-apple-darwin14.0.0 -lpjsip-x86_64-apple-darwin14.0.0 -lpjmedia-codec-x86_64-apple-darwin14.0.0 -lpjmedia-x86_64-apple-darwin14.0.0 -lpjmedia-videodev-x86_64-apple-darwin14.0.0 -lpjmedia-audiodev-x86_64-apple-darwin14.0.0 -lpjmedia-x86_64-apple-darwin14.0.0 -lpjnath-x86_64-apple-darwin14.0.0 -lpjlib-util-x86_64-apple-darwin14.0.0 -lsrtp-x86_64-apple-darwin14.0.0 -lresample-x86_64-apple-darwin14.0.0 -lgsmcodec-x86_64-apple-darwin14.0.0 -lspeex-x86_64-apple-darwin14.0.0 -lilbccodec-x86_64-apple-darwin14.0.0 -lg7221codec-x86_64-apple-darwin14.0.0 -lportaudio-x86_64-apple-darwin14.0.0 -lpj-x86_64-apple-darwin14.0.0 -lm -lpthread -framework CoreAudio -framework CoreServices -framework AudioUnit -framework AudioToolbox -framework Foundation -framework AppKit -framework QTKit -framework QuartzCore -framework OpenGL -lSDL2 -lm -liconv -Wl,-framework,OpenGL -Wl,-framework,ForceFeedback -lobjc -Wl,-framework,Cocoa -Wl,-framework,Carbon -Wl,-framework,IOKit -Wl,-framework,CoreAudio -Wl,-framework,AudioToolbox -Wl,-framework,AudioUnit -lavformat -lavcodec -lswscale -lavutil -lx264 -lm -framework CoreFoundation -framework VideoDecodeAcceleration -framework QuartzCore -lbz2 -lz -lcrypto -lssl -g -std=c++11 -lc++ -lz -g
	
clean:
	rm -f main.o pjtest
	
