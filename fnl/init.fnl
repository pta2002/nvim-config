(module init
  {autoload {a aniseed.core
             n aniseed.nvim}
   require-macros [:macros]})

(require "options")
(require "plugins")
(require "keys")
(require "lsp")

;; Plugin stuff
(setup :lualine {:options {:theme "gruvbox-flat"}})
(setup :nvim-treesitter.configs
       {:ensure_installed "maintained"
        :highlight {:enable true}
        :rainbow {:enable true
                  :extended_mode true
                  :max_file_lines nil}})

(setup :compe {:enable true
               :autocomplete true
               :source {:nvim_lsp true
                        :nvim_lua true}})

(setup :trouble {})

(set vim.g.vim_markdown_folding_disabled 1)
(set vim.g.vim_markdown_math 1)

(set vim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel")
