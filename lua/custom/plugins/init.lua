-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  -- { 'j-hui/fidget.nvim', opts = {} },

return {

  { 'windwp/nvim-autopairs', event = "InsertEnter",   -- autopair, Lua
    config = function()
      require('nvim-autopairs').setup()
    end,
  },

  -- manipulate character pairs quickly, saiw" , sr"( , sd(
  { 'machakann/vim-sandwich', event = 'VimEnter',
    config = function()
      -- require('custom.config.v_vim-sandwich')
      vim.cmd( [[
      nmap s <nop>
      omap s <nop>
      ]] )
    end,
  },






}
