#!/bin/bash
set -ex
/usr/local/bin/python3.${PYTHON_VERSION_MINOR} -m pip install --upgrade pip
mkdir -p /cgal-bindings/build/build-python/CGAL
cd /cgal-bindings && BOOST_INCLUDEDIR=/usr/include/boost169 CGAL_DIR=/cgal /usr/local/bin/python3.${PYTHON_VERSION_MINOR} -m pip wheel -v .
LD_LIBRARY_PATH=$PWD/build/lib auditwheel repair cgal-*.whl
