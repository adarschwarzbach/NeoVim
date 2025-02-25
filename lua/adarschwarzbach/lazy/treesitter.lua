return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
 
    configs.setup({
      ensure_installed = {
        "c", "cpp", "lua", "vim", "vimdoc", "javascript", "html", "python", "typescript", "bash", "cmake", "regex"
      },

      sync_install = false,
      highlight = { enable = true, disable = { "css" } },
      indent = { enable = true },
      autopairs = { enable = true, },
    })
  end
}		
