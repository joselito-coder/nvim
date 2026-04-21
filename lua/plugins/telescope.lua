return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "^.git/", "node_modules/" },
				layout_config = {
					vertical = { width = 0.7 },
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--iglob", "!.git" },
				},
			},
		})

		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({ cwd = vim.fn.getcwd() })
		end, { desc = "Find files" })

		vim.keymap.set("n", "<C-t>", function()
			builtin.find_files()
		end, { desc = "Find files" })

		vim.keymap.set("n", "<C-p>", builtin.git_files, {})

		vim.keymap.set("n", "<leader>pws", function()
			builtin.grep_string({ search = vim.fn.expand("<cword>") })
		end)

		vim.keymap.set("n", "<leader>pWs", function()
			builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
		end)

		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)

		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
