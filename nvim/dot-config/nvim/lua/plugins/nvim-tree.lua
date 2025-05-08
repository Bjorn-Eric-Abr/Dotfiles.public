return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" }, -- lazy-load on explicit command
    config = function()
        require("nvim-tree").setup {
            disable_netrw                      = true,
            hijack_netrw                       = false,
            hijack_directories                 = {
                enable    = false,
                auto_open = false,
            },
            open_on_tab                        = false,
            hijack_cursor                      = false,
            hijack_unnamed_buffer_when_opening = false,
            update_focused_file                = { enable = true },
            view                               = { width = 30, side = "left" },
        }
    end,
}
