-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- lua/config/autocmds.lua

-- lua/config/autocmds.lua

local augroup = vim.api.nvim_create_augroup

-- ──────────────────────────────────────────────────────────────────────────
-- 1. VimEnter: handle `nvim .` or bare `nvim` in a project directory
--    • Session exists  → restore it
--    • No session      → open Snacks explorer
--    • Wipe any [No Name] buffer either way
-- ──────────────────────────────────────────────────────────────────────────
vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("dir_session_or_explorer", { clear = true }),
	nested = true,
	callback = function()
		local arg = vim.fn.argv(0) --[[@as string]]

		-- Only act when opened on a directory (nvim .) or with no args (nvim)
		if arg ~= "" and vim.fn.isdirectory(arg) == 0 then
			return
		end

		-- cd into it if a directory arg was given
		if arg ~= "" then
			vim.cmd("cd " .. vim.fn.fnameescape(arg))
		end

		vim.schedule(function()
			local persistence = require("persistence")

			-- current() returns the expected session file path for the cwd
			local session_file = persistence.current()
			local session_exists = vim.uv.fs_stat(session_file) ~= nil

			if session_exists then
				persistence.load()
			end
		end)
	end,
})
