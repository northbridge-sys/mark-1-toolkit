<h1 align="center"> NBS Mark 1 Libraries </h1> <br>

<p align="center">
  Development libraries for the NBS Mark 1 computer in Second Life.
</p>

## Introduction

**The NBS Mark 1 is not yet available to the public; these libraries are probably useless to you.**

A set of libraries for the NBS Mark 1 computer, which runs entirely on the [Linden Scripting Language](https://wiki.secondlife.com/wiki/LSL_Portal) in [Second Life](https://secondlife.com/).

LSL is the native scripting language used to control Second Life objects. Certain third-party viewers incorporate an [LSL preprocessor](https://wiki.firestormviewer.org/fs_preprocessor) that provides C-style preprocessor macros via the built-in script editor. The NBS Mark 1 Libraries leverage the `#include` and `#define` macros, along with the built-in script optimizer, to make dozens of helper functions available to LSL scripts.

## Key Features

TBD

## Instructions

- If you haven't, enable the LSL preprocessor in your viewer and set the directory where the LSL preprocessor will check for include files.
- Create a directory called `northbridge-business-systems`/`mk1-lsl-toolkit` in your LSL preprocessor include directory.
- Unpack the repository into the `mk1-lsl-toolkit`, so that `libraries.lsl` is located in `[preprocessor directory]/northbridge-business-systems/mk1-lsl-toolkit/libraries.lsl`.
- Include the framework libraries by placing the following line at the top of your script:

```
#include "northbridge-sys/mk1-lsl-toolkit/libraries.lsl"
```

## Function Reference

TBD - moving to wiki
