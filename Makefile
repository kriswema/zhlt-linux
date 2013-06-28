CXX=g++
CXXFLAGS=-pthread -DNDEBUG -DHAVE_CONFIG_H -DHLCSG -DSTDC_HEADERS -D_CONSOLE -DSYSTEM -DSYSTEM_POSIX -DHAVE_ASM_ATOMIC_H -DHAVE_ATOMIC -DHAVE_FCNTL_H -DHAVE_PTHREAD_H -DHAVE_STDDEF_H -DHAVE_SYS_ATOMIC_H -DHAVE_SYS_RESOURCE_H -DHAVE_SYS_STAT_H -DHAVE_SYS_TIME_H -DHAVE_UNISTD_E -DHAVE_UNISTD_H -pthread
INCLUDES=-Icommon -Itemplate
LIBPATH=-Lcommon
LIBRARIES_DIR=common/
BINARIES_DIR=bin/
GLOBAL_BINARIES_DIR = /usr/bin/

all: hlcsg_ hlbsp_ hlvis_ hlrad_

hlcsg_:
	mkdir -p $(BINARIES_DIR)
	$(CXX) $(INCLUDES) $(CXXFLAGS) -o $(BINARIES_DIR)hlcsg -DDOUBLEVEC_T $(LIBRARIES_DIR)blockmem.cpp $(LIBRARIES_DIR)bspfile.cpp $(LIBRARIES_DIR)cmdlib.cpp $(LIBRARIES_DIR)filelib.cpp $(LIBRARIES_DIR)files.cpp $(LIBRARIES_DIR)log.cpp $(LIBRARIES_DIR)mathlib.cpp $(LIBRARIES_DIR)messages.cpp $(LIBRARIES_DIR)resourcelock.cpp $(LIBRARIES_DIR)scriplib.cpp $(LIBRARIES_DIR)threads.cpp $(LIBRARIES_DIR)winding.cpp hlcsg/autowad.cpp hlcsg/brush.cpp hlcsg/brushunion.cpp hlcsg/hullfile.cpp hlcsg/map.cpp hlcsg/netvis_in_vis.cpp hlcsg/properties.cpp hlcsg/qcsg.cpp hlcsg/textures.cpp hlcsg/wadcfg.cpp hlcsg/wadinclude.cpp hlcsg/wadpath.cpp

hlbsp_:
	mkdir -p $(BINARIES_DIR)
	$(CXX) $(INCLUDES) $(CXXFLAGS) -o $(BINARIES_DIR)hlbsp -DDOUBLEVEC_T $(LIBRARIES_DIR)blockmem.cpp $(LIBRARIES_DIR)bspfile.cpp $(LIBRARIES_DIR)cmdlib.cpp $(LIBRARIES_DIR)filelib.cpp $(LIBRARIES_DIR)files.cpp $(LIBRARIES_DIR)log.cpp $(LIBRARIES_DIR)mathlib.cpp $(LIBRARIES_DIR)messages.cpp $(LIBRARIES_DIR)resourcelock.cpp $(LIBRARIES_DIR)scriplib.cpp $(LIBRARIES_DIR)threads.cpp $(LIBRARIES_DIR)winding.cpp hlbsp/merge.cpp hlbsp/outside.cpp hlbsp/portals.cpp hlbsp/qbsp.cpp hlbsp/solidbsp.cpp hlbsp/surfaces.cpp hlbsp/tjunc.cpp hlbsp/writebsp.cpp

hlvis_:
	mkdir -p $(BINARIES_DIR)
	$(CXX) $(INCLUDES) $(CXXFLAGS) -o $(BINARIES_DIR)hlvis -DDOUBLEVEC_T $(LIBRARIES_DIR)blockmem.cpp $(LIBRARIES_DIR)bspfile.cpp $(LIBRARIES_DIR)cmdlib.cpp $(LIBRARIES_DIR)filelib.cpp $(LIBRARIES_DIR)files.cpp $(LIBRARIES_DIR)log.cpp $(LIBRARIES_DIR)mathlib.cpp $(LIBRARIES_DIR)messages.cpp $(LIBRARIES_DIR)resourcelock.cpp $(LIBRARIES_DIR)scriplib.cpp $(LIBRARIES_DIR)threads.cpp $(LIBRARIES_DIR)winding.cpp hlvis/flow.cpp hlvis/vis.cpp hlvis/zones.cpp

hlrad_:
	mkdir -p $(BINARIES_DIR)
	$(CXX) $(INCLUDES) $(CXXFLAGS) -o $(BINARIES_DIR)hlrad $(LIBRARIES_DIR)blockmem.cpp $(LIBRARIES_DIR)bspfile.cpp $(LIBRARIES_DIR)cmdlib.cpp $(LIBRARIES_DIR)filelib.cpp $(LIBRARIES_DIR)files.cpp $(LIBRARIES_DIR)log.cpp $(LIBRARIES_DIR)mathlib.cpp $(LIBRARIES_DIR)messages.cpp $(LIBRARIES_DIR)resourcelock.cpp $(LIBRARIES_DIR)scriplib.cpp $(LIBRARIES_DIR)threads.cpp $(LIBRARIES_DIR)winding.cpp hlrad/lerp.cpp hlrad/lightmap.cpp hlrad/mathutil.cpp hlrad/nomatrix.cpp hlrad/qrad.cpp hlrad/qradutil.cpp hlrad/sparse.cpp hlrad/trace.cpp hlrad/transfers.cpp hlrad/transparency.cpp hlrad/vismatrix.cpp hlrad/vismatrixutil.cpp

clean:
	rm -rf build

install:
	cp $(BINARIES_DIR)* $(GLOBAL_BINARIES_DIR)

release:
	@cd $(BINARIES_DIR);\
	tar cjvf zhlt.tar.bz2 hlcsg hlbsp hlvis hlrad
