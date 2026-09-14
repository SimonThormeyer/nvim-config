return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_c[4] = {
        "filename",
        path = 3, -- an absolute path with $HOME displayed as `~`.
        shorting_target = 0, -- Disable path shortening.
      }
    end,
  },
}
