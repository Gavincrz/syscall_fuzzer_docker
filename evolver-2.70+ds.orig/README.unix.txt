Instructions for installing the Surface Evolver on unix-style systems.

Quick start:
1. Unpack the Evolver archive.
2. In the src subdirectory, edit Makefile to uncomment the lines for
   your system.
3. Run "make".
4. Test by running "./evolver ../fe/cube.fe"

Detailed instructions:

1. The Evolver is distributed in a compressed tar archive evolver-2.40.tar.gz
   available from http://www.susqu.edu/brakke/evolver. Get this file into a 
   working directory.  The packed archive is about 2MB, unpacks to about 5MB.  
   You will probably need another 3 or 4 MB to compile.  

2. Uncompress the archive with
      gunzip evolver-2.40.tar.gz
   Extract the files with
      tar xvf evolver.tar 
   This will unpack into three subdirectories: src (source code),
   doc (the html version of the manual), and fe (sample datafiles).  
   The working directory will also contain a PDF version of the manual,
   and a man page, evolver.1.

3. Install the man page: copy evolver.1 to some appropriate place on your
   manpath, such as /usr/local/share/man/man1. You may have to become root 
   to have permission to do this.

4. Set the EVOLVERPATH environment variable: Evolver needs to find the initial 
   datafile and sometimes other files (e.g. command files for the "read" 
   command, the help documentation files). If the named file is not in the 
   current directory, then an  environment variable called EVOLVERPATH will be 
   consulted for a directory search list. The datafile directory and the 
   directory with the HTML documentation files should definitely be included.
   The format is the same as the usual PATH environment variable.  Set it up 
   as usual in your system, in .profile or .login or .cshrc or wherever:

   Unix C shell:
     setenv EVOLVERPATH /usr/you/evolver/fe:/usr/you/evolver/doc 
   Bourne shell:
     EVOLVERPATH=/usr/you/evolver/fe:/usr/you/evolver/doc
     export EVOLVERPATH </pre>

5. Change to the src subdirectory of your Evolver directory.

6. Modify Makefile for your system. Makefile begins with sets of macro 
   definitions for various systems.   If your system is listed, remove the 
   comment symbols '#' from start of the appropriate lines. If your system 
   is not there, use the GENERIC lines, or set up your own. If you do define 
   your own, be sure to put a corresponding section in include.h.

7. In Makefile, edit the CFLAGS line to have the proper options (optimization, 
   floating point option, etc.).

8. In Makefile, GRAPH should be the name of a screen graphics interface file.  
   Use glutgraph.o if possible; most systems have OpenGL/GLUT graphics now.  
   GLUT graphics uses a separate thread to display graphics, so if you use 
   GLUT, you must put -DPTHREADS in CFLAGS and put -lpthread in GRAPHLIB.
   If not using GLUT, for primitive X windows graphics you can use xgraph.o.  
   For no built-in screen graphics at all you can use nulgraph.o. GRAPHLIB 
   should be the appropriate graphics library plus any other libraries needed.

9. If you want to use parallel processes on a multiprocessor machine, 
   put -DPTHREADS in CFLAGS and put -lpthread in GRAPHLIB. Currently, the
   only calculations done in parallel are basic energies and named quantities.
   The number of processes actually done in parallel can be controlled
   with the -p n command line option.

10. If you want Evolver to be able to use geomview, include -DOOGL in CFLAGS.

11. If you want Evolver to operate in a higher space dimension than the
    the default maximum of 4, include -DMAXCOORD=n in CFLAGS, where n is
    the maximum space dimension. This sets the upper limit of dimensionality, 
    and is used for allocating space in data structures. 

12. If your system supports the long double data type, you can compute and
    print values in higher precision by compiling with -DLONGDOUBLE in CFLAGS. 
    But this slows computations, and should be used only by precision fanatics.

13. If you wish to use the commands based on the METIS partitioning
    software (metis, kmetis, body_metis, and metis_factor), then
    you should download the METIS package from,
      http://www-users.cs.umn.edu/~karypis/metis/
    and "make" the library libmetis.a (on some systems, make complains it
    cannot find ranlib, but the resulting libmetis.a still works).
    In Evolver's Makefile, add -DMETIS to CFLAGS, and add -lmetis to GRAPHLIB. 
    You will probably also have to add -L metispath  to GRAPHLIB to tell
    the linker where to find libmetis.a.  Note that METIS is incorporated
    in the Windows executable.  If you are using hessian commands on very 
    large surfaces, then metis_factor can be much faster than the other 
    sparse matrix factoring schemes in Evolver, and I highly recommend it.

14. From the shell command prompt in the src directory, run "make".  This
    will produce the Evolver executable file named "evolver" in the src
    directory.  If there are errors, hopefully you will only have to change 
    the system-specific parts of Makefile and include.h to get things to work.  
    If significant changes to other files are needed, let me know at
    brakke@susqu.edu.

15. Copy the evolver executable to someplace on your PATH, such as
    $HOME/bin or /usr/local/bin, or make a link someplace on your PATH to 
    the evolver executable.
 
16. Test by opening a new shell and running "evolver cube".  Now you
    should be able to follow the tutorials in the HTML or printed manual.

End of README

