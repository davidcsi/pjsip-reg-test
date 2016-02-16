#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-MacOSX
CND_DLIB_EXT=dylib
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include pjtest-Makefile.mk

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/main.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-Wno-write-strings -DPJ_AUTOCONF=1 -O2 -DPJ_IS_BIG_ENDIAN=0 -DPJ_IS_LITTLE_ENDIAN=1 -I/usr/local/include -L/usr/local/lib -lpjsua2-x86_64-apple-darwin14.0.0 -lstdc++ -lpjsua-x86_64-apple-darwin14.0.0 -lpjsip-ua-x86_64-apple-darwin14.0.0 -lpjsip-simple-x86_64-apple-darwin14.0.0 -lpjsip-x86_64-apple-darwin14.0.0 -lpjmedia-codec-x86_64-apple-darwin14.0.0 -lpjmedia-x86_64-apple-darwin14.0.0 -lpjmedia-videodev-x86_64-apple-darwin14.0.0 -lpjmedia-audiodev-x86_64-apple-darwin14.0.0 -lpjmedia-x86_64-apple-darwin14.0.0 -lpjnath-x86_64-apple-darwin14.0.0 -lpjlib-util-x86_64-apple-darwin14.0.0 -lsrtp-x86_64-apple-darwin14.0.0 -lresample-x86_64-apple-darwin14.0.0 -lgsmcodec-x86_64-apple-darwin14.0.0 -lspeex-x86_64-apple-darwin14.0.0 -lilbccodec-x86_64-apple-darwin14.0.0 -lg7221codec-x86_64-apple-darwin14.0.0 -lportaudio-x86_64-apple-darwin14.0.0 -lpj-x86_64-apple-darwin14.0.0 -lm -lpthread -framework CoreAudio -framework CoreServices -framework AudioUnit -framework AudioToolbox -framework Foundation -framework AppKit -framework QTKit -framework QuartzCore -framework OpenGL -lSDL2 -lm -liconv -Wl,-framework,OpenGL -Wl,-framework,ForceFeedback -lobjc -Wl,-framework,Cocoa -Wl,-framework,Carbon -Wl,-framework,IOKit -Wl,-framework,CoreAudio -Wl,-framework,AudioToolbox -Wl,-framework,AudioUnit -lavformat -lavcodec -lswscale -lavutil -lx264 -lm -framework CoreFoundation -framework VideoDecodeAcceleration -framework QuartzCore -lbz2 -lz -lcrypto -lssl -g -std=c++11 -lc++ -lz
CXXFLAGS=-Wno-write-strings -DPJ_AUTOCONF=1 -O2 -DPJ_IS_BIG_ENDIAN=0 -DPJ_IS_LITTLE_ENDIAN=1 -I/usr/local/include -L/usr/local/lib -lpjsua2-x86_64-apple-darwin14.0.0 -lstdc++ -lpjsua-x86_64-apple-darwin14.0.0 -lpjsip-ua-x86_64-apple-darwin14.0.0 -lpjsip-simple-x86_64-apple-darwin14.0.0 -lpjsip-x86_64-apple-darwin14.0.0 -lpjmedia-codec-x86_64-apple-darwin14.0.0 -lpjmedia-x86_64-apple-darwin14.0.0 -lpjmedia-videodev-x86_64-apple-darwin14.0.0 -lpjmedia-audiodev-x86_64-apple-darwin14.0.0 -lpjmedia-x86_64-apple-darwin14.0.0 -lpjnath-x86_64-apple-darwin14.0.0 -lpjlib-util-x86_64-apple-darwin14.0.0 -lsrtp-x86_64-apple-darwin14.0.0 -lresample-x86_64-apple-darwin14.0.0 -lgsmcodec-x86_64-apple-darwin14.0.0 -lspeex-x86_64-apple-darwin14.0.0 -lilbccodec-x86_64-apple-darwin14.0.0 -lg7221codec-x86_64-apple-darwin14.0.0 -lportaudio-x86_64-apple-darwin14.0.0 -lpj-x86_64-apple-darwin14.0.0 -lm -lpthread -framework CoreAudio -framework CoreServices -framework AudioUnit -framework AudioToolbox -framework Foundation -framework AppKit -framework QTKit -framework QuartzCore -framework OpenGL -lSDL2 -lm -liconv -Wl,-framework,OpenGL -Wl,-framework,ForceFeedback -lobjc -Wl,-framework,Cocoa -Wl,-framework,Carbon -Wl,-framework,IOKit -Wl,-framework,CoreAudio -Wl,-framework,AudioToolbox -Wl,-framework,AudioUnit -lavformat -lavcodec -lswscale -lavutil -lx264 -lm -framework CoreFoundation -framework VideoDecodeAcceleration -framework QuartzCore -lbz2 -lz -lcrypto -lssl -g -std=c++11 -lc++ -lz

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/pjtest

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/pjtest: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/pjtest ${OBJECTFILES} ${LDLIBSOPTIONS} -stdlib=libstdc++

${OBJECTDIR}/main.o: nbproject/Makefile-${CND_CONF}.mk main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/pjtest

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
