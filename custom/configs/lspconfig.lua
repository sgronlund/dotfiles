local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pylyzer", "matlab_ls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

lspconfig.clangd.setup({
    on_attach = function (client, bufnr)
      client.server_capabilities.signatureHelpProvider = false
      on_attach(client,bufnr)
    end,
    capabilities = capabilities,
  })

lspconfig.pylyzer.setup({
    filetypes = {"python"},
    settings = {
      python = {
        checkOnType = true,
        diagnostics = true,
        inlayHints = true,
        smartCompletion = true
      }
    }
  })
lspconfig.matlab_ls.setup({
    filetypes = {"matlab"},
    settings =  {
      matlab = {
        installPath = "/usr/bin/local/matlab",
        matlabConnectionTiming = "onStart",
        telemetry = true
      }
    }
})

end
