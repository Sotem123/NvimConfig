return {
	name = "cmake build",
	builder = function()
		return {
			name = "cmake and debug",
			strategy = {
				"orchestrator",
				tasks = {
					-- { cmd = { "mkdir" }, args = { "-p", "build" } },
					-- { cmd = { "cd" },    args = { "build" } },
					-- { cmd = { "cmake" }, args = { "../src" } },
					{
						cmd = { "echo" },
						args = { "gelukt" },
						components = {
							"custom.kanker",
							"default"
						},
					},
					{
						cmd = { "echo" },
						args = { "JEWEtende" },
						components = {
							"custom.kanker",
							"default"
						},
					},
				}
			}
		}
	end
}
