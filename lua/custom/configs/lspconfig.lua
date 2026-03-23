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

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library',
          -- '${3rd}/busted/library',
        },
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = vim.api.nvim_get_runtime_file('', true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

vim.lsp.enable('pyright')
vim.lsp.config('pyright', {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
})

vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp" },
    init_options = {
        fallbackFlags = { "--std=c++23" },
        --                fallbackFlags = { "--std=c11" },
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

-- vim.lsp.enable('hls')
-- vim.lsp.config('hls', {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { "haskell", "lhaskell" },
-- })

-- vim.lsp.enable('java_language_server')
-- vim.lsp.config('java_language_server', {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { "java" },
--     cmd = { "/home/max/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_linux.sh" },
-- })

vim.lsp.enable('cmake')
vim.lsp.config('cmake', {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            },
        },
    },
})
