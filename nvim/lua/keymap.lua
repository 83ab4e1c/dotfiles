local map = vim.keymap.set
vim.g.mapleader = ' '
-- nvimtree
map('n', '<c-q>', '<cmd>NvimTreeToggle<cr>', {noremap = true, silent = true})
-- bufferline
map('n', '<leader>dd', '<cmd>bdelete<cr>', {noremap = true, silent = true })
map('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', {noremap = true, silent = true})
map('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', {noremap = true, silent = true})
map('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', {noremap = true, silent = true})
map('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', {noremap = true, silent = true})
-- next buffer previous buffer
map('n', '[b', '<cmd>bn<cr>', {noremap = true, silent = true})
map('n', ']b', '<cmd>bp<cr>', {noremap = true, silent = true})
-- select window
map('n', '<c-h>', '<c-w><c-h>', {noremap = true, silent = true})
map('n', '<c-j>', '<c-w><c-j>', {noremap = true, silent = true})
map('n', '<c-k>', '<c-w><c-k>', {noremap = true, silent = true})
map('n', '<c-l>', '<c-w><c-l>', {noremap = true, silent = true})
-- select to end
map('n', 'Y', 'y$', {noremap = true, silent = true})
-- insert move
map('i', '<a-h>', '<left>', {noremap = true, silent = true})
map('i', '<a-j>', '<down>', {noremap = true, silent = true})
map('i', '<a-k>', '<up>', {noremap = true, silent = true})
map('i', '<a-l>', '<right>', {noremap = true, silent = true})
-- lspsaga
map('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', {noremap = true, silent = true})
map('n', 'ga', '<cmd>Lspsaga code_action<cr>', {noremap = true, silent = true})
map('x', 'ga', '<cmd>Lspsaga code_action<cr>', {noremap = true, silent = true})
map('n', 'K', '<cmd>Lspsaga hover_doc<cr>', {noremap = true, silent = true})
map('n', 'gs', '<cmd>Lspsaga signature_help<cr>', {noremap = true, silent = true})
map('n', 'gr', '<cmd>Lspsaga rename<cr>', {noremap = true, silent = true})
map('n', 'gd', '<cmd>Lspsaga preview_definition<cr>', {noremap = true, silent = true})
-- floaterm lazygit
map('n', '<a-=>', '<cmd>Lspsaga open_floaterm<cr>', {noremap = true, silent = true})
map('t', '<a-=>', '<c-\\><c-n><cmd>Lspsaga close_floaterm<cr>', {noremap = true, silent = true})
-- coman
map('n', 'gcc', '<cmd>ComComment<cr>', {noremap = true, silent = true})
map('x', 'gcc', ':ComComment<cr>', {noremap = true, silent = true})
map('n', 'gcj', '<cmd>ComAnnotation<cr>', {noremap = true, silent = true})
-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true, silent = true})
map('n', '<leader>b', '<cmd>Telescope buffers<cr>', {noremap = true, silent = true})
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true, silent = true})
map('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', {noremap = true, silent = true})
