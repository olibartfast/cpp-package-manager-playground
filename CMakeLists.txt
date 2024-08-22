cmake_minimum_required(VERSION 3.15)
project(cpp-package-manager-playground)

# Option to choose the package manager
option(USE_CONAN "Use Conan as package manager" OFF)
option(USE_VCPKG "Use vcpkg as package manager" OFF)
option(USE_SPACK "Use Spack as package manager" OFF)
option(USE_HUNTER "Use Hunter as package manager" OFF)

# Include the appropriate package manager file
if(USE_CONAN)
    include(cmake/conan.cmake)
elseif(USE_VCPKG)
    include(cmake/vcpkg.cmake)
elseif(USE_SPACK)
    include(cmake/spack.cmake)
elseif(USE_HUNTER)
    include(cmake/hunter.cmake)
endif()

# Add subdirectories for projects
add_subdirectory(projects/fmt-example)
add_subdirectory(projects/spdlog-example)