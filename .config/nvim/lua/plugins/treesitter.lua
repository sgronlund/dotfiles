return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				ensure_installed = { "c", "glsl", "vim", "lua", "python" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
