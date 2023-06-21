local buf = require("bufferline")
buf.setup{
  options={
    mode="buffers",
            themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
           

         --   style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
            numbers =  "ordinal",
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '➜',
         


            name_formatter = function(buf)  -- buf contains:
                  -- name                | str        | the basename of the active file
                  -- path                | str        | the full path of the active file
                  -- bufnr (buffer only) | int        | the number of the active buffer
                  -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
                  -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
            end,
            max_name_length = 7,
            max_prefix_length = 5, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 12,
            diagnostics =  "nvim_lsp" ,
            diagnostics_update_in_insert = false,
            -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return "("..count..")"
            end,
            -- NOTE: this will be called a lot so don't do any heavy processing here
            custom_filter = function(buf_number, buf_numbers)
                -- filter out filetypes you don't want to see
                if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                    return true
                end
                -- filter out by buffer name
                if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                    return true
                end
                -- filter out based on arbitrary rules
                -- e.g. filter out vim wiki buffer from tabline in your work repo
                if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                    return true
                end
                -- filter out by it's index number in list (don't show first buffer)
                if buf_numbers[1] ~= buf_number then
                    return true
                end
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer", 
                    text_align =  "center" ,
                    separator = true,
                }
            },
            color_icons = true,  -- whether or not to add the filetype icon highlights
            get_element_icon = function(element)
              -- element consists of {filetype: string, path: string, extension: string, directory: string}
              -- This can be used to change how bufferline fetches the icon
              -- for an element e.g. a buffer or a tab.
              -- e.g.
              local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
              return icon, hl
              -- or
            end,
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = true ,
            show_close_icon = true ,
            show_tab_indicators = true,
            show_duplicate_prefix =  false, -- whether to show duplicate buffer prefix
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = "slant",
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'},
            },
sort_by="tabs"

          }
        }
return buf
