local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Migrated setup as of: https://github.com/williamboman/nvim-lsp-installer/discussions/636
lsp_installer.setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local lspconfig = require("lspconfig")
local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
}
-- lspconfig.jedi_language_server.setup { opts = opts }


-- Note: With the new version of nvim-lsp-installer, we are now required
--       to call setup on each LSP individually
for _, server in ipairs(lsp_installer.get_installed_servers()) do
    -- custom settings
    if server.name == "jsonls" then
        local jsonls_opts = require("lsp.settings.jsonls")
        lspconfig.jsonls.setup { opts = vim.tbl_deep_extend("force", jsonls_opts, opts)}
    elseif server.name == "sumneko_lua" then
        local sumneko_opts = require("lsp.settings.sumneko_lua")
        lspconfig.sumneko_lua.setup { opts = vim.tbl_deep_extend("force", sumneko_opts, opts)}
    -- servers with default settings
    else
        lspconfig[server.name].setup { opts = opts}
    end

end
