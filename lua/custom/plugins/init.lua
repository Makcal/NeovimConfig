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
	-- install with yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npx --yes yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			-- Disable virtual_text since it's redundant due to lsp_lines.
			vim.diagnostic.config({
				virtual_text = false,
			})
            require('lsp_lines').setup()
		end,
        dependencies = {
            "neovim/nvim-lspconfig"
        },
		lazy = false,
	},
}
return plugins
