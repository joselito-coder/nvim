return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	opts = {
		defaults = {
			file_ignore_pattersn = { "^.git/" },
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
		live_grep = {
			additional_args = { "--hidden" },
		},
	},

	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = {
					vertical = { width = 0.7 },
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({
				cwd = vim.fn.getcwd(),
			})
		end, { desc = "find files" })
		vim.keymap.set("n", "<C-t>", builtin.find_files, { desc = "Find files but with ctrl+t" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)

		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
