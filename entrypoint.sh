#!/bin/bash
set -e
cd /cgal-bindings && python3 setup.py bdist_wheel --cgal-dir=/cgal --boost-dir=/usr/include/boost169 --boost-serialization-lib=/usr/lib64/libboost_serialization.so.1.69.0 --boost-iostreams-lib=/usr/lib64/libboost_iostreams.so.1.69.0 \
    --boost-regex-lib=/usr/lib64/libboost_regex.so.1.69.0 --keep-temp
auditwheel repair dist/cgal-5.1.0-cp36-cp36m-linux_x86_64.whl
