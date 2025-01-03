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
--		 fallbackFlags = { "--std=c++23" },
		fallbackFlags = { "--std=c23" },
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

