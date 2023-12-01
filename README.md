## vscode mac c/c++交叉编译环境配置步骤
1. vscode安装c/c++插件(只用装一次)  

2. vscode安装cmake tools 插件(只用装一次)  

3. brew安装交叉编译环境(只用装一次，你要编译哪个平台就装哪一个即可), [homebrew-macos-cross-toolchains](https://github.com/messense/homebrew-macos-cross-toolchains)  
```bash
# 可选，用ninja编译更快，当然不装也可以
brew install ninja

# windows x86_64
brew install mingw-w64

# linux相关
brew tap messense/macos-cross-toolchains

# linux x86_64  install x86_64-unknown-linux-gnu toolchain
brew install x86_64-unknown-linux-gnu

# linux arm64 install aarch64-unknown-linux-gnu toolchain
brew install aarch64-unknown-linux-gnu

```
4. 新建一个目录，vscode打开目录，执行命令ctrl+shift+p，选择>CMake: 快速入门 生成项目  

5. 点击左边工具栏CMake -> 配置, 选择交叉编译工具包(linux arm64举例)：  
aarch64-unknow-linux-gnu(只用选一次，下一个项目可以不用选)  

6. .vscode/settings.json 中增加toolchains配置，  vscode 插件有bug，  
在CMakeLists.txt中指定CMAKE_TOOLCHAIN_FILE没有用（因为这个bug，  
每个项目都要加这个）
```json
{
    "cmake.configureSettings": {
        // 当前文件夹下的toolchains文件，这个文件完全是cmake的写法，学过cmake的应该看得懂
        // 例子可以看项目中的toolchains/aarch64-linux-gnu.toolchain.cmake
        "CMAKE_TOOLCHAIN_FILE": "${workspaceFolder}/toolchains/aarch64-linux-gnu.toolchain.cmake",
    }
}
```
7. 左边工具栏CMake -> 配置, 就会生成build文件夹了  

8. 左边工具栏CMake -> 生成, 就会编译项目了

9. aarch64-linux-gnu.toolchain.cmake例子
```shell
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# set(CMAKE_C_COMPILER "aarch64-linux-gnu-gcc")
# set(CMAKE_CXX_COMPILER "aarch64-linux-gnu-g++")

set(CMAKE_C_COMPILER "aarch64-unknown-linux-gnu-gcc")
set(CMAKE_CXX_COMPILER "aarch64-unknown-linux-gnu-g++")
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

```

10. TODO 远程gdb调试