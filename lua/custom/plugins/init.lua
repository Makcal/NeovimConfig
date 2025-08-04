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
				virtual_lines = true,
			})
			require("lsp_lines").setup()
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		lazy = false,
	},
	{
		"dccsillag/magma-nvim",
		lazy = false,
	},
	-- {
	-- 	"Wansmer/langmapper.nvim",
	-- 	lazy = false,
	-- 	priority = 1, -- High priority is needed if you will use `autoremap()`
	-- 	config = function()
	-- 		require("langmapper").setup({--[[ your config ]]
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- 	dependencies = {
	-- 		"zbirenbaum/copilot.lua",
	-- 		cmd = "Copilot",
	-- 		config = function()
	-- 			require("copilot").setup({
	-- 				suggestion = { enabled = false },
	-- 				panel = { enabled = false },
	-- 			})
	-- 		end,
	-- 	},
	-- },
	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		ft = { "scala", "sbt", "java" },
		opts = function()
			local metals_config = require("metals").bare_config()
			metals_config.on_attach = function(client)
				local config = require("nvchad.configs.lspconfig")
				--- Guard against servers without the signatureHelper capability
				if client.server_capabilities.signatureHelpProvider then
					require("lsp-overloads").setup(client, {})
				end
				config.on_attach()
			end

			return metals_config
		end,
		config = function(self, metals_config)
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = self.ft,
				callback = function()
					metals_config.settings.metalsBinaryPath = "metals"
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})
		end,
	},
	{
		"https://codeberg.org/esensar/nvim-dev-container",
		lazy = false,
		config = function()
			require("devcontainer").setup({
				attach_mounts = {
					neovim_config = {
						enabled = false,
						options = { "readonly" },
					},
					neovim_data = {
						enabled = false,
						options = {},
					},
					-- Only useful if using neovim 0.8.0+
					neovim_state = {
						enabled = false,
						options = {},
					},
				},
				config_search_start = function()
					if vim.g.devcontainer_selected_config == nil or vim.g.devcontainer_selected_config == "" then
						local candidates = vim.split(
							vim.fn.glob(vim.loop.cwd() .. "/.devcontainer/**/devcontainer.json"),
							"\n",
							{ trimempty = true }
						)
						if #candidates < 2 then
							vim.g.devcontainer_selected_config = vim.loop.cwd()
						else
							local choices = { "Select devcontainer config file to use:" }
							for idx, candidate in ipairs(candidates) do
								table.insert(choices, idx .. ". - " .. candidate)
							end
							local choice_idx = vim.fn.inputlist(choices)
							if choice_idx > #candidates then
								choice_idx = 1
							end
							vim.g.devcontainer_selected_config =
								string.gsub(candidates[choice_idx], "/devcontainer.json", "")
						end
					end
					return vim.g.devcontainer_selected_config
				end,
			})
		end,
	},
}
return plugins
