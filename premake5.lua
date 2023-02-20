project "glfw"
	kind "StaticLib"
	staticruntime "on"
	language "C"
	
	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"include/GLFW/*.h",
		"src/context.c",
		"src/egl_context.*",
		"src/init.c",
		"src/input.c",
		"src/internal.h",
		"src/monitor.c",
		"src/null*.*",
		"src/osmesa_context.*",
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c"
	}
	includedirs { "%{IncludeDir.glfw}" }
	filter "system:windows"
		defines "_GLFW_WIN32"
		files
		{
			"src/win32_*.*",
			"src/wgl_context.*"
		}
	filter "system:linux"
		pic "on"
		defines "_GLFW_X11"
		files
		{
			"src/glx_context.*",
			"src/linux*.*",
			"src/posix*.*",
			"src/x11*.*",
			"src/xkb*.*"
		}
	filter "system:macosx"
		defines "_GLFW_COCOA"
		files
		{
			"src/cocoa_*.*",
			"src/posix_thread.h",
			"src/nsgl_context.h",
			"src/egl_context.h",
			"src/osmesa_context.h",
			"src/posix_thread.c",
			"src/nsgl_context.m",
			"src/egl_context.c",
			"src/nsgl_context.m",
			"src/osmesa_context.c",
			"src/posix_module.c"		
		}
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"