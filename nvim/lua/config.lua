local config = {}

function config.zephyr()
  vim.cmd('colorscheme zephyr')
end

function config.galaxyline()
  local status_ok, galaxyline = pcall(require, 'galaxyline')
  if not status_ok then
    return
  end

  local colors = require('galaxyline.theme').default
  local condition = require('galaxyline.condition')
  local gls = galaxyline.section
  galaxyline.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer' }

  gls.left[1] = {
    RainbowRed = {
      provider = function()
        return '▊ '
      end,
      highlight = { colors.blue, colors.bg },
    },
  }

  gls.left[2] = {
    ViMode = {
      provider = function()
        local mode_color = {
          ['!'] = colors.red,
          [''] = colors.blue,
          [''] = colors.orange,
          ['r?'] = colors.cyan,
          c = colors.magenta,
          ce = colors.red,
          cv = colors.red,
          i = colors.green,
          ic = colors.yellow,
          n = colors.red,
          no = colors.red,
          r = colors.cyan,
          R = colors.violet,
          rm = colors.cyan,
          Rv = colors.violet,
          s = colors.orange,
          S = colors.orange,
          t = colors.red,
          v = colors.blue,
          V = colors.blue,
        }
        vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
        return '  '
      end,
    },
  }

  gls.left[3] = {
    FileSize = {
      condition = condition.buffer_not_empty,
      highlight = { colors.fg, colors.bg },
      provider = 'FileSize',
    },
  }

  gls.left[4] = {
    FileIcon = {
      condition = condition.buffer_not_empty,
      highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
      provider = 'FileIcon',
    },
  }

  gls.left[5] = {
    FileName = {
      condition = condition.buffer_not_empty,
      highlight = { colors.fg, colors.bg, 'bold' },
      provider = 'FileName',
    },
  }

  gls.left[6] = {
    LineInfo = {
      highlight = { colors.fg, colors.bg },
      provider = 'LineColumn',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gls.left[7] = {
    PerCent = {
      highlight = { colors.fg, colors.bg, 'bold' },
      provider = 'LinePercent',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gls.left[8] = {
    DiagnosticError = {
      highlight = { colors.red, colors.bg },
      icon = '  ',
      provider = 'DiagnosticError',
    },
  }

  gls.left[9] = {
    DiagnosticWarn = {
      highlight = { colors.yellow, colors.bg },
      icon = '  ',
      provider = 'DiagnosticWarn',
    },
  }

  gls.left[10] = {
    DiagnosticHint = {
      highlight = { colors.cyan, colors.bg },
      icon = '  ',
      provider = 'DiagnosticHint',
    },
  }

  gls.left[11] = {
    DiagnosticInfo = {
      highlight = { colors.blue, colors.bg },
      icon = '  ',
      provider = 'DiagnosticInfo',
    },
  }

  gls.mid[1] = {
    ShowLspClient = {
      condition = function()
        local tbl = { ['dashboard'] = true, [''] = true }
        if tbl[vim.bo.filetype] then
          return false
        end
        return true
      end,
      highlight = { colors.blue, colors.bg, 'bold' },
      icon = ' LSP:',
      provider = 'GetLspClient',
    },
  }

  gls.right[1] = {
    FileEncode = {
      condition = condition.hide_in_width,
      highlight = { colors.green, colors.bg, 'bold' },
      provider = 'FileEncode',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gls.right[2] = {
    FileFormat = {
      condition = condition.hide_in_width,
      highlight = { colors.green, colors.bg, 'bold' },
      provider = 'FileFormat',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gls.right[3] = {
    GitIcon = {
      provider = function()
        return ' '
      end,
      condition = condition.check_git_workspace,
      highlight = { colors.violet, colors.bg, 'bold' },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gls.right[4] = {
    GitBranch = {
      condition = condition.check_git_workspace,
      highlight = { colors.violet, colors.bg, 'bold' },
      provider = 'GitBranch',
    },
  }

  gls.right[5] = {
    Separator = {
      highlight = { colors.fg, colors.bg, 'bold' },
      provider = function()
        return ' '
      end
    }
  }
  gls.right[6] = {
    DiffAdd = {
      condition = condition.hide_in_width,
      highlight = { colors.green, colors.bg },
      icon = '  ',
      -- icon = '  ',
      provider = 'DiffAdd',
    },
  }

  gls.right[7] = {
    DiffModified = {
      condition = condition.hide_in_width,
      highlight = { colors.orange, colors.bg },
      icon = '  ',
      -- icon = '  ',
      provider = 'DiffModified',
    },
  }

  gls.right[8] = {
    DiffRemove = {
      condition = condition.hide_in_width,
      highlight = { colors.red, colors.bg },
      icon = '  ',
      -- icon = '  ',
      provider = 'DiffRemove',
    },
  }

  gls.right[9] = {
    RainbowBlue = {
      provider = function()
        return ' ▊'
      end,
      highlight = { colors.blue, colors.bg },
    },
  }

  gls.short_line_left[1] = {
    BufferType = {
      highlight = { colors.blue, colors.bg, 'bold' },
      provider = 'FileTypeName',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gls.short_line_left[2] = {
    SFileName = {
      condition = condition.buffer_not_empty,
      highlight = { colors.fg, colors.bg, 'bold' },
      provider = 'SFileName',
    },
  }

  gls.short_line_right[1] = {
    BufferIcon = {
      highlight = { colors.fg, colors.bg },
      provider = 'BufferIcon',
    },
  }
end

function config.indent_blankline()
  local state, indent_blankline = pcall(require, "indent_blankline")
  if not state then
    vim.notify("indent_blankline not found!")
    return
  end
  -- require("indent_blankline").setup {
    -- show_current_context = true,
  -- }
  indent_blankline.setup {}
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
    },
  })
end

function config.nvim_tree()
  require('nvim-tree').setup({
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
  })
end

function config.autopairs()
  require("nvim-autopairs").setup()
end

function config.autotag()
  require('nvim-ts-autotag').setup()
end

function config.gitsigns()
  require("gitsigns").setup()
end

function config.telescope()
  require('telescope').setup({
    defaults = {
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  })
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('file_browser')
end

function config.nvim_treesitter()
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'c', 'cpp', 'go', 'lua', 'rust', 'python', 'regex', 'cmake', 'ninja',
      'make', 'bash', 'css', 'html', 'tsx', 'typescript', 'vue',
    },
    highlight = {
      enable = true,
    },
  })
end

function config.mason()
  require('mason').setup()
end

function config.nvim_lsp()
  local lspconfig = require("lspconfig")
  local signs = {
    Error = ' ',
    Warn = ' ',
    Info = ' ',
    Hint = ' ',
  }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = {
      prefix = '🔥',
      source = true,
    },
  })
  lspconfig.sumneko_lua.setup({
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { 'vim', 'packer_plugins' },
        },
        runtime = { version = 'LuaJIT' },
        workspace = {
          library = vim.list_extend({ [vim.fn.expand('$VIMRUNTIME/lua')] = true }, {}),
        },
      },
    },
  })
  lspconfig.clangd.setup({})
  lspconfig.pyright.setup({})
  lspconfig.gopls.setup({})
  lspconfig.rust_analyzer.setup({})

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  lspconfig.html.setup({
    capabilities = capabilities,
  })
  lspconfig.cssls.setup({
    capabilities = capabilities,
  })
  lspconfig.tsserver.setup({})
end

function config.lspsaga()
  require('lspsaga').init_lsp_saga({})
end

function config.nvim_cmp()
  local cmp = require("cmp")
  if not cmp then return end
  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    formatting = {
      fields = { "abbr", "kind", "menu" },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "buffer" },
      { name = "path" },
    }),
  })
end

return config
