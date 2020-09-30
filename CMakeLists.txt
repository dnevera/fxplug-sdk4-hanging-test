cmake_minimum_required(VERSION 3.12)
#
# Project
#
project(FxPlugHangingTest VERSION 3.1.0 LANGUAGES CXX)
option(DEVELOPER_ID_CERT "")

set (PROJECT_APP_TITLE "FxPlug Hanging Test")
set (PROJECT_APP_ID "com.dehancer.film.fxplug.hanging.test")
set (PLUGIN_NAME "FxPlugHangingTestFxPlug")
set (METAL_LIB_NAME "MetalDefaultLib")
set (CURRENT_METAL_TARGET_LIB ${METAL_LIB_NAME}.metallib)

#
# Options
#
message(STATUS "VERSION = " ${INSTALLER_VERSION})
message(STATUS "TODAY = " ${TODAY})

#
# CXX 1x
#
string(TIMESTAMP TODAY "%Y-%m-%d")
set (CMAKE_CXX_STANDARD 17)
set (BUILD_SHARED_LIBS OFF)
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wc++17-extensions -DSQLITE_THREADSAFE=2")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdeclspec -fms-extensions")
# disable developer warnings
set (CMAKE_POLICY_DEFAULT_CMP0054 NEW)
set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")
set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG_BUILD=1")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ObjC++ -fvisibility=hidden -Wno-unused-command-line-argument")
set (CMAKE_LINK_LIBRARY_FILE_FLAG "${CMAKE_LINK_LIBRARY_FILE_FLAG} -Wl, -fvisibility=hidden")
set (CMAKE_OSX_DEPLOYMENT_TARGET $ENV{MACOSX_DEPLOYMENT_TARGET})

message(STATUS "CMAKE_BUILD_TYPE: " ${CMAKE_BUILD_TYPE})

#
# External projects
#
include(ExternalProject)

find_package (PkgConfig REQUIRED)
find_package (EXPAT REQUIRED)
find_package (ZLIB REQUIRED)
find_package (Iconv REQUIRED)
find_package (SQLite3 REQUIRED)
find_package (BLAS REQUIRED)
find_package (LAPACK REQUIRED)

add_definitions(-DCURL_STATICLIB )

if (NOT "$ENV{PKG_CONFIG_PATH}" STREQUAL "")
    set(ENV{PKG_CONFIG_SYSROOT_DIR} $ENV{SYSROOT})
    # Don't strip -I/usr/include out of cflags
    set(ENV{PKG_CONFIG_ALLOW_SYSTEM_CFLAGS} 1)
    # Don't strip -L/usr/lib out of libs
    set(ENV{PKG_CONFIG_ALLOW_SYSTEM_LIBS} 1)
endif()

if(NOT PKG_CONFIG_FOUND)
    message(FATAL_ERROR "pkg-config not found!" )
    message(FATAL_ERROR "sudo apt-get install pkg-config, or brew install pkg-config")
endif()

include_directories(
        ${CMAKE_CURRENT_BINARY_DIR}/generated
        ${CURL_INCLUDE_DIR}
        ${SQLITE3_INCLUDE_DIRS}
        ./
)

find_program(COMPRESS_EXECUTABLE  ditto)
if (NOT COMPRESS_EXECUTABLE)
    message (FATAL_ERROR "Unable to find compression tools")
endif (NOT COMPRESS_EXECUTABLE)

find_program(RSYNC_EXECUTABLE rsync)
if (NOT RSYNC_EXECUTABLE)
    message (FATAL_ERROR "Unable to find rsync")
endif (NOT RSYNC_EXECUTABLE)

find_program (CODESIGN_TOOL NAMES codesign)
if (NOT CODESIGN_TOOL)
    message (FATAL_ERROR "Unable to find codesign")
endif (NOT CODESIGN_TOOL)

find_program(RSYNC_EXECUTABLE rsync)
if (NOT RSYNC_EXECUTABLE)
    message (FATAL_ERROR "Unable to find rsync")
endif (NOT RSYNC_EXECUTABLE)

add_subdirectory(macosfx)
