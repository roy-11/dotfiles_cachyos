return {
  {
    "mg979/vim-visual-multi",
    init = function()
      t = {}
      t["Find Under"] = "<C-S-d>"
      t["Find Subword Under"] = "<C-S-d>"
      vim.g.VM_maps = t
    end,
  },
  { "inkarkat/vim-ReplaceWithRegister" }, -- visual →gr : https://github.com/LazyVim/LazyVim/discussions/1371
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      keymaps = {
        normal = {
          variable_below = "<leader>;",
        },
      },
    },
  },
  { "thinca/vim-quickrun" },
  {
    "alexghergh/nvim-tmux-navigation",
    event = "BufReadPre", -- https://github.com/LazyVim/LazyVim/issues/1502 ファイルを一度開く必要あり
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })

      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    end,
  },
  -- {
  --   "nvim-telescope/telescope-media-files.nvim",
  --   config = function()
  --     require("telescope").setup({
  --       extensions = {
  --         media_files = {
  --           filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf", "mp4" },
  --           find_cmd = "rg",
  --         },
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1001,
  --   config = true,
  --   opts = {
  --     rocks = { "magick" },
  --   },
  -- },
  -- 確認中
  -- {
  --   "jellydn/hurl.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   ft = "hurl",
  --   opts = {
  --     debug = false,
  --     show_notification = false,
  --     mode = "popup",
  --     formatters = {
  --       json = { "jq" },
  --       html = {
  --         "prettier",
  --         "--parser",
  --         "html",
  --       },
  --     },
  --   },
  --   keys = {
  --     { "<leader>rA", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
  --     { "<leader>ra", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
  --     { "<leader>rte", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
  --     { "<leader>rtm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
  --     { "<leader>rtv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
  --     { "<leader>rh", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
  --   },
  -- },
  -- {
  --   "3rd/image.nvim",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     -- require("image").setup() kitty以外でエラーが出ないよう必要に応じて実行
  --   end,
  -- },
}
