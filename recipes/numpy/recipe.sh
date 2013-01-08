#!/bin/bash

# version of your package
VERSION_numpy=1.7.0b2

# dependencies of this recipe
DEPS_numpy=(android)

# url of the package
URL_numpy=http://downloads.sourceforge.net/project/numpy/NumPy/$VERSION_numpy/numpy-$VERSION_numpy.tar.gz

# md5 of the package
MD5_numpy=1b62cf0e34e2db58b0241b00d603df24

# default build path
BUILD_numpy=$BUILD_PATH/numpy/$(get_directory $URL_numpy)

# default recipe path
RECIPE_numpy=$RECIPES_PATH/numpy

RECIPE_numpy=$RECIPES_PATH/numpy
# function called for preparing source code if needed
# (you can apply patch etc here.)
function prebuild_numpy() {
    cd $BUILD_numpy
    # check marker in our source build
    if [ -f .patched ]; then
    # no patch needed
        return
    fi
    try patch -p1  < $RECIPE_numpy/numpy.patch
    touch .patched
}

# function called to build the source code
function build_numpy() {
	cd $BUILD_numpy
	push_arm
    export BLAS=None 
    export LAPACK=None 
    export ATLAS=None 
    try $BUILD_PATH/python-install/bin/python.host setup.py  build --fcompiler=arm-linux-androideabi-gfortran install
    pop_arm
}

# function called after all the compile have been done
function postbuild_numpy() {
	true
}

