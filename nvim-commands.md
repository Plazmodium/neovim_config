# Neovim Commands Reference

Based on your personal config. Leader key is `Space`.

---

## Commenting Code (Comment.nvim)

| Keys | Mode | Action |
|------|------|--------|
| `gcc` | Normal | Toggle comment on current line |
| `gc` | Visual | Toggle comment on selection |
| `gbc` | Normal | Toggle block comment on current line |
| `gb` | Visual | Toggle block comment on selection |
| `gcO` | Normal | Add comment on line above |
| `gco` | Normal | Add comment on line below |
| `gcA` | Normal | Add comment at end of line |

---

## Autocompletion (nvim-cmp)

| Keys | Action |
|------|--------|
| `Tab` | Select next completion item |
| `Shift+Tab` | Select previous completion item |
| `Enter` | Confirm selection |
| `Ctrl+Space` | Trigger completion manually |
| `Ctrl+e` | Abort/close completion menu |
| `Ctrl+b` | Scroll docs up (in popup) |
| `Ctrl+f` | Scroll docs down (in popup) |

---

## LSP (Language Server)

### Code Navigation
| Keys | Action |
|------|--------|
| `gd` | Go to definition |
| `K` | Show hover documentation (the popup dialog) |
| `Space + ca` | Code actions (fixes, refactors) |
| `Space + e` | Show diagnostic in floating window |

### Diagnostics (Errors/Warnings)
| Keys | Action |
|------|--------|
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `Space + e` | Show diagnostic details |

### LSP Commands
| Command | Action |
|---------|--------|
| `:LspInfo` | Show attached LSP clients |
| `:LspRestart` | Restart LSP servers |
| `:Mason` | Open Mason (LSP installer) |

---

## Scrolling the Hover/Signature Popup

When a documentation popup appears (from `K` or completion):

| Keys | Action |
|------|--------|
| `Ctrl+f` | Scroll down in popup |
| `Ctrl+b` | Scroll up in popup |
| `Ctrl+d` | Scroll down half page |
| `Ctrl+u` | Scroll up half page |

---

## File Navigation

### Telescope
| Keys | Action |
|------|--------|
| `Space + ff` | Find files |
| `Space + fg` | Live grep (search text) |
| `Space + fb` | List buffers |

### Nvim-Tree / Neo-tree
| Keys | Action |
|------|--------|
| `Space + n` | Toggle file tree |

### Harpoon (Quick file switching)
| Keys | Action |
|------|--------|
| `Space + a` | Add file to Harpoon |
| `Space + h` | Open Harpoon menu |
| `Space + j` | Jump to file 1 |
| `Space + k` | Jump to file 2 |
| `Space + l` | Jump to file 3 |
| `Space + ;` | Jump to file 4 |

---

## General Neovim Navigation

### Moving Around
| Keys | Action |
|------|--------|
| `h/j/k/l` | Left/down/up/right |
| `w` | Next word |
| `b` | Previous word |
| `e` | End of word |
| `0` | Start of line |
| `$` | End of line |
| `^` | First non-blank character |
| `gg` | Go to top of file |
| `G` | Go to bottom of file |
| `{number}G` | Go to line number |
| `%` | Jump to matching bracket |
| `Ctrl+d` | Scroll down half page |
| `Ctrl+u` | Scroll up half page |
| `Ctrl+f` | Scroll down full page |
| `Ctrl+b` | Scroll up full page |
| `zz` | Center cursor on screen |
| `zt` | Cursor to top of screen |
| `zb` | Cursor to bottom of screen |

### Search
| Keys | Action |
|------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `*` | Search word under cursor |
| `#` | Search word under cursor (backward) |

---

## Editing

### Basic Editing
| Keys | Action |
|------|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `I` | Insert at start of line |
| `A` | Insert at end of line |
| `o` | New line below |
| `O` | New line above |
| `r` | Replace single character |
| `R` | Replace mode |
| `x` | Delete character |
| `dd` | Delete line |
| `D` | Delete to end of line |
| `cc` | Change entire line |
| `C` | Change to end of line |
| `ciw` | Change inner word |
| `ci"` | Change inside quotes |
| `ci(` | Change inside parentheses |
| `yy` | Yank (copy) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `.` | Repeat last change |

### Visual Mode
| Keys | Action |
|------|--------|
| `v` | Visual mode (character) |
| `V` | Visual line mode |
| `Ctrl+v` | Visual block mode |
| `>` | Indent selection |
| `<` | Unindent selection |
| `y` | Yank selection |
| `d` | Delete selection |
| `c` | Change selection |

---

## Windows & Buffers

### Window Management
| Keys | Action |
|------|--------|
| `Ctrl+w s` | Split horizontal |
| `Ctrl+w v` | Split vertical |
| `Ctrl+w h/j/k/l` | Move to window |
| `Ctrl+w q` | Close window |
| `Ctrl+w =` | Equal window sizes |
| `Ctrl+w _` | Maximize height |
| `Ctrl+w \|` | Maximize width |
| `Space + tv` | Open terminal (vertical split) |
| `Space + th` | Open terminal (horizontal split) |

### Buffers
| Keys | Action |
|------|--------|
| `:bn` | Next buffer |
| `:bp` | Previous buffer |
| `:bd` | Close buffer |
| `:ls` | List buffers |
| `Space + fb` | Telescope buffer list |

---

## Git (Gitsigns)

| Keys | Action |
|------|--------|
| `Space + gs` | Stage hunk |
| `Space + gr` | Reset hunk |
| `Space + gp` | Preview hunk |
| `Space + gg` | Open LazyGit |

---

## Formatting

| Keys | Action |
|------|--------|
| `Space + gf` | Format buffer |
| Auto on save | Files auto-format on save |

---

## Useful Commands

| Command | Action |
|---------|--------|
| `:w` | Save file |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |
| `:e filename` | Edit/open file |
| `:Lazy` | Open plugin manager |
| `:Mason` | Open LSP installer |
| `:checkhealth` | Check Neovim health |
| `:set wrap` | Enable line wrap |
| `:set nowrap` | Disable line wrap |
| `:noh` | Clear search highlight |
