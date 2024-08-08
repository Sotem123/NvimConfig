local map = vim.keymap;

-- Split sentence
map.set('n', '<Leader>j', 'i<Cr><Esc>', { desc = 'Split the sentence.' });

-- Save
map.set('n', '<Leader>w', ':w<Cr>', { desc = 'Save' });

-- Save and quit
map.set('n', '<Leader>q', ':w!<Cr>:q!<Cr>', { desc = 'Quit and save.' });

-- Force quit
map.set('n', '<Leader><leader>q', '<Cmd>only<Cr><Cmd>q!<Cr>', { desc = 'Force quit all.' });

-- Scroll screen.
-- map.set({ 'n', 'v' }, '<C-K>', '30zk', { desc = 'Scroll up' });
-- map.set({ 'n', 'v' }, '<C-J>', '30zj', { desc = 'Scroll down' });
-- map.set({ 'n', 'v' }, '<C-L>', '30zl', { desc = 'Scroll right' });
-- map.set({ 'n', 'v' }, '<C-H>', '30zh', { desc = 'Scroll left' });

-- Window commands
map.set('n', '<C-q>', [[<Cmd>wincmd q<CR>]], {
    desc = "Close current window."
});

map.set('n', '<C-h>', [[<Cmd>wincmd h<CR>]], {
    desc = "Navigate to the left window."
});

map.set('n', '<C-l>', [[<Cmd>wincmd l<CR>]], {
    desc = "Navigate to the right window."
});

map.set('n', '<C-k>', [[<Cmd>wincmd k<CR>]], {
    desc = "Navigate to the upwards window."
});

map.set('n', '<C-j>', [[<Cmd>wincmd j<CR>]], {
    desc = "Navigate to the downwards window."
});

map.set('n', '<C-q>', [[<Cmd>wincmd q<CR>]], {
    desc = "Close current window."
});

-- Insert mode navigation.
map.set('i', '<C-h>', '<Left>');
map.set('i', '<C-l>', '<Right>');
map.set('i', '<C-k>', '<Up>');
map.set('i', '<C-j>', '<Down>');
-- map.set('i', '<C-b>', '<C-o>b');
-- map.set('i', '<C-e>', '<C-o>e');
-- map.set('i', '<C-0>', '<C-o>0');
-- map.set('i', '<C-$>', '<C-o>$');
