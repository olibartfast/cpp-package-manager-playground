cmake_minimum_required(VERSION 3.15)
project(spdlog-example)

add_executable(spdlog-example main.cpp)
find_package(spdlog REQUIRED)
target_link_libraries(spdlog-example PRIVATE spdlog::spdlog)