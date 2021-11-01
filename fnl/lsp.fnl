(module lsp
  {autoload {a aniseed.core}
   require-macros [:macros]})


(defn- nmap [keys exec extra]
  (vim.api.nvim_set_keymap "n" keys exec (a.merge {:noremap true} extra)))

;; This is the on_attach function we'll run
(defn lsp_setup [client bufnr]
  (vim.cmd "autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  (vim.cmd "autocmd CursorHold,CursorHoldI <buffer> lua require'nvim-lightbulb'.update_lightbulb()")
  (vim.cmd "COQnow --shut-up")
  ;; Set some keybindings
  (nmap "K" "<cmd>lua vim.lsp.buf.hover()<CR>")
  (let [wk (require :which-key)]
    (wk.register
      {:l {:name "LSP"
           :f ["<cmd>lua vim.lsp.buf.formatting()<CR>" "Format file"]
           :a ["<cmd>:CodeActionMenu<CR>" "Code actions"]
           :r ["<cmd>lua vim.lsp.buf.rename()<CR>" "Rename"]}}
      {:prefix "<leader>"})))

(local coq (. (require :coq) "lsp_ensure_capabilities"))

(let [lsp (require "lspconfig")]
  (lsp.clangd.setup (coq {:on_attach lsp_setup}))
  (lsp.hls.setup (coq {:on_attach lsp_setup}))
  (lsp.rust_analyzer.setup (coq {:on_attach lsp_setup}))
  (lsp.zls.setup (coq {:on_attach lsp_setup}))
  (lsp.tsserver.setup (coq {:on_attach lsp_setup}))
  (lsp.gopls.setup (coq {:on_attach lsp_setup}))
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




