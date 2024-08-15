local fh = require("file_helpers");
local log = require("overseer.log");

function Dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. Dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


return {
	desc = "Validate whether or not the given file exists.",
	-- Define parameters that can be passed in to the component
	params = {},
	-- Optional, default true. Set to false to disallow editing this component in the task editor
	editable = true,
	-- Optional, default true. When false, don't serialize this component when saving a task to disk
	serializable = true,
	-- The params passed in will match the params defined above
	constructor = function(params)
		-- You may optionally define any of the methods below
		return {
			on_pre_start = function(self, task)
				local currentDir = vim.fn.expand("%:p:h");
				local cmakePath = currentDir .. "/CMakeLists.txt";

				--log:error(Dump(task));

				--log:error(Dump(task.dependencies));
				log:error(require("overseer.task_list"));

				if (fh.FileExists(cmakePath)) then
					return true;
				else
					log:error("This tasks should be run from a directory containing CMakeLists.txt");
					task:dispose(true);
					return false;
				end
			end,
		}
	end,
}
