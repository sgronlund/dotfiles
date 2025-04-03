return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "dockerls", "marksman", "gopls", "jedi_language_server" , "jdtls", "glsl_analyzer"},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
        opts = {
            servers = {
                jinja_lsp = {
                    filetypes = {"jinja", "html"},
                }
            },
        },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			lspconfig.lua_ls.setup({
				capabilities = capabilites,
			})
			lspconfig.clangd.setup({
				capabilities = capabilites,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilites,
			})
			lspconfig.marksman.setup({
				capabilities = capabilites,
			})
			lspconfig.gopls.setup({
				capabilities = capabilites,
			})
			lspconfig.glsl_analyzer.setup({
				capabilities = capabilites,
			})
			lspconfig.jedi_language_server.setup({
				capabilities = capabilites,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilites,
			})
			lspconfig.jinja_lsp.setup({
				capabilities = capabilites,
			})
			lspconfig.phpactor.setup({
				capabilities = capabilites,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
		end,
	},
}
