return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 10,
      open_mapping = [[<leader>tt]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    --------------------------------------------------------------
    -- Normal-mode mappings to resize splits
    --------------------------------------------------------------
    vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { silent = true })
    vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { silent = true })
    vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
    vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

    --------------------------------------------------------------
    -- Terminal-mode mappings to resize while in the terminal
    -- This leaves terminal-mode, does the resize, then goes back.
    --------------------------------------------------------------
    vim.keymap.set("t", "<C-Up>", [[<C-\><C-n>:resize +2<CR>i]], { silent = true })
    vim.keymap.set("t", "<C-Down>", [[<C-\><C-n>:resize -2<CR>i]], { silent = true })
    vim.keymap.set("t", "<C-Left>", [[<C-\><C-n>:vertical resize -2<CR>i]], { silent = true })
    vim.keymap.set("t", "<C-Right>", [[<C-\><C-n>:vertical resize +2<CR>i]], { silent = true })

    --------------------------------------------------------------
    -- Example: Open another quick terminal
    --------------------------------------------------------------
    local Terminal = require("toggleterm.terminal").Terminal

    local new_horizontal_term = Terminal:new({
      direction = "horizontal",
      size = 15,
    })

    -- Map <leader>tn to toggle the new terminal
    vim.keymap.set("n", "<leader>tn", function()
      new_horizontal_term:toggle()
    end, { desc = "Open a new horizontal terminal" })
  end,
}
