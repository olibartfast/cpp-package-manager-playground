#!/bin/bash

# Variables
BUILD_DIR="build"
PROJECT_ROOT=$(pwd)

# Cleanup previous builds
echo "Cleaning up previous builds..."
rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}

# Function to build with Conan
build_conan() {
    echo "=== Building with Conan ==="
    cd ${BUILD_DIR}
    conan install .. --build=missing || { echo "Conan install failed"; exit 1; }
    cmake .. -DUSE_CONAN=ON || { echo "CMake configuration failed"; exit 1; }
    cmake --build . || { echo "Conan build failed"; exit 1; }
    cd ${PROJECT_ROOT}
}

# Function to build with vcpkg
build_vcpkg() {
    echo "=== Building with vcpkg ==="
    export VCPKG_ROOT=[path-to-vcpkg]
    cd ${BUILD_DIR}
    cmake .. -DUSE_VCPKG=ON -DCMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake || { echo "CMake configuration failed"; exit 1; }
    cmake --build . || { echo "vcpkg build failed"; exit 1; }
    cd ${PROJECT_ROOT}
}

# Function to build with Spack
build_spack() {
    echo "=== Building with Spack ==="
    cd ${BUILD_DIR}
    cmake .. -DUSE_SPACK=ON || { echo "CMake configuration failed"; exit 1; }
    cmake --build . || { echo "Spack build failed"; exit 1; }
    cd ${PROJECT_ROOT}
}

# Function to build with Hunter
build_hunter() {
    echo "=== Building with Hunter ==="
    cd ${BUILD_DIR}
    cmake .. -DUSE_HUNTER=ON || { echo "CMake configuration failed"; exit 1; }
    cmake --build . || { echo "Hunter build failed"; exit 1; }
    cd ${PROJECT_ROOT}
}

# Run all builds
build_conan
build_vcpkg
build_spack
build_hunter

echo "=== All package manager tests completed ==="
