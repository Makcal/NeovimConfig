---@type ChadrcConfig
local M = {
	base46 = {
		theme = "onedark",
		hl_override = {
			NonText = { fg = "grey_fg2" },
			LineNr = { fg = "white" },
			StatusLine = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },

            CmpDoc = { bg = "NONE" },
            CmpPmenu = { bg = "NONE" },

            TbFill = { bg = "NONE" },
            TbBufOn = { bg = "NONE" },
            TbBufOff = { bg = "NONE" },
            TbBufOnClose = { bg = "NONE" },
            TbBufOffClose = { bg = "NONE" },
            TbBufOnModified = { bg = "NONE" },
            TbBufOffModified = { bg = "NONE" },

			NvimTreeNormal = { bg = "NONE" },
			NvimTreeNormalNC = { bg = "NONE" },
            NvimTreeWinSeparator = { bg = "NONE", fg = "white" },
			NvimTreeCursorLine = { bg = "NONE" },

			TelescopeNormal = { bg = "NONE" },
			TelescopeBorder = { bg = "NONE", fg = "white" },
			TelescopeSelection = { bg = "light_grey" },
            TelescopeResultsTitle = { bg = "sun" },
			TelescopePromptNormal = { bg = "NONE" },
			TelescopePromptBorder = { bg = "NONE", fg = "white" },
			TelescopePromptPrefix = { bg = "NONE" },
		},
	},
	mason = {
		pkgs = {
			"pyright",
		},
	},
}
return M
