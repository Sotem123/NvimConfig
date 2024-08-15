return {
	name = "cmake build",
	builder = function()
		return {
			cmd = { "echo" },
			args = { "real" },
			components = {
				"custom.check_cmake_project",
				{
					"dependencies",
					task_names = {
						{
							cmd = { "echo" },
							args = { "MOARREAL" },
						}
					},
					sequential = true
				},
			},
		}
		-- return {
		-- 	name = "CMake build",
		-- 	strategy = {
		-- 		"orchestrator",
		-- 		tasks = {
		-- 			{ cmd = { "echo" }, args = { "real" }, components = { "custom.check_cmake_project" } },
		-- 			{ cmd = { "echo" }, args = { "real1" } },
		-- 			{ cmd = { "echo" }, args = { "real2" } },
		-- 			{ cmd = { "echo" }, args = { "real3" } },
		-- 			{ cmd = { "echo" }, args = { "real4" } },
		-- 		}
		-- 	}
		-- }
	end
}
