-- Dashboard on startup
return {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 100,
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.startify")
        alpha.setup(dashboard.config)

        -- Manually trigger Alpha if startup was a directory
        vim.api.nvim_create_autocmd("VimEnter", {
            once = true,
            callback = function()
                local argv = vim.fn.argv()
                if vim.fn.argc() == 1 and vim.fn.isdirectory(argv[1]) == 1 then
                    -- Clear the directory buffer if it was opened
                    vim.cmd("enew")                -- open an empty buffer
                    vim.cmd("silent! bwipeout! 1") -- wipe the old buffer
                    alpha.start()
                elseif vim.fn.argc() == 0 then
                    alpha.start()
                    print("start")
                end
            end,
        })
    end,
}
