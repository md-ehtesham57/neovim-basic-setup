# 🚀 My NeoVim Config – Beginner Friendly Guide

Welcome!  
This is my personal NeoVim configuration written in **Lua**.  
It’s built to be **easy to use for beginners** but still **powerful** enough to grow with you.

If you’ve never touched `init.lua` before, don’t worry — I’ll walk you through **what this file does, how to install it, and how to use it**.

---

## 📦 1. What’s inside this config?

Here’s what my `init.lua` sets up:

### ✏️ Basic Editor Settings
These make NeoVim easier to read and work in:
- Show line numbers (`number`) and relative numbers (`relativenumber`)
- Tabs = 2 spaces (`tabstop`, `shiftwidth`, `expandtab`)
- Smart indentation for code
- No word wrapping (`wrap = false`)
- Pretty colors in terminal (`termguicolors = true`)
- Highlight the line where the cursor is (`cursorline = true`)
- Always show the sign column (for Git changes, errors, etc.)
- Use system clipboard (`clipboard = unnamedplus`)
- Smooth scrolling (`scrolloff = 8`)
- Windows split nicely (`splitbelow`, `splitright`)
- Faster updates (`updatetime = 250`)
- Quicker keymap timeout (`timeoutlen = 300`)

---

## ⚡ 2. Plugins (via Lazy.nvim)

We use **[lazy.nvim](https://github.com/folke/lazy.nvim)** to manage plugins.  
When you open NeoVim, it will **automatically install** missing plugins.

### 🧠 Coding Help
- **Mason** (`williamboman/mason.nvim`) – Installs language servers easily.
- **Mason LSPConfig** (`williamboman/mason-lspconfig.nvim`) – Connects Mason to NeoVim's LSP.
- **nvim-lspconfig** – Adds smart features like:
  - Go to definition (`gd`)
  - Hover docs (`K`)
  - Rename variables (`<leader>rn`)
  - Code actions (`<leader>ca`)
- Preconfigured for **TypeScript** and **Lua**.

### ✍ Autocomplete & Snippets
- **nvim-cmp** – Autocomplete popup while typing.
- **LuaSnip** – Snippets (pre-written code blocks).
- **cmp-nvim-lsp** + **cmp_luasnip** – Connect LSP & snippets to autocomplete.

Keybinds:
- `<Tab>` → Next suggestion
- `<S-Tab>` → Previous suggestion
- `<CR>` → Accept suggestion

### 📏 Visual Helpers
- **indent-blankline** – Vertical lines for indentation guides.
- **tokyonight.nvim** + **gruvbox.nvim** – Color themes.
- **lualine.nvim** – Pretty status bar at the bottom.
- **nvim-web-devicons** – Icons for files.

### 📂 File Navigation
- **nvim-tree.lua** – File explorer.
  - `<leader>ee` → Toggle file tree.
  - `<leader>ew` → Close file tree.

### 🔍 Search
- **telescope.nvim** – Fuzzy finder.
  - `<leader>ff` → Find files.
  - `<leader>fg` → Live grep (search in files).
  - `<leader>fb` → Find open buffers.
  - `<leader>fh` → Help tags.

### 📝 Git Integration
- **vim-signify** – Shows file changes (added, modified, deleted lines).
- **vim-fugitive** – Full Git control inside NeoVim.
  - `<leader>gs` → Git status
  - `<leader>gc` → Git commit
  - `<leader>gd` → Git diff
  - `<leader>gl` → Git log
  - `<leader>gp` → Git push
  - `<leader>gP` → Git pull
  - `<leader>gb` → Switch branches

---

## 🛠 3. Custom Keymaps

- `<leader>r` → Reload config (`init.lua`)
- `<leader>tt` → Open terminal in vertical split
- `<leader>tc` → Close terminal
- `<C-v>` in Insert Mode → Paste from system clipboard

---

## 🪄 4. Auto Formatting
Every time you save a file, it **auto-formats** using the language server’s rules.

---

## 🖌 5. How to Install

**Step 1 – Install NeoVim (v0.9 or later)**  
[Download NeoVim here](https://neovim.io/)

**Step 2 – Install a Nerd Font** (for icons)  
[Download FiraCode Nerd Font](https://www.nerdfonts.com/)

**Step 3 – Install Git**  
Required for downloading plugins.

**Step 4 – Install this config**
```sh
# Backup your old config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/YOUR-USERNAME/YOUR-REPO.git ~/.config/nvim

## Beginner Tips

:w → Save file

:q → Quit NeoVim

:wq → Save & quit

u → Undo

<C-r> → Redo

/text → Search in file

n → Next search result

N → Previous search result

## Conclusion ##


---

This README **matches exactly what’s in your init.lua** — every setting, plugin, and keybinding is explained in plain English.  

If you want, I can also add **a visual diagram** showing how the plugins connect (for absolute beginners who like pictures). That would make it even friendlier.  

Do you want me to add that diagram too?


