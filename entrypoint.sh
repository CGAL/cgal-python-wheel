#!/bin/bash
set -e
/usr/local/bin/python3.${PYTHON_VERSION_MINOR} -m pip install --upgrade pip
cd /cgal-bindings && BOOST_INCLUDEDIR=/usr/include/boost169 CGAL_DIR=/cgal /usr/local/bin/python3.${PYTHON_VERSION_MINOR} -m pip wheel -v .
auditwheel repair *.whl
