-- ~/.config/nvim/lua/plugins/snacks.lua
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          git_log_line = {
            actions = {
              copy_sha = function(_, item)
                vim.fn.setreg("+", item.commit)
                vim.notify("Copied " .. item.commit)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<C-y>"] = { "copy_sha", mode = { "i", "n" } },
                },
              },
            },
          },
        },
      },
    },
  },
}
