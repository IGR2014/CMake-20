# - Check Compiler
# checks compiler version
#


# Include guard
include_guard(GLOBAL)


# Set usefull compiler warnings
function (
	set_compiler_warnings
)

	# Check compiler is Clang
	if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")

		# Clang minimum required version
		set(
			PROJECT_COMPILER_VERSION_MINIMUM
			"16.0.0"
		)

	# Check compiler is MSVC
	elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")

		# MSVC minimum required version
		set(
			PROJECT_COMPILER_VERSION_MINIMUM
			"19.30.0"
		)

	# Check compiler is GCC
	elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")

		# GCC minimum required version
		set(
			PROJECT_COMPILER_VERSION_MINIMUM
			"12.0.0"
		)

	# Unknown compiler
	else ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")

		# Placeholder minimum required version
		set(
			PROJECT_COMPILER_VERSION_MINIMUM
			"0.0.0"
		)
		# Error message
		message(
			FATAL_ERROR
			"Unknown/unsupported compiler ${CMAKE_CXX_COMPILER_ID}!"
		)
		# Exit function
		return()

	endif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")

	# Check version
	if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "${PROJECT_COMPILER_VERSION_MINIMUM}")

		# Error message
		message(
			FATAL_ERROR
			"Unsupported ${CMAKE_CXX_COMPILER_ID} version: ${PROJECT_COMPILER_VERSION_MINIMUM}+ required, ${CMAKE_CXX_COMPILER_VERSION} found!"
		)
		# Exit function
		return()

	endif (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "${PROJECT_COMPILER_VERSION_MINIMUM}")

	# MSVC compiler flags
	set(
		PROJECT_MSVC_COMPILER_FLAGS
		/W4 # warn usefull warnings
		/permissive- # warn if non-standard C++ is used
		/WX # warnings as errors
		/w14242 # 'identifier': conversion from 'type1' to 'type1', possible loss of data
		/w14254 # 'operator': conversion from 'type1:field_bits' to 'type2:field_bits', possible loss of data
		/w14263 # 'function': member function does not override any base class virtual member function
		/w14265 # 'classname': class has virtual functions, but destructor is not virtual instances of this class may not be destructed correctly
		/w14287 # 'operator': unsigned/negative constant mismatch
		/we4289 # nonstandard extension used: 'variable': loop control variable declared in the for-loop is used outside the for-loop scope
		/w14296 # 'operator': expression is always 'boolean_value'
		/w14311 # 'variable': pointer truncation from 'type1' to 'type2'
		/w14545 # expression before comma evaluates to a function which is missing an argument list
		/w14546 # function call before comma missing argument list
		/w14547 # 'operator': operator before comma has no effect; expected operator with side-effect
		/w14549 # 'operator': operator before comma has no effect; did you intend 'operator'?
		/w14555 # expression has no effect; expected expression with side- effect
		/w14619 # pragma warning: there is no warning number 'number'
		/w14640 # Enable warning on thread un-safe static member initialization
		/w14826 # Conversion from 'type1' to 'type_2' is sign-extended. This may cause unexpected runtime behavior.
		/w14905 # wide string literal cast to 'LPSTR'
		/w14906 # string literal cast to 'LPWSTR'
		/w14928 # illegal copy-initialization; more than one user-defined conversion has been implicitly applied
		/DNOMINMAX # Define NOMINMAX
	)

	# GNU compiler flags
	set(
		PROJECT_GNU_COMPILER_FLAGS
		-Wall # warn usefull warnings
		-Wextra # warn even more
		-Wconversion # warn on type conversions that may lose data
		-pedantic # warn if non-standard C++ is used
		-Werror # warnings as errors
		-Wno-comment # don't warn about nested comments
		-Wmisleading-indentation # warn if indentation implies blocks where blocks do not exist
		-Wduplicated-cond # warn if if / else chain has duplicated conditions
		-Wduplicated-branches # warn if if / else branches have duplicated code
		-Wlogical-op # warn about logical operations being used where bitwise were probably wanted
		-Wuseless-cast # warn if you perform a cast to the same type
		-Wno-unknown-pragmas # don't warn about unknown pragmas
		"$<$<BOOL:PROJECT_CXX_COLORED_OUTPUT>:-fdiagnostics-color=always>"
	)

	# Clang compiler flags
	set(
		PROJECT_CLANG_COMPILER_FLAGS
		"$<IF:$<STREQUAL:${CMAKE_CXX_SIMULATE_ID},MSVC>,${PROJECT_MSVC_COMPILER_FLAGS},${PROJECT_GNU_COMPILER_FLAGS}>"
		-Wno-unknown-warning-option # don't warn on unknown flag
		-Wextra-semi # Warn about semicolon after in-class function definition.
		-Wshadow # warn the user if a variable declaration shadows one from a parent context
		-Wnon-virtual-dtor # warn the user if a class with virtual functions has a non-virtual destructor. This helps catch hard to track down memory errors
		-Wold-style-cast # warn for c-style casts
		-Wcast-align # warn for potential performance problem casts
		-Wunused # warn on anything being unused
		-Woverloaded-virtual # warn if you overload (not override) a virtual function
		-Wpedantic # warn if non-standard C++ is used
		-Wsign-conversion # warn on sign conversions
		-Wnull-dereference # warn if a null dereference is detected
		-Wdouble-promotion # warn if float is implicit promoted to double
		-Wformat=2 # warn on security issues around functions that format output (ie printf)
		-Wimplicit-fallthrough # warn on statements that fallthrough without an explicit annotation
		"$<$<BOOL:PROJECT_CXX_COLORED_OUTPUT>:-fcolor-diagnostics>"
	)

	# Compile options
	add_compile_options(
		# Add compiler flags if Clang
		"$<$<CXX_COMPILER_ID:Clang>:${PROJECT_CLANG_COMPILER_FLAGS}>"
		# Add compiler flags if MSVC
		"$<$<CXX_COMPILER_ID:MSVC>:${PROJECT_MSVC_COMPILER_FLAGS}>"
		# Add compiler flags if GCC
		"$<$<CXX_COMPILER_ID:GNU>:${PROJECT_GNU_COMPILER_FLAGS}>"
	)

endfunction (
	set_compiler_warnings
)

