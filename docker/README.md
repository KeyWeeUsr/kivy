Docker files + building scripts forked from PyPA's manylinux repository from
commit 1590dc168684e8da83c01734724443a698c641bd (MIT license).

    https://github.com/pypa/manylinux/tree/1590dc168684e8da83c01734724443a698c641bd/docker

**Changes:**

* docker/build_scripts/build.sh
    * switched to EPEL for CentOS 7
    * removed "devtools-2" for LLVM

* docker/build_scripts/manylinux1-check.py
    * is_manylinux_compatible() return value changed to

            return have_compatible_glibc(2, 12)

* docker/Dockerfile-i686
    * switched to "FROM centos:7" and changed file/image maintainer

* docker/Dockerfile-x86_64
    * switched to "FROM centos:7" and changed file/image maintainer

!!! The content of this folder should not be changed much, so that we could
switch to the newer non-CentOS 5 version of PyPA's way for creating manylinux
wheels when it's ready.
