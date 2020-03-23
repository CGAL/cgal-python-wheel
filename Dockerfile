FROM quay.io/pypa/manylinux2014_x86_64:latest
MAINTAINER Maxime Gimeno <maxime.gimeno@gmail.com>

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
    tbb-devel \
    zlib-devel.x86_64; yum clean all

RUN curl -fSL "https://cmake.org/files/v3.12/cmake-3.12.4-Linux-x86_64.sh" -o /usr/cmake.sh
RUN cd /usr \
 && chmod +x ./cmake.sh && bash cmake.sh --skip-license && rm cmake.sh
 
RUN cd tmp && curl -s -SL "https://github.com/CGAL/LAStools/archive/master.zip" -o laslib.zip && unzip laslib.zip && \
    cd LAStools-master && \
    mkdir build && cd build && \
    /usr/bin/cmake .. && make -j 6 && make install
    
RUN pip3 install wheel auditwheel

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]
