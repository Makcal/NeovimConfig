require("chadrc")



local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)



-- Auto change dir
local group_cdpwd = vim.api.nvim_create_augroup("group_cdpwd", {})
vim.api.nvim_create_autocmd("VimEnter", {
	group = group_cdpwd,
	pattern = "*",
	callback = function()
		vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
	end,
})



-- run commands
local term = require("nvchad.term")
local run_commands = {
	c = {
		pattern = "*.c",
        get_cmd = function()
            return "gcc " .. vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r") .. " && bash -c \"time " .. vim.fn.expand("%:p:r") .. "\""
        end,
	},
	cpp = {
		pattern = "*.cpp",
        get_cmd = function()
            return "g++ --std=c++23 " .. vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r") .. " && bash -c \"time " .. vim.fn.expand("%:p:r") .. "\""
        end,
	},
	python = {
		pattern = "*.py",
		get_cmd = function() return "python " .. vim.fn.expand("%") end,
	},
    haskell = {
        pattern = "*.hs",
        get_cmd = function() return "ghc --run " .. vim.fn.expand("%") end,
    },
}

local group_run = vim.api.nvim_create_augroup("group_run", {})
-- fallback
vim.api.nvim_create_autocmd("BufEnter", {
    group = group_run,
    pattern = '*',
    callback = function()
        vim.keymap.set("n", "<F6>", function()
            print('No run command is defined for this filetype')
        end)
    end,
})
for _, cmd in pairs(run_commands) do
    vim.api.nvim_create_autocmd("BufEnter", {
        group = group_run,
        pattern = cmd.pattern,
        callback = function()
            vim.keymap.set("n", "<F6>", function()
                term.new({cmd = "echo Running " .. vim.fn.expand("%") .. ";" .. cmd.get_cmd() .. "; exit", pos = "float"})
            end)
            if cmd.setup ~= nil then
                cmd.setup()
            end
        end,
    })
end



-- Trim trailing whitespaces on save
local group_trim_ws = vim.api.nvim_create_augroup("group_trim_ws", {})
vim.api.nvim_create_autocmd("FileType", {
	group = group_trim_ws,
	desc = "Trim trailing white spaces",
	pattern = "bash,c,cpp,lua,java,go,php,javascript,make,python,rust,perl,sql,markdown",
	callback = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "<buffer>",
			callback = function()
				-- Save cursor position to restore later
				local curpos = vim.api.nvim_win_get_cursor(0)
				vim.cmd([[keeppatterns %s/\s\+$//e]])
				vim.api.nvim_win_set_cursor(0, curpos)
			end,
		})
	end,
})



-- Fix ibl plugin
require("ibl")
vim.api.nvim_exec2("IBLEnable", { output = false })

