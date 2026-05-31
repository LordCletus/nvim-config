return {
    --################
    --# Color Scheme #
    --################

    {
        "rose-pine/neovim",
	    name = "rose-pine",
	    config = function()
		    vim.cmd("colorscheme rose-pine")
	    end
    },

    --####################
    --# Mason LSP Helper #
    --####################
    
    {
        "mason-org/mason.nvim",
        opts = {}
    },

    --Lsp config
    {
        "neovim/nvim-lspconfig",
    },

    --########################
    --# Strikethrough Plugin #
    --########################
    
    {
        "justamanpop/strike-through.nvim"  
    },
    {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    --####################
    --# Blink Completion #
    --####################

    {
      'saghen/blink.cmp',
      dependencies = {
        'saghen/blink.lib',
        -- optional: provides snippets for the snippet source 
        -- 'rafamadriz/friendly-snippets', 
        },
      build = function()
        -- build the fuzzy matcher, wait up to 60 seconds
        -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
        require('blink.cmp').build():wait(60000)
      end,

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { 
            preset = 'super-tab', 

            ["<C-Tab>"] = { "show", "fallback"},

        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- (Default) list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"`
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "lua" }
      },
      },
 

    --##############
    --# Treesitter #
    --##############

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate'
    },

    --####################
    --# Feline statusbar #
    --####################
    
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    --##########################
    --# Barbecue Bar and lines #
    --##########################

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
          "SmiteshP/nvim-navic",
          "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
        -- configurations go here
        },
    },

    --###########################
    --# Rust-anyalyser features #
    --###########################

    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
    },

    --############################
    --# Cursor word underlineing #
    --############################

    {
        "sontungexpt/stcursorword",
        event = "VeryLazy",
        config = true,
    },
    
    --####################
    --# indent-blankline #
    --####################

    {
        "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} 
    },

    --############
    --# Surround #
    --############

    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- #############
    -- # Autopairs #
    -- #############

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    --######################
    --# Diagnostics viewer #
    --######################

    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup()
            vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
        end
    },   

    --########
    --# Yazi #
    --########

    {
      "mikavilpas/yazi.nvim",
      version = "*", -- use the latest stable version
      event = "VeryLazy",
      dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
      },
      keys = {
        --  in this section, choose your own keymappings!
        {
          "<leader>-",
          mode = { "n", "v" },
          "<cmd>Yazi<cr>",
          desc = "Open yazi at the current file",
        },
        {
          -- Open in the current working directory
          "<leader>cw",
          "<cmd>Yazi cwd<cr>",
          desc = "Open the file manager in nvim's working directory",
        },
        {
          "fm",
          "<cmd>Yazi toggle<cr>",
          desc = "Resume the last yazi session",
        },
      },
      ---@type YaziConfig | {}
      opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = false,
        keymaps = {
          show_help = "<f1>",
        },
      },
      --  if you use `open_for_directories=true`, this is recommended
      init = function()
        -- mark netrw as loaded so it's not loaded at all.
        --
        -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
        vim.g.loaded_netrwPlugin = 1
      end,
    },

    --###############
    --# Comment Out #
    --###############
    
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
    }
}
}
