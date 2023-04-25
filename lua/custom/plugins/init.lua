-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  -- { 'j-hui/fidget.nvim', opts = {} },

return {

--[[
  Manipulate character pairs quickly, saiw" , sr"( , sd(  -- Vim Script
  Thus their action can be repeated by . command without any dependency.
  h sandwich.txt
]]
  { "machakann/vim-sandwich", event = "VimEnter",
    config = function()
      vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Nop>', { silent = true })
    end,
  },

--[[
  Modern matchit.vim implementation  -- Vim Script
  vim match-up: even better % 👊 navigate and highlight matching words 👊
  Adds motions g%, [%, ]%, and z%. Combines these motions into convenient text objects i% and a%.
  h matchup.txt
]]
  { "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      -- Improve performance
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_timeout = 100
      vim.g.matchup_matchparen_insert_timeout = 30

      -- Enhanced matching with matchup plugin
      vim.g.matchup_override_vimtex = 1

      -- Whether to enable matching inside comment or string
      vim.g.matchup_delim_noskips = 0

      -- Show offscreen match pair in popup window
      -- vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
      vim.g.matchup_matchparen_offscreen = { method = 'popup'}
    end,
  },

  -- h nvim-autopairs.txt
  { "windwp/nvim-autopairs", event = "InsertEnter",   -- Lua
    opts = {},
    -- config = function()
      -- require('nvim-autopairs').setup()
    -- end,
  },

  -- h bufferline, TAB
  { "akinsho/bufferline.nvim",
    event = "BufReadPre",
    -- :help bufferline-settings
    opts = {

      options = {
        mode = 'buffers',
        numbers = 'buffer_id',
        offsets = {
          {filetype = 'NvimTree'}
        },
        -- color_icons = true, -- whether or not to add the filetype icon highlights
      },
      -- :help bufferline-highlights
      highlights = {
        buffer_selected = {
          italic = false
        },
        indicator_selected = {
          fg = { attribute = 'fg', highlight = 'Function' },
          italic = false
        }
      }

    },
  },

  -- Show match number and index for searching
  -- nzzzv, https://github.com/VonHeikemen/dotfiles
  { "kevinhwang91/nvim-hlslens",
    event = "BufReadPre",
    opts = {
      calm_down = true,
      -- nearest_only = true,
      -- nearest_float_when = 'always'
    },
    keys = { 'n', 'N', '*', '#','g*', 'g#' },
    config = function()
      require('hlslens').setup()
      -- h vim.keymap.set
      -- Default options {opts}: {remap = false, silent = false, expr = false}
      local kopts = { silent = true }

      vim.keymap.set('n', 'n',
          [[<Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>]],
          kopts)
      vim.keymap.set('n', 'N',
          [[<Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>]],
          kopts)
      vim.keymap.set('n', '*', [[*zz<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', '#', [[#zz<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', 'g*', [[g*zz<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', 'g#', [[g#zz<Cmd>lua require('hlslens').start()<CR>]], kopts)
    end,
  },






}
