local config = require("nvchad.configs.lspconfig")
--
local on_attach = config.on_attach
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
		-- fallbackFlags = { "--std=c23" },
	},
})

lspconfig.hls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { 'haskell', 'lhaskell' },
})
