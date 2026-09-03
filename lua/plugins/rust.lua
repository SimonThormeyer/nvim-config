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
  {
    "mrcjkb/rustaceanvim",
    keys = {
      {
        "<leader>cw",
        function()
          local client = vim.lsp.get_clients({
            bufnr = 0,
            name = "rust-analyzer",
          })[1]

          if not client then
            vim.notify("rust-analyzer is not running", vim.log.levels.WARN)
            return
          end

          local target = vim.tbl_get(client.config.settings, "rust-analyzer", "cargo", "target")

          if target == "wasm32-unknown-unknown" then
            vim.cmd.RustAnalyzer("target")
            vim.notify("rust-analyzer: native target")
          else
            vim.cmd.RustAnalyzer("target wasm32-unknown-unknown")
            vim.notify("rust-analyzer: wasm32-unknown-unknown")
          end
        end,
        desc = "Toggle Rust WASM target",
      },
    },
  },
}
