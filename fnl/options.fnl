(module options
  {require-macros [:macros]})

;; This file defines a list of neovim options
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
(set- hlsearch false) ;; Don't highlight after searching

;; Stuff for autocomplete
(set- completeopt "menuone,noselect")
(set- updatetime 10) ;; Update CursorHold every 10ms

;; Use 24-bit color, and the tokyonight colorscheme
(set- termguicolors true)

;; Use the gruvbox-flat color scheme
(vim.cmd "colorscheme gruvbox-flat")
