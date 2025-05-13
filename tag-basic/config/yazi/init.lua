require("bunny"):setup({
	hops = {
		{ key = "/",          path = "/", },
		{ key = { "t", "r" }, path = "/tmp", },
		{ key = { "t", "p" }, path = "/tmp/pytest-of-marco/pytest-current", },
		{ key = "h",          path = "~",                                      desc = "Home" },
		{ key = "m",          path = "~/Music",                                desc = "Music" },
		{ key = "d",          path = "~/Desktop",                              desc = "Desktop" },
		{ key = "D",          path = "~/Documents",                            desc = "Documents" },
		{ key = { "c", "r" }, path = "~/share_c_level", },
		{ key = { "c", "b" }, path = "~/share_c_level/00_orga/03_Buchhaltung", },
		{ key = { "l", "s" }, path = "~/.local/share",                         desc = "Local share" },
		{ key = { "l", "b" }, path = "~/.local/bin",                           desc = "Local bin" },
		-- key and path attributes are required, desc is optional
	},
	desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
	ephemeral = true,    -- Enable ephemeral hops, default is true
	tabs = true,         -- Enable tab hops, default is true
	notify = false,      -- Notify after hopping, default is false
	fuzzy_cmd = "fzf",   -- Fuzzy searching command, default is "fzf"
})
