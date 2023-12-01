cmake_minimum_required(VERSION 3.15)
project(ikun VERSION 0.1.0 LANGUAGES C CXX)
# vscode 插件有bug，在CMakeLists.txt中指定CMAKE_TOOLCHAIN_FILE没有用，需要在.vscode/settings.json指定CMAKE_TOOLCHAIN_FILE
# set(CMAKE_TOOLCHAIN_FILE /path/to/toolchain)


include(CTest)
enable_testing()

add_executable(ikun main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
