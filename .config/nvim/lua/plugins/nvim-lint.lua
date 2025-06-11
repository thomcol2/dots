return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                python = {"ruff"}
            }
            vim.api.nvim_create_autocmd("BufWritePost", {
                callback = function()
                    require("lint").try_lint()
                end,
            })
            vim.keymap.set("n", "<leader>l", vim.diagnostic.open_float, {})
        end,
    },
}
