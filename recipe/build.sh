#!/bin/bash

set -x
set -e

mkdir build
cd build

if [[ "$target_platform" == osx-* ]]
then
  OPENMP_FLAGS="-DOpenMP_C_FLAGS=-fopenmp -DOpenMP_CXX_FLAGS=-fopenmp -DOpenMP_C_LIB_NAMES=libomp -DOpenMP_CXX_LIB_NAMES=libomp"
else
  OPENMP_FLAGS=""
fi

cmake ${CMAKE_ARGS} .. -DCMAKE_INSTALL_PREFIX="$PREFIX" -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_CXX_FLAGS="-D_LIBCPP_DISABLE_AVAILABILITY" ${OPENMP_FLAGS}
ninja install   # Install C++ library into Conda env
cd ../python
${PYTHON} -m pip install -v . --config-settings use_system_libtreelite=True
