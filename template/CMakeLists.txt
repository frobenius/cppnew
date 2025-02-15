cmake_minimum_required (VERSION 3.8)
set(VERSION "1.0.0")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXE_LINKER_FLAGS "-static-libstdc++")

project ("hello")

include_directories("${CMAKE_SOURCE_DIR}/include/")
add_executable (hello src/main.cpp)
target_link_libraries(hello PUBLIC -lpthread)
