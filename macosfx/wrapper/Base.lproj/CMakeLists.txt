#    find_program(IBTOOL_EXECUTABLE ibtool)
#
#    add_custom_command(
#            TARGET ${PROJECT_NAME} POST_BUILD
#            COMMAND "${IBTOOL_EXECUTABLE}"
#            --compile
#            "$<TARGET_FILE_DIR:${PROJECT_NAME}>/../Resources/MainMenu.nib"
#            ${CMAKE_CURRENT_SOURCE_DIR}/Base.lproj/MainMenu.xib
#            COMMENT "Running IBTOOL_EXECUTABLE..."
#    )
