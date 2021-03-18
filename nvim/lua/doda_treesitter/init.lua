require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "c", "lua", "html", "css"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  refactor = {
      highlight_definitions = {
        enable = true
      }
   }
}

