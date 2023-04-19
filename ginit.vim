" https://github.com/dtr2300/nvim/blob/main/lua/config/gui/nvimqt.lua

" https://github.com/equalsraf/neovim-qt#configuration
" https://neovide.dev/configuration.html

lua << EOF

  if vim.g.GuiLoaded then
    require("custom.gui.nvimqt").setup()
  elseif vim.g.neovide then
    require("custom.gui.neovide").setup()
  end

EOF
