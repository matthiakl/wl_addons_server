push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_trainingsite_type {
   name = "europeans_battlearena_level_2",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Battle Arena Level 2"),
   icon = dirname .. "menu.png",
   size = "big",

   enhancement = {
        name = "europeans_battlearena_level_3",
        enhancement_cost = {
           brick = 3,
           grout = 3,
           marble_column = 3,
           quartz = 1,
           diamond = 1,
           gold = 1
        },
        enhancement_return_on_dismantle = {
           granite = 3,
           marble = 3,
           quartz = 1,
           diamond = 1,
           scrap_metal_mixed = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 80, 88 },
      }
   },

   aihints = {
      trainingsites_max_percent = 20,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
     --normal_ai_limit = 4
   },

   working_positions = {
      europeans_trainer_normal = 1
   },

   inputs = {
      { name = "ration", amount = 10 },
      { name = "beer", amount = 10 },
      { name = "snack", amount = 6 },
      { name = "shield_steel", amount = 2 },
      { name = "spear_advanced", amount = 2 },
      { name = "ax_broad", amount = 2 },
      { name = "trident_steel", amount = 2 },
      { name = "armor_chain", amount = 2 },
      { name = "armor_helmet", amount = 2 },
      { name = "helmet_mask", amount = 2 }
      
   },

   ["soldier evade"] = {
      food = {
        {"ration"},
        {"beer"}
      }
   },
      
   ["soldier defense"] = {
      food = {
        {"ration"},
        {"beer"}
      },
      weapons = {"shield_steel"}
   },
   
   ["soldier attack"] = {
      food = {
         {"ration", "snack"}
      },
      weapons = {"spear_advanced", "ax_broad", "trident_steel"}
   },
   
   ["soldier health"] = {
      food = {
         {"ration", "snack"}
      },
      weapons = {"armor_chain", "armor_helmet", "helmet_mask"}
   },

   programs = {
      sleep = {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _"sleeping",
         actions = {
            "sleep=duration:5s",
            "return=skipped",
         }
      },
      upgrade_soldier_evade_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
         actions = {
            "return=skipped when economy needs beer",
            "checksoldier=soldier:evade level:0", -- Fails when aren't any soldier of level 0 evade
            "sleep=duration:60s",
            "checksoldier=soldier:evade level:0", -- Because the soldier can be expelled by the player
            "consume=ration beer:2",
            "train=soldier:evade level:1"
         }
      },
      upgrade_soldier_evade_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
         actions = {
            "return=skipped when economy needs beer",
            "checksoldier=soldier:evade level:1", -- Fails when aren't any soldier of level 1 evade
            "sleep=duration:60s",
            "checksoldier=soldier:evade level:1", -- Because the soldier can be expelled by the player
            "consume=ration:2 beer:2",
            "train=soldier:evade level:2"
         }
      },
      upgrade_soldier_defense_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
         actions = {
            "return=skipped when economy needs shield_steel",
            "checksoldier=soldier:defense level:0", -- Fails when aren't any soldier of level 0 defense
            "sleep=duration:45s",
            "checksoldier=soldier:defense level:0", -- Because the soldier can be expulsed by the player
            "consume=ration beer shield_steel",
            "train=soldier:defense level:1",
            "produce=scrap_iron"
         }
      },
      upgrade_soldier_defense_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier defense from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:defense level:1", -- Fails when aren't any soldier of level 0 defense
            "sleep=duration:45s",
            "checksoldier=soldier:defense level:1", -- Because the soldier can be expulsed by the player
            "consume=ration beer",
            "train=soldier:defense level:2"
         }
      },
      upgrade_soldier_attack_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
         actions = {
            "return=skipped when economy needs spear",
            "checksoldier=soldier:attack level:0",
            "sleep=duration:45s",
            "checksoldier=soldier:attack level:0",
            "consume=ration spear_advanced",
            "train=soldier:attack level:1",
            "produce=scrap_iron"
         }
      },
      upgrade_soldier_attack_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier attack from level 1 to level 2"),
         actions = {
            "return=skipped when economy needs spear_advanced",
            "checksoldier=soldier:attack level:1",
            "sleep=duration:45s",
            "checksoldier=soldier:attack level:1",
            "consume=ration ax_broad",
            "train=soldier:attack level:2",
            "produce=scrap_iron"
         }
      },
      upgrade_soldier_attack_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier attack from level 2 to level 3"),
         actions = {
            "return=skipped when economy needs trident_steel",
            "checksoldier=soldier:attack level:2",
            "sleep=duration:45s",
            "checksoldier=soldier:attack level:2",
            "consume=snack trident_steel",
            "train=soldier:attack level:3",
            "produce=scrap_iron"
         }
      },
      upgrade_soldier_health_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier health from level 0 to level 1"),
         actions = {
            "return=skipped when economy needs armor_chain",
            "checksoldier=soldier:health level:0", -- Fails when aren't any soldier of level 0 health
            "sleep=duration:30s",
            "checksoldier=soldier:health level:0", -- Because the soldier can be expelled by the player
            "consume=ration armor_chain",
            "train=soldier:health level:1",
            "produce=scrap_iron"
         }
      },
      upgrade_soldier_health_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier health from level 1 to level 2"),
         actions = {
            "return=skipped when economy needs armor_helmet and economy needs helmet",
            "checksoldier=soldier:health level:1", -- Fails when aren't any soldier of level 0 health
            "sleep=duration:30s",
            "checksoldier=soldier:health level:1", -- Because the soldier can be expelled by the player
            "consume=ration armor_helmet",
            "train=soldier:health level:2",
            "produce=scrap_iron"
         }
      },
      upgrade_soldier_health_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("europeans_building", "upgrading soldier health from level 2 to level 3"),
         actions = {
            "return=skipped when economy needs helmet_mask",
            "checksoldier=soldier:health level:2", -- Fails when aren't any soldier of level 0 health
            "sleep=duration:30s",
            "checksoldier=soldier:health level:2", -- Because the soldier can be expelled by the player
            "consume=snack helmet_mask",
            "train=soldier:health level:3",
            "produce=scrap_iron"
         }
      },
   },
   
   soldier_capacity = 12,
   trainer_patience = 18,
   
   messages = {
      -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
      no_soldier = pgettext("europeans_building", "No soldier to train!"),
      -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
      no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()
