local conf = require('config')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { 'glepnir/zephyr-nvim', config = conf.zephyr},
  { 'nvim-lua/plenary.nvim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'akinsho/bufferline.nvim', config = conf.nvim_bufferline },
  { 'glepnir/galaxyline.nvim', config = conf.galaxyline },
  { 'lukas-reineke/indent-blankline.nvim', config = conf.indent_blankline },
  { 'kyazdani42/nvim-tree.lua', config = conf.nvim_tree },
  { 'windwp/nvim-autopairs', config = conf.autopairs },
  { 'lewis6991/gitsigns.nvim', config = conf.gitsigns },
  { 'nvim-telescope/telescope.nvim', config = conf.telescope },
  { 'nvim-telescope/telescope-fzy-native.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-treesitter/nvim-treesitter', config = conf.nvim_treesitter },
  { 'windwp/nvim-ts-autotag', config = conf.autotag },
  { 'glepnir/coman.nvim' },
  { 'williamboman/mason.nvim', config = conf.mason },
  { 'neovim/nvim-lspconfig', config = conf.nvim_lsp },
  { 'glepnir/lspsaga.nvim', config = conf.lspsaga },
  { 'hrsh7th/nvim-cmp', config = conf.nvim_cmp },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
})
