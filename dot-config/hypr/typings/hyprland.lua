---@meta

-- Non-exhaustive EmmyLua typings for Hyprland's built-in Lua config API (hl.*)
-- Hyprland >= 0.55

hl = {}

---@class hl.match
---@field class? string
---@field title? string
---@field initial_class? string
---@field initial_title? string
---@field content? string
---@field xdg_tag? string
---@field float? boolean
---@field fullscreen? boolean
---@field pin? boolean
---@field xwayland? boolean

---@class hl.animation
---@field leaf string
---@field enabled? boolean
---@field speed? number
---@field bezier? string
---@field spring? string
---@field style? string

---@class hl.curve
---@field type "bezier"|"spring"
---@field points? table<integer, table<integer, number>>
---@field mass? number
---@field stiffness? number
---@field dampening? number

---Configure global options (sections: input, general, decoration, render, misc, debug, cursor, group, ...)
---@param opts table<string, table<string, any>>
function hl.config(opts) end

---Configure a monitor (options: mode, position, scale, cm, supports_hdr, supports_wide_color,
---sdrbrightness, sdrsaturation, sdr_max_luminance, sdr_min_luminance, vrr, ...)
---@param opts table<string, any>
function hl.monitor(opts) end

---Add a window rule
---@param opts table<string, any>
function hl.window_rule(opts) end

---Add a layer rule
---@param opts table<string, any>
function hl.layer_rule(opts) end

---Add a workspace rule
---@param opts table<string, any>
function hl.workspace_rule(opts) end

---Set an environment variable
---@param name string
---@param value string|number
function hl.env(name, value) end

---Register a gesture
---@param opts table<string, any>
function hl.gesture(opts) end

---Register an animation curve (bezier or spring)
---@param name string
---@param opts hl.curve
function hl.curve(name, opts) end

---Configure an animation
---@param opts hl.animation
function hl.animation(opts) end

---Bind a key
---@param key string
---@param dispatcher string
---@param opts? table<string, any>  -- e.g. { locked = true, repeating = true }
function hl.bind(key, dispatcher, opts) end

---Register a permission
---@param opts table<string, any>
function hl.permission(opts) end

---Configure a device
---@param opts table<string, any>
function hl.device(opts) end

---Load a plugin
---@param opts table<string, any>
function hl.load(opts) end

---Dispatchers (usable with hl.bind)
hl.dsp = {}

---Execute a shell command
---@param cmd string
---@return string
function hl.dsp.exec_cmd(cmd) end

---Execute a raw Hyprland command
---@param cmd string
---@return string
function hl.dsp.exec_raw(cmd) end

---Exit Hyprland
---@param opts? table<string, any>
---@return string
function hl.dsp.exit(opts) end

---Move cursor
---@param opts table<string, number>  -- { x, y }
---@return string
function hl.dsp.move(opts) end

---Move cursor to corner
---@param opts table<string, any>  -- { corner, window? }
---@return string
function hl.dsp.move_to_corner(opts) end

---Toggle active group
---@return string
function hl.dsp.toggle_group() end

---Change active group member
---@param opts table<string, any>  -- { index, window? }
---@return string
function hl.dsp.change_group_active(opts) end

---Move window into a group
---@param opts table<string, any>
---@return string
function hl.dsp.move_group_window(opts) end

---Lock groups
---@return string
function hl.dsp.lock_groups() end

---Lock active group
---@return string
function hl.dsp.lock_active_group() end
