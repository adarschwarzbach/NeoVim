-- File: lua/plugins/comment.lua
return {
  "numToStr/Comment.nvim",
  keys = {
    -- NORMAL mode: Ctrl + /
    {
      "<C-/>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      mode = "n",
      desc = "Toggle line comment (VSCode style)",
    },
    -- VISUAL mode: Ctrl + /
    {
      "<C-/>",
      function()
        -- Toggle line comment in visual mode
        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.linewise(vim.fn.visualmode())
      end,
      mode = "x",
      desc = "Toggle line comment for selection (VSCode style)",
    },
    -- NORMAL mode: Shift + Alt + A
    {
      "<S-M-a>",
      function()
        require("Comment.api").toggle.blockwise.current()
      end,
      mode = "n",
      desc = "Toggle block comment (VSCode style)",
    },
    -- VISUAL mode: Shift + Alt + A
    {
      "<S-M-a>",
      function()
        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
        vim.api.nvim_feedkeys(esc, "nx", false)
        require("Comment.api").toggle.blockwise(vim.fn.visualmode())
      end,
      mode = "x",
      desc = "Toggle block comment for selection (VSCode style)",
    },
  },
  config = function()
    -- Use the default settings or configure as you like
    require("Comment").setup({
      --- Add more config options here if desired
    })
  end,
}
