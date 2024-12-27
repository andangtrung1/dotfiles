return {
	"glepnir/lspsaga.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		local lspsaga = require("lspsaga")
		lspsaga.setup({
			lightbulb = {
				enable = false,
			},
			debug = false,
			-- code action title icon
			max_preview_lines = 10,

			finder_action_keys = {
				open = "o",
				vsplit = "s",
				split = "i",
				quit = "q",
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},

			hover = {
				max_width = 0.5,
			},

			code_action_keys = { quit = "q", exec = "<CR>" },
			rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
			border_style = "single",
			rename_prompt_prefix = "➤",
			server_filetype_map = {},
			diagnostic_prefix_format = "%d. ",
		})
	end,
}
