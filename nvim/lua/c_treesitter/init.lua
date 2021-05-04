require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "c", "lua", "html", "css"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = true,   -- get back user specific definitions (python docstrings in my case)
  },
  refactor = {
      highlight_definitions = {
        enable = true
      },
   }
}

vim.cmd[[set foldmethod=expr]]
vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
