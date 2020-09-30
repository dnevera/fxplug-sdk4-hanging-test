if (APPLE)

    project(${METAL_LIB_NAME})
    set (CURRENT_TARGET_NAME ${PROJECT_NAME})

    file (GLOB __DEPENDS_PLUGIN_SOURCES ${__DEPENDS_PLUGIN_SOURCES}
            ./*.h
            )

    # -ffast-math ?
    add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/TileableRemoteBrightness.air
            DEPENDS TileableRemoteBrightness.metal ${__DEPENDS_PLUGIN_SOURCES}
            COMMAND xcrun -sdk macosx metal
            ${METAL_FLAGS}
            -I ${CMAKE_CURRENT_SOURCE_DIR}
            -c ${CMAKE_CURRENT_SOURCE_DIR}/TileableRemoteBrightness.metal
            -o ${CMAKE_CURRENT_BINARY_DIR}/TileableRemoteBrightness.air
            VERBATIM
            )

    add_custom_target(
            ${CURRENT_TARGET_NAME}
            DEPENDS
            ${CMAKE_CURRENT_BINARY_DIR}/TileableRemoteBrightness.air
            COMMAND xcrun -sdk macosx metallib ${CMAKE_CURRENT_BINARY_DIR}/*.air -o ${CURRENT_METAL_TARGET_LIB}
    )

    set_target_properties(${CURRENT_TARGET_NAME} PROPERTIES BUNDLE TRUE)
    set_target_properties(${CURRENT_TARGET_NAME} PROPERTIES PREFIX "")
    set_target_properties(${CURRENT_TARGET_NAME} PROPERTIES SUFFIX ".metallib")

    if (INSTALL_ON)
        install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${CURRENT_METAL_TARGET_LIB} DESTINATION ${BUNDLE_DIR}/Contents/MacOS/Metallib)
    endif()

endif()
