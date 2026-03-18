return {
    "junegunn/fzf.vim",
    dependencies = {
        "junegunn/fzf",
    },
    keys = {
        { "<Leader>p", ":Files<CR>", desc = "Find Files" },
        { "<Leader>u", ":Buffers<CR>", desc = "Find Buffers", },
    },
}
