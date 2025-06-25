return{
    'mhinz/vim-startify',
    event = 'VimEnter',
    config = function()
        local pokemon = require('pokemon')
        pokemon.setup({
            number = 'random',
            size = 'auto',
        })
        vim.g.startify_custom_header = pokemon.header()
    end,
    dependencies = { { 'ColaMint/pokemon.nvim' } },

		opts = { 
    -- pokemon number (format: [number]{.[forme]}). default is 'random'. 
    -- [number]: 0001 ~ 1008
    -- [forme]: 1, 2, 3, 4, ... (represents the different forme of this pokemon)
    number = 'random', -- '0001', '0006.1', '0006.2', '0006.3'
    -- header size ('tiny', small', 'large'). default is 'auto'.
    size = 'auto', 
}
}
