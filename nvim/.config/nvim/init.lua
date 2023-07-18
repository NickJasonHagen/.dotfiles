-- disable netrw at the very start of your init.lua (strongly advised) -- nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require('nickjasonhagen.plugins')
require('nickjasonhagen.settings')
-- require('nickjasonhagen.debugger')

-- require'nvim-treesitter.parsers'.get_parser_configs().nscript = {
--   install_info = {
--     url = '/home/skorm/.local/share/nvim/site/pack/plugins/start/nvim-treesitter-nscript',
--     files = {'/home/skorm/.local/share/nvim/site/pack/plugins/start/nvim-treesitter-nscript/src/parser.c'}
--   },
--   filetype = 'nscript'
-- }
--
-- vim.cmd('autocmd BufNewFile,BufRead *.nc m-treesitter-nscriptnvim-treesitter-nscriptset filetype=nscript')

