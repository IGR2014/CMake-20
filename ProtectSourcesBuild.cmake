# Build in Source protection
file(
	TO_CMAKE_PATH
	"${PROJECT_BINARY_DIR}/CMakeLists.txt"
	LOC_PATH
)
# Check existance
if (EXISTS "${LOC_PATH}")
	# Error message
	message(
		FATAL_ERROR
		"Cannot build in a source directory (or any with CMakeLists.txt)!"
	)
endif (EXISTS "${LOC_PATH}")

