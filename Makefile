CXX=g++
CXXFLAGS=-pthread -DNDEBUG -DHAVE_CONFIG_H -DHLCSG -DSTDC_HEADERS -D_CONSOLE -DSYSTEM -DSYSTEM_POSIX -DHAVE_ASM_ATOMIC_H -DHAVE_ATOMIC -DHAVE_FCNTL_H -DHAVE_PTHREAD_H -DHAVE_STDDEF_H -DHAVE_SYS_ATOMIC_H -DHAVE_SYS_RESOURCE_H -DHAVE_SYS_STAT_H -DHAVE_SYS_TIME_H -DHAVE_UNISTD_E -DHAVE_UNISTD_H -pthread
INCLUDES=-Icommon -Itemplate
LIBPATH=-Lcommon
LIBRARIES_DIR=common/
HLCSG_DIR=hlcsg/
HLBSP_DIR=hlbsp/
HLVIS_DIR=hlvis/
HLRAD_DIR=hlrad/
BINARIES_DIR=bin/
GLOBAL_BINARIES_DIR = /usr/bin/

all: hlcsg_ hlbsp_ hlvis_ hlrad_

hlcsg_:
	mkdir -p $(BINARIES_DIR)
	$(CXX) $(INCLUDES) $(CXXFLAGS) \
	-o $(BINARIES_DIR)hlcsg -DDOUBLEVEC_T \
	$(LIBRARIES_DIR)blockmem.cpp \
	$(LIBRARIES_DIR)bspfile.cpp \
	$(LIBRARIES_DIR)cmdlib.cpp \
	$(LIBRARIES_DIR)filelib.cpp \
	$(LIBRARIES_DIR)log.cpp \
	$(LIBRARIES_DIR)mathlib.cpp \
	$(LIBRARIES_DIR)messages.cpp \
	$(LIBRARIES_DIR)resourcelock.cpp \
	$(LIBRARIES_DIR)scriplib.cpp \
	$(LIBRARIES_DIR)threads.cpp \
	$(LIBRARIES_DIR)winding.cpp \
	$(HLCSG_DIR)autowad.cpp \
	$(HLCSG_DIR)brush.cpp \
	$(HLCSG_DIR)brushunion.cpp \
	$(HLCSG_DIR)hullfile.cpp \
	$(HLCSG_DIR)map.cpp \
	$(HLCSG_DIR)properties.cpp \
	$(HLCSG_DIR)qcsg.cpp \
	$(HLCSG_DIR)textures.cpp \
	$(HLCSG_DIR)wadcfg.cpp \
	$(HLCSG_DIR)wadinclude.cpp \
	$(HLCSG_DIR)wadpath.cpp

hlbsp_:
	mkdir -p $(BINARIES_DIR)
	$(CXX) $(INCLUDES) $(CXXFLAGS) \
	-o $(BINARIES_DIR)hlbsp -DDOUBLEVEC_T \
	$(LIBRARIES_DIR)blockmem.cpp \
	$(LIBRARIES_DIR)bspfile.cpp \
	$(LIBRARIES_DIR)cmdlib.cpp \
	$(LIBRARIES_DIR)filelib.cpp \
	$(LIBRARIES_DIR)log.cpp \
	$(LIBRARIES_DIR)mathlib.cpp \
	$(LIBRARIES_DIR)messages.cpp \
	$(LIBRARIES_DIR)resourcelock.cpp \
	$(LIBRARIES_DIR)scriplib.cpp \
	$(LIBRARIES_DIR)threads.cpp \
	$(LIBRARIES_DIR)winding.cpp \
	$(HLBSP_DIR)merge.cpp \
	$(HLBSP_DIR)outside.cpp \
	$(HLBSP_DIR)portals.cpp \
	$(HLBSP_DIR)qbsp.cpp \
	$(HLBSP_DIR)solidbsp.cpp \
	$(HLBSP_DIR)surfaces.cpp \
	$(HLBSP_DIR)tjunc.cpp \
	$(HLBSP_DIR)writebsp.cpp

hlvis_:
	mkdir -p $(BINARIES_DIR)
	$(CXX) $(INCLUDES) $(CXXFLAGS) \
	-o $(BINARIES_DIR)hlvis -DDOUBLEVEC_T \
	$(LIBRARIES_DIR)blockmem.cpp \
	$(LIBRARIES_DIR)bspfile.cpp \
	$(LIBRARIES_DIR)cmdlib.cpp \
	$(LIBRARIES_DIR)filelib.cpp \
	$(LIBRARIES_DIR)log.cpp \
	$(LIBRARIES_DIR)mathlib.cpp \
	$(LIBRARIES_DIR)messages.cpp \
	$(LIBRARIES_DIR)resourcelock.cpp \
	$(LIBRARIES_DIR)scriplib.cpp \
	$(LIBRARIES_DIR)threads.cpp \
	$(LIBRARIES_DIR)winding.cpp \
	$(HLVIS_DIR)flow.cpp \
	$(HLVIS_DIR)vis.cpp \
	$(HLVIS_DIR)zones.cpp

hlrad_:
	mkdir -p $(BINARIES_DIR)
	$(CXX) $(INCLUDES) $(CXXFLAGS) \
	-o $(BINARIES_DIR)hlrad \
	$(LIBRARIES_DIR)blockmem.cpp \
	$(LIBRARIES_DIR)bspfile.cpp \
	$(LIBRARIES_DIR)cmdlib.cpp \
	$(LIBRARIES_DIR)filelib.cpp \
	$(LIBRARIES_DIR)log.cpp \
	$(LIBRARIES_DIR)mathlib.cpp \
	$(LIBRARIES_DIR)messages.cpp \
	$(LIBRARIES_DIR)resourcelock.cpp \
	$(LIBRARIES_DIR)scriplib.cpp \
	$(LIBRARIES_DIR)threads.cpp \
	$(LIBRARIES_DIR)winding.cpp \
	$(HLRAD_DIR)lerp.cpp \
	$(HLRAD_DIR)lightmap.cpp \
	$(HLRAD_DIR)mathutil.cpp \
	$(HLRAD_DIR)nomatrix.cpp \
	$(HLRAD_DIR)qrad.cpp \
	$(HLRAD_DIR)qradutil.cpp \
	$(HLRAD_DIR)sparse.cpp \
	$(HLRAD_DIR)trace.cpp \
	$(HLRAD_DIR)transfers.cpp \
	$(HLRAD_DIR)transparency.cpp \
	$(HLRAD_DIR)vismatrix.cpp \
	$(HLRAD_DIR)vismatrixutil.cpp

clean:
	@rm -fRv $(BINARIES_DIR)

install:
	cp $(BINARIES_DIR)* $(GLOBAL_BINARIES_DIR)

release:
	@cd $(BINARIES_DIR);\
	tar cjvf zhlt.tar.bz2 hlcsg hlbsp hlvis hlrad
