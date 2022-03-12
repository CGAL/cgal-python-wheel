FROM quay.io/pypa/manylinux2014_x86_64:latest

RUN yum -y update; yum clean all
RUN yum -y install epel-release.noarch; yum clean all
RUN yum -y update; yum -y install \
    boost169-devel.x86_64 \
    curl \
    eigen3-devel.noarch \
    metis-devel \
    gmp-devel.x86_64 \
    mpfr-devel.x86_64 \
    tar \
    python3-devel.x86_64 \
    swig3.x86_64 \
    zlib-devel.x86_64; yum clean all

RUN curl -s -SL "https://github.com/oneapi-src/oneTBB/releases/download/2019_U9/tbb2019_20191006oss_lin.tgz"   | tar xz &&\
    cd tbb2019_20191006oss && cp -r include/tbb /usr/include && cp lib/intel64/gcc4.8/* /usr/lib64
 
 
RUN cd tmp && curl -s -SL "https://github.com/CGAL/LAStools/archive/master.zip" -o laslib.zip && unzip laslib.zip && \
    cd LAStools-master && \
    mkdir build && cd build && \
    /usr/bin/cmake .. && make -j 6 && make install
    
RUN pip3 install wheel auditwheel

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]
