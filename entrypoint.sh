#!/bin/bash
set -e
cd /cgal-bindings && ${PYTHON_ROOT_DIR}/bin/python3 setup.py bdist_wheel --cgal-dir=/cgal --boost-dir=/usr/include/boost169 --boost-serialization-lib=/usr/lib64/libboost_serialization.so.1.69.0 --boost-iostreams-lib=/usr/lib64/libboost_iostreams.so.1.69.0 \
    --boost-regex-lib=/usr/lib64/libboost_regex.so.1.69.0 --keep-temp --python_executable=/usr/local/bin/python3.${PYTHON_VERSION_MINOR}
auditwheel repair dist/*
