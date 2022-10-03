local conf = require('config')
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = packer_path .. "/plugin/packer_compiled.lua"
local state = vim.loop.fs_stat(packer_path)
if not state then
  local cmd = '!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path
  vim.cmd(cmd)
  vim.cmd('packadd packer.nvim')
end

return require('packer').startup({ function(use)
  use { 'wbthomason/packer.nvim' }
  -- use {
  --   'glepnir/zephyr-nvim',
  --   config = conf.zephyr
  -- }
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = conf.catppuccin,
  }
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = conf.galaxyline,
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf.indent_blankline,
  }
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = conf.nvim_tree,
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'akinsho/nvim-bufferline.lua',
    event = { 'BufRead', 'BufNewFile' },
    config = conf.nvim_bufferline,
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = conf.autopairs,
  }
  use {
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf.gitsigns,
    requires = { 'nvim-lua/plenary.nvim', opt = true },
  }
  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = conf.telescope,
    requires = {
      { 'nvim-lua/plenary.nvim', opt = true },
      { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
      { 'nvim-telescope/telescope-file-browser.nvim', opt = true },
    },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufRead', 'BufNewFile' },
    run = ':TSUpdate',
    config = conf.nvim_treesitter,
  }
  use {
    'glepnir/coman.nvim',
    event = { 'BufRead', 'BufNewFile' },
  }
  use {
    'williamboman/mason.nvim',
    config = conf.mason
  }
  use {
    'neovim/nvim-lspconfig',
    after = 'mason.nvim',
    config = conf.nvim_lsp,
  }
  use {
    'glepnir/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = conf.lspsaga,
  }
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = conf.nvim_cmp,
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
      { 'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
    },
  }
  if not state then
    require('packer').sync()
  end
end,
  config = {
    compile_path = compile_path,
    display = {
      open_fn = require('packer.util').float,
    },
    git = {
      clone_timeout = 60,
    },
  }
})
