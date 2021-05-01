#
# Copyright (c) 2019 Vinnie Falco (vinnie.falco@gmail.com)
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#
# Official repository: https://github.com/CPPAlliance/ZLib
#

file(GLOB_RECURSE BOOST_ZLIB_TESTS_FILES CONFIGURE_DEPENDS Jamfile *.cpp *.hpp)
list(FILTER BOOST_ZLIB_TESTS_FILES EXCLUDE REGEX "^${CMAKE_CURRENT_SOURCE_DIR}/cmake_install_test/.*$")

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "" FILES ${BOOST_ZLIB_TESTS_FILES})
add_executable(tests ${BOOST_ZLIB_TESTS_FILES})
target_include_directories(tests PRIVATE .)
target_link_libraries(tests PRIVATE Boost::zlib)
add_test(NAME zlib-tests COMMAND tests)

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "" FILES limits.cpp main.cpp)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR}/../src PREFIX "" FILES ../src/src.cpp)
add_executable(limits limits.cpp main.cpp ../src/src.cpp Jamfile)

target_compile_features(limits PUBLIC cxx_constexpr)

target_include_directories(limits PRIVATE ../include .)
target_compile_definitions(limits PRIVATE
    BOOST_ZLIB_NO_LIB=1
)

if(BOOST_SUPERPROJECT_VERSION)
    target_link_libraries(limits
        PRIVATE
            Boost::align
            Boost::assert
            Boost::config
            Boost::container
            Boost::exception
            Boost::system
            Boost::throw_exception
            Boost::utility
    )
elseif(BOOST_ZLIB_IN_BOOST_TREE)
    target_include_directories(limits PRIVATE ${BOOST_ROOT})
    target_link_directories(limits PRIVATE ${BOOST_ROOT}/stage/lib)
else()
    target_link_libraries(limits
        PRIVATE
            Boost::system
            Boost::container
    )
endif()

add_test(NAME zlib-limits COMMAND limits)
