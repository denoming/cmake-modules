# Find the native libconfig (C/C++ interface) includes and libraries
#
#  LIBCONFIG_INCLUDE_DIR      - where to find libconfig.h header file
#  LIBCONFIG_FOUND            - True if libconfig found.
#  LIBCONFIG_LIBRARIES        - List of libraries when using libconfig.
#  LIBCONFIG_STATIC_AVAILABLE - True if libconfig static library available.
#
#  LIBCONFIGPP_INCLUDE_DIR      - where to find libconfig.h++ header file
#  LIBCONFIGPP_FOUND            - True if libconfig++ found.
#  LIBCONFIGPP_LIBRARIES        - List of libraries when using libconfig++.
#  LIBCONFIGPP_STATIC_AVAILABLE - True if libconfig++ static library available.
#

find_path(LIBCONFIG_INCLUDE_DIR libconfig.h)
find_library(LIBCONFIG_LIBRARY libconfig)
find_library(LIBCONFIG_STATIC_LIBRARY
    ${CMAKE_STATIC_LIBRARY_PREFIX}libconfig${CMAKE_STATIC_LIBRARY_SUFFIX})

find_path(LIBCONFIGPP_INCLUDE_DIR libconfig.h++)
find_library(LIBCONFIGPP_LIBRARY libconfig++)
find_library(LIBCONFIGPP_STATIC_LIBRARY
    ${CMAKE_STATIC_LIBRARY_PREFIX}libconfig++${CMAKE_STATIC_LIBRARY_SUFFIX})

if(LIBCONFIG_INCLUDE_DIR AND LIBCONFIG_LIBRARY)
    set(LIBCONFIG_FOUND TRUE)
    if (LIBCONFIG_STATIC_LIBRARY)
        set(LIBCONFIG_STATIC_AVAILABLE TRUE)
        set(LIBCONFIG_LIBRARIES ${LIBCONFIG_STATIC_LIBRARY})
    else()
        set(LIBCONFIG_LIBRARIES ${LIBCONFIG_LIBRARY})
    endif()
    unset(LIBCONFIG_LIBRARY)
    unset(LIBCONFIG_STATIC_LIBRARY)
endif()

if(LIBCONFIGPP_INCLUDE_DIR AND LIBCONFIGPP_LIBRARY)
    set(LIBCONFIGPP_FOUND TRUE)
    if (LIBCONFIGPP_STATIC_LIBRARY)
        set(LIBCONFIGPP_STATIC_AVAILABLE TRUE)
        set(LIBCONFIGPP_LIBRARIES ${LIBCONFIGPP_STATIC_LIBRARY})
    else()
        set(LIBCONFIGPP_LIBRARIES ${LIBCONFIGPP_LIBRARY})
    endif()
    unset(LIBCONFIGPP_LIBRARY)
    unset(LIBCONFIGPP_STATIC_LIBRARY)
endif()

if(LIBCONFIG_FOUND)
    if (NOT LibConfig_FIND_QUIETLY)
        message(STATUS "Found libconfig: ${LIBCONFIG_LIBRARIES}")
        message(STATUS "Found libconfig++: ${LIBCONFIGPP_LIBRARIES}")
    endif()
else()
    if(LibConfig_FIND_REQUIRED)
        message(SEND_ERROR "Could NOT find LibConfig")
    endif()
endif()

mark_as_advanced(
    LIBCONFIG_INCLUDE_DIR
    LIBCONFIG_LIBRARIES
    LIBCONFIG_STATIC_AVAILABLE
    LIBCONFIGPP_INCLUDE_DIR
    LIBCONFIGPP_LIBRARIES
    LIBCONFIGPP_STATIC_AVAILABLE)
