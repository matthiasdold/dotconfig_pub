local util = require 'lspconfig.util'

local texlab_build_status = vim.tbl_add_reverse_lookup {
  Success = 0,
  Error = 1,
  Failure = 2,
  Cancelled = 3,
}

local texlab_forward_status = vim.tbl_add_reverse_lookup {
  Success = 0,
  Error = 1,
  Failure = 2,
  Unconfigured = 3,
}

local function buf_build(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local texlab_client = util.get_active_client_by_name(bufnr, 'texlab')
  local params = {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
  }
  if texlab_client then
    texlab_client.request('textDocument/build', params, function(err, result)
      if err then
        error(tostring(err))
      end
      print('Build ' .. texlab_build_status[result.status])
    end, bufnr)
  else
    print 'method textDocument/build is not supported by any servers active on the current buffer'
  end
end

local function buf_search(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local texlab_client = util.get_active_client_by_name(bufnr, 'texlab')
  local params = {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
    position = { line = vim.fn.line '.' - 1, character = vim.fn.col '.' },
  }
  if texlab_client then
    texlab_client.request('textDocument/forwardSearch', params, function(err, result)
      if err then
        error(tostring(err))
      end
      print('Search ' .. texlab_forward_status[result.status])
    end, bufnr)
  else
    print 'method textDocument/forwardSearch is not supported by any servers active on the current buffer'
  end
end

-- bufnr isn't actually required here, but we need a valid buffer in order to
-- be able to find the client for buf_request.
-- TODO find a client by looking through buffers for a valid client?
-- local function build_cancel_all(bufnr)
--   bufnr = util.validate_bufnr(bufnr)
--   local params = { token = "texlab-build-*" }
--   lsp.buf_request(bufnr, 'window/progress/cancel', params, function(err, method, result, client_id)
--     if err then error(tostring(err)) end
--     print("Cancel result", vim.inspect(result))
--   end)
-- end

local custom_attach = function(client, bufnr)
    print("hello")
end

return {
  default_config = {
    cmd = { 'texlab' },
    filetypes = { 'tex', 'bib', 'plaintex' },
    on_attach = custom_attach,
    root_dir = function(fname)
      return util.root_pattern '.latexmkrc'(fname) or util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    settings = {
      texlab = {
        rootDirectory = '.',
        build = {
          executable = 'latexmk',
          args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '-pvc', '%f' },
          onSave = true,
          forwardSearchAfter = true,
          isContinuous = true
        },
        -- Config as found here: https://github.com/f3fora/nvim-texlabconfig
        forwardSearch = {
            executable = 'okular',
            args = {
                '--unique',
                --'file:%p#src:%l%f',
                'file:%p#src:%l%f',
            },
        },
        auxDirectory = '.',
        chktex = {
          onOpenAndSave = true,
          onEdit = true,
        },
        diagnosticsDelay = 300,
        latexFormatter = 'latexindent',
        latexindent = {
          ['local'] = nil, -- local is a reserved keyword
          modifyLineBreaks = false,
        },
        bibtexFormatter = 'texlab',
        formatterLineLength = 80,
      },
    },
  },
  commands = {
    TexlabBuild = {
      function()
        buf_build(0)
      end,
      description = 'Build the current buffer',
    },
    TexlabForward = {
      function()
        buf_search(0)
      end,
      description = 'Forward search from current position',
    },
  },
  docs = {
    description = [[
https://github.com/latex-lsp/texlab
A completion engine built from scratch for (La)TeX.
See https://github.com/latex-lsp/texlab/blob/master/docs/options.md for configuration options.
]],
  },
}
