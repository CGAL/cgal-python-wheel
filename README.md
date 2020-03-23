cgal-python-wheel
==================

This Docker image can be used to build a wheel for the CGAL python bindings.

It requires two user mounted volume containing the CGAL tree to be used, `/cgal`, and the cgal-swig-bindings tree, `/cgal-bindings`.

Example Usage:

    # Build or pull the image
    docker build -t cgal/python-wheel:manylinux2014 .
    docker run --rm -t -v /path/to/cgal:/cgal -v /path/to/bindings:/cgal-bindings \
               cgal/python-wheel:manylinux2014


