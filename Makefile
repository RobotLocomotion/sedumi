# Default pod makefile distributed with pods version: 12.11.14

SEDUMI_DIR=SeDuMi_1_3

default_target: all

# Default to a less-verbose build.  If you want all the gory compiler output,
# run "make VERBOSE=1"
$(VERBOSE).SILENT:

# Figure out where to build the software.
#   Use BUILD_PREFIX if it was passed in.
#   If not, search up to four parent directories for a 'build' directory.
#   Otherwise, use ./build.
ifeq "$(BUILD_PREFIX)" ""
BUILD_PREFIX:=$(shell for pfx in ./ .. ../.. ../../.. ../../../..; do d=`pwd`/$$pfx/build;\
               if [ -d $$d ]; then echo $$d; exit 0; fi; done; echo `pwd`/build)
endif
# create the build directory if needed, and normalize its path name
BUILD_PREFIX:=$(shell mkdir -p $(BUILD_PREFIX) && cd $(BUILD_PREFIX) && echo `pwd`)

# Default to a release build.  If you want to enable debugging flags, run
# "make BUILD_TYPE=Debug"
ifeq "$(BUILD_TYPE)" ""
BUILD_TYPE="Release"
endif

ifeq ($(wildcard .mexext),)
	DUMMY:=$(shell matlab -nodesktop -nosplash -r "ptr=fopen('.mexext','w'); fprintf(ptr,'%s',mexext); fclose(ptr); exit")
endif
MEXEXT := $(shell cat .mexext)


all: $(SEDUMI_DIR)/bwblkslv.$(MEXEXT) $(BUILD_PREFIX)/matlab/addpath_sedumi.m $(BUILD_PREFIX)/matlab/rmpath_sedumi.m

configure:

$(SEDUMI_DIR)/bwblkslv.$(MEXEXT) :
	cd $(SEDUMI_DIR) && matlab -wait -nosplash -nodesktop -nodisplay -r "install_sedumi; exit"

$(BUILD_PREFIX)/matlab/addpath_sedumi.m : 
#	$(MAKE) configure
	@mkdir -p $(BUILD_PREFIX)/matlab
	echo "function addpath_sedumi()\n\naddpath(fullfile('$(shell pwd)','$(SEDUMI_DIR)'));\naddpath(fullfile('$(shell pwd)','$(SEDUMI_DIR)','conversion'));\n" > $(BUILD_PREFIX)/matlab/addpath_sedumi.m

$(BUILD_PREFIX)/matlab/rmpath_sedumi.m : 
	@mkdir -p $(BUILD_PREFIX)/matlab
	echo "function rmpath_sedumi()\n\nrmpath(fullfile('$(shell pwd)','$(SEDUMI_DIR)'));\nrmpath(fullfile('$(shell pwd)','$(SEDUMI_DIR)','conversion'));\n" > $(BUILD_PREFIX)/matlab/rmpath_sedumi.m

clean:
#	$(MAKE) -C $(SEDUMI_DIR) clean
	-rm $(BUILD_PREFIX)/matlab/*path_sedumi.m
