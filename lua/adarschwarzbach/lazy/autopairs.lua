return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- Load autopairs when you enter Insert mode
  config = function()
    require("nvim-autopairs").setup({
      -- Your custom options go here (if any).
      -- See :help nvim-autopairs for details.
    })

    -- If you're using nvim-cmp, this sets up completion pairing.
    local cmp_ok, cmp = pcall(require, "cmp")
    if cmp_ok then
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}
