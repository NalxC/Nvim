return {
    colorschemes = "tokyonight", -- monokai-pro/ gruvbox/ onedark/ tokyonight/
    use_icons = true,
    enable_module = {
        {import = "plugins.module.clangd"},
        {import = "plugins.module.go"},
    },
}
