set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# set(CMAKE_C_COMPILER "aarch64-linux-gnu-gcc")
# set(CMAKE_CXX_COMPILER "aarch64-linux-gnu-g++")

set(CMAKE_C_COMPILER "aarch64-unknown-linux-gnu-gcc")
set(CMAKE_CXX_COMPILER "aarch64-unknown-linux-gnu-g++")

# 执行这个命令找到编译器sysroot路径
# echo 'int main(int, char**) {return 0; }'|/usr/local/bin/aarch64-unknown-linux-gnu-g++  -E -v -
set(CMAKE_SYSROOT /usr/local/Cellar/aarch64-unknown-linux-gnu/10.2.0/toolchain/bin/../aarch64-unknown-linux-gnu/sysroot)
# 在mac中需要指定这个，不然-isysroot会是默认的mac平台的路径
# https://lvv.me/posts/2022/04/26_cmake_cross_compile/
set(CMAKE_OSX_SYSROOT /usr/local/Cellar/aarch64-unknown-linux-gnu/10.2.0/toolchain/bin/../aarch64-unknown-linux-gnu/sysroot)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# set(CMAKE_C_FLAGS "-march=armv8-a")
# set(CMAKE_CXX_FLAGS "-march=armv8-a")

# cache flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "c flags")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" CACHE STRING "c++ flags")
