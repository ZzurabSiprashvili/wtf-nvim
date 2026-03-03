# nvim

<img width="1270" height="708" alt="Screenshot 2026-03-03 at 05 00 44" src="https://github.com/user-attachments/assets/138765d4-f832-45a6-836c-b9b47c38fc37" />

<img width="1265" height="707" alt="Screenshot 2026-03-03 at 05 01 04" src="https://github.com/user-attachments/assets/b3c84c10-33ec-47bf-8465-55b86ec97c53" />

My personal Neovim configuration -- the setup I actually use every day.

This isn't a "Neovim distribution" or a framework. It's just how I like my editor. I'm sharing it because maybe you'll like some of the same things I do, and if so, I'd love to hear from you. Some of the best conversations start with "hey, I use that too btw."

```
                    ,----,                   _.--,-``'-.
                  ,/   .`|                  /    /      '.
       .---.    ,`   .'  :   ,---,.        /  ../         ;
      /. ./|  ;    ;     / ,'  .' |        \  ``\  .``-    '
  .--'.  ' ;.'___,/    ,',---.'   |         \ ___\/    \   :
 /__./ \ : ||    :     | |   |   .'               \    :   |
.--'.  '   \' .;    |.';  ; :   :  :                 |    ;  .
___/ \ |    ' '`----'  |  | :   |  |-,              ;   ;   :
   \  \;      :    '   :  ; |   :  ;/|             /   :   :
 \   ;  `      |    |   |  ' |   |   .'             `---'.  |
  .   \    .\  ;    '   :  | '   :  '                `--..`;
   \   \   ' \ |    ;   |.'  |   |  |              .--,_
    :   '  |--'     '---'    |   :  \              |    |`.
     \   \ ;                 |   | ,'              `-- -`, ;
      '---'                  `----'                  '---`'
```

## What's Inside

This config is built around a few ideas that matter to me:

- **Stay fast.** Everything lazy-loads. Startup is snappy. Plugins load when you actually need them.
- **Keep it navigable.** Telescope for finding things, Flash for jumping around, Neo-tree and Yazi for browsing files. Multiple ways to get where you need to go.
- **Git is a first-class citizen.** LazyGit, Diffview, Gitsigns -- I spend a lot of time in git and the editor should make that easy.
- **Terminals belong in the editor.** Bottom splits, side splits, floating windows for Claude and Gemini. Python and Node REPLs on demand.
- **Dark, high-contrast, no-nonsense look.** Noctis High Contrast colorscheme with custom tweaks to diff highlights and indent guides.
- **No global installs for LSP or formatters.** Mason installs everything into Neovim's data directory -- tsgo, lua_ls, Prettier, black, gofumpt, and the rest. Your system stays clean.

The leader key is `Space`. Most keybindings are designed to be discoverable through which-key -- just press `Space` and wait.

## Getting Started

### Prerequisites

- **Neovim** >= 0.11 (built with LuaJIT)
- **Git** (for lazy.nvim and plugin installs)
- A **C compiler** in your path (for treesitter parser compilation)
- A [Nerd Font](https://www.nerdfonts.com/) installed and configured in your terminal
- **ripgrep** (`rg`) for Telescope live grep and todo-comments search

LSP servers and formatters (tsgo, lua_ls, Prettier, black, etc.) are installed automatically via Mason -- no need to install Node, Python, or Go globally for them.

Optional but recommended:
- [lazygit](https://github.com/jesseduffield/lazygit) for the LazyGit integration
- [yazi](https://github.com/sxyazi/yazi) for the Yazi file manager integration
- [claude](https://docs.anthropic.com/en/docs/claude-code) CLI for the Claude terminal
- [gemini](https://github.com/google-gemini/gemini-cli) CLI for the Gemini terminal

### Installation

Back up your existing config if you have one:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

Clone this repo:

```bash
git clone https://github.com/ZzurabSiprashvili/wtf-nvim.git ~/.config/nvim
```

Open Neovim and let lazy.nvim do its thing:

```bash
nvim
```

Plugins will auto-install on first launch. Mason will then install LSP servers and formatters in the background -- the first open of a JS file or similar might take a moment while tsgo finishes installing. Run `:Mason` to watch progress or manage packages.

### Project Structure

```
~/.config/nvim/
├── init.lua                    -- Entry point: leader key, lazy.nvim bootstrap, colorscheme
├── lua/
│   ├── options.lua             -- Editor settings (indentation, search, UI)
│   ├── mappings.lua            -- Global keybindings + loads plugin mappings
│   ├── commands.lua            -- Custom user commands (currently empty, yours to fill)
│   ├── lsp.lua                 -- LSP keybindings (servers installed via Mason)
│   └── plugins/
│       ├── init.lua            -- Plugin specs for lazy.nvim
│       ├── configs/            -- Plugin-specific configuration
│       │   ├── alpha.lua
│       │   ├── blink.lua
│       │   ├── conform.lua     -- Formatters (Prettier, stylua, black, gofumpt)
│       │   ├── mason.lua       -- LSP servers to install
│       │   ├── mason-tools.lua -- Formatters to install
│       │   └── ...
│       └── mappings/           -- Plugin-specific keybindings
│           ├── init.lua
│           ├── conform.lua
│           └── ...
```

Each plugin gets its own config file and its own mapping file. If you want to tweak how Telescope behaves, you look in `plugins/configs/telescope.lua`. If you want to change its keybindings, you look in `plugins/mappings/telescope.lua`. No hunting through a giant monolith.

## Editor Settings

A few things about how the editor itself is configured (before plugins even enter the picture):

- **2-space indentation** with spaces (no tabs)
- **Relative line numbers** with absolute number on the current line
- **System clipboard** integration (`unnamedplus`)
- **Smart case** search -- lowercase searches are case-insensitive, add an uppercase letter and it becomes exact
- **Persistent undo** -- your undo history survives between sessions
- **Global statusline** (`laststatus = 3`) -- one statusline at the bottom, not per-window
- **Indent-based folding** with all folds open by default
- New splits open **below** and to the **right**
- Perl and Ruby providers are disabled (faster startup if you don't use them)

## Plugins

| Plugin                                                                            | What it does                  | Details                            |
| --------------------------------------------------------------------------------- | ----------------------------- | ---------------------------------- |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                   | Plugin manager                | [read more](#lazynvim)             |
| [mason.nvim](https://github.com/mason-org/mason.nvim)                             | LSP/formatter installer      | [read more](#masonnvim)            |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)      | Mason + LSP bridge            | [read more](#mason-lspconfignvim)  |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto-install formatters   | [read more](#mason-tool-installernvim) |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                          | Code formatting              | [read more](#conformnvim)          |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)             | Treesitter parsers & highlighting | [read more](#nvim-treesitter)  |
| [noctis-high-contrast.nvim](https://github.com/iagorrr/noctis-high-contrast.nvim) | Colorscheme                   | [read more](#noctis-high-contrast) |
| [alpha-nvim](https://github.com/goolord/alpha-nvim)                               | Dashboard / start screen      | [read more](#alpha-nvim)           |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                     | Buffer tabs along the top     | [read more](#bufferlinenvim)       |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                      | Statusline                    | [read more](#lualinenvim)          |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)                 | Cursor animation              | [read more](#smear-cursornvim)     |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                | Fuzzy finder for everything   | [read more](#telescopenvim)        |
| [flash.nvim](https://github.com/folke/flash.nvim)                                 | Jump / motion                 | [read more](#flashnvim)            |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)                   | File tree sidebar             | [read more](#neo-treenvim)         |
| [yazi.nvim](https://github.com/mikavilpas/yazi.nvim)                              | Yazi file manager integration | [read more](#yazinvim)             |
| [blink.cmp](https://github.com/saghen/blink.cmp)                                  | Completion engine             | [read more](#blinkcmp)             |
| [copilot.vim](https://github.com/github/copilot.vim)                              | GitHub Copilot                | [read more](#copilotvim)           |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                       | Git gutter signs + blame      | [read more](#gitsignsnvim)         |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)                          | LazyGit inside Neovim         | [read more](#lazygitnvim)          |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim)                        | Side-by-side diff viewer      | [read more](#diffviewnvim)         |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                             | Diagnostics list              | [read more](#troublenvim)          |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)                 | Highlight and search TODOs    | [read more](#todo-commentsnvim)    |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                     | Togglable terminals & REPLs   | [read more](#toggletermnvim)       |
| [outline.nvim](https://github.com/hedyhli/outline.nvim)                           | Symbol outline sidebar        | [read more](#outlinenvim)          |
| [indentmini.nvim](https://github.com/nvimdev/indentmini.nvim)                     | Indent guide lines            | [read more](#indentmininvim)       |
| [marks.nvim](https://github.com/chentoast/marks.nvim)                             | Better marks experience       | [read more](#marksnvim)            |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                         | Keybinding hints popup        | [read more](#which-keynvim)        |
| [scratchpad.nvim](https://github.com/athar-qadri/scratchpad.nvim)                 | Quick scratch buffer          | [read more](#scratchpadnvim)       |
| [nvim-emmet](https://github.com/olrtg/nvim-emmet)                                 | Emmet abbreviation expansion  | [read more](#nvim-emmet)           |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                        | Auto-close brackets/quotes    | [read more](#nvim-autopairs)       |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)              | Snippet collection            | [read more](#friendly-snippets)    |
| [leetcode.nvim](https://github.com/kawre/leetcode.nvim)                           | LeetCode in Neovim            | [read more](#leetcodenvim)         |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                          | Lua utility library           | [read more](#plenarynvim)          |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)               | File type icons               | [read more](#nvim-web-devicons)    |

---

## Plugin Details

### lazy.nvim

The plugin manager. It handles installing, updating, and lazy-loading everything else. On first launch it clones itself into `stdpath("data")` and then pulls in all the plugins defined in `lua/plugins/init.lua`.

A few built-in Neovim plugins are disabled for speed: `netrwPlugin`, `tarPlugin`, `tohtml`, `tutor`, and `zipPlugin`. The update checker runs silently in the background -- no pop-ups nagging you about new versions.

Run `:Lazy` to see the dashboard, update plugins, profile startup time, or clean unused ones.

---

### mason.nvim

Portable package manager that installs LSP servers, formatters, and linters into Neovim's data directory. Nothing goes in your system PATH or global npm/pip -- everything lives under `~/.local/share/nvim/`. Run `:Mason` to browse packages, install new ones, or update what you have.

---

### mason-lspconfig.nvim

Bridges Mason with nvim-lspconfig. On first launch it installs the LSP servers listed in `plugins/configs/mason.lua` (tsgo, lua_ls, basedpyright, gopls, jsonls, cssls, html) and enables them automatically. Use `:LspInstall <server>` to add more.

---

### conform.nvim

Lightweight formatter that runs Prettier, stylua, black, and gofumpt on your code. Formatters are installed via mason-tool-installer -- no global installs.

| Key  | Mode           | Action                    |
| ---- | -------------- | ------------------------- |
| `++` | Normal, Visual | Format buffer or selection |

Format-on-save is disabled by default. Enable it in `plugins/configs/conform.lua` if you want.

**Formatters by filetype:** JS/TS/React (Prettier), JSON/HTML/CSS/SCSS/Markdown/YAML (Prettier), Lua (stylua), Python (black), Go (gofumpt).

---

### mason-tool-installer.nvim

Auto-installs formatters and other tools via Mason on first launch. The list lives in `plugins/configs/mason-tools.lua`: prettier, stylua, black, gofumpt. Add more there if you need them.

---

### nvim-treesitter

Provides tree-sitter parser management and the query files that power Neovim's built-in treesitter features. This config enables treesitter-based **syntax highlighting** for every filetype that has a parser installed -- it falls back silently for filetypes without one.

Parsers are compiled from C on first install (that's why you need a C compiler), and `:TSUpdate` runs automatically whenever the plugin updates so your parsers stay in sync.

To install a parser for a language you're working with:

```vim
:TSInstall rust javascript python lua
```

To see what's currently installed:

```vim
:TSInstall
```

The plugin does **not** lazy-load (as per official guidance) -- it needs to be available before any buffer is read so highlighting kicks in immediately.

---

### noctis-high-contrast

The colorscheme. [Noctis High Contrast](https://github.com/iagorrr/noctis-high-contrast.nvim) is a dark theme with vivid syntax highlighting that's easy on the eyes during long sessions but still makes important things pop.

It loads eagerly (no lazy-loading for the thing that paints your entire screen) with highest priority so it's applied before anything else renders. There's a small custom highlight override that sets the popup menu selection to pink-on-dark (`#ff669c` on `#1a1a1a`).

---

### alpha-nvim

The dashboard you see when you open Neovim without a file argument. It shows a big ASCII art header and four quick-action buttons:

| Button | Action                   |
| ------ | ------------------------ |
| `f`    | Find files (Telescope)   |
| `r`    | Recent files (Telescope) |
| `g`    | Open LazyGit             |
| `q`    | Quit                     |

Nothing groundbreaking, but it's a nice landing page instead of staring at an empty buffer.

---

### bufferline.nvim

Renders open buffers as tabs along the top of the editor. You can visually see what's open, jump to any buffer by position, pin important ones, and close buffers you're done with.

| Key                             | Action                               |
| ------------------------------- | ------------------------------------ |
| `Ctrl+h` / `Ctrl+l`             | Previous / next buffer               |
| `Ctrl+Shift+H` / `Ctrl+Shift+L` | Move buffer left / right             |
| `Ctrl+1` through `Ctrl+7`       | Jump to buffer by position           |
| `Space b p`                     | Toggle pin on current buffer         |
| `Space b b`                     | Pick a buffer (letter labels appear) |
| `Space W`                       | Pick a buffer to close               |
| `Space b x r`                   | Close all buffers to the right       |
| `Space b x l`                   | Close all buffers to the left        |

---

### lualine.nvim

The statusline at the bottom. Uses default lualine config with devicons. Since `laststatus` is set to `3`, there's a single global statusline rather than one per split -- keeps things clean when you have multiple windows open.

---

### smear-cursor.nvim

Adds a subtle animation trail to cursor movements. Purely cosmetic, zero impact on workflow. It just looks nice. Loads lazily on `VeryLazy` so it doesn't affect startup.

---

### telescope.nvim

The fuzzy finder. This is probably the plugin I use more than any other. It searches files, grep results, buffers, git state, diagnostics, keymaps, help tags -- basically everything.

The prompt sits at the top with results sorted in ascending order (so the best match is closest to where your eyes already are).

| Key           | Action                                   |
| ------------- | ---------------------------------------- |
| `Space Space` | Find files                               |
| `Space ?`     | Live grep (search file contents)         |
| `Space ,`     | Switch buffer (most recently used first) |
| `Space f f`   | Find files (same as Space Space)         |
| `Space f r`   | Recent files                             |
| `Space f h`   | Help tags                                |
| `Space f d`   | Diagnostics                              |
| `Space f w`   | Grep word under cursor                   |
| `Space f m`   | Marks                                    |
| `Space f k`   | Keymaps                                  |
| `Space f g`   | Git files                                |
| `Space f s`   | Git status                               |
| `Space f b`   | Git branches                             |
| `Space f c`   | Git commits                              |
| `Space f B`   | Commits for current buffer               |
| `Space f S`   | Git stash                                |

---

### flash.nvim

A motion plugin that lets you jump anywhere on the screen in 2-3 keystrokes. Press `s`, type a couple characters of where you want to go, and Flash labels the matches for you to pick. Way faster than scrolling or repeated `w`/`b` motions.

| Key      | Mode                     | Action                                   |
| -------- | ------------------------ | ---------------------------------------- |
| `s`      | Normal, Visual, Operator | Flash jump                               |
| `S`      | Normal, Visual, Operator | Flash treesitter (select by syntax node) |
| `r`      | Operator                 | Remote flash (operate on distant text)   |
| `R`      | Operator, Visual         | Treesitter search                        |
| `Ctrl+s` | Command line             | Toggle flash in search                   |

Also works in VSCode if you use the Neovim extension there.

---

### neo-tree.nvim

A file tree sidebar. Toggle it with `Tab Tab`. It follows the current file, shows dotfiles, and hides git-ignored files.

| Key       | Action               |
| --------- | -------------------- |
| `Tab Tab` | Toggle the file tree |

Inside Neo-tree you get the usual tree controls -- expand/collapse, create/rename/delete files, etc.

---

### yazi.nvim

[Yazi](https://github.com/sxyazi/yazi) is a blazingly fast terminal file manager. This plugin opens it inside Neovim so you get Yazi's powerful file operations (bulk rename, visual selection, archive handling) without leaving the editor.

| Key       | Action                                    |
| --------- | ----------------------------------------- |
| `Space e` | Open Yazi in the current file's directory |
| `Space E` | Open Yazi in the working directory        |

Press `F1` inside Yazi for its help screen. Requires `yazi` to be installed separately.

---

### blink.cmp

The completion engine. It's fast (uses a Rust fuzzy matcher), shows ghost text inline, and completes from buffer contents and file paths. Documentation pops up automatically after 200ms.

| Key      | Action            |
| -------- | ----------------- |
| `Enter`  | Accept completion |
| `Ctrl+b` | Scroll docs up    |
| `Ctrl+f` | Scroll docs down  |

Works alongside friendly-snippets for snippet completions and nvim-autopairs for auto-closing brackets after function completions.

---

### copilot.vim

GitHub Copilot for AI-powered code suggestions. Loads on `InsertEnter` so it's ready when you start typing. Enabled for all file types except:

- `markdown`
- `gitcommit`

You'll need to run `:Copilot auth` on first use to authenticate with your GitHub account.

---

### gitsigns.nvim

Shows git diff status in the sign column (the thin strip to the left of line numbers). Added lines get a green bar, changed lines get a yellow bar, deleted lines get a triangle marker. Also shows inline blame for the current line.

| Key         | Action                                   |
| ----------- | ---------------------------------------- |
| `]h` / `[h` | Jump to next / previous hunk             |
| `]H` / `[H` | Jump to last / first hunk                |
| `Space g b` | Blame current line (full commit message) |
| `Space g B` | Blame entire buffer                      |

---

### lazygit.nvim

Opens [LazyGit](https://github.com/jesseduffield/lazygit) in a floating terminal inside Neovim. If you haven't used LazyGit before, it's a terminal UI for git that makes staging, committing, rebasing, and branch management genuinely pleasant.

| Key         | Action       |
| ----------- | ------------ |
| `Space g g` | Open LazyGit |

Requires `lazygit` to be installed.

---

### diffview.nvim

A proper diff viewer. Opens a tabpage with side-by-side diffs (horizontal layout), a file panel, and custom highlight colors tuned for the dark colorscheme. Way better than staring at inline diffs.

| Key         | Action                           |
| ----------- | -------------------------------- |
| `Space g d` | Open diffview (unstaged changes) |
| `Space g s` | Staged changes                   |
| `Space g h` | Current file's git history       |
| `Space g H` | Full repo file history           |
| `Space g m` | Compare with `main` branch       |
| `Space g M` | Compare with `master` branch     |
| `Space g f` | Focus the file panel             |
| `Space g t` | Toggle the file panel            |
| `Space g c` | Close diffview                   |

---

### trouble.nvim

A pretty list for diagnostics, references, quickfix results, and more. Way nicer than the default quickfix window.

| Key         | Action                                     |
| ----------- | ------------------------------------------ |
| `Space x d` | Toggle workspace diagnostics               |
| `Space x D` | Toggle diagnostics for current buffer only |
| `Space x r` | Reset all diagnostics                      |

---

### todo-comments.nvim

Highlights TODO, FIX, HACK, WARN, PERF, NOTE, and TEST comments in your code with distinct colors and icons. Also lets you search and jump between them.

| Key         | Action                               |
| ----------- | ------------------------------------ |
| `]t` / `[t` | Jump to next / previous todo comment |
| `Space x t` | Show all todos in Trouble            |
| `Space x T` | Show TODO/FIX/FIXME in Trouble       |
| `Space s t` | Search all todos with Telescope      |
| `Space s T` | Search TODO/FIX/FIXME with Telescope |

Supported keywords: `FIX` (and FIXME, BUG, ISSUE), `TODO`, `HACK`, `WARN` (and WARNING, XXX), `PERF` (and OPTIM, OPTIMIZE), `NOTE` (and INFO), `TEST` (and TESTING, PASSED, FAILED).

---

### toggleterm.nvim

Manage multiple terminal instances without leaving Neovim. Terminals persist between toggles -- your shell session stays alive when you hide the terminal, and picks up right where you left off when you show it again.

| Key         | Action                                          |
| ----------- | ----------------------------------------------- |
| `Space H`   | Toggle terminal at the bottom                   |
| `Space L`   | Toggle terminal on the right                    |
| `Space h P` | Python REPL at the bottom                       |
| `Space l P` | Python REPL on the right                        |
| `Space h N` | Node REPL at the bottom                         |
| `Space l N` | Node REPL on the right                          |
| `Space h C` | Claude CLI (floating window)                    |
| `Space h G` | Gemini CLI (floating window)                    |
| `Ctrl+x`    | Exit terminal focus (go back to normal editing) |

The bottom terminal takes up 15 lines. The right terminal takes 40% of the screen width. Claude and Gemini open in floating windows with curved borders.

---

### outline.nvim

A symbol outline sidebar. Shows functions, classes, variables, and other symbols in the current file as a navigable tree.

| Key         | Action         |
| ----------- | -------------- |
| `Space c o` | Toggle outline |

---

### indentmini.nvim

Draws thin vertical lines at each indentation level so you can visually track block structure. The current indent scope gets a slightly brighter line. Colors are tuned to be visible but not distracting against the dark background.

---

### marks.nvim

Enhances the built-in marks experience. Shows marks in the sign column so you can see at a glance which lines are bookmarked. Use Telescope (`Space f m`) to search through your marks.

---

### which-key.nvim

Press `Space` (the leader key) and wait -- a popup appears showing all available keybindings that start with that prefix. Incredibly useful for discovering and remembering keybindings. Works with any prefix, not just leader.

---

### scratchpad.nvim

A quick throwaway buffer for jotting notes, pasting snippets, or working something out. The content persists across sessions.

| Key       | Action          |
| --------- | --------------- |
| `Space .` | Open scratchpad |

---

### nvim-emmet

Emmet abbreviation expansion for HTML/CSS workflows. Select some text or place your cursor, trigger the wrap command, and type an Emmet abbreviation to wrap the content.

| Key         | Mode           | Action                       |
| ----------- | -------------- | ---------------------------- |
| `Space x e` | Normal, Visual | Wrap with Emmet abbreviation |

---

### nvim-autopairs

Automatically closes brackets, parentheses, quotes, and other paired characters when you type the opening one. Works with blink.cmp so completions that insert functions also get their closing parenthesis.

---

### friendly-snippets

A collection of snippets for many languages and frameworks. These feed into blink.cmp's completion menu. You don't interact with this plugin directly -- it just makes completion smarter.

---

### leetcode.nvim

Solve LeetCode problems directly inside Neovim. Browse problems, write solutions, and submit them without opening a browser.

Run `:Leet` to get started.

---

### plenary.nvim

A Lua utility library used by many plugins (Telescope, Gitsigns, Neo-tree, Scratchpad). You don't interact with it directly -- it's infrastructure that makes other plugins work.

---

### nvim-web-devicons

Provides file type icons used throughout the UI -- in the file tree, bufferline tabs, statusline, Telescope pickers, etc. Requires a Nerd Font.

---

## Global Keybindings

Beyond the plugin-specific mappings listed above, here are the general keybindings:

| Key             | Mode           | Action                  |
| --------------- | -------------- | ----------------------- |
| `Escape`        | Normal         | Clear search highlight  |
| `++`            | Normal, Visual | Format buffer/selection |
| `Shift+h/j/k/l` | Normal         | Navigate between splits |
| `Space \|`      | Normal         | Vertical split          |
| `Space -`       | Normal         | Horizontal split        |
| `Space /`       | Normal, Visual | Toggle comment          |
| `Space w`       | Normal         | Close current buffer    |

**LSP keybindings** (when a language server is attached): `gd` (definition), `gr` (references), `K` (hover), `Space r n` (rename), `Space c a` (code actions), `[d` / `]d` (prev/next diagnostic).

## Acknowledgments

Built with [lazy.nvim](https://github.com/folke/lazy.nvim). Heavily inspired by the Neovim community and the many open-source plugin authors who make this ecosystem great.
