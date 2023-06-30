# - Find Direct3D
# Find the Direct3D includes and libraries
#
#  Direct3D_INCLUDE_DIR				- Where to find Direct3D headers
#  Direct3D_LIBRARIES				- List of libraries when using Direct3D.
#  Direct3D_VERSION 				- Direct3D library version.
#  Direct3D_FOUND				- True if Direct3D found.
#
#  Direct3D_Direct3D9_INCLUDE_DIR		- Where to find Direct3D9 headers
#  Direct3D_Direct3D9_LIBRARY			- List of libraries when using Direct3D9.
#  Direct3D_Direct3D9_FOUND			- True if Direct3D9 found.
#
#  Direct3D_Direct3D10_INCLUDE_DIR		- Where to find Direct3D10 headers
#  Direct3D_Direct3D10_LIBRARY			- List of libraries when using Direct3D10.
#  Direct3D_Direct3D10_FOUND			- True if Direct3D10 found.
#
#  Direct3D_Direct3D11_INCLUDE_DIR		- Where to find Direct3D11 headers
#  Direct3D_Direct3D11_LIBRARY			- List of libraries when using Direct3D11.
#  Direct3D_Direct3D11_FOUND			- True if Direct3D11 found.
#
#  Direct3D_Direct3DCompiler_INCLUDE_DIR	- Where to find Direct3DCompiler headers
#  Direct3D_Direct3DCompiler_LIBRARY		- List of libraries when using Direct3DCompiler.
#  Direct3D_Direct3DCompiler_FOUND		- True if Direct3DCompiler found.
#


# Include guard
include_guard()


# Check cached
if (Direct3D_INCLUDE_DIRS AND Direct3D_LIBRARIES)

	# Already in cache, be silent
	set(
		Direct3D_FIND_QUIETLY
		TRUE
	)

endif (Direct3D_INCLUDE_DIRS AND Direct3D_LIBRARIES)

# Windows
if (WIN32)

	# CMake find framework settings
	set(
		CMAKE_FIND_FRAMEWORK
		NEVER
	)
	set(
		CMAKE_FIND_FRAMEWORK_SAVE
		${CMAKE_FIND_FRAMEWORK}
	)
	set(
		CMAKE_REQUIRED_QUIET
		${Direct3D_FIND_QUIETLY}
	)
	set(
		CMAKE_REQUIRED_QUIET_SAVE
		${CMAKE_REQUIRED_QUIET}
	)

	# WindowsKit package required
	find_package(
		WindowsKit 6.0 REQUIRED
	)

	# Direct3D search paths
	set(
		Direct3D_INCLUDE_DIR_PATHS
		${WindowsKit_INCLUDE_DIR_PATHS}
	)
	set(
		Direct3D_LIBRARY_PATHS
		${WindowsKit_LIBRARY_PATHS}
	)

	# Find Direct3D9 header
	find_path(
		Direct3D_Direct3D9_INCLUDE_DIR
		NAMES d3d9.h d3d9helper.h
		PATHS ${Direct3D_INCLUDE_DIR_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find Direct3D10 header
	find_path(
		Direct3D_Direct3D10_INCLUDE_DIR
		NAMES d3d10_1.h d3d10.h
		PATHS ${Direct3D_INCLUDE_DIR_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find Direct3D11 header
	find_path(
		Direct3D_Direct3D11_INCLUDE_DIR
		NAMES d3d11_4.h d3d11_3.h d3d11_2.h d3d11_1.h d3d11.h
		PATHS ${Direct3D_INCLUDE_DIR_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find Direct3DCompiler header
	find_path(
		Direct3D_Direct3DCompiler_INCLUDE_DIR
		NAMES d3dcompiler.h
		PATHS ${Direct3D_INCLUDE_DIR_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)

	# Direct3D9 found
	if (Direct3D_Direct3D9_INCLUDE_DIR)

		# Direct3D9 Includes
		list(
			APPEND
			Direct3D_INCLUDE_DIRS
			${Direct3D_Direct3D9_INCLUDE_DIR}
		)
		# Direct3D9 found
		set(
			Direct3D_Direct3D9_FOUND
			TRUE
		)

		# Check if file exists
		if (EXISTS "${Direct3D_Direct3D9_INCLUDE_DIR}/d3d9.h")

			# Direct3D9 version
			file(
				STRINGS "${Direct3D_Direct3D9_INCLUDE_DIR}/d3d9.h"
				Direct3D9_VERSION_STR
				REGEX "#define[ \t\n\r]+DIRECT3D_VERSION[ \t\n\r]+0x[0-9a-fA-F]+"
			)

		else (EXISTS "${Direct3D_Direct3D9_INCLUDE_DIR}/d3d9.h")

			# Direct3D9 version
			file(
				STRINGS "${Direct3D_Direct3D9_INCLUDE_DIR}/d3d9helper.h"
				Direct3D9_VERSION_STR
				REGEX "#define[ \t\n\r]+DIRECT3D_VERSION[ \t\n\r]+0x[0-9a-fA-F]+"
			)

		endif (EXISTS "${Direct3D_Direct3D9_INCLUDE_DIR}/d3d9.h")

		# Direct3D9 version value
		string(
			REGEX
			MATCH "0x[0-9]+"
			Direct3D9_VERSION_STR
			${Direct3D9_VERSION_STR}
		)

		# Check
		if (Direct3D9_VERSION_STR)

			# Hex to Dec
			math(
				EXPR
				Direct3D9_VERSION "${Direct3D9_VERSION_STR}"
				OUTPUT_FORMAT DECIMAL
			)
			# Version major
			math(
				EXPR
				Direct3D9_VERSION_MAJOR "${Direct3D9_VERSION} / 256"
			)
			# Version major
			math(
				EXPR
				Direct3D9_VERSION_MINOR "${Direct3D9_VERSION} % 256"
			)
			# Direct3D9 version
			set(
				Direct3D_Direct3D9_VERSION
				"${Direct3D9_VERSION_MAJOR}.${Direct3D9_VERSION_MINOR}"
			)
			# Direct3D version
			set(
				Direct3D_VERSION
				${Direct3D_Direct3D9_VERSION}
			)

		endif (Direct3D9_VERSION_STR)

	endif (Direct3D_Direct3D9_INCLUDE_DIR)

	# Direct3D10 found
	if (Direct3D_Direct3D10_INCLUDE_DIR)

		# Direct3D10 Includes
		list(
			APPEND
			Direct3D_INCLUDE_DIRS
			${Direct3D_Direct3D10_INCLUDE_DIR}
		)
		# Direct3D10 found
		set(
			Direct3D_Direct3D10_FOUND
			TRUE
		)

		# Check if file exists
		if (EXISTS "${Direct3D_Direct3D10_INCLUDE_DIR}/d3d10_1.h")

			# Direct3D10 major version
			set(
				Direct3D10_VERSION_MAJOR_STR
				"10"
			)
			# Direct3D10 minor version
			set(
				Direct3D10_VERSION_MINOR_STR
				"1"
			)

		else (EXISTS "${Direct3D_Direct3D10_INCLUDE_DIR}/d3d10_1.h")

			# Direct3D10 version (major)
			file(
				STRINGS "${Direct3D_Direct3D10_INCLUDE_DIR}/d3d10.h"
				Direct3D10_VERSION_MAJOR_STR
				REGEX "#define[ \t\n\r]+D3D_MAJOR_VERSION[ \t\n\r]+[(][ \t\n\r]+[0-9a-fA-F]+[ \t\n\r]+[)]"
			)
			# Direct3D10 version (minor)
			file(
				STRINGS "${Direct3D_Direct3D10_INCLUDE_DIR}/d3d10.h"
				Direct3D10_VERSION_MINOR_STR
				REGEX "#define[ \t\n\r]+D3D_MINOR_VERSION[ \t\n\r]+[(][ \t\n\r]+[0-9a-fA-F]+[ \t\n\r]+[)]"
			)
			# Direct3D10 version value (major)
			string(
				REGEX
				MATCH "[^a-zA-Z][0-9]+"
				Direct3D10_VERSION_MAJOR_STR
				${Direct3D10_VERSION_MAJOR_STR}
			)
			string(
				STRIP
				"${Direct3D10_VERSION_MAJOR_STR}"
				Direct3D10_VERSION_MAJOR_STR
			)
			# Direct3D10 version value (minor)
			string(
				REGEX
				MATCH "[^a-zA-Z][0-9]+"
				Direct3D10_VERSION_MINOR_STR
				${Direct3D10_VERSION_MINOR_STR}
			)
			string(
				STRIP
				"${Direct3D10_VERSION_MINOR_STR}"
				Direct3D10_VERSION_MINOR_STR
			)

		endif (EXISTS "${Direct3D_Direct3D10_INCLUDE_DIR}/d3d10_1.h")

		# Direct3D10 version
		set(
			Direct3D10_VERSION_STR
			"${Direct3D10_VERSION_MAJOR_STR}.${Direct3D10_VERSION_MINOR_STR}"
		)

		# Check
		if (Direct3D10_VERSION_STR)

			# Direct3D10 version
			set(
				Direct3D_Direct3D10_VERSION
				${Direct3D10_VERSION_STR}
			)
			# Direct3D version
			set(
				Direct3D_VERSION
				${Direct3D_Direct3D10_VERSION}
			)

		endif (Direct3D10_VERSION_STR)

	endif (Direct3D_Direct3D10_INCLUDE_DIR)

	# Direct3D11 found
	if (Direct3D_Direct3D11_INCLUDE_DIR)

		# Direct3D11 Includes
		list(
			APPEND
			Direct3D_INCLUDE_DIRS
			${Direct3D_Direct3D11_INCLUDE_DIR}
		)
		# Direct3D11 found
		set(
			Direct3D_Direct3D11_FOUND
			TRUE
		)

		# Check if file exists
		if (EXISTS "${Direct3D_Direct3D11_INCLUDE_DIR}/d3d11_4.h")

			# Direct3D11 major version
			set(
				Direct3D11_VERSION_MAJOR_STR
				"11"
			)
			# Direct3D11 minor version
			set(
				Direct3D11_VERSION_MINOR_STR
				"4"
			)

		elseif (EXISTS "${Direct3D_Direct3D11_INCLUDE_DIR}/d3d11_3.h")

			# Direct3D11 major version
			set(
				Direct3D11_VERSION_MAJOR_STR
				"11"
			)
			# Direct3D11 minor version
			set(
				Direct3D11_VERSION_MINOR_STR
				"3"
			)

		elseif (EXISTS "${Direct3D_Direct3D11_INCLUDE_DIR}/d3d11_2.h")

			# Direct3D11 major version
			set(
				Direct3D11_VERSION_MAJOR_STR
				"11"
			)
			# Direct3D11 minor version
			set(
				Direct3D11_VERSION_MINOR_STR
				"2"
			)

		elseif (EXISTS "${Direct3D_Direct3D11_INCLUDE_DIR}/d3d11_1.h")

			# Direct3D11 major version
			set(
				Direct3D11_VERSION_MAJOR_STR
				"11"
			)
			# Direct3D11 minor version
			set(
				Direct3D11_VERSION_MINOR_STR
				"1"
			)

		else (EXISTS "${Direct3D_Direct3D11_INCLUDE_DIR}/d3d11_4.h")

			# Direct3D11 version (major)
			file(
				STRINGS "${Direct3D_Direct3D11_INCLUDE_DIR}/d3d11.h"
				Direct3D11_VERSION_MAJOR_STR
				REGEX "#define[ \t\n\r]+D3D11_MAJOR_VERSION[ \t\n\r]+[(][ \t\n\r]+[0-9a-fA-F]+[ \t\n\r]+[)]"
			)
			# Direct3D11 version (minor)
			file(
				STRINGS "${Direct3D_Direct3D11_INCLUDE_DIR}/d3d11.h"
				Direct3D11_VERSION_MINOR_STR
				REGEX "#define[ \t\n\r]+D3D11_MINOR_VERSION[ \t\n\r]+[(][ \t\n\r]+[0-9a-fA-F]+[ \t\n\r]+[)]"
			)
			# Direct3D11 version value (major)
			string(
				REGEX
				MATCH "[^a-zA-Z][0-9]+"
				Direct3D11_VERSION_MAJOR_STR
				${Direct3D11_VERSION_MAJOR_STR}
			)
			string(
				STRIP
				"${Direct3D11_VERSION_MAJOR_STR}"
				Direct3D11_VERSION_MAJOR_STR
			)
			# Direct3D11 version value (minor)
			string(
				REGEX
				MATCH "[^a-zA-Z][0-9]+"
				Direct3D11_VERSION_MINOR_STR
				${Direct3D11_VERSION_MINOR_STR}
			)
			string(
				STRIP
				"${Direct3D11_VERSION_MINOR_STR}"
				Direct3D11_VERSION_MINOR_STR
			)

		endif (EXISTS "${Direct3D_Direct3D11_INCLUDE_DIR}/d3d11_4.h")

		# Direct3D11 version
		set(
			Direct3D11_VERSION_STR
			"${Direct3D11_VERSION_MAJOR_STR}.${Direct3D11_VERSION_MINOR_STR}"
		)

		# Check
		if (Direct3D11_VERSION_STR)

			# Direct3D11 version
			set(
				Direct3D_Direct3D11_VERSION
				${Direct3D11_VERSION_STR}
			)
			# Direct3D version
			set(
				Direct3D_VERSION
				${Direct3D_Direct3D11_VERSION}
			)

		endif (Direct3D11_VERSION_STR)

	endif (Direct3D_Direct3D11_INCLUDE_DIR)

	# Direct3DCompiler found
	if (Direct3D_Direct3DCompiler_INCLUDE_DIR)

		# Direct3DCompiler Includes
		list(
			APPEND
			Direct3D_INCLUDE_DIRS
			${Direct3D_Direct3DCompiler_INCLUDE_DIR}
		)
		# Direct3DCompiler found
		set(
			Direct3D_Direct3DCompiler_FOUND
			TRUE
		)

	endif (Direct3D_Direct3DCompiler_INCLUDE_DIR)

	# Find Direct3D9 Library
	find_library(
		Direct3D_Direct3D9_LIBRARY
		NAMES d3d9
		PATHS ${Direct3D_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find Direct3D10 Library
	find_library(
		Direct3D_Direct3D10_LIBRARY
		NAMES d3d10
		PATHS ${Direct3D_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find Direct3D11 Library
	find_library(
		Direct3D_Direct3D11_LIBRARY
		NAMES d3d11
		PATHS ${Direct3D_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find Direct3DCompiler Library
	find_library(
		Direct3D_Direct3DCompiler_LIBRARY
		NAMES D3DCompiler d3dcompiler
		PATHS ${Direct3D_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)

	# Direct3D9 Libraries
	if (Direct3D_Direct3D9_LIBRARY)

		# Direct3D9 Libraries
		list(
			APPEND
			Direct3D_LIBRARIES
			${Direct3D_Direct3D9_LIBRARY}
		)
		# Direct3D9 found
		set(
			Direct3D_Direct3D9_FOUND
			TRUE
		)

	endif (Direct3D_Direct3D9_LIBRARY)

	# Direct3D10 Libraries
	if (Direct3D_Direct3D10_LIBRARY)

		# Direct3D10 Libraries
		list(
			APPEND
			Direct3D_LIBRARIES
			${Direct3D_Direct3D10_LIBRARY}
		)
		# Direct3D10 found
		set(
			Direct3D_Direct3D10_FOUND
			TRUE
		)

	endif (Direct3D_Direct3D10_LIBRARY)

	# Direct3D11 Libraries
	if (Direct3D_Direct3D11_LIBRARY)

		# Direct3D11 Libraries
		list(
			APPEND
			Direct3D_LIBRARIES
			${Direct3D_Direct3D11_LIBRARY}
		)
		# Direct3D11 found
		set(
			Direct3D_Direct3D11_FOUND
			TRUE
		)

	endif (Direct3D_Direct3D11_LIBRARY)

	# Direct3DCompiler Libraries
	if (Direct3D_Direct3DCompiler_LIBRARY)

		# Direct3DCompiler Libraries
		list(
			APPEND
			Direct3D_LIBRARIES
			${Direct3D_Direct3DCompiler_LIBRARY}
		)
		# Direct3DCompiler found
		set(
			Direct3D_Direct3DCompiler_FOUND
			TRUE
		)

	endif (Direct3D_Direct3DCompiler_LIBRARY)

	# Handle the QUIETLY and REQUIRED arguments and set Direct3D_FOUND to TRUE if
	# all listed variables are TRUE.
	include(FindPackageHandleStandardArgs)
	find_package_handle_standard_args(
		Direct3D
		REQUIRED_VARS Direct3D_Direct3D9_FOUND Direct3D_Direct3D10_FOUND Direct3D_Direct3D11_FOUND Direct3D_Direct3DCompiler_FOUND
		VERSION_VAR Direct3D_VERSION
		HANDLE_COMPONENTS
	)

	# Direct3D::Direct3D9 target
	if (Direct3D_Direct3D9_FOUND AND NOT TARGET Direct3D::Direct3D9)

		# Absolute path
		if (IS_ABSOLUTE ${Direct3D_Direct3D9_LIBRARY})

			add_library(
				Direct3D::Direct3D9
				UNKNOWN IMPORTED
			)
			set_target_properties(
				Direct3D::Direct3D9
				PROPERTIES
				IMPORTED_LOCATION ${Direct3D_Direct3D9_LIBRARY}
			)

		else (IS_ABSOLUTE ${Direct3D_Direct3D9_LIBRARY})

			add_library(
				Direct3D::Direct3D9
				INTERFACE IMPORTED
			)
			set_target_properties(
				Direct3D::Direct3D9
				PROPERTIES
				IMPORTED_LIBNAME ${Direct3D_Direct3D9_LIBRARY}
			)

		endif (IS_ABSOLUTE ${Direct3D_Direct3D9_LIBRARY})

		set_target_properties(
			Direct3D::Direct3D9
			PROPERTIES
			INTERFACE_LINK_LIBRARIES "Direct3D::Direct3DCompiler"
			INTERFACE_INCLUDE_DIRECTORIES ${Direct3D_Direct3D9_INCLUDE_DIR}
		)

	endif (Direct3D_Direct3D9_FOUND AND NOT TARGET Direct3D::Direct3D9)

	# Direct3D::Direct3D10 target
	if (Direct3D_Direct3D10_FOUND AND NOT TARGET Direct3D::Direct3D10)

		# Absolute path
		if (IS_ABSOLUTE ${Direct3D_Direct3D10_LIBRARY})

			add_library(
				Direct3D::Direct3D10
				UNKNOWN IMPORTED
			)
			set_target_properties(
				Direct3D::Direct3D10
				PROPERTIES
				IMPORTED_LOCATION ${Direct3D_Direct3D10_LIBRARY}
			)

		else (IS_ABSOLUTE ${Direct3D_Direct3D10_LIBRARY})

			add_library(
				Direct3D::Direct3D10
				INTERFACE IMPORTED
			)
			set_target_properties(
				Direct3D::Direct3D10
				PROPERTIES
				IMPORTED_LIBNAME ${Direct3D_Direct3D10_LIBRARY}
			)

		endif (IS_ABSOLUTE ${Direct3D_Direct3D10_LIBRARY})

		set_target_properties(
			Direct3D::Direct3D10
			PROPERTIES
			INTERFACE_LINK_LIBRARIES "Direct3D::Direct3DCompiler"
			INTERFACE_INCLUDE_DIRECTORIES ${Direct3D_Direct3D10_INCLUDE_DIR}
		)

	endif (Direct3D_Direct3D10_FOUND AND NOT TARGET Direct3D::Direct3D10)

	# Direct3D::Direct3D11 target
	if (Direct3D_Direct3D11_FOUND AND NOT TARGET Direct3D::Direct3D11)

		# Absolute path
		if (IS_ABSOLUTE ${Direct3D_Direct3D11_LIBRARY})

			add_library(
				Direct3D::Direct3D11
				UNKNOWN IMPORTED
			)
			set_target_properties(
				Direct3D::Direct3D11
				PROPERTIES
				IMPORTED_LOCATION ${Direct3D_Direct3D11_LIBRARY}
			)

		else (IS_ABSOLUTE ${Direct3D_Direct3D11_LIBRARY})

			add_library(
				Direct3D::Direct3D11
				INTERFACE IMPORTED
			)
			set_target_properties(
				Direct3D::Direct3D11
				PROPERTIES
				IMPORTED_LIBNAME ${Direct3D_Direct3D10_LIBRARY}
			)

		endif (IS_ABSOLUTE ${Direct3D_Direct3D11_LIBRARY})

		set_target_properties(
			Direct3D::Direct3D11
			PROPERTIES
			INTERFACE_LINK_LIBRARIES "Direct3D::Direct3DCompiler"
			INTERFACE_INCLUDE_DIRECTORIES ${Direct3D_Direct3D10_INCLUDE_DIR}
		)

	endif (Direct3D_Direct3D11_FOUND AND NOT TARGET Direct3D::Direct3D11)

	# Direct3D::Direct3DCompiler target
	if (Direct3D_Direct3DCompiler_FOUND AND NOT TARGET Direct3D::Direct3DCompiler)

		# Absolute path
		if (IS_ABSOLUTE ${Direct3D_Direct3DCompiler_LIBRARY})

			add_library(
				Direct3D::Direct3DCompiler
				UNKNOWN IMPORTED
			)
			set_target_properties(
				Direct3D::Direct3DCompiler
				PROPERTIES
				IMPORTED_LOCATION ${Direct3D_Direct3DCompiler_LIBRARY}
			)

		else (IS_ABSOLUTE ${Direct3D_Direct3DCompiler_LIBRARY})

			add_library(
				Direct3D::Direct3DCompiler
				INTERFACE IMPORTED
			)
			set_target_properties(
				Direct3D::Direct3DCompiler
				PROPERTIES
				IMPORTED_LIBNAME ${Direct3D_Direct3DCompiler_LIBRARY}
			)

		endif (IS_ABSOLUTE ${Direct3D_Direct3DCompiler_LIBRARY})

		set_target_properties(
			Direct3D::Direct3DCompiler
			PROPERTIES
			INTERFACE_LINK_LIBRARIES ${Direct3D_Direct3DCompiler_LIBRARY}
			INTERFACE_INCLUDE_DIRECTORIES ${Direct3D_Direct3DCompiler_INCLUDE_DIR}
		)

	endif (Direct3D_Direct3DCompiler_FOUND AND NOT TARGET Direct3D::Direct3DCompiler)

	# CMake find framework settings
	set(
		CMAKE_FIND_FRAMEWORK
		${CMAKE_FIND_FRAMEWORK_SAVE}
	)
	set(
		CMAKE_REQUIRED_QUIET
		${CMAKE_REQUIRED_QUIET_SAVE}
	)

endif (WIN32)

# Remove Include duplicates
list(
	REMOVE_DUPLICATES
	Direct3D_INCLUDE_DIRS
)
# Remove Library duplicates
list(
	REMOVE_DUPLICATES
	Direct3D_LIBRARIES
)

# Advanced
mark_as_advanced(
	Direct3D_Direct3D9_INCLUDE_DIR
	Direct3D_Direct3D9_LIBRARY
	Direct3D_Direct3D10_INCLUDE_DIR
	Direct3D_Direct3D10_LIBRARY
	Direct3D_Direct3D11_INCLUDE_DIR
	Direct3D_Direct3D11_LIBRARY
	Direct3D_Direct3DCompiler_INCLUDE_DIR
	Direct3D_Direct3DCompiler_LIBRARY
	Direct3D_INCLUDE_DIRS
	Direct3D_LIBRARIES
)

