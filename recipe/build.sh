#!/bin/bash

set -x
set -e

mkdir build
cd build
cmake ${CMAKE_ARGS} .. -DCMAKE_INSTALL_PREFIX="$PREFIX" -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_BUILD_TYPE=Release -GNinja
ninja install   # Install C++ library into Conda env
cd ../python
python setup.py install --single-version-externally-managed --record=record.txt
cd ../runtime/python
python setup.py install --single-version-externally-managed --record=record.txt
