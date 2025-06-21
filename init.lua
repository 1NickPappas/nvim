-- Set leader key before plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load core editor options
require("config.options")

-- (Optional but recommended) Load global keymaps
-- require("config.keymaps")

require("config.lazy")
