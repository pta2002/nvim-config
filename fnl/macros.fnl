{:setup (fn setup [name argument]
          `(let [p# (require ,name)]
             (p#.setup ,argument)))

 :set- (fn set- [key val]
         "Set option 'key' to value 'val' (adapted from zest.nvim)"
         (let [key (tostring key)
               val (if (= nil val) true val)
               (ok? scope) (pcall (fn [] (. (vim.api.nvim_get_option_info key) :scope)))]
           `(tset vim.opt ,key ,val)))
 :g- (fn g- [option val]
        `(tset vim.g ,(tostring option) ,val))}
