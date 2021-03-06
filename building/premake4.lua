solution "6502"
	configurations {
		"Release-Dynamic", "Release-Dynamic-Module", "Release-Static", "Release-Static-Module",
		"Debug-Dynamic", "Debug-Dynamic-Module", "Debug-Static", "Debug-Static-Module"
	}

	project "6502"
		language "C"
		flags {"ExtraWarnings"}
		files {"../sources/**.c"}
		includedirs {"../API"}
		--buildoptions {"-std=c89 -pedantic -Wall -Weverything"}

		configuration "Release*"
			targetdir "lib/release"

		configuration "Debug*"
			flags {"Symbols"}
			targetdir "lib/debug"

		configuration "*Dynamic*"
			kind "SharedLib"

		configuration "*Dynamic-Module"
			defines {"CPU_6502_BUILD_MODULE_ABI"}
			targetprefix ""
			targetextension ".CPU"

		configuration "*Static*"
			kind "StaticLib"
			defines {"CPU_6502_STATIC"}

		configuration "*Static-Module"
			defines {"CPU_6502_BUILD_ABI"}
