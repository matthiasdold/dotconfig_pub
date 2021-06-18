local iron = require('iron')

iron.core.add_repl_definitions {
  python = {
    python_connect= {
    command = {"split", vim.api.nvim_buf_get_option(0, "ft"),"ipython", "repl", ":connect"}
    }
  },
  clojure = {
    lein_connect = {
      command = {"lein", "repl", ":connect"}
    }
  }
}

iron.core.set_config {
  repl_open_cmd = 'rightbelow 100 vsplit',
  preferred = {
    python = "ipython",
    clojure = "lein"
  }
}


