return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim"
    },
    config = function()

	local harpoon = require("harpoon");	
	local wk = require("which-key");

	harpoon:setup();

	local tsconf = require("telescope.config").values;
	local function toggle_telescope(harpoon_files)

	    local file_paths = {};
	    for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value);
	    end

	    require("telescope.pickers").new({},{

		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
		    results = file_paths,
		}),
		previewer = tsconf.file_previewer({}),
		sorter = tsconf.generic_sorter({})
	    }):find()
	end

	wk.add({
	    "<leader>h",
	    group = "Harpoon",
	    icon = {
		icon = "󱡁",
		hl = "",
		color = "blue"
	    }
	});

	vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add to menu" });
	vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end, { desc = "Quick menu" });
	vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end, { desc = "Remove current item from list" });
	vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end, { desc = "Clear the list" });

	vim.keymap.set("n", "<leader><C-1>", function() harpoon:list():replace_at(1) end, { desc = "Replace bookmark 1." });
	vim.keymap.set("n", "<leader><C-2>", function() harpoon:list():replace_at(2) end, { desc = "Replace bookmark 2." });
	vim.keymap.set("n", "<leader><C-3>", function() harpoon:list():replace_at(3) end, { desc = "Replace bookmark 3." });
	vim.keymap.set("n", "<leader><C-4>", function() harpoon:list():replace_at(4) end, { desc = "Replace bookmark 4." });

	vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, { desc = "Open bookmark 1."});
	vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, { desc = "Open bookmark 2."});
	vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, { desc = "Open bookmark 3."});
	vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, { desc = "Open bookmark 4."});

	-- Toggle previous & next buffers stored within Harpoon list
	vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end);
	vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end);
    end
}
