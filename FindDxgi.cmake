# - Find Dxgi
# Find the Dxgi includes and libraries
#
#  Dxgi_INCLUDE_DIR	- Where to find Dxgi headers
#  Dxgi_LIBRARY		- List of libraries when using Dxgi.
#  Dxgi_VERSION 	- Dxgi library version.
#  Dxgi_FOUND		- True if Dxgi found.
#


# Check cached
if (Dxgi_INCLUDE_DIRS AND Dxgi_LIBRARIES)

	# Already in cache, be silent
	set(
		Dxgi_FIND_QUIETLY
		TRUE
	)

endif (Dxgi_INCLUDE_DIRS AND Dxgi_LIBRARIES)

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
		${Dxgi_FIND_QUIETLY}
	)
	set(
		CMAKE_REQUIRED_QUIET_SAVE
		${CMAKE_REQUIRED_QUIET}
	)

	# WindowsKit package required
	find_package(
		WindowsKit 6.0 REQUIRED
	)

	# Dxgi Search paths
	set(
		Dxgi_INCLUDE_DIR_PATHS
		${WindowsKit_INCLUDE_DIR_PATHS}
	)
	set(
		Dxgi_LIBRARY_PATHS
		${WindowsKit_LIBRARY_PATHS}
	)

	# Find Dxgi header
	find_path(
		Dxgi_Dxgi_INCLUDE_DIR
		NAMES dxgi1_6.h dxgi1_5.h dxgi1_4.h dxgi1_3.h dxgi1_2.h dxgi.h dxgi.h
		PATHS ${Dxgi_INCLUDE_DIR_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)

	# Dxgi found
	if (Dxgi_Dxgi_INCLUDE_DIR)

		# Dxgi Includes
		list(
			APPEND
			Dxgi_INCLUDE_DIRS
			${Dxgi_Dxgi_INCLUDE_DIR}
		)
		# Dxgi found
		set(
			Dxgi_Dxgi_FOUND
			TRUE
		)

		# Check if file exists
		if (EXISTS "${Dxgi_Dxgi_INCLUDE_DIR}/dxgi1_6.h")

			# Dxgi major version
			set(
				Dxgi_VERSION_MAJOR_STR
				"1"
			)
			# Dxgi minor version
			set(
				Dxgi_VERSION_MINOR_STR
				"6"
			)

		elseif (EXISTS "${Dxgi_Dxgi_INCLUDE_DIR}/dxgi1_5.h")

			# Dxgi major version
			set(
				Dxgi_VERSION_MAJOR_STR
				"1"
			)
			# Dxgi minor version
			set(
				Dxgi_VERSION_MINOR_STR
				"5"
			)

		elseif (EXISTS "${Dxgi_Dxgi_INCLUDE_DIR}/dxgi1_4.h")

			# Dxgi major version
			set(
				Dxgi_VERSION_MAJOR_STR
				"1"
			)
			# Dxgi minor version
			set(
				Dxgi_VERSION_MINOR_STR
				"4"
			)

		elseif (EXISTS "${Dxgi_Dxgi_INCLUDE_DIR}/dxgi1_3.h")

			# Dxgi major version
			set(
				Dxgi_VERSION_MAJOR_STR
				"1"
			)
			# Dxgi minor version
			set(
				Dxgi_VERSION_MINOR_STR
				"3"
			)

		elseif (EXISTS "${Dxgi_Dxgi_INCLUDE_DIR}/dxgi1_2.h")

			# Dxgi major version
			set(
				Dxgi_VERSION_MAJOR_STR
				"1"
			)
			# Dxgi minor version
			set(
				Dxgi_VERSION_MINOR_STR
				"2"
			)

		elseif (EXISTS "${Dxgi_Dxgi_INCLUDE_DIR}/dxgi.h")

			# Dxgi IID_IDXGIFactory1
			file(
				STRINGS "${Direct3D_Direct3D11_INCLUDE_DIR}/dxgi.h"
				Dxgi_VERSION_1_0_STR
				REGEX "IID_IDXGIFactory1"
			)

			# If Dxgi version ok
			if ("${Dxgi_VERSION_1_0_STR}" STREQUAL "")

				# Dxgi major version
				set(
					Dxgi_VERSION_MAJOR_STR
					"1"
				)
				# Dxgi minor version
				set(
					Dxgi_VERSION_MINOR_STR
					"0"
				)

			else ("${Dxgi_VERSION_1_0_STR}" STREQUAL "")

				# Dxgi major version
				set(
					Dxgi_VERSION_MAJOR_STR
					"1"
				)
				# Dxgi minor version
				set(
					Dxgi_VERSION_MINOR_STR
					"1"
				)

			endif ("${Dxgi_VERSION_1_0_STR}" STREQUAL "")

		else (EXISTS "${Dxgi_Dxgi_INCLUDE_DIR}/dxgi1_6.h")

			# Dxgi major version
			set(
				Dxgi_VERSION_MAJOR_STR
				"0"
			)
			# Dxgi minor version
			set(
				Dxgi_VERSION_MINOR_STR
				"0"
			)

		endif (EXISTS "${Dxgi_Dxgi_INCLUDE_DIR}/dxgi1_6.h")

		# Dxgi version
		set(
			Dxgi_VERSION_STR
			"${Dxgi_VERSION_MAJOR_STR}.${Dxgi_VERSION_MINOR_STR}"
		)

		# Check
		if (Dxgi_VERSION_STR)

			# Dxgi version
			set(
				Dxgi_Dxgi_VERSION
				${Dxgi_VERSION_STR}
			)
			# Dxgi version
			set(
				Dxgi_VERSION
				${Dxgi_Dxgi_VERSION}
			)

		endif (Dxgi_VERSION_STR)

	endif (Dxgi_Dxgi_INCLUDE_DIR)

	# Find Dxgi Library
	find_library(
		Dxgi_Dxgi_LIBRARY
		NAMES DXGI dxgi
		PATHS ${Dxgi_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find Dxgi GUID Library
	find_library(
		Dxgi_Guid_LIBRARY
		NAMES DXGUID dxguid
		PATHS ${Dxgi_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)

	# Dxgi Libraries
	if (Dxgi_Dxgi_LIBRARY)

		# Dxgi Libraries
		list(
			APPEND
			Dxgi_LIBRARIES
			${Dxgi_Dxgi_LIBRARY}
		)
		# Dxgi DXGI Library found
		set(
			Dxgi_Dxgi_FOUND
			TRUE
		)

	endif (Dxgi_Dxgi_LIBRARY)

	# Dxgi GUID Libraries
	if (Dxgi_Guid_LIBRARY)

		# Dxgi Libraries
		list(
			APPEND
			Dxgi_LIBRARIES
			${Dxgi_Guid_LIBRARY}
		)
		# Dxgi GUID Library found
		set(
			Dxgi_Guid_FOUND
			TRUE
		)

	endif (Dxgi_Guid_LIBRARY)

	# Handle the QUIETLY and REQUIRED arguments and set Dxgi_FOUND to TRUE if
	# all listed variables are TRUE.
	include(FindPackageHandleStandardArgs)
	find_package_handle_standard_args(
		Dxgi
		REQUIRED_VARS Dxgi_Dxgi_FOUND Dxgi_Guid_FOUND
		VERSION_VAR Dxgi_VERSION
		HANDLE_COMPONENTS
	)

	# Dxgi::Dxgi target
	if (Dxgi_Dxgi_FOUND AND NOT TARGET Dxgi::Dxgi)

		# Absolute path
		if (IS_ABSOLUTE ${Dxgi_Dxgi_LIBRARY})

			add_library(
				Dxgi::Dxgi
				UNKNOWN IMPORTED
			)
			set_target_properties(
				Dxgi::Dxgi
				PROPERTIES
				IMPORTED_LOCATION ${Dxgi_Dxgi_LIBRARY}
			)

		else (IS_ABSOLUTE ${Dxgi_Dxgi_LIBRARY})

			add_library(
				Dxgi::Dxgi
				INTERFACE IMPORTED
			)
			set_target_properties(
				Dxgi::Dxgi
				PROPERTIES
				IMPORTED_LIBNAME ${Dxgi_Dxgi_LIBRARY}
			)

		endif (IS_ABSOLUTE ${Dxgi_Dxgi_LIBRARY})

		set_target_properties(
			Dxgi::Dxgi
			PROPERTIES
			INTERFACE_LINK_LIBRARIES ${Dxgi_Dxgi_LIBRARY}
			INTERFACE_INCLUDE_DIRECTORIES ${Dxgi_Dxgi_INCLUDE_DIR}
		)

	endif (Dxgi_Dxgi_FOUND AND NOT TARGET Dxgi::Dxgi)

	# Dxgi::Guid target
	if (Dxgi_Guid_FOUND AND NOT TARGET Dxgi::Guid)

		# Absolute path
		if (IS_ABSOLUTE ${Dxgi_Guid_LIBRARY})

			add_library(
				Dxgi::Guid
				UNKNOWN IMPORTED
			)
			set_target_properties(
				Dxgi::Guid
				PROPERTIES
				IMPORTED_LOCATION ${Dxgi_Guid_LIBRARY}
			)

		else (IS_ABSOLUTE ${Dxgi_Guid_LIBRARY})

			add_library(
				Dxgi::Guid
				INTERFACE IMPORTED
			)
			set_target_properties(
				Dxgi::Guid
				PROPERTIES
				IMPORTED_LIBNAME ${Dxgi_Guid_LIBRARY}
			)

		endif (IS_ABSOLUTE ${Dxgi_Guid_LIBRARY})

		set_target_properties(
			Dxgi::Guid
			PROPERTIES
			INTERFACE_LINK_LIBRARIES ${Dxgi_Guid_LIBRARY}
			INTERFACE_INCLUDE_DIRECTORIES ${Dxgi_Dxgi_INCLUDE_DIR}
		)

	endif (Dxgi_Guid_FOUND AND NOT TARGET Dxgi::Guid)

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
	Dxgi_Dxgi_INCLUDE_DIR
	Dxgi_Dxgi_LIBRARY
	Dxgi_Guid_LIBRARY
)

