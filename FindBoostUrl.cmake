# Find the native libmosquitto includes and libraries
#
#  BoostUrl_INCLUDE_DIR  - where to find url.hpp, etc.
#  BoostUrl_FOUND        - True if BoostUrl found.
#  BoostUrl_FIND_QUIETLY - True if BoostUrl had been already found.

if(BoostUrl_FOUND)
    set(BoostUrl_FIND_QUIETLY TRUE)
endif()

find_path(BoostUrl_INCLUDE_DIR
          NAMES url.hpp
          PATH_SUFFIXES boost)
find_library(BoostUrl_LIBRARY
          NAMES libboost_url${CMAKE_STATIC_LIBRARY_SUFFIX})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
        BoostUrl
        DEFAULT_MSG
        BoostUrl_LIBRARY BoostUrl_INCLUDE_DIR)

mark_as_advanced(
        BoostUrl_INCLUDE_DIR
        BoostUrl_LIBRARY)