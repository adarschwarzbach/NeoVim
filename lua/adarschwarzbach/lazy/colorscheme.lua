local M = {
  "folke/tokyonight.nvim",
  lazy = false,    -- Load this during startup as it’s your main colorscheme
  priority = 1000, -- Load this before other start plugins
}

-- This is the variant/colorscheme name you want to use
M.name = "tokyonight-night"

function M.config()
  -- First, set up the theme with your custom configuration.
  require("tokyonight").setup({
    style = "storm",                  -- Options: "storm", "moon", "night", "day"
    transparent = true,               -- Enable transparency (no background color)
    terminal_colors = true,           -- Apply theme colors to terminal buffers
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      sidebars = "dark",              -- Style for sidebars
      floats = "dark",                -- Style for floating windows
    },
  })

  -- Then, attempt to load the colorscheme.
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M

