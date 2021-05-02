#
# Copyright (c) 2019 Vinnie Falco (vinnie.falco@gmail.com)
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#
# Official repository: https://github.com/CPPAlliance/ZLib
#

source_group (include/boost/zlib zlib)
source_group (test/extern/zlib-1.2.11 zlib)
source_group (test "/")

set (ZLIB_SOURCES
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/crc32.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/deflate.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/inffast.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/inffixed.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/inflate.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/inftrees.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/trees.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/zlib.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/zutil.h
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/adler32.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/compress.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/crc32.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/deflate.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/infback.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/inffast.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/inflate.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/inftrees.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/trees.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/uncompr.c
    ${CMAKE_CURRENT_LIST_DIR}/extern/zlib-1.2.11/zutil.c
)

if (MSVC)
    set_source_files_properties (${ZLIB_SOURCES} PROPERTIES COMPILE_FLAGS "/wd4127 /wd4131 /wd4244")
endif()

add_executable (tests-zlib
    ${BOOST_ZLIB_SOURCES}
    ${ZLIB_SOURCES}
    Jamfile
    error.cpp
    deflate_stream.cpp
    inflate_stream.cpp
    zlib.cpp
	main.cpp
)
