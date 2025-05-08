local api = vim.api
local fn = vim.fn
local alpha = require("alpha")

api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        local argc = fn.argc()
        if argc == 0 then
            -- case: `nvim`
            alpha.start(true)
            return
        end

        local first = fn.argv(0)
        if argc == 1 and fn.isdirectory(first) == 1 then
            -- case: `nvim some/dir`
            vim.cmd.cd(first) -- cd into the directory

            -- Open neo-tree instead of nvim-tree
            vim.cmd("Neotree")

            -- now delete the buffer that nvim auto‐opened for the dir
            local dir_buf = fn.bufnr(first)
            if dir_buf ~= -1 then
                api.nvim_buf_delete(dir_buf, { force = true })
            end
            return
        end
    end,
})
