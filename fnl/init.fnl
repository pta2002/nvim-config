(module init
  {autoload {a aniseed.core
             n aniseed.nvim}
   require-macros [:zest.macros :macros]})

(require "plugins")

;; Helper functions for key bindings
(defn- nmap [keys exec extra]
  (vim.api.nvim_set_keymap "n" keys exec (a.merge {:noremap true} extra)))
(defn- imap [keys exec extra]
  (vim.api.nvim_set_keymap "i" keys exec (a.merge {:noremap true} extra)))
(defn- map [keys exec extra]
  (vim.api.nvim_set_keymap "" keys exec (a.merge {:noremap true} extra)))

(set- mouse   "a") ;; Enable mouse usage
(set- number true) ;; Enable line numbers

;; Indentation stuff
(set- tabstop    2)
(set- shiftwidth 2)
(set- expandtab  true)
(set- smarttab   true)
(set- autoindent true)
(set- cindent    true)

(set- linebreak  true) ;; Wrap lines
(set- hidden     true) ;; Switch buffers without saving
(set- splitright true) ;; Split to the right
(set- splitbelow true) ;; Split down

(set- showmode false) ;; Don't show the modeline

;; Stuff for autocomplete
(set- completeopt "menuone,noselect")

;; Use 24-bit color, and the tokyonight colorscheme
(set- termguicolors true)

(vim.cmd "colorscheme gruvbox-flat")

;; Keybinds
(map "ç" ":") ;; Convenience thing for portuguese keyboards
(set n.g.mapleader " ")
(set n.g.maplocalleader n.g.mapleader)

;; Set j and k to move by visual lines
(map "j" "gj")
(map "k" "gk")

(local wk (require "which-key"))
(wk.register
  {:f {:name "file"
       :f ["<cmd>Telescope find_files<cr>" "Find file"]
       :g ["<cmd>Telescope live_grep<cr>" "Grep in files"]
       :t ["<cmd>NvimTreeToggle<cr>" "Toggle file tree"]}
   :e {:name "current buffer"
       :f ["<cmd>Limelight!!<cr><cmd>Goyo<cr>" "Toggle focus mode"]}}
  {:prefix "<leader>"})

; Some things for barbar
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

;; Intellitab
(imap "<Tab>" "<CMD>lua require('intellitab').indent()<CR>")

;; Plugin stuff
(setup :lualine {:options {:theme "gruvbox-flat"}})
(setup :nvim-treesitter.configs
       {:ensure_installed "maintained"
        :highlight {:enable true}})

(setup :compe {:enable true
               :autocomplete true
               :source {:nvim_lsp true
                        :nvim_lua true}})

(setup :trouble {})

(defn lsp_setup [client bufnr]
  (vim.cmd "autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  ;; Set some keybindings
  (nmap "K" "<cmd>lua vim.lsp.buf.hover()<CR>")
  (wk.register
    {:l {:name "LSP"
         :f ["<cmd>lua vim.lsp.buf.formatting()<CR>" "Format file"]
         :a ["<cmd>lua vim.lsp.buf.code_action()<CR>" "Code actions"]
         :r ["<cmd>lua vim.lsp.buf.rename()<CR>" "Rename"]}}
    {:prefix "<leader>"}))

(let [lsp (require "lspconfig")]
  (lsp.clangd.setup {:on_attach lsp_setup})
  (lsp.hls.setup {:on_attach lsp_setup})
  (lsp.rls.setup {:on_attach lsp_setup})
  (lsp.sumneko_lua.setup
    {:cmd ["/home/pta2002/sources/lua-language-server/bin/Linux/lua-language-server" "-E"
           "/home/pta2002/sources/lua-language-server/main.lua"]
     :on_attach lsp_setup
     :settings {:Lua {:runtime {:version "LuaJIT"
                                :path (vim.split package.path ";")}
                      :diagnostics {:globals ["vim"]}
                      :workspace {:library
                                  {(vim.fn.expand "$VIMRUNTIME/lua") true
                                   (vim.fn.expand "$VIMRUNTIME/lua/vim/lsp") true}}
                      :telemetry {:enable false}}}}))

(set vim.g.vim_markdown_folding_disabled 1)
(set vim.g.vim_markdown_math 1)

(set vim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel")
