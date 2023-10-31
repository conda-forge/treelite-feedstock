#!/bin/bash

set -x
set -e

mkdir build
cd build
cmake ${CMAKE_ARGS} .. -DCMAKE_PREFIX_PATH="$PREFIX" -DCMAKE_INSTALL_PREFIX="$PREFIX" -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_CXX_FLAGS="-D_LIBCPP_DISABLE_AVAILABILITY"
ninja install   # Install C++ library into Conda env
cd ../python
${PYTHON} -m pip install -v . --config-settings use_system_libtreelite=True
