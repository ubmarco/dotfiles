require("bunny"):setup({
	hops = {
		{ key = "/",          path = "/", },
		{ key = "d",          path = "~/Downloads",                                 desc = "Downloads" },
		{ key = "h",          path = "~",                                           desc = "Home" },
		{ key = { "f" },      path = "/mnt/data/Sync/Fotos", },
		{ key = { "m", "h" }, path = "/mnt/dlink_nas_home", },
		{ key = { "m", "u" }, path = "/mnt/dlink_nas", },
		{ key = { "n", "c" }, path = "~/Nextcloud/ub_c_level",},
		{ key = { "n", "r" }, path = "~/Nextcloud",},
		{ key = { "s", "b" }, path = "~/share_c_level/00_orga/03_Buchhaltung/2025", desc = "share_c_level / Buchhaltung" },
		{ key = { "s", "r" }, path = "~/share_c_level",                             desc = "share_c_level" },
		{ key = { "t", "p" }, path = "/tmp/pytest-of-marco/pytest-current", },
		{ key = { "t", "r" }, path = "/tmp", },
		{ key = { "v", "b" }, path = "/home/marco/Videos/BBT", },
		-- key and path attributes are required, desc is optional
	},
	desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
	ephemeral = true,    -- Enable ephemeral hops, default is true
	tabs = true,         -- Enable tab hops, default is true
	notify = false,      -- Notify after hopping, default is false
	fuzzy_cmd = "fzf",   -- Fuzzy searching command, default is "fzf"
})
