return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
      formatters = {
        rustfmt = {
          command = "rustup",
          args = {
            "run",
            "nightly",
            "rustfmt",
            "--emit=stdout",
          },
        },
      },
    },
  },
}
