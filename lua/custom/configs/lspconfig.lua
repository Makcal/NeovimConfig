local config = require("nvchad.configs.lspconfig")
--
local on_attach = function(client)
	--- Guard against servers without the signatureHelper capability
	if client.server_capabilities.signatureHelpProvider then
		require("lsp-overloads").setup(client, {})
	end
	config.on_attach()
end
local capabilities = config.capabilities
capabilities.textDocument.signatureHelp.triggerCharacters = ""

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "c", "cpp" },
	init_options = {
		fallbackFlags = { "--std=c++23" },
		--		fallbackFlags = { "--std=c11" },
	},
    -- I don't really understand what it is. Just copied from
    -- https://github.com/williamboman/nvim-lsp-installer/discussions/392
    -- and https://github.com/fitrh/init.nvim/blob/7127fbef569ee498b1cbfae62ef372050b07afbc/lua/lsp/config/clangd.lua#L14
    -- and https://www.reddit.com/r/neovim/comments/pxd2og/clangtidy_for_neovim/
	cmd = {
		"clangd",
		"--background-index",
		"-j=12",
		"--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
		"--clang-tidy",
		"--clang-tidy-checks=*",
		"--all-scopes-completion",
		"--cross-file-rename",
		"--completion-style=detailed",
		"--header-insertion-decorators",
		"--header-insertion=iwyu",
		"--pch-storage=memory",
	},
})

lspconfig.hls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "haskell", "lhaskell" },
})

-- lspconfig.java_language_server.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "java" },
-- 	cmd = { "/home/max/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_linux.sh" },
-- })
