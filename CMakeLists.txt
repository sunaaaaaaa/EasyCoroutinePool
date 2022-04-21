cmake_minimum_required(VERSION 2.8)

project(mypool)
#cmake显示编译命令
set(CMAKE_VERBOSE_MAKEFILE ON)
#设定编译标志，在编译时拼接字符串，取ENV中的CXXFLAGS，加上后面的-dynamic等参数
#添加的编译标志的含义：
#rdynamic 链接器将所有符号添加到动态符号表中，程序动态调用动态库中的函数，编译时用到该选项，通常和-ldl一起用。
#-O0不进行跳转和延迟退栈优化  -O1表示优化
#-ggdb 使用gdb的调试信息
#-Wall打印所有警告信息   -Werror 警告信息视为error
#-std指定标准
#-Wno-deprecated 关闭未使用推荐的警告
#-Wno-unused-function:关闭未使用的函数警告
#-Wno-unused-local-typedefs:忽略本地未使用的类型定义警告 
#-Wno-deprecated-declarations：关闭使用废弃api警告
set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -rdynamic -O0 -ggdb -std=c++11 -Wall -Wno-deprecated -Werror -Wno-unused-function")

#set命令将第二行开始的文件添加到变量LIB_SRC中去，可以通过${}取出
set(LIB_SRC
   src/core/coroutine_pool.cc
   src/coroutine/coroutine.cc
   src/thread/Thread.cc
   )

include_directories(.)
#生成动态库或者静态库，第一个参数指定库的名字，第二个参数决定是静态库还是动态库，shared为动态库  
#第三个为生成库的源文件
add_library(mypool SHARED ${LIB_SRC})
set(LIB_LIB
   mypool
   pthread
   )

add_executable(test tests/test.cc)
add_dependencies(test mypool)
target_link_libraries(test ${LIB_LIB})

#EXECUTABLE_OUTPUT_PATH 和 PROJECT_SOURCE_DIR 为CMake自带的预定义的变量，分别表示二进制可执行文件的存放位置和工程根目录
#LIBRARY_OUTPUT_PATH 该变量同样是预先定义好的，表示库文件的输出位置
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
