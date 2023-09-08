return {
    colorschemes = "tokyonight", -- monokai-pro/ gruvbox/ onedark/ tokyonight/
    use_icons = true,
    enable_module = {
        -- {import = "plugins.module.test"}
    },
    lsp_servers = {
        "lua_ls",
        "clangd",
        "marksman",
        -- "gopls",
    },
    debug_adapters = {
        "codelldb",
    },
    -- plugin_keymapping = {},
}
