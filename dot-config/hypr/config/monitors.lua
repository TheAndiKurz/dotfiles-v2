-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly
-- hl.monitor({
--     output    = "MONITOR1",
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })


-- MSI MAG321UX OLED
hl.monitor({
    output            = MONITOR1,
    mode              = "3840x2160@240",
    position          = "0x0",
    scale             = "1.25",
    cm                = "hdr",
    bitdepth          = 10,
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
