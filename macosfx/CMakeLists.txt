set(PROJECT_PLUGIN_PATH  ${CMAKE_CURRENT_BINARY_DIR}/plugin/${PLUGIN_NAME}.pluginkit)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -framework AppKit")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -framework ServiceManagement")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -framework Foundation ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -framework Cocoa")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -framework Security")

add_subdirectory(shaders)
add_subdirectory(plugin)
add_subdirectory(wrapper)

