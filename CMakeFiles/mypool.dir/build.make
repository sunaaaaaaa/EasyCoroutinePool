# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lighthouse/cppSpace/myCoroutinePool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lighthouse/cppSpace/myCoroutinePool

# Include any dependencies generated for this target.
include CMakeFiles/mypool.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mypool.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mypool.dir/flags.make

CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o: CMakeFiles/mypool.dir/flags.make
CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o: src/core/coroutine_pool.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/cppSpace/myCoroutinePool/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o -c /home/lighthouse/cppSpace/myCoroutinePool/src/core/coroutine_pool.cc

CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/cppSpace/myCoroutinePool/src/core/coroutine_pool.cc > CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.i

CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/cppSpace/myCoroutinePool/src/core/coroutine_pool.cc -o CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.s

CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o.requires:

.PHONY : CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o.requires

CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o.provides: CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o.requires
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o.provides.build
.PHONY : CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o.provides

CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o.provides.build: CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o


CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o: CMakeFiles/mypool.dir/flags.make
CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o: src/coroutine/coroutine.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/cppSpace/myCoroutinePool/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o -c /home/lighthouse/cppSpace/myCoroutinePool/src/coroutine/coroutine.cc

CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/cppSpace/myCoroutinePool/src/coroutine/coroutine.cc > CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.i

CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/cppSpace/myCoroutinePool/src/coroutine/coroutine.cc -o CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.s

CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o.requires:

.PHONY : CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o.requires

CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o.provides: CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o.requires
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o.provides.build
.PHONY : CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o.provides

CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o.provides.build: CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o


CMakeFiles/mypool.dir/src/thread/Thread.cc.o: CMakeFiles/mypool.dir/flags.make
CMakeFiles/mypool.dir/src/thread/Thread.cc.o: src/thread/Thread.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lighthouse/cppSpace/myCoroutinePool/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/mypool.dir/src/thread/Thread.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mypool.dir/src/thread/Thread.cc.o -c /home/lighthouse/cppSpace/myCoroutinePool/src/thread/Thread.cc

CMakeFiles/mypool.dir/src/thread/Thread.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mypool.dir/src/thread/Thread.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lighthouse/cppSpace/myCoroutinePool/src/thread/Thread.cc > CMakeFiles/mypool.dir/src/thread/Thread.cc.i

CMakeFiles/mypool.dir/src/thread/Thread.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mypool.dir/src/thread/Thread.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lighthouse/cppSpace/myCoroutinePool/src/thread/Thread.cc -o CMakeFiles/mypool.dir/src/thread/Thread.cc.s

CMakeFiles/mypool.dir/src/thread/Thread.cc.o.requires:

.PHONY : CMakeFiles/mypool.dir/src/thread/Thread.cc.o.requires

CMakeFiles/mypool.dir/src/thread/Thread.cc.o.provides: CMakeFiles/mypool.dir/src/thread/Thread.cc.o.requires
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/thread/Thread.cc.o.provides.build
.PHONY : CMakeFiles/mypool.dir/src/thread/Thread.cc.o.provides

CMakeFiles/mypool.dir/src/thread/Thread.cc.o.provides.build: CMakeFiles/mypool.dir/src/thread/Thread.cc.o


# Object files for target mypool
mypool_OBJECTS = \
"CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o" \
"CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o" \
"CMakeFiles/mypool.dir/src/thread/Thread.cc.o"

# External object files for target mypool
mypool_EXTERNAL_OBJECTS =

lib/libmypool.so: CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o
lib/libmypool.so: CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o
lib/libmypool.so: CMakeFiles/mypool.dir/src/thread/Thread.cc.o
lib/libmypool.so: CMakeFiles/mypool.dir/build.make
lib/libmypool.so: CMakeFiles/mypool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lighthouse/cppSpace/myCoroutinePool/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library lib/libmypool.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mypool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mypool.dir/build: lib/libmypool.so

.PHONY : CMakeFiles/mypool.dir/build

CMakeFiles/mypool.dir/requires: CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o.requires
CMakeFiles/mypool.dir/requires: CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o.requires
CMakeFiles/mypool.dir/requires: CMakeFiles/mypool.dir/src/thread/Thread.cc.o.requires

.PHONY : CMakeFiles/mypool.dir/requires

CMakeFiles/mypool.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mypool.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mypool.dir/clean

CMakeFiles/mypool.dir/depend:
	cd /home/lighthouse/cppSpace/myCoroutinePool && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lighthouse/cppSpace/myCoroutinePool /home/lighthouse/cppSpace/myCoroutinePool /home/lighthouse/cppSpace/myCoroutinePool /home/lighthouse/cppSpace/myCoroutinePool /home/lighthouse/cppSpace/myCoroutinePool/CMakeFiles/mypool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mypool.dir/depend

