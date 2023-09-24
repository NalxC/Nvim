return {
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function ()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<C-f>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-f>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<C-f>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<C-b>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  }
}
