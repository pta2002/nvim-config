(module lsp
  {require-macros [:macros]})

;; This is the on_attach function we'll run
(defn lsp_setup [client bufnr]
  (vim.cmd "autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  (vim.cmd "autocmd CursorHold,CursorHoldI <buffer> lua require'nvim-lightbulb'.update_lightbulb()")
  ;; Set some keybindings
  (nmap "K" "<cmd>lua vim.lsp.buf.hover()<CR>")
  (wk.register
    {:l {:name "LSP"
         :f ["<cmd>lua vim.lsp.buf.formatting()<CR>" "Format file"]
         :a ["<cmd>:CodeActionMenu<CR>" "Code actions"]
         :r ["<cmd>lua vim.lsp.buf.rename()<CR>" "Rename"]}}
    {:prefix "<leader>"}))

(let [lsp (require "lspconfig")]
  (lsp.clangd.setup {:on_attach lsp_setup})
  (lsp.hls.setup {:on_attach lsp_setup})
  (lsp.rust_analyzer.setup {:on_attach lsp_setup})
  (lsp.zls.setup {:on_attach lsp_setup})
  (lsp.tsserver.setup {:on_attach lsp_setup})
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




