# - Find WindowsKit
# Find the WindowsKit includes and libraries
#
#  WindowsKit_INCLUDE_DIR			- Where to find WindowsKit headers
#  WindowsKit_VERSION 				- WindowsKit library version.
#  WindowsKit_FOUND				- True if WindowsKit found.
#


# Include guard
include_guard()


# Check cached
if (WindowsKit_INCLUDE_DIRS AND WindowsKit_LIBRARIES)

	# Already in cache, be silent
	set(
		WindowsKit_FIND_QUIETLY
		TRUE
	)

endif (WindowsKit_INCLUDE_DIRS AND WindowsKit_LIBRARIES)

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
		${WindowsKit_FIND_QUIETLY}
	)
	set(
		CMAKE_REQUIRED_QUIET_SAVE
		${CMAKE_REQUIRED_QUIET}
	)

	# Not MinGW
	if (NOT MINGW)

		# Get Windows SDK's dir (Windows XP/Vista/7)
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_6_0_A
			"C:/Program Files/Microsoft SDKs/Windows/v6.0A"
		)
		# Get Windows SDK's dir (Windows XP/Vista/7)
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_7_0
			"C:/Program Files/Microsoft SDKs/Windows/v7.0"
		)
		# Get Windows KIT's dir from registry (Windows 8.0)
		get_filename_component(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_0
			"[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows Kits\\Installed Roots;KitsRoot8]" REALPATH
		)
		# Get Windows KIT's dir from registry (Windows 8.1)
		get_filename_component(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1
			"[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows Kits\\Installed Roots;KitsRoot81]" REALPATH
		)
		# Get Windows KIT's dir from registry (Windows 10)
		get_filename_component(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0
			"[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows Kits\\Installed Roots;KitsRoot10]" REALPATH
		)
		# Get Windows KIT's dir from registry (general)
		get_filename_component(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL
			"[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows Kits\\Installed Roots;KitsRoot]" REALPATH
		)

		# WindowsSDK (v6.0A) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_6_0_A
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_6_0_A}/Include"
		)
		# WindowsSDK (v7.0) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_7_0
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_7_0}/Include"
		)
		# WindowsSDK (v8.0) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_0
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_0}/Include/um"
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1}/Include/shared"
		)
		# WindowsSDK (v8.1) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_1
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1}/Include/um"
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1}/Include/shared"
		)

		# Windows Target Platform
		if (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

			# WindowsSDK (v10.0) possible Include paths
			set(
				WindowsKit_INCLUDE_DIR_SEARCH_PATHS_10_0
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0}/Include/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0}/Include/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/shared"
			)
			# WindowsSDK (v??.?) possible Include paths
			set(
				WindowsKit_INCLUDE_DIR_SEARCH_PATHS_GENERAL
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/shared"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include/shared"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include"
			)

		else (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

			# WindowsSDK (v10.0) possible Include paths
			set(
				WindowsKit_INCLUDE_DIR_SEARCH_PATHS_10_0
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0}/Include/*/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0}/Include/*/shared"
			)
			# WindowsSDK (v??.?) possible Include paths
			set(
				WindowsKit_INCLUDE_DIR_SEARCH_PATHS_GENERAL
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include/*/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include/*/shared"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include/shared"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Include"
			)

		endif (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

		# WindowsSDK (v6.0A) possible Library paths
		set(
			WindowsKit_LIBRARY_SEARCH_PATHS_6_0_A
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_6_0_A}/Lib/"
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_6_0_A}/Lib/x64"
		)
		# WindowsSDK (v7.0) possible Library paths
		set(
			WindowsKit_LIBRARY_SEARCH_PATHS_7_0
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_7_0}/Lib/"
			"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_7_0}/Lib/x64"
		)

		# Windows Target Platform
		if (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

			# WindowsSDK (v8.0) possible Library paths
			set(
				WindowsKit_LIBRARY_SEARCH_PATHS_8_0
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_0}/Lib/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_0}/Lib/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um/x64"
			)
			# WindowsSDK (v8.1) possible Library paths
			set(
				WindowsKit_LIBRARY_SEARCH_PATHS_8_1
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1}/Lib/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1}/Lib/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um/x64"
			)
			# WindowsSDK (v10.0) possible Library paths
			set(
				WindowsKit_LIBRARY_SEARCH_PATHS_10_0
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0}/Lib/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0}/Lib/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um/x64"
			)
			# WindowsSDK (v??.?) possible Library paths
			set(
				WindowsKit_LIBRARY_SEARCH_PATHS_GENERAL
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Lib"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Lib/x64"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Lib/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Lib/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/um/x64"
			)

		else (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

			# WindowsSDK (v8.0) possible Library paths
			set(
				WindowsKit_LIBRARY_SEARCH_PATHS_8_0
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_0}/Lib/*/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_0}/Lib/*/um/x64"
			)
			# WindowsSDK (v8.1) possible Library paths
			set(
				WindowsKit_LIBRARY_SEARCH_PATHS_8_1
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1}/Lib/*/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1}/Lib/*/um/x64"
			)
			# WindowsSDK (v10.0) possible Library paths
			set(
				WindowsKit_LIBRARY_SEARCH_PATHS_10_0
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0}/Lib/*/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0}/Lib/*/um/x64"
			)
			# WindowsSDK (v??.?) possible Library paths
			set(
				WindowsKit_LIBRARY_SEARCH_PATHS_GENERAL
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Lib"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Lib/x64"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Lib/*/um"
				"${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL}/Lib/*/um/x64"
			)

		endif (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

	else (NOT MINGW)

		# WindowsSDK (v6.0A) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_6_0_A
			${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES}
		)
		# WindowsSDK (v7.0) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_7_0
			${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES}
		)
		# WindowsSDK (v8.0) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_0
			${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES}
		)
		# WindowsSDK (v8.1) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_1
			${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES}
		)
		# WindowsSDK (v10.0) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_10_0
			${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES}
		)
		# WindowsSDK (v??.?) possible Include paths
		set(
			WindowsKit_INCLUDE_DIR_SEARCH_PATHS_GENERAL
			${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES}
		)

		# WindowsSDK (v6.0A) possible Library paths
		set(
			WindowsKit_LIBRARY_SEARCH_PATHS_6_0_A
			${CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES}
		)
		# WindowsSDK (v7.0) possible Library paths
		set(
			WindowsKit_LIBRARY_SEARCH_PATHS_7_0
			${CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES}
		)
		# WindowsSDK (v8.0) possible Library paths
		set(
			WindowsKit_LIBRARY_SEARCH_PATHS_8_0
			${CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES}
		)
		# WindowsSDK (v8.1) possible Library paths
		set(
			WindowsKit_LIBRARY_SEARCH_PATHS_8_1
			${CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES}
		)
		# WindowsSDK (v10.0) possible Library paths
		set(
			WindowsKit_LIBRARY_SEARCH_PATHS_10_0
			${CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES}
		)
		# WindowsSDK (v??.?) possible Library paths
		set(
			WindowsKit_LIBRARY_SEARCH_PATHS_GENERAL
			${CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES}
		)

	endif (NOT MINGW)

	# Find WindowsSDK header (v6.0A)
	find_path(
		WindowsKit_INCLUDE_DIR_6_0_A
		NAMES windows.h Windows.h
		PATHS ${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_6_0_A}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find WindowsSDK header (v7.0)
	find_path(
		WindowsKit_INCLUDE_DIR_7_0
		NAMES windows.h Windows.h
		PATHS ${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_7_0}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find WindowsKit header (v8.0)
	find_path(
		WindowsKit_INCLUDE_DIR_8_0
		NAMES windows.h Windows.h
		PATHS ${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_0}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find WindowsKit header (v8.1)
	find_path(
		WindowsKit_INCLUDE_DIR_8_1
		NAMES windows.h Windows.h
		PATHS ${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_1}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find WindowsKit header (v10.0)
	find_path(
		WindowsKit_INCLUDE_DIR_10_0
		NAMES windows.h Windows.h
		PATHS ${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_10_0}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find WindowsKit header (v??.?)
	find_path(
		WindowsKit_INCLUDE_DIR_GENERAL
		NAMES windows.h Windows.h
		PATHS ${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_GENERAL}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)

	# WindowsSDK found v6.0A
	if (WindowsKit_INCLUDE_DIR_6_0_A)

		# WindowsSDK Includes
		set(
			WindowsKit_INCLUDE_DIR_PATHS
			${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_6_0_A}
		)

		# WindowsSDK Libraries
		set(
			WindowsKit_LIBRARY_PATHS
			${WindowsKit_LIBRARY_SEARCH_PATHS_6_0_A}
		)

		# WindowsSDK version
		set(
			WindowsKit_VERSION
			"6.0"
		)

	endif (WindowsKit_INCLUDE_DIR_6_0_A)

	# WindowsSDK found v7.0
	if (WindowsKit_INCLUDE_DIR_7_0)

		# WindowsSDK Includes
		set(
			WindowsKit_INCLUDE_DIR_PATHS
			${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_7_0}
		)

		# WindowsSDK Libraries
		set(
			WindowsKit_LIBRARY_PATHS
			${WindowsKit_LIBRARY_SEARCH_PATHS_7_0}
		)

		# WindowsSDK version
		set(
			WindowsKit_VERSION
			"7.0"
		)

	endif (WindowsKit_INCLUDE_DIR_7_0)

	# WindowsKit found v8.0
	if (WindowsKit_INCLUDE_DIR_8_0)

		# WindowsKit Includes
		set(
			WindowsKit_INCLUDE_DIR_PATHS
			${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_0}
		)

		# WindowsKit Libraries
		set(
			WindowsKit_LIBRARY_PATHS
			${WindowsKit_LIBRARY_SEARCH_PATHS_8_0}
		)

		# WindowsKit version
		set(
			WindowsKit_VERSION
			"8.0"
		)

	endif (WindowsKit_INCLUDE_DIR_8_0)

	# WindowsKit found v8.1
	if (WindowsKit_INCLUDE_DIR_8_1)

		# WindowsKit Includes
		set(
			WindowsKit_INCLUDE_DIR_PATHS
			${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_1}
		)

		# WindowsKit Libraries
		set(
			WindowsKit_LIBRARY_PATHS
			${WindowsKit_LIBRARY_SEARCH_PATHS_8_1}
		)

		# WindowsKit version
		set(
			WindowsKit_VERSION
			"8.1"
		)

	endif (WindowsKit_INCLUDE_DIR_8_1)

	# WindowsKit found v10.0
	if (WindowsKit_INCLUDE_DIR_10_0)

		# WindowsKit Includes
		set(
			WindowsKit_INCLUDE_DIR_PATHS
			${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_10_0}
		)

		# WindowsKit Libraries
		set(
			WindowsKit_LIBRARY_PATHS
			${WindowsKit_LIBRARY_SEARCH_PATHS_10_0}
		)

		# Windows Target Platform
		if (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

			# WindowsKit version
			set(
				WindowsKit_VERSION
				${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}
			)

		else (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

			# WindowsKit version
			set(
				WindowsKit_VERSION
				"10.0"
			)

		endif (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

	endif (WindowsKit_INCLUDE_DIR_10_0)

	# WindowsKit found v??.?
	if (WindowsKit_INCLUDE_DIR_GENERAL)

		# WindowsKit Includes
		set(
			WindowsKit_INCLUDE_DIR_PATHS
			${WindowsKit_INCLUDE_DIR_SEARCH_PATHS_GENERAL}
		)

		# WindowsKit Libraries
		set(
			WindowsKit_LIBRARY_PATHS
			${WindowsKit_LIBRARY_SEARCH_PATHS_GENERAL}
		)

		# Windows Target Platform
		if (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

			# WindowsKit version
			set(
				WindowsKit_VERSION
				${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}
			)

		else (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

			# WindowsKit version
			set(
				WindowsKit_VERSION
				${CMAKE_SYSTEM_VERSION}
			)

		endif (NOT "${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}" STREQUAL "")

	endif (WindowsKit_INCLUDE_DIR_GENERAL)

	# WindowsKit Includes
	set(
		WindowsKit_INCLUDE_DIRS
		${WindowsKit_INCLUDE_DIR_PATHS}
	)
	# WindowsKit User32 Includes
	set(
		WindowsKit_LibUser32_INCLUDE_DIR
		${WindowsKit_INCLUDE_DIR_PATHS}
	)
	# WindowsKit Version Includes
	set(
		WindowsKit_LibVersion_INCLUDE_DIR
		${WindowsKit_INCLUDE_DIR_PATHS}
	)

	# Find User32 Library
	find_library(
		WindowsKit_LibUser32_LIBRARY
		NAMES user32 User32
		PATHS ${WindowsKit_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find Version Library
	find_library(
		WindowsKit_LibVersion_LIBRARY
		NAMES version Version
		PATHS ${WindowsKit_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)

	# User32 Library
	if (WindowsKit_LibUser32_LIBRARY)

		# WindowsKit Libraries
		list(
			APPEND
			WindowsKit_LIBRARIES
			${WindowsKit_LibUser32_LIBRARY}
		)
		# User32 Library found
		set(
			WindowsKit_LibUser32_FOUND
			TRUE
		)

	endif (WindowsKit_LibUser32_LIBRARY)

	# Version Library
	if (WindowsKit_LibVersion_LIBRARY)

		# WindowsKit Libraries
		list(
			APPEND
			WindowsKit_LIBRARIES
			${WindowsKit_LibVersion_LIBRARY}
		)
		# Version Library found
		set(
			WindowsKit_LibVersion_FOUND
			TRUE
		)

	endif (WindowsKit_LibVersion_LIBRARY)

	# Handle the QUIETLY and REQUIRED arguments and set WindowsKit_FOUND to TRUE if
	# all listed variables are TRUE.
	include(FindPackageHandleStandardArgs)
	find_package_handle_standard_args(
		WindowsKit
		REQUIRED_VARS WindowsKit_LibUser32_FOUND WindowsKit_LibVersion_FOUND
		VERSION_VAR WindowsKit_VERSION
		HANDLE_COMPONENTS
	)

	# WindowsKit::LibUser32 target
	if (WindowsKit_LibUser32_FOUND AND NOT TARGET WindowsKit::LibUser32)

		# Absolute path
		if (IS_ABSOLUTE ${WindowsKit_LibUser32_LIBRARY})

			add_library(
				WindowsKit::LibUser32
				UNKNOWN IMPORTED
			)
			set_target_properties(
				WindowsKit::LibUser32
				PROPERTIES
				IMPORTED_LOCATION ${WindowsKit_LibUser32_LIBRARY}
			)

		# Library
		else (IS_ABSOLUTE ${WindowsKit_LibUser32_LIBRARY})

			add_library(
				WindowsKit::LibUser32
				INTERFACE IMPORTED
			)
			set_target_properties(
				WindowsKit::LibUser32
				PROPERTIES
				IMPORTED_LIBNAME ${WindowsKit_LibUser32_LIBRARY}
			)

		endif (IS_ABSOLUTE ${WindowsKit_LibUser32_LIBRARY})

		# Common
		set_target_properties(
			WindowsKit::LibUser32
			PROPERTIES
			INTERFACE_LINK_LIBRARIES ${WindowsKit_LibUser32_LIBRARY}
			INTERFACE_INCLUDE_DIRECTORIES "${WindowsKit_LibUser32_INCLUDE_DIR}"
		)

	endif (WindowsKit_LibUser32_FOUND AND NOT TARGET WindowsKit::LibUser32)

	# WindowsKit::LibVersion target
	if (WindowsKit_LibVersion_FOUND AND NOT TARGET WindowsKit::LibVersion)

		# Absolute path
		if (IS_ABSOLUTE ${WindowsKit_LibVersion_LIBRARY})

			add_library(
				WindowsKit::LibVersion
				UNKNOWN IMPORTED
			)
			set_target_properties(
				WindowsKit::LibVersion
				PROPERTIES
				IMPORTED_LOCATION ${WindowsKit_LibVersion_LIBRARY}
			)

		# Library
		else (IS_ABSOLUTE ${WindowsKit_LibVersion_LIBRARY})

			add_library(
				WindowsKit::LibVersion
				INTERFACE IMPORTED
			)
			set_target_properties(
				WindowsKit::LibVersion
				PROPERTIES
				IMPORTED_LIBNAME ${WindowsKit_LibVersion_LIBRARY}
			)

		endif (IS_ABSOLUTE ${WindowsKit_LibVersion_LIBRARY})

		# Common
		set_target_properties(
			WindowsKit::LibVersion
			PROPERTIES
			INTERFACE_LINK_LIBRARIES ${WindowsKit_LibVersion_LIBRARY}
			INTERFACE_INCLUDE_DIRECTORIES "${WindowsKit_LibVersion_INCLUDE_DIR}"
		)

	endif (WindowsKit_LibVersion_FOUND AND NOT TARGET WindowsKit::LibVersion)

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

# Advanced
mark_as_advanced(
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_6_0_A
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_7_0
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_0
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_8_1
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_10_0
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_BASE_GENERAL
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_6_0_A
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_7_0
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_0
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_8_1
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_10_0
	WindowsKit_INCLUDE_DIR_SEARCH_PATHS_GENERAL
	WindowsKit_INCLUDE_DIR_6_0_A
	WindowsKit_INCLUDE_DIR_7_0
	WindowsKit_INCLUDE_DIR_8_0
	WindowsKit_INCLUDE_DIR_8_1
	WindowsKit_INCLUDE_DIR_10_0
	WindowsKit_INCLUDE_DIR_GENERAL
	WindowsKit_LibUser32_INCLUDE_DIR
	WindowsKit_LibVersion_INCLUDE_DIR
	WindowsKit_LIBRARY_SEARCH_PATHS_6_0_A
	WindowsKit_LIBRARY_SEARCH_PATHS_7_0
	WindowsKit_LIBRARY_SEARCH_PATHS_8_0
	WindowsKit_LIBRARY_SEARCH_PATHS_8_1
	WindowsKit_LIBRARY_SEARCH_PATHS_10_0
	WindowsKit_LIBRARY_SEARCH_PATHS_GENERAL
	WindowsKit_LibUser32_LIBRARY
	WindowsKit_LibVersion_LIBRARY
)

