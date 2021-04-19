local iron = require('iron')

iron.core.add_repl_definitions {
  python = {
    python_connect= {
      command = {"rightbelow 20 split", vim.api.nvim_buf_get_option(0, "ft"),"ipython", "repl", ":connect"}
    }
  },
  clojure = {
    lein_connect = {
      command = {"lein", "repl", ":connect"}
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "ipython",
    clojure = "lein"
  }
}
