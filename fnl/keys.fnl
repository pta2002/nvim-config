(module keys
  {autoload {a aniseed.core}
   require-macros [:macros]})

;; Helper functions for key bindings
(defn- nmap [keys exec extra]
  (vim.api.nvim_set_keymap "n" keys exec (a.merge {:noremap true} extra)))
(defn- imap [keys exec extra]
  (vim.api.nvim_set_keymap "i" keys exec (a.merge {:noremap true} extra)))
(defn- map [keys exec extra]
  (vim.api.nvim_set_keymap "" keys exec (a.merge {:noremap true} extra)))

;; Keybinds
(map "ç" ":") ;; Convenience thing for portuguese keyboards
(g- mapleader " ")
(g- maplocalleader " ")

;; Set j and k to move by visual lines
(map "j" "gj")
(map "k" "gk")

(let [wk (require "which-key")]
  (wk.register
    {:f {:name "file"
         :f ["<cmd>Telescope find_files<cr>" "Find file"]
         :g ["<cmd>Telescope live_grep<cr>" "Grep in files"]
         :t ["<cmd>NvimTreeToggle<cr>" "Toggle file tree"]}
     :e {:name "current buffer"
         :f ["<cmd>Limelight!!<cr><cmd>Goyo<cr>" "Toggle focus mode"]}}
    {:prefix "<leader>"}))

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


