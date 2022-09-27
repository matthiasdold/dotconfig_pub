local iron = require("iron.core")

iron.setup {
  config = {
    -- If iron should expose `<plug>(...)` mappings for the plugins
    should_map_plug = false,
    -- Whether a repl should be discarded or not
    scratch_repl = false,
    -- Your repl definitions come here
    repl_definition = {
      -- set a default
      python = require("iron.fts.python").ipython,
      sh = {
        command = {"fish"}
      },
    },
    preferred = {
        python = "ipython"
    },
    repl_open_cmd = require('iron.view').right(
        function()
            return math.floor(vim.o.columns / 3)
        end
    ),
    -- how the REPL window will be opened, the default is opening
    -- a float window of height 40 at the bottom.

    buflist = true,
  },
  -- Iron doesn't set keymaps by default anymore. Set them here
  -- or use `should_map_plug = true` and map from you vim files
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<C-s>",
    send_file = "<space>sf",
    send_line = "<C-s>",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = false
  }
}

-- iron.core.add_repl_definitions {
--   python = {
--     python_connect= {
--     command = {"split", vim.api.nvim_buf_get_option(0, "ft"),"ipython", "repl", ":connect"}
--     }
--   },
--   clojure = {
--     lein_connect = {
--       command = {"lein", "repl", ":connect"}
--     }
--   }
-- }
-- 
-- iron.core.set_config {
--   repl_open_cmd = 'rightbelow 100 vsplit',
--   preferred = {
--     python = "ipython",
--     clojure = "lein"
--   }
-- }


