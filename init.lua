require('lazyvim')
require('options')
require('keymaps')
require('colourscheme')

--Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

--Lualine Config

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ')', right = '('},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require("stcursorword").setup({
    max_word_length = 100, -- if cursorword length > max_word_length then not highlight
    min_word_length = 2, -- if cursorword length < min_word_length then not highlight
    excluded = {
        filetypes = {
            "TelescopePrompt",
        },
        buftypes = {
            -- "nofile",
            -- "terminal",
        },
        patterns = { -- the pattern to match with the file path
            -- "%.png$",
            -- "%.jpg$",
            -- "%.jpeg$",
            -- "%.pdf$",
            -- "%.zip$",
            -- "%.tar$",
            -- "%.tar%.gz$",
            -- "%.tar%.xz$",
            -- "%.tar%.bz2$",
            -- "%.rar$",
            -- "%.7z$",
            -- "%.mp3$",
            -- "%.mp4$",
        },
    },
    highlight = {
        underline = true,
        fg = nil,
        bg = nil,
    },
})

require("ibl").setup()
require('Comment').setup()

-- Merge capabilities with the default config from lsp/markdown_oxide.lua
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- If using nvim-cmp, extend capabilities (optional)
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use the function call form to MERGE (not replace) the config
vim.lsp.config('markdown_oxide', {
    -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
    -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
    capabilities = vim.tbl_deep_extend(
        'force',
        capabilities,
        {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            },
        }
    ),
})

--##################
--# Markview Setup #
--##################

--- Configuration options for `markview.nvim`.
---@class markview.config
---
---@field experimental? markview.config.experimental
---@field html? markview.config.html
---@field latex? markview.config.latex
---@field markdown? markview.config.markdown
---@field markdown_inline? markview.config.markdown_inline
---@field preview? markview.config.preview
---@field renderers? table<string, function>
---@field typst? markview.config.typst
---@field yaml? markview.config.yaml
local presets = require("markview.presets");

require("markview").setup({
    markdown = {
        headings = presets.headings.arrowed
    }
});

--- You can again call `setup()` to modify
--- the options without changing the preset.
require("markview").setup({
    markdown = {
        headings = {}
    },

    preview = {
        enable = true,


        enable_hybrid_mode = true,
        linewise_hybrid_mode = true,
        hybrid_modes = {'n'}
    },

    experimental = {
        --prefer_nvim = true,
    },
});

vim.lsp.enable('markdown_oxide')
