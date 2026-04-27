return {
	"folke/snacks.nvim",
	opts = {

		image = {
			enabled = true,
		},
		picker = {
			sources = {
				explorer = {
					hidden = true, -- show dotfiles (.env, .gitignore, etc.)
					exclude = { ".git" }, -- but still hide .git folder
				},
			},
		},
	},

	keys = {
		{
			"<leader>pv",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
	},
}
