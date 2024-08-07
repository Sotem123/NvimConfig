-- Global options.
local opt = vim.opt;
local g = vim.g;

-- Take indent for new line from previous line.
opt.autoindent = true;

-- When included Vim will use all yank, deletce, change, put operations for the clipboard *.
opt.clipboard = 'unnamedplus';

-- Enable line numbers.
opt.number = true;

-- Show the relative line numbers.
-- When used in conjunction with opt.number the current absolute line number is shown for the cursor line.
opt.relativenumber = true;

-- Round the shifting (<, >) to the nearest width.
opt.shiftround = true;

-- Number of spaces that a <Tab> in the file counts for.
opt.tabstop = 4;

-- The amount of spaces used for (auto)indent step.
opt.shiftwidth = 4;

-- Use spaces when <Tab> is inserted.
opt.expandtab = false;

-- Only apply casing during regex when the expression contains a upper-cased letter.
opt.smartcase = true;

-- Use 'shiftwidth' when inserting tabs.
opt.smarttab = true;

-- Should lines be wrapped?
opt.wrap = false;

g.mapleader = " ";
g.maplocalleader = "\\";

-- Ensure folds are not all closed by default
opt.foldlevel = 99;

-- Enable 24-bit colors.
opt.termguicolors = true;

-- Should the mode be displayed in the command line?
opt.showmode = false;

-- Should the buffer unload when it's abandoned (true == don't unload).
opt.hidden = true;

-- Store undo history into a file instead of ram, persisting the changes through closing/opening of files.
opt.undofile = true;

g.python3_host_prg = '~/.venv/nvim/bin/python';
