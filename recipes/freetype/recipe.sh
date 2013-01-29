#!/bin/bash

# version of your package
VERSION_freetype=2.4.11

# dependencies of this recipe
DEPS_freetype=()

# url of the package
URL_freetype=http://download.savannah.gnu.org/releases/freetype/freetype-$VERSION_freetype.tar.gz

# md5 of the package
MD5_freetype=5af8234cf36f64dc2b97f44f89325117

# default build path
BUILD_freetype=$BUILD_PATH/freetype/$(get_directory $URL_freetype)

# default recipe path
RECIPE_freetype=$RECIPES_PATH/freetype

RECIPE_freetype=$RECIPES_PATH/freetype
# function called for preparing source code if needed
# (you can apply patch etc here.)
function prebuild_freetype() {
    true
}

# function called to build the source code
function build_freetype() {
	cd $BUILD_freetype
	push_arm
    try ./configure --host=arm-linux-androideabi --prefix="$BUILD_PATH/python-install" 
    try make
    try make install
    pop_arm
}

# function called after all the compile have been done
function postbuild_freetype() {
	true
}

