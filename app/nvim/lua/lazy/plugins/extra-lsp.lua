return {
  -- 構文解析（シンタックスやハイライト）
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "vimdoc",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "graphql", -- 追加
        "prisma", -- 追加
        "http", -- 追加
        "xml", -- 追加
        "hurl", -- 追加
        "hyprlang", -- 追加
      },
    },
  },
  -- LSP設定
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      -- servers = {
      --   -- GraphQL LSP設定
      --   graphql = {
      --     cmd = { "graphql-lsp", "server", "--method", "stream" },
      --     filetypes = { "graphql" },
      --   },
      --
      --   -- Prisma LSP設定
      --   prisma = {
      --     cmd = { "prisma-language-server", "--stdio" },
      --     filetypes = { "prisma" },
      --   },
      -- },
    },
  },
}
