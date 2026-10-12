-- core/nodes.lua : étape 1, un nœud d'éditeur « Boss Start ».

local RiftSchema     = require "rift.schema.RiftSchema"
local RiftEvent      = require "rift.event.RiftEvent"
local RiftCommonNode = require "rift.node.RiftCommonNode"
local Color          = require "system.utils.Color"

local NODE_BOSS_START = "BossTemplateStartNode"

-- L'objet que tu poses dans l'éditeur (même forme que les nœuds de KatiesStuff).
RiftSchema.entity {
    name = "BossTemplateStartObj",
    object = {},
    step = {},
    position = {},
    autoMove = {},
    hittable = {},
    subDelay = {},
    tween = {},
    health = { health = 1 },
    typeReferenceSystem = { id = NODE_BOSS_START },
    editorCategory = { id = "BossTemplate_BOSS" },
    friendlyName = { name = "Boss Start" },
    sprite = { texture = "mods/BossTemplate/assets/node_start.png" },
    editorLine = { color = Color.hex(0xFFFFFF) },
}

-- Appelé pour chaque nœud posé, dans deux contextes différents :
--   ev.sim.choreomap présent -> génération du niveau pour le jeu
--   sinon                    -> simulation dans l'éditeur (il faut créer l'entité visible)
RiftEvent.NodeProcess.add("BossTemplateStart", NODE_BOSS_START, function(ev)
    if ev.sim.choreomap then
        print("[BossTemplate] Boss Start : passe de generation")
    else
        ev.entity = RiftCommonNode.spawnSystemEntity(ev)
    end
end)