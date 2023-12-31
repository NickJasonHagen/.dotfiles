-- local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

local Remap = require("nickjasonhagen.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local cnoremap = Remap.cnoremap
local nmap = Remap.nmap
-- local vmap = Remap.vmap

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
nnoremap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
nnoremap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap('y', 'myy`y')
vnoremap('Y', 'myY`y')

-- Disable annoying command line thing
nnoremap('q:', ':q<CR>')

-- Easy insertion of a trailing ; or , from insert mode
inoremap(';;', '<Esc>A;<Esc>')
inoremap(',,', '<Esc>A,<Esc>')

-- Move text up and down
inoremap('<A-j>', '<Esc>:move .+1<CR>==gi')
inoremap('<A-k>', '<Esc>:move .-2<CR>==gi')
xnoremap('<A-j>', ":move '>+1<CR>gv-gv")
xnoremap('<A-k>', ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)

-- Normal --
-- Let Y act same as D and C, Yank till end of line.
nnoremap("Y", "yg$")

-- Better join lower line into current
nnoremap("J", "mzJ`z")
nnoremap("<leader>J", ":TSJToggle<CR>")

-- Better window navigation
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

-- Scroll and center
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- Resize with arrows
nnoremap('<C-Up>', '<cmd>resize -2<CR>')
nnoremap('<C-Down>', '<cmd>resize +2<CR>')
nnoremap('<C-Right>', '<cmd>vertical resize -2<CR>')
nnoremap('<C-Left>', '<cmd>vertical resize +2<CR>')

-- Navigate buffers
nnoremap('<S-l>', '<cmd>bnext<CR>')
nnoremap('<S-h>', '<cmd>bprevious<CR>')

-- Command --
-- Resave with sudo
cnoremap('w!!', 'w !sudo tee %')
cnoremap('x!!', '<cmd>!chmod +x %<CR>')

-- Insert --
-- Press zx fast to exit insert mode
-- inoremap('zx', '<ESC>')

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

-- Visual --
-- Press zx fast to exit visual mode
-- vnoremap('zx', '<ESC>')

-- Stay in indent mode
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- Move text up and down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Don't yank paste target
-- vnoremap('p', '"_dP')

-- Visual Block --

-- Replace with paste in Visual Block mode
xnoremap('<leader>p', '"_dP')

-- Other
-- Yank till end of line
nnoremap("Y", "yg$")
nnoremap("<leader>Y", "\"+yg$")

-- Yank to system's clipboard
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")

-- Delete without cut
nnoremap('<leader>d', '"_d')
vnoremap('<leader>d', '"_d')

-- Show diff of unsaved changes compared to last saved version.
nnoremap('<leader>D%', ':w !diff % -<CR>')

-- Reselect last pasted text
nnoremap('gp', '`[v`]')

-- No operation: cancel
nnoremap("<leader>Q", "<cmd>quit<CR>")

-- No operation: cancel
nnoremap("Q", "<nop>")

-- This unsets the "last search pattern" register by hitting return
nnoremap('<CR>', '<cmd>noh<CR><CR>')

-- Quickfix list
nnoremap("<C-J>", "<cmd>cnext<CR>zz")
nnoremap("<C-K>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")

-- This replaces the current word
nnoremap('<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Formatting
nnoremap('<leader>F', function()
    vim.lsp.buf.format({
        timeout_ms = 10000,
        -- filter = function(client)
        --     return client.name == "null-ls"
        -- end
    })
end, { desc = 'Format File' })

-- Substitute current word
nnoremap('<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Generate docblock
nnoremap("<Leader>**", ":Neogen<CR>")

-- Undotree
nnoremap('<leader>U', '<cmd>UndotreeToggle<CR>')

-- Nvim Tree
nnoremap('<leader>e', '<cmd>NvimTreeFindFileToggle<CR>')
nnoremap('<leader>E', '<cmd>Ex<CR>')

-- ToggleTerm
nnoremap("<C-\\>", "<cmd>ToggleTerm direction=float<CR>")

-- Tmux Sessionizer
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Ctrl+Shift+F - t
nnoremap("\x74\r", "<cmd>silent !tmux neww t<CR>")

-- Git
nnoremap("gh", "<cmd>diffget //2<CR>")
nnoremap("gl", "<cmd>diffget //3<CR>")
