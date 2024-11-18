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
		"Issafalcon/lsp-overloads.nvim",
		lazy = false,
		config = {
			display_automatically = true,
		},
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
}
return plugins
