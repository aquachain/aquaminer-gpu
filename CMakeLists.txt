cmake_minimum_required(VERSION 3.8)
project(AQUACPPMINERGPU)

# Aquahash
add_subdirectory(aquahash)

# Curl
set(HTTP_ONLY ON CACHE BOOL "")
set(CMAKE_USE_OPENSSL OFF CACHE BOOL "")
set(BUILD_CURL_EXE OFF CACHE BOOL "")
set(CURL_STATICLIB ON CACHE BOOL "")
set(CURL_ZLIB OFF CACHE BOOL "")
set(CMAKE_USE_LIBSSH2 OFF CACHE BOOL "")
add_subdirectory(curl)

# RapidJSON
add_subdirectory(rapidjson)

# OpenCL
find_package(OpenCL REQUIRED)

# Threads
find_package(Threads REQUIRED)

# OpenSSL
find_package(OpenSSL REQUIRED)


file(GLOB SRC src/*.cpp)
file(GLOB HDR src/*.cpp)

add_executable(aquacppminer-gpu
  ${SRC} ${HDR})
target_compile_definitions(aquacppminer-gpu
  PUBLIC
  -DARCH="Linux64")
target_link_libraries(aquacppminer-gpu
  PUBLIC
  aquahash
  ${OpenCL_LIBRARIES}
  libcurl
  Threads::Threads
  gmp
  OpenSSL::SSL)
target_include_directories(aquacppminer-gpu
  PUBLIC
  curl/include
  aquahash/include
  rapidjson/include
  ${OpenCL_INCLUDE_DIRS})
