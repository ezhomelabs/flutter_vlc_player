cmake_minimum_required(VERSION 3.4.1)

project(vlcjni C CXX)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

link_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/libs/${ANDROID_ABI}
)

file(GLOB JNI_SRCS
    ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/*.c
)

add_library(
    vlcjni SHARED
    ${JNI_SRCS}
)

target_link_libraries(
    vlcjni
    vlc
    log
)