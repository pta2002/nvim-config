(module plugins
  {require {p packer}})

;; TODO: Move plugin configuration over here

(p.startup (fn []
  ;; Config stuff
  (use "wbthomason/packer.nvim")
  (use "Olical/aniseed")

  ;; Utilities
  (use "godlygeek/tabular")
  (use "tpope/vim-surround")
  (use "tpope/vim-commentary")
  (use "cohama/lexima.vim")
  (use "hrsh7th/nvim-compe")
  (use "folke/trouble.nvim")
  (use {1 "folke/todo-comments.nvim"
       :requires [["folke/todo-comments.nvim"]]
       :config
       (fn []
         (local todo-comments (require "todo-comments"))
         (todo-comments.setup {:highlight {:before "fg"}}))})
  (use {1 "nvim-telescope/telescope.nvim"
       :requires [["nvim-lua/popup.nvim"] ["nvim-lua/plenary.nvim"]]})
  (use {1 "folke/which-key.nvim"
       :config
       (fn []
         (local which-key (require "which-key"))
         (which-key.setup {}))})
  (use "tpope/vim-sleuth")
  (use "pta2002/intellitab.nvim")
  (use {1 "kyazdani42/nvim-tree.lua"
        :config
        (fn []
          (local nvim-tree (require "nvim-tree"))
          (nvim-tree.setup {}))})

  ;; Eye candy
  (use "hoob3rt/lualine.nvim")
  (use "eddyekofo94/gruvbox-flat.nvim")
  (use "kyazdani42/nvim-web-devicons")
  (use "romgrk/barbar.nvim")
  (use "junegunn/limelight.vim")
  (use "junegunn/Goyo.vim")

  ;; Git
  (use "airblade/vim-gitgutter")

  ;; Languages
  (use "nvim-treesitter/nvim-treesitter")
  (use "LnL7/vim-nix")
  (use "hashivim/vim-terraform")
  (use "hashivim/vim-nomadproject")
  (use "plasticboy/vim-markdown")
  (use "neovimhaskell/haskell-vim")
  (use "guns/vim-sexp")
  (use "alx741/yesod.vim")
  (use "pbrisbin/vim-syntax-shakespeare")
  (use "p00f/nvim-ts-rainbow")

  ;; LSP
  (use "neovim/nvim-lspconfig")
  (use "github/copilot.vim")
  (use "ms-jpq/coq_nvim")
  (use "ms-jpq/coq.thirdparty")
  (use "mfussenegger/nvim-jdtls")
  (use {1 "weilbith/nvim-code-action-menu"
        :cmd "CodeActionMenu"})
  (use "kosayoda/nvim-lightbulb")
  (use {1 "scalameta/nvim-metals" :requires ["nvim-lua/plenary.nvim"]})
  (use {1 "onsails/lspkind-nvim"
       :config 
       (fn []
         (local lk (require "lspkind"))
         (lk.init {:with_text false}))})))

(local packer_compiled (.. (vim.fn.stdpath :config) "/plugin/packer_compiled.lua"))
(vim.cmd (.. "luafile" packer_compiled))
