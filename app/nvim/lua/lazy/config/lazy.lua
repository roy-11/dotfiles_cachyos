local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- import any extras modules here
    -- フォーマット・リンティング
    { import = "lazyvim.plugins.extras.linting.eslint" }, -- 追加：eslint
    { import = "lazyvim.plugins.extras.formatting.prettier" }, -- 追加：prettier

    -- 言語
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.tailwind" }, -- 追加：tailwind
    { import = "lazyvim.plugins.extras.lang.docker" }, -- 追加： dokcer
    { import = "lazyvim.plugins.extras.lang.yaml" }, -- 追加：yaml
    { import = "lazyvim.plugins.extras.lang.git" }, -- 追加：git
    { import = "lazyvim.plugins.extras.lang.markdown" }, -- 追加：markdown
    { import = "lazyvim.plugins.extras.lang.python" }, -- 追加：python
    { import = "lazyvim.plugins.extras.lang.toml" }, -- 追加：toml
    { import = "lazyvim.plugins.extras.lang.sql" }, -- 追加：sql
    { import = "lazyvim.plugins.extras.lang.prisma" }, -- 追加：prisma
    { import = "lazyvim.plugins.extras.util.dot" }, -- .env, .conf

    -- Other Recommended
    { import = "lazyvim.plugins.extras.editor.inc-rename" },
    { import = "lazyvim.plugins.extras.editor.dial" },
    { import = "lazyvim.plugins.extras.coding.yanky" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

    -- Git
    { import = "lazyvim.plugins.extras.util.gh" },

    -- AI
    { import = "lazyvim.plugins.extras.ai.copilot" }, -- goast suggest

    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
