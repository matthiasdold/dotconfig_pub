-- npm i -g pyright
-- O is defined in globals.lua

require'lspconfig'.pyls.setup{
    -- NOTE: Pyright does not work properly --> pyls seems much better, although not being the default with
    -- nvim lspinstall. Since "pyls" is a python program (not an executeable) we do not specify a cmd
    -- cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.python.diagnostics.virtual_text,
            signs = O.python.diagnostics.signs,
            underline = O.python.diagnostics.underline,
            update_in_insert = true

        })
    }
}
