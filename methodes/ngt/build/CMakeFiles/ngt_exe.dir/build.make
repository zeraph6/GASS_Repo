# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/build

# Include any dependencies generated for this target.
include CMakeFiles/ngt_exe.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/ngt_exe.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ngt_exe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ngt_exe.dir/flags.make

CMakeFiles/ngt_exe.dir/ngt.o: CMakeFiles/ngt_exe.dir/flags.make
CMakeFiles/ngt_exe.dir/ngt.o: ../ngt.cpp
CMakeFiles/ngt_exe.dir/ngt.o: CMakeFiles/ngt_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ngt_exe.dir/ngt.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ngt_exe.dir/ngt.o -MF CMakeFiles/ngt_exe.dir/ngt.o.d -o CMakeFiles/ngt_exe.dir/ngt.o -c /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/ngt.cpp

CMakeFiles/ngt_exe.dir/ngt.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ngt_exe.dir/ngt.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/ngt.cpp > CMakeFiles/ngt_exe.dir/ngt.i

CMakeFiles/ngt_exe.dir/ngt.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ngt_exe.dir/ngt.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/ngt.cpp -o CMakeFiles/ngt_exe.dir/ngt.s

# Object files for target ngt_exe
ngt_exe_OBJECTS = \
"CMakeFiles/ngt_exe.dir/ngt.o"

# External object files for target ngt_exe
ngt_exe_EXTERNAL_OBJECTS =

ngt: CMakeFiles/ngt_exe.dir/ngt.o
ngt: CMakeFiles/ngt_exe.dir/build.make
ngt: CMakeFiles/ngt_exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ngt"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ngt_exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ngt_exe.dir/build: ngt
.PHONY : CMakeFiles/ngt_exe.dir/build

CMakeFiles/ngt_exe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ngt_exe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ngt_exe.dir/clean

CMakeFiles/ngt_exe.dir/depend:
	cd /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/build /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/build /home/iazizi/CLionProjects/ngt-develop/NGT/bin/ngt/build/CMakeFiles/ngt_exe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ngt_exe.dir/depend

