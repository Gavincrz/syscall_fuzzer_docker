# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

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
CMAKE_COMMAND = /home/gavin/clion-2018.2.4/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/gavin/clion-2018.2.4/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gavin/zlib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gavin/zlib/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/zlib.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/zlib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/zlib.dir/flags.make

CMakeFiles/zlib.dir/adler32.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/adler32.o: ../adler32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/zlib.dir/adler32.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/adler32.o   -c /home/gavin/zlib/adler32.c

CMakeFiles/zlib.dir/adler32.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/adler32.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/adler32.c > CMakeFiles/zlib.dir/adler32.i

CMakeFiles/zlib.dir/adler32.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/adler32.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/adler32.c -o CMakeFiles/zlib.dir/adler32.s

CMakeFiles/zlib.dir/compress.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/compress.o: ../compress.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/zlib.dir/compress.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/compress.o   -c /home/gavin/zlib/compress.c

CMakeFiles/zlib.dir/compress.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/compress.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/compress.c > CMakeFiles/zlib.dir/compress.i

CMakeFiles/zlib.dir/compress.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/compress.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/compress.c -o CMakeFiles/zlib.dir/compress.s

CMakeFiles/zlib.dir/crc32.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/crc32.o: ../crc32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/zlib.dir/crc32.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/crc32.o   -c /home/gavin/zlib/crc32.c

CMakeFiles/zlib.dir/crc32.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/crc32.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/crc32.c > CMakeFiles/zlib.dir/crc32.i

CMakeFiles/zlib.dir/crc32.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/crc32.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/crc32.c -o CMakeFiles/zlib.dir/crc32.s

CMakeFiles/zlib.dir/deflate.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/deflate.o: ../deflate.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/zlib.dir/deflate.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/deflate.o   -c /home/gavin/zlib/deflate.c

CMakeFiles/zlib.dir/deflate.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/deflate.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/deflate.c > CMakeFiles/zlib.dir/deflate.i

CMakeFiles/zlib.dir/deflate.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/deflate.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/deflate.c -o CMakeFiles/zlib.dir/deflate.s

CMakeFiles/zlib.dir/gzclose.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/gzclose.o: ../gzclose.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/zlib.dir/gzclose.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/gzclose.o   -c /home/gavin/zlib/gzclose.c

CMakeFiles/zlib.dir/gzclose.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/gzclose.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/gzclose.c > CMakeFiles/zlib.dir/gzclose.i

CMakeFiles/zlib.dir/gzclose.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/gzclose.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/gzclose.c -o CMakeFiles/zlib.dir/gzclose.s

CMakeFiles/zlib.dir/gzlib.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/gzlib.o: ../gzlib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/zlib.dir/gzlib.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/gzlib.o   -c /home/gavin/zlib/gzlib.c

CMakeFiles/zlib.dir/gzlib.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/gzlib.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/gzlib.c > CMakeFiles/zlib.dir/gzlib.i

CMakeFiles/zlib.dir/gzlib.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/gzlib.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/gzlib.c -o CMakeFiles/zlib.dir/gzlib.s

CMakeFiles/zlib.dir/gzread.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/gzread.o: ../gzread.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/zlib.dir/gzread.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/gzread.o   -c /home/gavin/zlib/gzread.c

CMakeFiles/zlib.dir/gzread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/gzread.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/gzread.c > CMakeFiles/zlib.dir/gzread.i

CMakeFiles/zlib.dir/gzread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/gzread.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/gzread.c -o CMakeFiles/zlib.dir/gzread.s

CMakeFiles/zlib.dir/gzwrite.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/gzwrite.o: ../gzwrite.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/zlib.dir/gzwrite.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/gzwrite.o   -c /home/gavin/zlib/gzwrite.c

CMakeFiles/zlib.dir/gzwrite.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/gzwrite.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/gzwrite.c > CMakeFiles/zlib.dir/gzwrite.i

CMakeFiles/zlib.dir/gzwrite.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/gzwrite.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/gzwrite.c -o CMakeFiles/zlib.dir/gzwrite.s

CMakeFiles/zlib.dir/inflate.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/inflate.o: ../inflate.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/zlib.dir/inflate.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/inflate.o   -c /home/gavin/zlib/inflate.c

CMakeFiles/zlib.dir/inflate.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/inflate.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/inflate.c > CMakeFiles/zlib.dir/inflate.i

CMakeFiles/zlib.dir/inflate.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/inflate.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/inflate.c -o CMakeFiles/zlib.dir/inflate.s

CMakeFiles/zlib.dir/infback.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/infback.o: ../infback.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/zlib.dir/infback.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/infback.o   -c /home/gavin/zlib/infback.c

CMakeFiles/zlib.dir/infback.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/infback.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/infback.c > CMakeFiles/zlib.dir/infback.i

CMakeFiles/zlib.dir/infback.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/infback.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/infback.c -o CMakeFiles/zlib.dir/infback.s

CMakeFiles/zlib.dir/inftrees.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/inftrees.o: ../inftrees.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/zlib.dir/inftrees.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/inftrees.o   -c /home/gavin/zlib/inftrees.c

CMakeFiles/zlib.dir/inftrees.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/inftrees.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/inftrees.c > CMakeFiles/zlib.dir/inftrees.i

CMakeFiles/zlib.dir/inftrees.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/inftrees.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/inftrees.c -o CMakeFiles/zlib.dir/inftrees.s

CMakeFiles/zlib.dir/inffast.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/inffast.o: ../inffast.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/zlib.dir/inffast.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/inffast.o   -c /home/gavin/zlib/inffast.c

CMakeFiles/zlib.dir/inffast.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/inffast.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/inffast.c > CMakeFiles/zlib.dir/inffast.i

CMakeFiles/zlib.dir/inffast.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/inffast.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/inffast.c -o CMakeFiles/zlib.dir/inffast.s

CMakeFiles/zlib.dir/trees.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/trees.o: ../trees.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/zlib.dir/trees.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/trees.o   -c /home/gavin/zlib/trees.c

CMakeFiles/zlib.dir/trees.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/trees.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/trees.c > CMakeFiles/zlib.dir/trees.i

CMakeFiles/zlib.dir/trees.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/trees.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/trees.c -o CMakeFiles/zlib.dir/trees.s

CMakeFiles/zlib.dir/uncompr.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/uncompr.o: ../uncompr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/zlib.dir/uncompr.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/uncompr.o   -c /home/gavin/zlib/uncompr.c

CMakeFiles/zlib.dir/uncompr.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/uncompr.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/uncompr.c > CMakeFiles/zlib.dir/uncompr.i

CMakeFiles/zlib.dir/uncompr.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/uncompr.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/uncompr.c -o CMakeFiles/zlib.dir/uncompr.s

CMakeFiles/zlib.dir/zutil.o: CMakeFiles/zlib.dir/flags.make
CMakeFiles/zlib.dir/zutil.o: ../zutil.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/zlib.dir/zutil.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlib.dir/zutil.o   -c /home/gavin/zlib/zutil.c

CMakeFiles/zlib.dir/zutil.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlib.dir/zutil.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gavin/zlib/zutil.c > CMakeFiles/zlib.dir/zutil.i

CMakeFiles/zlib.dir/zutil.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlib.dir/zutil.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gavin/zlib/zutil.c -o CMakeFiles/zlib.dir/zutil.s

# Object files for target zlib
zlib_OBJECTS = \
"CMakeFiles/zlib.dir/adler32.o" \
"CMakeFiles/zlib.dir/compress.o" \
"CMakeFiles/zlib.dir/crc32.o" \
"CMakeFiles/zlib.dir/deflate.o" \
"CMakeFiles/zlib.dir/gzclose.o" \
"CMakeFiles/zlib.dir/gzlib.o" \
"CMakeFiles/zlib.dir/gzread.o" \
"CMakeFiles/zlib.dir/gzwrite.o" \
"CMakeFiles/zlib.dir/inflate.o" \
"CMakeFiles/zlib.dir/infback.o" \
"CMakeFiles/zlib.dir/inftrees.o" \
"CMakeFiles/zlib.dir/inffast.o" \
"CMakeFiles/zlib.dir/trees.o" \
"CMakeFiles/zlib.dir/uncompr.o" \
"CMakeFiles/zlib.dir/zutil.o"

# External object files for target zlib
zlib_EXTERNAL_OBJECTS =

libz.so.1.2.11: CMakeFiles/zlib.dir/adler32.o
libz.so.1.2.11: CMakeFiles/zlib.dir/compress.o
libz.so.1.2.11: CMakeFiles/zlib.dir/crc32.o
libz.so.1.2.11: CMakeFiles/zlib.dir/deflate.o
libz.so.1.2.11: CMakeFiles/zlib.dir/gzclose.o
libz.so.1.2.11: CMakeFiles/zlib.dir/gzlib.o
libz.so.1.2.11: CMakeFiles/zlib.dir/gzread.o
libz.so.1.2.11: CMakeFiles/zlib.dir/gzwrite.o
libz.so.1.2.11: CMakeFiles/zlib.dir/inflate.o
libz.so.1.2.11: CMakeFiles/zlib.dir/infback.o
libz.so.1.2.11: CMakeFiles/zlib.dir/inftrees.o
libz.so.1.2.11: CMakeFiles/zlib.dir/inffast.o
libz.so.1.2.11: CMakeFiles/zlib.dir/trees.o
libz.so.1.2.11: CMakeFiles/zlib.dir/uncompr.o
libz.so.1.2.11: CMakeFiles/zlib.dir/zutil.o
libz.so.1.2.11: CMakeFiles/zlib.dir/build.make
libz.so.1.2.11: CMakeFiles/zlib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gavin/zlib/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking C shared library libz.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zlib.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library libz.so.1.2.11 libz.so.1 libz.so

libz.so.1: libz.so.1.2.11
	@$(CMAKE_COMMAND) -E touch_nocreate libz.so.1

libz.so: libz.so.1.2.11
	@$(CMAKE_COMMAND) -E touch_nocreate libz.so

# Rule to build all files generated by this target.
CMakeFiles/zlib.dir/build: libz.so

.PHONY : CMakeFiles/zlib.dir/build

CMakeFiles/zlib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/zlib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/zlib.dir/clean

CMakeFiles/zlib.dir/depend:
	cd /home/gavin/zlib/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gavin/zlib /home/gavin/zlib /home/gavin/zlib/cmake-build-debug /home/gavin/zlib/cmake-build-debug /home/gavin/zlib/cmake-build-debug/CMakeFiles/zlib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/zlib.dir/depend

