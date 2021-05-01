# C++ standard.
set(CMAKE_CXX_EXTENSIONS OFF CACHE STRING "")

# Static library linkage.
set(BUILD_SHARED_LIBS OFF CACHE STRING "")
add_definitions(-DBOOST_ALL_STATIC_LINK=1)

# Interprocedural optimization.
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE ON CACHE STRING "")
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_MINSIZEREL ON CACHE STRING "")
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO ON CACHE STRING "")

# Compiler definitions.
if(WIN32)
    add_definitions(-D_WIN32_WINNT=0x0601 -D_CRT_SECURE_NO_WARNINGS)
endif()

# Detect Boost tree.
if(NOT DEFINED BOOST_ZLIB_IN_BOOST_TREE AND EXISTS "${CMAKE_CURRENT_LIST_DIR}/../../../../Jamroot")
    set(BOOST_ZLIB_IN_BOOST_TREE ON CACHE STRING "")
endif()
