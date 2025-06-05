require("bunny"):setup({
	hops = {
		{ key = "/",          path = "/", },
		{ key = { "t", "r" }, path = "/tmp", },
		{ key = { "t", "p" }, path = "/tmp/pytest-of-marco/pytest-current", },
		{ key = "h",          path = "~",                                           desc = "Home" },
		{ key = { "m", "u" }, path = "/mnt/dlink_nas", },
		{ key = { "m", "h" }, path = "/mnt/dlink_nas_home", },
		{ key = "d",          path = "~/Downloads",                                 desc = "Downloads" },
		{ key = { "s", "r" }, path = "~/share_c_level",                             desc = "share_c_level" },
		{ key = { "s", "b" }, path = "~/share_c_level/00_orga/03_Buchhaltung/2025", desc = "share_c_level / Buchhaltung" },
		{ key = { "n", "c" }, path = "~/Nextcloud/ub_c_level",                      desc = "Nextcloud / ub_c_level" },
		{ key = { "f" },      path = "/mnt/data/Sync/Fotos", },

		-- key and path attributes are required, desc is optional
	},
	desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
	ephemeral = true,    -- Enable ephemeral hops, default is true
	tabs = true,         -- Enable tab hops, default is true
	notify = false,      -- Notify after hopping, default is false
	fuzzy_cmd = "fzf",   -- Fuzzy searching command, default is "fzf"
})
