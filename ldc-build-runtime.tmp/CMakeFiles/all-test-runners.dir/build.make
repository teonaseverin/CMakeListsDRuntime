# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_SOURCE_DIR = /home/tock/runtime_thumb/ldc-build-runtime.tmp/ldc-src/runtime

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tock/runtime_thumb/ldc-build-runtime.tmp

# Utility rule file for all-test-runners.

# Include the progress variables for this target.
include CMakeFiles/all-test-runners.dir/progress.make

CMakeFiles/all-test-runners: druntime-test-runner
CMakeFiles/all-test-runners: phobos2-test-runner
CMakeFiles/all-test-runners: druntime-test-runner-debug
CMakeFiles/all-test-runners: phobos2-test-runner-debug


all-test-runners: CMakeFiles/all-test-runners
all-test-runners: CMakeFiles/all-test-runners.dir/build.make

.PHONY : all-test-runners

# Rule to build all files generated by this target.
CMakeFiles/all-test-runners.dir/build: all-test-runners

.PHONY : CMakeFiles/all-test-runners.dir/build

CMakeFiles/all-test-runners.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/all-test-runners.dir/cmake_clean.cmake
.PHONY : CMakeFiles/all-test-runners.dir/clean

CMakeFiles/all-test-runners.dir/depend:
	cd /home/tock/runtime_thumb/ldc-build-runtime.tmp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tock/runtime_thumb/ldc-build-runtime.tmp/ldc-src/runtime /home/tock/runtime_thumb/ldc-build-runtime.tmp/ldc-src/runtime /home/tock/runtime_thumb/ldc-build-runtime.tmp /home/tock/runtime_thumb/ldc-build-runtime.tmp /home/tock/runtime_thumb/ldc-build-runtime.tmp/CMakeFiles/all-test-runners.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/all-test-runners.dir/depend
