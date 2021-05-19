{:setup (fn setup [name argument]
          `(let [p# (require ,name)]
             (p#.setup ,argument)))
 :set- (fn set- [key val]
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
                          (tset vim.bo ,key ,val))))))}
