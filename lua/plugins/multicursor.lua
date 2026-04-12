return {
	"mg979/vim-visual-multi",
	branch = "master",
	init = function()
		vim.g.VM_maps = {
			["Find Under"] = "<C-n>", -- select word under cursor / add next match
			["Find Subword Under"] = "<C-n>",
			["Select All"] = "<C-A-n>", -- select ALL matches at once
			["Skip Region"] = "<C-x>", -- skip current, go to next
			["Remove Region"] = "<C-p>", -- undo last added cursor
			["Add Cursor Down"] = "<C-j>", -- add cursor on line below
			["Add Cursor Up"] = "<C-k>", -- add cursor on line above
		}
	end,
}
