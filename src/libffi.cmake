set(LIBFFI_DIR "${CMAKE_SOURCE_DIR}/src/libffi")
set(LIBFFI_LIB_DIR "${LIBFFI_DIR}/build_$(PLATFORM_NAME)-$(CURRENT_ARCH)-$(CONFIGURATION)/.libs")
set(LIBFFI_INCLUDE_DIR "${LIBFFI_DIR}/build_$(PLATFORM_NAME)-$(CURRENT_ARCH)-$(CONFIGURATION)/include")

add_custom_target(libffi
    COMMAND "${CMAKE_SOURCE_DIR}/build/scripts/build-step-libffi.sh"
    WORKING_DIRECTORY "${LIBFFI_DIR}"
)

include(SetActiveArchitectures)
SetActiveArchitectures(libffi)

set_target_properties(libffi PROPERTIES
    XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS[variant=Debug] YES
)