return {
	name = "C debug build",
	builder = function()

		return {
            cmd = { "bash", "-c" },
            args = {
                [[
                mkdir -p ./build &&
                cd ./build &&				
                cmake -DCMAKE_BUILD_TYPE=Debug ../src &&
				cmake --build .
                ]]
            },
            components = {
                { "on_output_quickfix", open = false },
                "default",
            },
		};
	end,
	condition = {
		filtype = {
			"c"
		}
	}
};
