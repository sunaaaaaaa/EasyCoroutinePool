# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/lighthouse/cppSpace/myCoroutinePool/CMakeFiles /home/lighthouse/cppSpace/myCoroutinePool/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/lighthouse/cppSpace/myCoroutinePool/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named mypool

# Build rule for target.
mypool: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 mypool
.PHONY : mypool

# fast build rule for target.
mypool/fast:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/build
.PHONY : mypool/fast

#=============================================================================
# Target rules for targets named test

# Build rule for target.
test: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 test
.PHONY : test

# fast build rule for target.
test/fast:
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/build
.PHONY : test/fast

src/core/coroutine_pool.o: src/core/coroutine_pool.cc.o

.PHONY : src/core/coroutine_pool.o

# target to build an object file
src/core/coroutine_pool.cc.o:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.o
.PHONY : src/core/coroutine_pool.cc.o

src/core/coroutine_pool.i: src/core/coroutine_pool.cc.i

.PHONY : src/core/coroutine_pool.i

# target to preprocess a source file
src/core/coroutine_pool.cc.i:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.i
.PHONY : src/core/coroutine_pool.cc.i

src/core/coroutine_pool.s: src/core/coroutine_pool.cc.s

.PHONY : src/core/coroutine_pool.s

# target to generate assembly for a file
src/core/coroutine_pool.cc.s:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/core/coroutine_pool.cc.s
.PHONY : src/core/coroutine_pool.cc.s

src/coroutine/coroutine.o: src/coroutine/coroutine.cc.o

.PHONY : src/coroutine/coroutine.o

# target to build an object file
src/coroutine/coroutine.cc.o:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.o
.PHONY : src/coroutine/coroutine.cc.o

src/coroutine/coroutine.i: src/coroutine/coroutine.cc.i

.PHONY : src/coroutine/coroutine.i

# target to preprocess a source file
src/coroutine/coroutine.cc.i:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.i
.PHONY : src/coroutine/coroutine.cc.i

src/coroutine/coroutine.s: src/coroutine/coroutine.cc.s

.PHONY : src/coroutine/coroutine.s

# target to generate assembly for a file
src/coroutine/coroutine.cc.s:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/coroutine/coroutine.cc.s
.PHONY : src/coroutine/coroutine.cc.s

src/thread/Thread.o: src/thread/Thread.cc.o

.PHONY : src/thread/Thread.o

# target to build an object file
src/thread/Thread.cc.o:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/thread/Thread.cc.o
.PHONY : src/thread/Thread.cc.o

src/thread/Thread.i: src/thread/Thread.cc.i

.PHONY : src/thread/Thread.i

# target to preprocess a source file
src/thread/Thread.cc.i:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/thread/Thread.cc.i
.PHONY : src/thread/Thread.cc.i

src/thread/Thread.s: src/thread/Thread.cc.s

.PHONY : src/thread/Thread.s

# target to generate assembly for a file
src/thread/Thread.cc.s:
	$(MAKE) -f CMakeFiles/mypool.dir/build.make CMakeFiles/mypool.dir/src/thread/Thread.cc.s
.PHONY : src/thread/Thread.cc.s

tests/test.o: tests/test.cc.o

.PHONY : tests/test.o

# target to build an object file
tests/test.cc.o:
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/tests/test.cc.o
.PHONY : tests/test.cc.o

tests/test.i: tests/test.cc.i

.PHONY : tests/test.i

# target to preprocess a source file
tests/test.cc.i:
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/tests/test.cc.i
.PHONY : tests/test.cc.i

tests/test.s: tests/test.cc.s

.PHONY : tests/test.s

# target to generate assembly for a file
tests/test.cc.s:
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/tests/test.cc.s
.PHONY : tests/test.cc.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... edit_cache"
	@echo "... mypool"
	@echo "... test"
	@echo "... src/core/coroutine_pool.o"
	@echo "... src/core/coroutine_pool.i"
	@echo "... src/core/coroutine_pool.s"
	@echo "... src/coroutine/coroutine.o"
	@echo "... src/coroutine/coroutine.i"
	@echo "... src/coroutine/coroutine.s"
	@echo "... src/thread/Thread.o"
	@echo "... src/thread/Thread.i"
	@echo "... src/thread/Thread.s"
	@echo "... tests/test.o"
	@echo "... tests/test.i"
	@echo "... tests/test.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

