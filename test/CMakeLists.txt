# CMake version
cmake_minimum_required(VERSION 3.25.0)

# C++20 standard
set(
	CMAKE_CXX_STANDARD
	20
)
# Standard required
set(
	CMAKE_CXX_STANDARD_REQUIRED
	True
)
# No GNU extensions!
set(
	CMAKE_CXX_EXTENSIONS
	OFF
)
# Exceptions
set(
	CMAKE_CXX_EXCEPTIONS
	ON
)
# RTTI
set(
	CMAKE_CXX_RTTI
	ON
)
# LTO
set(
	CMAKE_INTERPROCEDURAL_OPTIMIZATION
	"$<BOOL:$<OR:$<CONFIG:Release>,$<CONFIG:RelWithDebInfo>>>"
)
# PIC
set(
	CMAKE_POSITION_INDEPENDENT_CODE
	ON
)
# Hidden inlines
set(
	CMAKE_VISIBILITY_INLINES_HIDDEN
	True
)
# Compile commands export
set(
	CMAKE_EXPORT_COMPILE_COMMANDS
	ON
)
# CMake Module path
set(
	CMAKE_MODULE_PATH
	"../"
)

# Sources build protection
include(ProtectSourcesBuild)

# Project for tests
project(
	"CMake++20"
	VERSION 1.0.0
	DESCRIPTION "Usefull CMake C++20 setup template"
	HOMEPAGE_URL "https://github.com/IGR2014/CMake-20"
	LANGUAGES CXX
)

# Check Compiler
include(CheckCompiler)

# Set usefull compiler warnings
set_compiler_warnings()

