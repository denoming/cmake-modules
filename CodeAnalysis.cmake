# Distributed under the MIT License.  See accompanying
# file LICENSE.md

#[=======================================================================[.rst:
CodeAnalysis
-------

Add code format target.

Custom Targets
^^^^^^^^^^^^^^^^

This module provides the following custom target, if found:

``codeanalysis``
  The code analysis custom target.

#]=======================================================================]

if(TARGET codeanalysis)
    return()
endif()

find_package(CppCheck)

if(CppCheck_FOUND)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/analysis/cppcheck)
    add_custom_target(codeanalysis COMMAND ${CPPCHECK_COMMAND})
endif()
