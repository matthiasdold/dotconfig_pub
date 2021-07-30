local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_disable_netrw = 0 --"1 by default, disables netrw
vim.g.nvim_tree_hide_dotfiles = 0 --0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_indent_markers = 1 --"0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_follow = 0 --"0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_auto_close = 1 --0 by default, closes the tree when it's the last window

vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "__pycache__"}
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_tab_open = 0        
vim.g.nvim_tree_allow_resize = 1
vim.g.nvim_tree_auto_ignore_ft = { "startify" }

vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  }
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "U",
      ignored = "◌",
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  }
