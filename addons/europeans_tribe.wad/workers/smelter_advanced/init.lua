push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
   name = "europeans_smelter_advanced",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("europeans_worker", "Advanced Smelter"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   vision_range = 2,
   
   animations = {
      idle = {
         hotspot = { 4, 23 }
      },
      walk = {
         hotspot = { 18, 25 },
         fps = 10,
         directional = true
      },
      walkload = {
         hotspot = { 8, 22 },
         fps = 10,
         directional = true
      }
   }
}

pop_textdomain()
