Graphene
==============================================================================
A set of programs (both hosted and baremetal) for a robot orchestra, playing
orchestral scores via multiple independent instruments controlled by a central
conductor.

Written in C11, building under Linux.

Documentation
------------------------------------------------------------------------------
Documentation for individual instruments, the common library, and the
conductor application can be found under the `docs/` directory.

Building
------------------------------------------------------------------------------
This project uses both the host system compiler (for compiling the conductor
program), and a custom build of the LLVM project's clang (for compiling the
baremetal instrument programs). To get the custom build of clang, please run
the `setup.sh` script. Note that building the LLVM suite has its own set of
system requirements: https://llvm.org/docs/GettingStarted.html#requirements

This project is written using C11, so a standards-conforming C11 compiler is
required. Additionally, the build system is written in POSIX-conforming bourne
shell script, with a wrapper Makefile for convenience. The GNU coreutils (or a
compatible set) are expected.

To make changes to the toolchain in use, please see the `toolchain-*.sh`
files.

Contributing
------------------------------------------------------------------------------
Instructions to read through before contributing can be found in the
`CONTRIBUTING.txt` file.

License
------------------------------------------------------------------------------
For details on the license this project is released under, please read the
`LICENSE.txt` file. When using this project in source or binary form, please
include a copy of said license in the root of your own project directory (e.g.
named `LICENSE-graphene.txt` or similar).
