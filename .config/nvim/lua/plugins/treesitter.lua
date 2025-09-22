return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
				ensure_installed = { "c", "glsl", "vim", "lua", "python" , "r", "markdown", "markdown_inline", "latex"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
}
