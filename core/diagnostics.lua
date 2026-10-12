-- core/diagnostics.lua : quels événements de sauvegarde / génération se déclenchent ?

local RiftEvent   = require "rift.event.RiftEvent"
local RiftexEvent = require "Riftex.event.RiftexEvent"

RiftexEvent.SongSave.add("bosstplSongSave", "init", function(ev)
    print("[BossTemplate] SongSave")
end)

RiftexEvent.BeatmapSave.add("bosstplBeatmapSave", "init", function(ev)
    print("[BossTemplate] BeatmapSave")
end)

RiftEvent.ChoreoFinalize.add("bosstplChoreoFinalize", "init", function(ev)
    print("[BossTemplate] ChoreoFinalize")
end)