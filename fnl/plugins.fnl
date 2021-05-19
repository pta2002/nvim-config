(module plugins
  {require {p packer}
   require-macros [:zest.macros]})

;; TODO: Move plugin configuration over here

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
  (pa- "folke/todo-comments.nvim"
       :requires [["folke/todo-comments.nvim"]]
       :config
       (fn []
         (local todo-comments (require "todo-comments"))
         (todo-comments.setup {:highlight {:before "fg"}})))
  (pa- "nvim-telescope/telescope.nvim"
       :requires [["nvim-lua/popup.nvim"] ["nvim-lua/plenary.nvim"]])
  (pa- "folke/which-key.nvim"
       :config
       (fn []
         (local which-key (require "which-key"))
         (which-key.setup {})))
  (use "tpope/vim-sleuth")
  (use "pta2002/intellitab.nvim")

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
  (use "Olical/conjure")
  (use "neovimhaskell/haskell-vim")
  (use "guns/vim-sexp")

  ;; LSP
  (use "neovim/nvim-lspconfig")
  (use "mfussenegger/nvim-jdtls")
  (pa- "onsails/lspkind-nvim"
       :config 
       (fn []
         (local lk (require "lspkind"))
         (lk.init {:with_text false})))))
