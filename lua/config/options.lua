-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.winbar = "%=%m %f"

vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.formatoptions:remove({ "c", "r", "o" })

-- Detect filetype from shebang for extensionless files
vim.filetype.add({
	pattern = {
		[".*"] = {
			priority = -math.huge, -- run last, only if nothing else matched
			function(path, bufnr)
				local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""

				if first_line:match("^#!.*/bin/bash") or first_line:match("^#!.*/usr/bin/env bash") then
					return "bash"
				end
				if first_line:match("^#!.*/bin/sh") or first_line:match("^#!.*/usr/bin/env sh") then
					return "sh"
				end
				if first_line:match("^#!.*/usr/bin/env python") or first_line:match("^#!.*/bin/python") then
					return "python"
				end
				if first_line:match("^#!.*/usr/bin/env node") or first_line:match("^#!.*/bin/node") then
					return "javascript"
				end
				if first_line:match("^#!.*/usr/bin/env ruby") or first_line:match("^#!.*/bin/ruby") then
					return "ruby"
				end
			end,
		},
	},
})
