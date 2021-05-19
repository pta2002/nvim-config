let g:aniseed#env = { "module": "init", "compile": v:true }
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup lsp
  au!
  au FileType java lua require('jdtls').start_or_attach({cmd = {'/home/pta2002/.config/nvim/lsp/eclipse.sh'}})
augroup END
