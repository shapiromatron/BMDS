#!/bin/bash

set -xe

yum update -y
yum install -y cmake gsl-devel eigen3-devel

cp ./vendor/nlopt-2.7.1.tar.gz ~
cd ~
tar -xf nlopt-2.7.1.tar.gz && cd nlopt-2.7.1
ls -laht # TODO - remove temp
sed -i 's/cmake_minimum_required (VERSION 3\.2)/cmake_minimum_required (VERSION 3.15)/' CMakeLists.txt
sed -i 's/cmake_minimum_required (VERSION 3\.2)/cmake_minimum_required (VERSION 3.15)/' cmake/generate-cpp.cmake
head -n 20 CMakeLists.txt # TODO - remove temp
head -n 20 cmake/generate-cpp.cmake # TODO - remove temp
mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=OFF .. && make install
cd $GITHUB_WORKSPACE
