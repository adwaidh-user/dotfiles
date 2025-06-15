return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag"
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = {
				"c", "cpp",
				"vim",
				"lua",
				"html",
				"css",
				"bash",
				"json",
				"gitignore",
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
			sync_install = false,
			highlight = { enabled = true },
			indent = { enabled = true },
		})
	end
}
