project(fmt-example)

add_executable(fmt-example main.cpp)
find_package(fmt REQUIRED)
target_link_libraries(fmt-example PRIVATE fmt::fmt)