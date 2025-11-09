# 📱 Mobile Termux Neovim Configuration

A comprehensive, mobile-optimized Neovim configuration designed specifically for Termux on Android devices.

## 🎯 Features

- **📱 Mobile-Optimized**: Designed for touch keyboards and small screens
- **⚡ Performance**: Optimized for mobile device performance
- **🎨 Beautiful UI**: Mobile-friendly themes and colors
- **🔧 Easy Navigation**: Simplified keybindings for mobile use
- **🚀 Fast Setup**: Automatic mobile detection and configuration

## 📋 Mobile Optimizations

### **UI/UX Enhancements**
- Reduced UI elements for more screen space
- Mobile-friendly scrolling and navigation
- Optimized popup sizes for small screens
- Touch-friendly file operations
- Simplified status line and buffer display

### **Performance Optimizations**
- Lazy-loaded plugins for faster startup
- Mobile-optimized settings without disabling features
- Full syntax highlighting support for all languages
- Optimized auto-completion for mobile responsiveness
- Mobile-specific backup and swap settings

### **Mobile Keybindings**
- **Leader Key**: `Space` (easy to reach on mobile keyboards)
- **Escape Alternatives**: `jj`, `jk`, `kj`, `kk` (no need to reach Esc)
- **Simplified Shortcuts**: Single key or simple combinations
- **Touch-Friendly**: Large, easy-to-tap key combinations

## 🚀 Quick Start

### **Installation**
1. Clone this repository to `~/.config/nvim/`
2. Open Neovim: `nvim`
3. Run `:PackerInstall` to install plugins
4. Restart Neovim

### **Mobile Detection**
The configuration automatically detects if you're running in Termux and applies mobile optimizations. You'll see:
```
📱 Mobile mode detected - applying mobile optimizations
```

## 📱 Mobile Keybindings

### **Essential Commands**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>f` | Find files | Open file finder |
| `<leader>b` | Show buffers | List open buffers |
| `<leader>g` | Live grep | Search in files |
| `<leader>s` | Save file | Save current file |
| `<leader>q` | Quit | Close current buffer |
| `<leader>w` | Save & quit | Save and close |

### **Navigation**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>t` | Toggle tree | Open/close file tree |
| `<leader>e` | Focus tree | Focus file tree |
| `<leader>n` | Next buffer | Go to next buffer |
| `<leader>p` | Previous buffer | Go to previous buffer |
| `<leader>h/j/k/l` | Window nav | Move between windows |

### **LSP & Code Actions**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>c` | Code action | Show available actions |
| `<leader>d` | Go to definition | Jump to definition |
| `<leader>i` | Show hover | Display hover info |
| `<leader>r` | Rename symbol | Rename symbol |
| `<leader>R` | Show references | List references |

### **Copy/Paste & Editing**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>y` | Copy to clipboard | Copy selection |
| `<leader>p` | Paste from clipboard | Paste from clipboard |
| `<leader>a` | Select all | Select entire file |
| `<leader>/` | Toggle comment | Comment/uncomment |
| `<leader>u` | Undo | Undo last action |
| `<leader>U` | Redo | Redo last action |

### **Escape Alternatives**
| Key | Action | Description |
|-----|--------|-------------|
| `jj` | Escape | Exit insert mode |
| `jk` | Escape | Exit insert mode |
| `kj` | Escape | Exit insert mode |
| `kk` | Escape | Exit insert mode |

## 🎨 Mobile Themes

### **Available Themes**
- **Catppuccin Mocha** (default) - Dark theme optimized for mobile
- **Catppuccin Latte** - Light theme for mobile
- **Tokyo Night** - Alternative dark theme

### **Theme Commands**
| Command | Action | Description |
|---------|--------|-------------|
| `:MobileTheme` | Refresh theme | Apply mobile theme colors |
| `:MobileThemeLight` | Light theme | Switch to light mobile theme |
| `:MobileThemeDark` | Dark theme | Switch to dark mobile theme |

## 🔧 Mobile Plugins

### **Core Plugins**
- **nvim-tree**: Mobile-optimized file tree
- **telescope**: Mobile-friendly file finder
- **lualine**: Compact status line
- **bufferline**: Mobile-optimized buffer display
- **treesitter**: Full syntax highlighting for all languages
- **lspconfig**: Language server protocol
- **mason**: LSP package manager with all language servers
- **nvim-cmp**: Auto-completion

### **Language Support**
The mobile configuration supports **ALL programming languages** including:
- **Web**: HTML, CSS, JavaScript, TypeScript, Vue, React, Angular, Svelte
- **Backend**: Python, Node.js, PHP, Ruby, Go, Rust, Java, C/C++
- **Mobile**: Dart (Flutter), Kotlin, Swift
- **Data**: R, Julia, MATLAB, SQL
- **Functional**: Haskell, OCaml, F#, Clojure, Elixir, Erlang
- **Systems**: Assembly, Verilog, VHDL, SystemVerilog
- **Scripting**: Bash, PowerShell, Fish, Zsh, Perl, Tcl
- **Markup**: Markdown, LaTeX, reStructuredText, AsciiDoc
- **Config**: YAML, JSON, TOML, INI, XML
- **And many more!**

### **Mobile-Specific Features**
- **Auto-save**: Automatically save files
- **Codeium**: AI-powered code completion
- **Comment.nvim**: Easy commenting
- **which-key**: Keybinding help
- **trouble.nvim**: Diagnostics display
- **nvim-dap**: Debugging support

## 📱 Mobile Tips

### **Performance Tips**
- Use `:MobileHelp` for quick reference
- Pin Termux to recent apps for quick access
- Use `tmux` for persistent sessions
- Monitor resources with `htop`

### **Navigation Tips**
- Use `<leader>t` to toggle file tree
- Use `<leader>f` for quick file finding
- Use `<leader>b` to switch between buffers
- Use `jj` instead of `Esc` for faster editing

### **Mobile Workflow**
1. **Start**: Open Neovim with `nvim`
2. **Navigate**: Use `<leader>t` for file tree
3. **Find**: Use `<leader>f` for file search
4. **Edit**: Use mobile-friendly keybindings
5. **Save**: Use `<leader>s` to save
6. **Quit**: Use `<leader>q` to quit

## 🛠️ Customization

### **Mobile Settings**
Edit `lua/mobile.lua` to customize:
- UI elements and spacing
- Performance settings
- Mobile-specific options

### **Keybindings**
Edit `lua/mobile_keys.lua` to customize:
- Key combinations
- Command shortcuts
- Mobile-specific bindings

### **Plugins**
Edit `lua/mobile_plugins.lua` to customize:
- Plugin configurations
- Mobile-optimized settings
- Performance options

### **Themes**
Edit `lua/mobile_theme.lua` to customize:
- Color schemes
- Highlight groups
- Mobile-specific colors

## 🔍 Troubleshooting

### **Common Issues**

#### **Mobile Detection Not Working**
```bash
# Check if TERMUX_VERSION is set
echo $TERMUX_VERSION
```

#### **Plugins Not Loading**
```vim
:PackerInstall
:PackerSync
```

#### **Performance Issues**
```vim
:MobileHelp
# Check mobile optimizations are applied
```

#### **Theme Issues**
```vim
:MobileTheme
# Refresh mobile theme
```

### **Mobile-Specific Commands**
| Command | Action | Description |
|---------|--------|-------------|
| `:MobileHelp` | Show help | Display mobile shortcuts |
| `:MobileKeyHelp` | Key help | Show keybinding reference |
| `:MobileTheme` | Refresh theme | Apply mobile theme |
| `:MobileThemeLight` | Light theme | Switch to light theme |
| `:MobileThemeDark` | Dark theme | Switch to dark theme |

## 📚 Additional Resources

- **Termux Wiki**: [wiki.termux.com](https://wiki.termux.com)
- **Neovim Documentation**: `:help` in Neovim
- **Mobile Help**: `:MobileHelp` in Neovim
- **Keybindings**: `:MobileKeyHelp` in Neovim

## 🤝 Contributing

Found an issue or want to improve mobile support? Contributions are welcome!

1. Fork the repository
2. Make your changes
3. Test on mobile device
4. Submit a pull request

## 📄 License

This configuration is provided as-is for educational purposes. Individual plugins have their own licenses.

---

**Happy mobile coding! 📱💻✨**
