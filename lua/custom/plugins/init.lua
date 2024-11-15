local plugins = {
	{
		"williamboman/mason.nvim",
		-- opts = {
		-- 	ensure_installed = {
		-- 		"pyright",
		-- 	},
		-- },
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = {
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undotree" },
		},
		opts = {
			keymaps = {
				["<Down>"] = "move_next",
				["<Up>"] = "move_prev",
			},
		},
	},
	{
		"tpope/vim-surround",
		lazy = false,
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
	},
	{
		"nvzone/volt",
		lazy = true,
	},
	{
		"nvzone/menu",
		lazy = false,
	},
	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
	},
	{
		"nvchad/base46",
		lazy = false,
	},
}
return plugins
