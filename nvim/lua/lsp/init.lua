local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "lsp.lsp-installer"
require("lsp.handlers").setup()
require "lsp.null-ls"
require "lsp.settings.lsp_signature"

vim.lsp.set_log_level("debug")
