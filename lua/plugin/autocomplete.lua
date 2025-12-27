return {
	{
		'saghen/blink.cmp',
		version = "1.*",
    event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets"
		},
		--- @type blink.cmp.Config
		opts = {
			keymap = { preset = 'enter' },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono"
			},
			completion = {
				documentation = { auto_show = true }
			},
			signature = { enabled = true },
		},
	},
	{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
		opts = {}
	},
}
