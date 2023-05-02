return {

  -- Super fast buffer jump
  -- Hop is an EasyMotion-like plugin
  { "phaazon/hop.nvim",
    cmd = "HopWord",
    -- keys = { 'f', 'F', 't', 'T' },
    keys = { 'f', 't' },
    branch = 'v2', -- optional but strongly recommended
    -- enabled = false,
    opt = {
      case_insensitive = true,
      char2_fallback_key = '<CR>',
    },
    config = function()
      require'hop'.setup{}

      vim.cmd[[ hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
      vim.cmd[[ hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
      vim.cmd[[ hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]

      local hop = require('hop')
      local directions = require('hop.hint').HintDirection

      -- Type a bigram ...
--[[
      vim.keymap.set('n', 'f', function()
        hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end, {remap=true})

      vim.keymap.set('n', 'F', function()
        hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end, {remap=true})

      vim.keymap.set('n', 't', function()
        hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
      end, {remap=true})

      vim.keymap.set('n', 'T', function()
        hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
      end, {remap=true})
]]

      vim.keymap.set('n', 'f', function() hop.hint_char2() end, {remap=true})
      vim.keymap.set('n', 't', function() hop.hint_char2({ hint_offset = -1 }) end, {remap=true})
    end,
  },


}
