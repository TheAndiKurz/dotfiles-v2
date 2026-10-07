-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly

hl.monitor({
    output    = LAPTOP,
    mode      = "1920x1200@60",
    position  = "0x0",
    scale     = "1",
})


-- MSI MAG321UX OLED
hl.monitor({
    output            = DESKTOP,
    mode              = "3840x2160@240",
    position          = "0x0",
    scale             = "1",
    supports_hdr      = 0,
    sdrbrightness     = 0.7,
    sdrsaturation     = 1.0,
    sdr_max_luminance = 250,
})

hl.config({
    render = {
        cm_enabled = true,
        cm_auto_hdr = 1,
    },
})
