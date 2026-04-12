return {
	"folke/snacks.nvim",
	opts = {
		explorer = {
			replace_netrw = true,
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
}
