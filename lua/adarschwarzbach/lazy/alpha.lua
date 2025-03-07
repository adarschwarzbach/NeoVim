return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons', 'nvim-telescope/telescope.nvim' },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local telescope = require("telescope")
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local sorters = require("telescope.config").values.generic_sorter
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      -- Set header (Neovim ASCII Art)
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
        "                                                     "
      }

      -- Centered quote and time block
      dashboard.section.footer.val = {
        "                                                     ",
        "    'Aut inveniam viam aut faciam' - Hannibal of Carthage",
        "                    " .. os.date("%Y-%m-%d %H:%M:%S") .. "                      ",
        "                                                     "
      }

      -- Expose the function globally so it can be called from dashboard button
      _G.open_recent_dirs = function()
        local recent_files = vim.v.oldfiles or {}
        local dirs = {}

        for _, file in ipairs(recent_files) do
          local dir = vim.fn.fnamemodify(file, ":h")
          if vim.fn.isdirectory(dir) == 1 and not dirs[dir] then
            dirs[dir] = true
          end
        end

        local dir_list = vim.tbl_keys(dirs)
        if #dir_list == 0 then
          print("No recent folders found.")
          return
        end

        pickers.new({}, {
          prompt_title = "Recent Folders",
          finder = finders.new_table { results = dir_list },
          sorter = sorters({}),
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              vim.cmd("cd " .. selection.value)
              print("Changed directory to: " .. selection.value)
            end)
            return true
          end,
        }):find()
      end

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  > Recent Folders", ":lua open_recent_dirs()<CR>"),
        dashboard.button("t", "  > Open Terminal", ":ToggleTerm<CR>"),
        dashboard.button("q", "  > Quit NVIM", ":qa<CR>")
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
  },
}
