(module plugins
  {require {p packer}})

(p.startup (fn []
  ;; Config stuff
  (use "wbthomason/packer.nvim")
  (use "Olical/aniseed")
  (use "tsbohc/zest.nvim")

  ;; Utilities
  (use "godlygeek/tabular")
  (use "tpope/vim-surround")
  (use "tpope/vim-commentary")
  (use "cohama/lexima.vim")
  (use "hrsh7th/nvim-compe")
  (use "folke/trouble.nvim")

  ;; Eye candy
  (use "hoob3rt/lualine.nvim")
  (use "folke/tokyonight.nvim")
  (use "kyazdani42/nvim-web-devicons")
  (use "romgrk/barbar.nvim")

  ;; Git
  (use "airblade/vim-gitgutter")

  ;; Languages
  (use "nvim-treesitter/nvim-treesitter")
  (use "LnL7/vim-nix")
  (use "plasticboy/vim-markdown")

  (use "neovim/nvim-lspconfig")))
