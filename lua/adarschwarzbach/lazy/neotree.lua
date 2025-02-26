return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>e",
      function()
        vim.cmd("Neotree toggle")
      end,
      desc = "Toggle Neo-tree",
    },
    {
      "<leader>er",
      function()
        vim.cmd("Neotree reveal")
      end,
      desc = "Reveal current file in Neo-tree",
    },
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          -- Set these to false to see all “hidden” files:
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
    })
  end
}
