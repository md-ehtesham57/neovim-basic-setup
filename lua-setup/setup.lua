vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- ⚡ Enable Lua module loader (makes startup faster)
vim.loader.enable()

-- ⛓️ Leader key
vim.g.mapleader = "\\"

-- 📁 Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
end
vim.opt.rtp:prepend(lazypath)
-- 🚀 Plugin Setup with Lazy.nvim
require("lazy").setup({

  -- 🧠 LSP & Autocomplete (Updated with Auto-Indentation)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls" },
        automatic_installation = true,
        automatic_enable = true, -- Ensure automatic setup is enabled
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end

      -- TypeScript / Lua LSPs
      lspconfig.ts_ls.setup({ on_attach = on_attach })
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },


  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl", -- this line is crucial in v3
    opts = {
      indent = {
        char = "│",
      },
      exclude = {
        filetypes = { "help", "packer", "NvimTree", "terminal" },
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
    }
  },


  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.g.gruvbox_transparent_bg = 1
      vim.cmd("colorscheme gruvbox")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    end
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      local mason = require("mason")
      mason.setup({
        ui = {
          border = "rounded", -- Optional UI tweak
        },
        pip = {
          upgrade_dependencies = false, -- This can sometimes cause issues, try disabling
        },
      })
    end,
  },


  {
    "mhinz/vim-signify",
    lazy = false,
    init = function()
      -- Optional tweaks if you want
      -- Below lines are used to represent changes,
      -- While the git is initialized.
      vim.g.signify_sign_add = '+'
      vim.g.signify_sign_change = '~'
      vim.g.signify_sign_delete = '_'
    end
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" })
      vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { desc = "Git Diff" })
      vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git Log" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })
      vim.keymap.set("n", "<leader>gP", ":Git pull<CR>", { desc = "Git Pull" })
      vim.keymap.set("n", "<leader>gb", ":Git switch ", { desc = "Git Switch Branch" }) -- prompts for branch name
    end
  }
}) -- Fix: Add the missing closing parenthesis here


-- ✨ Optional: Set default colorscheme
vim.cmd("colorscheme gruvbox")

-- 🪄 Quality of life keymaps
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
vim.keymap.set("n", "<leader>ew", ":NvimTreeClose<CR>", { desc = "Close File Tree" })
vim.keymap.set("n", "<leader>r", ":so ~/.config/nvim/init.lua<CR>", { desc = "Reload config" })

-- Clipboard bindings (for insert and normal mode)

-- ⌨️ Open terminal in a horizontal split
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("vsplit | terminal")
  vim.cmd("startinsert") -- jump straight into insert mode
end, { desc = "Open Terminal" })


--Auto Indentation and Formating
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
  augroup END
]]

-- ✨ Enable Auto Indentation in Lua & TypeScript (and more)
vim.cmd("filetype plugin indent on") -- Automatically load filetype indent plugins
vim.opt.smartindent = true           -- Enables smart indentation
vim.opt.autoindent = true            -- Enable auto-indentation
vim.opt.cindent = true               -- C style auto-indentation
vim.opt.tabstop = 2                  -- Set tab width to 2 spaces
vim.opt.shiftwidth = 2               -- Shift width for auto-indentation
vim.opt.expandtab = true             -- Use spaces instead of tabs


-- ❌ Close terminal window (or any focused window really)
vim.keymap.set("t", "<leader>tc", [[<C-\><C-n>:q<CR>]], { desc = "Close Terminal" })
vim.keymap.set("n", "<leader>tc", ":q<CR>", { desc = "Close Terminal" })

vim.keymap.set("i", "<C-v>", "<Esc>\"+pa", { desc = "Paste (Insert)" })
