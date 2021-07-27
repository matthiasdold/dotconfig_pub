require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    --[[custom_captures = {
      ["pythonDocstring"] = "TSComment",
    },]]
    -- additional_vim_regex_highlighting = true,   -- get back user specific definitions (python docstrings in my case)
  },
  --[[refactor = {
      highlight_definitions = {
        enable = true
      },  
   }]]
}
vim.cmd[[set foldmethod=expr]]
vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
