# - Find GDI
# Find the GDI includes and libraries
#
#  Gdi_INCLUDE_DIRS				- where to find windows.h for GDI32 or gdiplus.h for GDI+
#  Gdi_LIBRARIES				- List of libraries when using GDI.
#  Gdi_VERSION 					- GDI library version ("1.0" for GDI32 or "2.0" for GDI+).
#  Gdi_FOUND					- True if GDI found.
#
#  Gdi_Gdi32_INCLUDE_DIR			- where to find windows.h
#  Gdi_Gdi32_LIBRARY				- List of libraries when using GDI32.
#  Gdi_Gdi32_FOUND				- True if GDI32 found.
#
#  Gdi_GdiPlus_INCLUDE_DIR			- where to find gdiplus.h
#  Gdi_GdiPlus_LIBRARY				- List of libraries when using GDI+.
#  Gdi_GdiPlus_FOUND				- True if GDI+ found.
#


# Include guard
include_guard()


# Check cached
if (Gdi_INCLUDE_DIRS AND Gdi_LIBRARIES)

	# Already in cache, be silent
	set(
		Gdi_FIND_QUIETLY
		TRUE
	)

endif (Gdi_INCLUDE_DIRS AND Gdi_LIBRARIES)

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
		${Gdi_FIND_QUIETLY}
	)
	set(
		CMAKE_REQUIRED_QUIET_SAVE
		${CMAKE_REQUIRED_QUIET}
	)

	# WindowsKit package required
	find_package(
		WindowsKit 6.0 REQUIRED
	)

	# GDI search paths
	set(
		Gdi_INCLUDE_DIR_PATHS
		${WindowsKit_INCLUDE_DIR_PATHS}
	)
	set(
		Gdi_LIBRARY_PATHS
		${WindowsKit_LIBRARY_PATHS}
	)

	# Find GDI32 header
	find_path(
		Gdi_Gdi32_INCLUDE_DIR
		NAMES windows.h
		PATHS ${Gdi_INCLUDE_DIR_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find GDI+ header
	find_path(
		Gdi_GdiPlus_INCLUDE_DIR
		NAMES GdiPlus.h gdiplus.h
		PATHS ${Gdi_INCLUDE_DIR_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)

	# GDI32 found
	if (Gdi_Gdi32_INCLUDE_DIR)

		# GDI32 Includes
		list(
			APPEND
			Gdi_INCLUDE_DIRS
			${Gdi_Gdi32_INCLUDE_DIR}
		)
		# GDI32 found
		set(
			Gdi_Gdi32_FOUND
			TRUE
		)

	endif (Gdi_Gdi32_INCLUDE_DIR)

	# GDI+ found
	if (Gdi_GdiPlus_INCLUDE_DIR)

		# GDI+ Includes
		list(
			APPEND
			Gdi_INCLUDE_DIRS
			${Gdi_GdiPlus_INCLUDE_DIR}
		)
		# GDI+ found
		set(
			Gdi_GdiPlus_FOUND
			TRUE
		)

	endif (Gdi_GdiPlus_INCLUDE_DIR)

	# Find GDI32 Library
	find_library(
		Gdi_Gdi32_LIBRARY
		NAMES libgdi32 gdi32
		PATHS ${Gdi_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)
	# Find GDI+ Library
	find_library(
		Gdi_GdiPlus_LIBRARY
		NAMES libgdiplus gdiplus
		PATHS ${Gdi_LIBRARY_PATHS}
		NO_DEFAULT_PATH
		NO_CMAKE_SYSTEM_PATH
	)

	# GDI+ Libraries
	if (Gdi_Gdi32_LIBRARY)

		# GDI Libraries
		list(
			APPEND
			Gdi_LIBRARIES
			${Gdi_Gdi32_LIBRARY}
		)
		# GDI+ found
		set(
			Gdi_Gdi32_FOUND
			TRUE
		)
		# GDI+ version
		set(
			Gdi_VERSION
			"1.0"
		)

	endif (Gdi_Gdi32_LIBRARY)

	# GDI+ Libraries
	if (Gdi_GdiPlus_LIBRARY)

		# GDI Libraries
		list(
			APPEND
			Gdi_LIBRARIES
			${Gdi_GdiPlus_LIBRARY}
		)
		# GDI+ found
		set(
			Gdi_GdiPlus_FOUND
			TRUE
		)
		# GDI+ version
		set(
			Gdi_VERSION
			"2.0"
		)

	endif (Gdi_GdiPlus_LIBRARY)

	# Handle the QUIETLY and REQUIRED arguments and set Gdi_FOUND to TRUE if
	# all listed variables are TRUE.
	include(FindPackageHandleStandardArgs)
	find_package_handle_standard_args(
		Gdi
		REQUIRED_VARS Gdi_Gdi32_FOUND Gdi_GdiPlus_FOUND
		VERSION_VAR Gdi_VERSION
		HANDLE_COMPONENTS
	)

	# Gdi::Gdi32 target
	if (Gdi_Gdi32_FOUND AND NOT TARGET Gdi::Gdi32)

		# Absolute path
		if (IS_ABSOLUTE ${Gdi_Gdi32_LIBRARY})

			add_library(
				Gdi::Gdi32
				UNKNOWN IMPORTED
			)
			set_target_properties(
				Gdi::Gdi32
				PROPERTIES
				IMPORTED_LOCATION ${Gdi_Gdi32_LIBRARY}
			)

		# Library
		else (IS_ABSOLUTE ${Gdi_Gdi32_LIBRARY})

			add_library(
				Gdi::Gdi32
				INTERFACE IMPORTED
			)
			set_target_properties(
				Gdi::Gdi32
				PROPERTIES
				IMPORTED_LIBNAME ${Gdi_Gdi32_LIBRARY}
			)

		endif (IS_ABSOLUTE ${Gdi_Gdi32_LIBRARY})

		# Common
		set_target_properties(
			Gdi::Gdi32
			PROPERTIES
			INTERFACE_LINK_LIBRARIES ${Gdi_Gdi32_LIBRARY}
			INTERFACE_INCLUDE_DIRECTORIES ${Gdi_Gdi32_INCLUDE_DIR}
		)

	endif (Gdi_Gdi32_FOUND AND NOT TARGET Gdi::Gdi32)

	# Gdi::GdiPlus target
	if (Gdi_GdiPlus_FOUND AND NOT TARGET Gdi::GdiPlus)

		# Absolute path
		if (IS_ABSOLUTE ${Gdi_GdiPlus_LIBRARY})

			add_library(
				Gdi::GdiPlus
				UNKNOWN IMPORTED
			)
			set_target_properties(
				Gdi::GdiPlus
				PROPERTIES
				IMPORTED_LOCATION ${Gdi_GdiPlus_LIBRARY}
			)

		# Library
		else (IS_ABSOLUTE ${Gdi_GdiPlus_LIBRARY})

			add_library(
				Gdi::GdiPlus
				INTERFACE IMPORTED
			)
			set_target_properties(
				Gdi::GdiPlus
				PROPERTIES
				IMPORTED_LIBNAME ${Gdi_GdiPlus_LIBRARY}
			)

		endif (IS_ABSOLUTE ${Gdi_GdiPlus_LIBRARY})

		# Common
		set_target_properties(
			Gdi::GdiPlus
			PROPERTIES
			INTERFACE_LINK_LIBRARIES ${Gdi_GdiPlus_LIBRARY}
			INTERFACE_INCLUDE_DIRECTORIES ${Gdi_GdiPlus_INCLUDE_DIR}
		)

	endif (Gdi_GdiPlus_FOUND AND NOT TARGET Gdi::GdiPlus)

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
	Gdi_Gdi32_INCLUDE_DIR
	Gdi_GdiPlus_INCLUDE_DIR
	Gdi_INCLUDE_DIR_PATHS
	Gdi_INCLUDE_DIRS
	Gdi_Gdi32_LIBRARY
	Gdi_GdiPlus_LIBRARY
	Gdi_LIBRARIES
)

