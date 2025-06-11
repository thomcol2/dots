local options = {
    showmode = false,
    showcmd = false,
    mouse = "a",
    cursorline = true,
    smoothscroll = true,
    title = true,

    number = true,
    relativenumber = true,
    colorcolumn = "80",

    expandtab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,

    smartindent = true,
    autoindent = true,
    wrap = true,

    termguicolors = true,

    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,

    backup = false,
    writebackup = false,
    swapfile = false,

    clipboard = "unnamedplus",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
