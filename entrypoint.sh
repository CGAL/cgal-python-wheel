#!/bin/bash
set -ex
/usr/local/bin/python3.${PYTHON_VERSION_MINOR} -m pip install --upgrade pip
mkdir -p /cgal-bindings/build/build-python/CGAL
if [ -f /cgal/CGALConfig.cmake ]; then
  CGAL_DIR=/cgal
else
#  shopt
  ls /cgal
  ls /cgal/lib*/cmake/CGAL/CGALConfig.cmake
  files=(/cgal/lib*/cmake/CGAL/CGALConfig.cmake)
  echo $files
  file=${files[0]}
  CGAL_DIR=${file%\/CGALConfig.cmake}
fi
export CGAL_DIR
cd /cgal-bindings && BOOST_INCLUDEDIR=/usr/include/boost169 /usr/local/bin/python3.${PYTHON_VERSION_MINOR} -m pip wheel -v .
LD_LIBRARY_PATH=$PWD/build/lib auditwheel repair cgal-*.whl
