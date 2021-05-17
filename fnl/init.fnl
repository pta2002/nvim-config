(module nvim-config
  {autoload {a aniseed.core
             n aniseed.nvim}
   require-macros [:zest.macros]})

(require "plugins")

;; Helper functions for key bindings
(defn- nmap [keys exec extra]
  (vim.api.nvim_set_keymap "n" keys exec (a.merge {:noremap true} extra)))
(defn- imap [keys exec extra]
  (vim.api.nvim_set_keymap "i" keys exec (a.merge {:noremap true} extra)))
(defn- map [keys exec extra]
  (vim.api.nvim_set_keymap "" keys exec (a.merge {:noremap true} extra)))

(macro setup [plugin arg]
  `(let [p# (require ,plugin)]
     (p#.setup ,arg)))

(macro set- [key val]
  "Set option 'key' to value 'val' (adapted from zest.nvim)"
  (let [key (tostring key)
        val (if (= nil val) true val)
        (ok? scope) (pcall (fn [] (. (vim.api.nvim_get_option_info key) :scope)))]
    (if ok?
      (match scope
        :global `(vim.api.nvim_set_option ,key ,val)
        :win    `(do
                   (tset vim.o  ,key ,val)
                   (tset vim.wo ,key ,val))
        :buf    `(do
                   (tset vim.o  ,key ,val)
                   (tset vim.bo ,key ,val))))))

(set- mouse   "a")    ;; Enable mouse usage
(set- number true) ;; Enable line numbers

;; Indentation stuff
(set- tabstop    2)
(set- shiftwidth 2)
(set- expandtab  true)
(set- smarttab   true)
(set- autoindent true)
(set- cindent    true)

;; Stuff for autocomplete
(set- completeopt "menuone,noselect")

;; Use 24-bit color, and the tokyonight colorscheme
(set- termguicolors true)
(colo- :tokyonight)

;; Keybinds
(map "ç" ":") ;; Convenience thing for portuguese keyboards

;; Some things for barbar
(nmap "<A-,>" ":BufferPrevious<CR>" {:silent true})
(nmap "<A-.>" ":BufferNext<CR>"     {:silent true})
(nmap "<A-1>" ":BufferGoto 1<CR>"   {:silent true})
(nmap "<A-2>" ":BufferGoto 2<CR>"   {:silent true})
(nmap "<A-3>" ":BufferGoto 3<CR>"   {:silent true})
(nmap "<A-4>" ":BufferGoto 4<CR>"   {:silent true})
(nmap "<A-5>" ":BufferGoto 5<CR>"   {:silent true})
(nmap "<A-6>" ":BufferGoto 6<CR>"   {:silent true})
(nmap "<A-7>" ":BufferGoto 7<CR>"   {:silent true})
(nmap "<A-8>" ":BufferGoto 8<CR>"   {:silent true})
(nmap "<A-9>" ":BufferGoto 9<CR>"   {:silent true})
(nmap "<A-x>" ":BufferClose<CR>"    {:silent true})

;; compe
(imap "<C-Space>" "compe#complete()" {:silent true :expr true})
(imap "<CR>" "compe#confirm(lexima#expand('<LT>CR>', 'i'))" {:silent true :expr true})
(imap "<C-e>" "compe#close('<C-e>')" {:silent true :expr true})

;; Plugin stuff
(setup :lualine {:options {:theme "tokyonight"}})
(setup :nvim-treesitter.configs
       {:ensure_installed "maintained"
        :highlight {:enable true}})

(setup :compe {:enable true
                :autocomplete true
                :source {:nvim_lsp true}})

(setup :trouble {})

(let [lsp (require "lspconfig")]
  (lsp.clangd.setup {}))

(g- vim_markdown_folding_disabled 1)
(g- vim_markdown_math 1)
