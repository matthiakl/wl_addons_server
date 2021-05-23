push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_trainingsite_type {
   name = "europeans_trainingscamp_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Trainingscamp"),
   icon = dirname .. "menu.png",
   size = "medium",
   
   enhancement = {
        name = "europeans_trainingscamp_level_1",
        enhancement_cost = {
          planks = 1,
          cloth = 1,
          brick = 1,
          grout = 1,
          quartz = 1,
          diamond = 1,
          gold = 1
        },
        enhancement_return_on_dismantle = {
          log = 1,
          granite = 2,
          quartz = 1,
          diamond = 1,
          scrap_metal_mixed = 1
        },
   },
   
   buildcost = {
      planks = 4,
      reed = 3,
      quartz = 1,
      diamond = 1,
      gold = 1
   },
   return_on_dismantle = {
      log = 4,
      granite = 3,
      quartz = 1,
      diamond = 1,
      scrap_metal_mixed = 1
   },

   animations = {
      idle = { -- TODO(GunChleoc): make animations
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 50, 38 },
      },
      build = { -- TODO(GunChleoc): make animations
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 50, 38 },
      },
      working = { -- TODO(GunChleoc): make animations
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 50, 38 },
      }
   },

   aihints = {
      trainingsites_max_percent = 10,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
     --normal_ai_limit = 2
   },

   working_positions = {
      europeans_trainer = 1
   },

   inputs = {
      { name = "ration", amount = 6 },
      { name = "spear_advanced", amount = 2 },
      { name = "armor_chain", amount = 2 }
   },


   ["soldier attack"] = {
      food = {
         {"ration"}
      },
      weapons = {"spear_advanced"}
   },
   
   ["soldier health"] = {
      food = {
         {"ration"}
      },
      weapons = {"armor_chain"}
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
   },

   soldier_capacity = 2,
   trainer_patience = 12,
   
   messages = {
      -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
      no_soldier = pgettext("europeans_building", "No soldier to train!"),
      -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
      no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
   },
}

pop_textdomain()

