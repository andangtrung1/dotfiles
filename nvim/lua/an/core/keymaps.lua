vim.g.mapleader = " "
local map = vim.keymap.set

-- Custom functions
-- Automatically create a file if it does not exist
vim.keymap.set("n", "gf", function()
	local filepath = vim.fn.expand("<cfile>")
	if vim.fn.filereadable(filepath) == 0 then
		-- Create and open the file
		vim.cmd("edit " .. filepath)
		print("Created new file: " .. filepath)
	else
		-- Open the existing file
		vim.cmd("edit " .. filepath)
	end
end, { desc = "Open Or Create File Under Cursor", noremap = true, silent = true })

-- Remapping gj gk for wrapped line
map("n", "j", "gj", { desc = "Down In Wrap", noremap = true, silent = true })
map("n", "k", "gk", { desc = "Up In Wrap", noremap = true, silent = true })

-- Remapping JK
map("n", "J", "<C-d>", { desc = "Scroll Down", noremap = true, silent = false })
map("n", "K", "<C-u>", { desc = "Scroll Up", noremap = true, silent = false })

-- Move around in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Down In Visual", noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Up In Visual", noremap = true, silent = true })

-- Remapping escape key
map({ "i", "v" }, "jk", "<Esc>", { desc = "Escape", noremap = true, silent = true })
map({ "i", "v" }, "jj", "<Esc>", { desc = "Escape", noremap = true, silent = true })

-- Indenting
map("v", "<", "<gv", { desc = "Indent >", noremap = true, silent = false })
map("v", ">", ">gv", { desc = "Indent <", noremap = true, silent = false })

-- Copy-Pasting
map("v", "<C-c>", '"+y', { desc = "Copy To Clipboard", noremap = true, silent = false })
map("n", "<C-v>", '"+P', { desc = "Paste From Clipboard", noremap = true, silent = false })

-- Focus between windows
map("n", "<C-h>", "<C-w>h", { desc = "Focus Left", noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { desc = "Focus Right", noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { desc = "Focus Up", noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { desc = "Focus Down", noremap = true, silent = false })

-- Resize windows or panes
map("n", "<C-S-H>", "3<C-w>>", { desc = "Resize Left", noremap = true, silent = false })
map("n", "<C-S-J>", "3<C-w>-", { desc = "Resize Right", noremap = true, silent = false })
map("n", "<C-S-K>", "3<C-w>+", { desc = "Resize Up", noremap = true, silent = false })
map("n", "<C-S-L>", "3<C-w><", { desc = "Resize Down", noremap = true, silent = false })

-- Editing keymaps
map("n", "<leader>q", ":q<cr>", { desc = "QUIT FILE", noremap = true, silent = true })
map("n", "<leader>Q", ":qa<cr>", { desc = "FORCE QUIT FILE", noremap = true, silent = true })
map("n", "<leader>w", ":w<cr>", { desc = "Write File", noremap = true, silent = true })
map("n", "<leader>W", ":wa<cr>", { desc = "Force Write File", noremap = true, silent = true })
map("n", "<leader>m", ":messages<cr>", { desc = "Show Messages", noremap = true, silent = true })

-- Navigate between quickfix items
map("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "QuickFixList Next" })
map("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "QuickFixList Previous" })

-- Nvim options and commands
map("n", "<leader>ow", ":set wrap!<cr>", { desc = "Toggle Wrap Lines", noremap = true, silent = true })
map("n", "<leader>ol", ":set linebreak!<cr>", { desc = "Toggle Break Lines", noremap = true, silent = true })
map("n", "<leader>os", ":set spell!<cr>", { desc = "Toggle Spell Check On", noremap = true, silent = true })
map("n", "<leader>oh", ":set hlsearch!<cr>", { desc = "Toggle Search Highlight", noremap = true, silent = false })
map("n", "<leader>op", ":pwd<cr>", { desc = "Current Working Directory", noremap = true, silent = false })

-- Buffers
map("n", "<Tab>", ":bnext<cr>", { desc = "Next Buffer", noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<cr>", { desc = "Previous Buffer", noremap = true, silent = true })
map("n", "<leader>bn", ":enew<cr>", { desc = "New Empty Buffer", noremap = true, silent = true })
map("n", "<leader>bl", ":blast<cr>", { desc = "Last Buffer", noremap = true, silent = true })
map("n", "<leader>bd", ":bdelete<cr>", { desc = "Last Buffer", noremap = true, silent = true })
map("n", "<leader>bs", ":source %<cr>", { desc = "Source Buffer", noremap = true, silent = true })

-- Splits and Panes
map("n", "<leader>pv", "<C-w>v", { desc = "Split Vertically", noremap = true, silent = false })
map("n", "<leader>ph", "<C-w>s", { desc = "Split Horizontally", noremap = true, silent = false })
map("n", "<leader>pe", "<C-w>=", { desc = "Equal Split", noremap = true, silent = false })
map("n", "<leader>pc", ":close<CR>", { desc = "Close Split", noremap = true, silent = false })
map("n", "<leader>po", ":only<CR>", { desc = "Single Pane", noremap = true, silent = false })

-- =========================
-- plugin specific keymaps
-- =========================

-- Tagbar
map("n", "<leader>tt", ":TagbarToggle<cr>", { desc = "Tagbar Toggle", noremap = true, silent = true })

-- Toggle Term
map(
	"n",
	"<leader>th",
	":ToggleTerm direction=horizontal<cr>",
	{ desc = "Terminal Below", noremap = true, silent = true }
)
map("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Terminal Floating", noremap = true, silent = true })

-- Markdown Preview
map(
	"n",
	"<leader>om",
	":MarkdownPreviewToggle<cr>",
	{ desc = "Toggle Markdown Preview", noremap = true, silent = true }
)

-- Auto-Session Manager
map("n", "<leader>ss", ":SessionSave<CR>", { desc = "Session Save", noremap = true, silent = true })
map("n", "<leader>sr", ":SessionRestore<CR>", { desc = "Session Restore", noremap = true, silent = true })
map("n", "<leader>sd", ":SessionDelete<CR>", { desc = "Session Delete", noremap = true, silent = true })

-- NvimTree
map("n", "<leader>ee", ":NvimTreeToggle<cr>", { desc = "NvimTree Toggle", noremap = true, silent = true })
map("n", "<leader>ef", ":NvimTreeFocus<cr>", { desc = "NvimTree Focus", noremap = true, silent = true })
map("n", "<leader>eF", ":NvimTreeFindFileToggle<cr>", { desc = "NvimTree Current", noremap = true, silent = true })
map("n", "<leader>er", ":NvimTreeRefresh<cr>", { desc = "NvimTree Refresh", noremap = true, silent = true })
map("n", "<leader>eo", ":Oil<cr>", { desc = "Oil Nvim", noremap = true, silent = false })

-- UndoTree
map("n", "<leader>uu", ":UndotreeToggle<cr>", { desc = "UndoTree Toggle", noremap = true, silent = true })
map("n", "<leader>uf", ":UndotreeFocus<cr>", { desc = "UndoTree Focus", noremap = true, silent = true })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Fuzzy Find", noremap = true, silent = true })
map(
	"n",
	"<leader>fw",
	":Telescope current_buffer_fuzzy_find<cr>",
	{ desc = "Fuzzy Find Pattern", noremap = true, silent = true }
)
map("n", "<leader>fo", ":Telescope oldfiles<cr>", { desc = "Fuzzy Find Recent Files", noremap = true, silent = true })
map("n", "<leader>fg", ":Telescope live_grep<cr>", { desc = "Live Grep", noremap = true, silent = true })
map("n", "<leader>fs", ":Telescope grep_string<cr>", { desc = "String", noremap = true, silent = true })
map("n", "<leader>fr", ":Telescope resume<cr>", { desc = "Resume Search", noremap = true, silent = true })
map("n", "<leader>fk", ":Telescope keymaps<cr>", { desc = "Search Keymaps", noremap = true, silent = true })
map("n", "<leader>fb", ":Telescope buffers<cr>", { desc = "Fuzzy Find Buffers", noremap = true, silent = true })

-- Gitsigns
map("n", "<leader>gg", ":Gitsigns<cr>", { desc = "Gitsigns Options", noremap = true, silent = true })
map(
	"n",
	"<leader>gl",
	":Gitsigns toggle_linehl<cr>",
	{ desc = "Gitsigns Line Highlight", noremap = true, silent = true }
)
map(
	"n",
	"<leader>gw",
	":Gitsigns toggle_word_diff<cr>",
	{ desc = "Gitsigns Word Difference", noremap = true, silent = true }
)
map(
	"n",
	"<leader>gd",
	":Gitsigns toggle_deleted<cr>",
	{ desc = "Gitsigns Toggle Deleted", noremap = true, silent = true }
)
map("n", "<leader>gh", ":Gitsigns preview_hunk<cr>", { desc = "Gitsigns Preview Hunk", noremap = true, silent = true })
map("n", "<leader>gp", ":Gitsigns prev_hunk<cr>", { desc = "Gitsigns Previous Hunk", noremap = true, silent = true })
map("n", "<leader>gn", ":Gitsigns next_hunk<cr>", { desc = "Gitsigns Next Hunk", noremap = true, silent = true })
map("n", "<leader>gr", ":Gitsigns refresh<cr>", { desc = "Gitsigns Refresh", noremap = true, silent = true })
map("n", "<leader>gH", ":Gitsigns diffthis<cr>", { desc = "Gitsigns Compare History", noremap = true, silent = true })

-- LSP Keymaps
map("n", "<leader>li", ":LspInfo<cr>", { desc = "Connected Language Servers", noremap = true, silent = true })
map(
	"n",
	"<leader>lH",
	":lua vim.lsp.buf.signature_help()<cr>",
	{ desc = "Signature Help", noremap = true, silent = true }
)
map("n", "<leader>lD", ":Telescope diagnostics<cr>", { desc = "Telescope Diagnostic", noremap = true, silent = true })
map(
	"n",
	"<leader>lt",
	":Telescope lsp_type_definitions<cr>",
	{ desc = "Type Definition", noremap = true, silent = true }
)
map("n", "<leader>ld", ":Telescope lsp_definitions<cr>", { desc = "Go To Definition", noremap = true, silent = true })
map("n", "<leader>lr", ":Telescope lsp_references<cr>", { desc = "References", noremap = true, silent = true })

-- LSP_Saga
map("n", "<leader>lh", ":Lspsaga hover_doc<cr>", { desc = "Hover Docs", noremap = true, silent = true })
map("n", "<leader>lR", ":Lspsaga rename<cr>", { desc = "Rename", noremap = true, silent = true })
map("n", "<leader>la", ":Lspsaga code_action<cr>", { desc = "Code Action", noremap = true, silent = true })
map(
	"n",
	"<leader>le",
	":Lspsaga show_line_diagnostics<cr>",
	{ desc = "Show Line Diagnostics", noremap = true, silent = true }
)
map(
	"n",
	"<leader>ln",
	":Lspsaga diagnostic_jump_next<cr>",
	{ desc = "Go To Next Diagnostic", noremap = true, silent = true }
)
map(
	"n",
	"<leader>lp",
	":Lspsaga diagnostic_jump_prev<cr>",
	{ desc = "Go To Previous Diagnostic", noremap = true, silent = true }
)
map("n", "<leader>lo", ":Lspsaga outline<cr>", { desc = "LSP Saga outline", noremap = true, silent = true })
