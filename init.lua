-- Ultimate Vehicle Tuning
-- Self-contained CET UI. Reads live TweakDB values, no external exe required.

local VEHICLES = {
    { id = "Vehicle.v_sport1_rayfield_caliburn_player",          name = "Rayfield Caliburn",            class = "Hypercar" },
    { id = "Vehicle.v_sport1_rayfield_aerondight_player",        name = "Rayfield Aerondight Guinevere", class = "Hypercar" },
    { id = "Vehicle.v_sport1_herrera_riptide_player",            name = "Herrera Riptide Terrier",       class = "Hypercar" },
    { id = "Vehicle.v_sport1_quadra_sport_r7_player",            name = "Quadra Sport R-7 Chiaroscuro",  class = "Hypercar" },
    { id = "Vehicle.v_sport2_quadra_type66_avenger_player",      name = "Quadra Type-66 Avenger",       class = "Sport" },
    { id = "Vehicle.v_sport1_quadra_turbo_r_player",             name = "Quadra Turbo-R V-Tech",        class = "Sport" },
    { id = "Vehicle.v_sport2_quadra_type66_player",              name = "Quadra Type-66 Jen Rowley",    class = "Sport" },
    { id = "Vehicle.v_sport2_quadra_type66_nomad_player",        name = "Quadra Type-66 Javelina",      class = "Sport" },
    { id = "Vehicle.v_sport2_quadra_type66_02_player",           name = "Quadra Type-66 Bulleat",       class = "Sport" },
    { id = "Vehicle.v_sport2_mizutani_shion_player",             name = "Mizutani Shion MZ2",           class = "Sport" },
    { id = "Vehicle.v_sport2_mizutani_shion_base_player",        name = "Mizutani Shion MZ1",           class = "Sport" },
    { id = "Vehicle.v_sport2_mizutani_shion_nomad_player",       name = "Mizutani Shion Coyote",        class = "Sport" },
    { id = "Vehicle.v_sport2_porsche_911turbo_player",           name = "Porsche 911 Turbo (930)",      class = "Sport" },
    { id = "Vehicle.v_sport1_herrera_outlaw_player",         name = "Herrera Outlaw",           class = "Sport" },
    { id = "Vehicle.v_sport1_yaiba_semimaru_player",      name = "Yaiba ARV-Q340 Semimaru",      class = "Sport" },
    { id = "Vehicle.v_standard3_thorton_mackinaw_player", name = "Thorton Mackinaw MTL1",        class = "Truck" },
    { id = "Vehicle.v_standard3_thorton_mackinaw_ncu_player", name = "Thorton Mackinaw Beast",   class = "Truck" },
    { id = "Vehicle.v_standard25_thorton_colby_pickup_player", name = "Thorton Colby CX410 Butte", class = "Truck" },
    { id = "Vehicle.v_utility4_kaukaz_bratsk",            name = "Kaukaz Bratsk U4020",          class = "Truck" },
    { id = "Vehicle.v_standard3_militech_hellhound_player", name = "Militech Hellhound",         class = "Truck" },
    { id = "Vehicle.v_sport2_villefort_alvarado_player", name = "Villefort Alvarado V4F 570 Delegate", class = "Luxury" },
    { id = "Vehicle.v_sport2_villefort_deleon_player",    name = "Villefort DeLeon Vindicator",  class = "Luxury" },
    { id = "Vehicle.v_standard3_chevalier_emperor_player",name = "Chevillon Emperor 620 Ragnar", class = "Luxury" },
    { id = "Vehicle.v_standard2_chevalier_thrax_player",  name = "Chevillon Thrax 388 Jefferson",class = "Luxury" },
    { id = "Vehicle.v_standard2_archer_quartz_player",    name = "Archer Quartz EC-T2 R660",     class = "Economy" },
    { id = "Vehicle.v_standard2_archer_quartz_nomad_player", name = "Archer Quartz Sidewinder",  class = "Economy" },
    { id = "Vehicle.v_standard2_archer_hella_player",     name = "Archer Hella EC-D i360",       class = "Economy" },
    { id = "Vehicle.v_standard2_thorton_colby_player",    name = "Thorton Colby C125",           class = "Economy" },
    { id = "Vehicle.v_standard2_thorton_galena_player",   name = "Thorton Galena G240",          class = "Economy" },
    { id = "Vehicle.v_standard2_thorton_galena_nomad_player", name = "Thorton Galena Rattler",   class = "Economy" },
    { id = "Vehicle.v_standard25_thorton_merrimac_player",name = "Thorton Merrimac Warlock",     class = "Economy" },
    { id = "Vehicle.v_standard2_villefort_cortes_player", name = "Villefort Cortes V5000 Valor", class = "Economy" },
    { id = "Vehicle.v_standard25_villefort_columbus_player", name = "Villefort Columbus V340-F Freight", class = "Economy" },
    { id = "Vehicle.v_standard2_makigai_maimai_player",   name = "Makigai MaiMai P126",          class = "Economy" },
    { id = "Vehicle.v_standard3_makigai_tanishi_player",  name = "Makigai Tanishi Kuma",         class = "Economy" },
    { id = "Vehicle.v_standard25_mahir_supron_player",    name = "Mahir Supron FS3",             class = "Economy" },
    { id = "Vehicle.v_standard2_mizutani_hozuki_player",  name = "Mizutani Hozuki Hoseki",       class = "Economy" },

    -- Common player/garage motorcycle records. Additional official records are
    -- discovered from Vehicle.vehicle_list.list during onInit.
    { id = "Vehicle.v_sportbike3_brennan_apollo_player",       name = "Brennan Apollo",                class = "Bike" },
    { id = "Vehicle.v_sportbike3_brennan_apollo_nomad_player", name = "Scorpion's Apollo",             class = "Bike" },
    { id = "Vehicle.v_sportbike3_brennan_apollo_player_02",    name = "Brennan Apollo 650-S",          class = "Bike" },
    { id = "Vehicle.v_sportbike2_arch_player",                  name = "ARCH Nazare",                   class = "Bike" },
    { id = "Vehicle.v_sportbike2_arch_jackie_player",           name = "Jackie's ARCH",                 class = "Bike" },
    { id = "Vehicle.v_sportbike2_arch_jackie_tuned_player",     name = "Jackie's ARCH (Tuned)",         class = "Bike" },
    { id = "Vehicle.v_sportbike2_arch_tyger_player",            name = "ARCH Nazare Itsumade",          class = "Bike" },
    { id = "Vehicle.v_sportbike2_arch_player_02",               name = "ARCH Nazare Racer",             class = "Bike" },
    { id = "Vehicle.v_sportbike2_arch_player_03",               name = "ARCH Nazare Kobold",            class = "Bike" },
    { id = "Vehicle.v_sportbike2_arch_linas_player",            name = "ARCH Nazare Malina-Mobile",     class = "Bike" },
    { id = "Vehicle.v_sportbike1_yaiba_kusanagi_player",        name = "Yaiba Kusanagi CT-3X",          class = "Bike" },
    { id = "Vehicle.v_sportbike1_yaiba_kusanagi_player_02",     name = "Yaiba Kusanagi Peacekeeper",    class = "Bike" },
    { id = "Vehicle.v_sportbike1_yaiba_kusanagi_player_03",     name = "Yaiba Kusanagi Akashita",       class = "Bike" },
    -- All 16 Muramasa cosmetic configurations inherit this physics record.
    { id = "Vehicle.v_sportbike1_yaiba_muramasa_player",        name = "Yaiba ASM-R250 Muramasa",       class = "Bike" },
}

-- The game maintains the complete base-game/expansion garage roster in this
-- TweakDB list. Reading it at runtime keeps the mod aligned with the installed
-- game version instead of relying on a manually maintained subset.
local MURAMASA_VARIANTS = {
    "Vehicle.v_sportbike1_yaiba_muramasa_naked",
    "Vehicle.v_sportbike1_yaiba_muramasa_naked_as",
    "Vehicle.v_sportbike1_yaiba_muramasa_naked_as_nr",
    "Vehicle.v_sportbike1_yaiba_muramasa_naked_as_ns",
    "Vehicle.v_sportbike1_yaiba_muramasa_naked_as_ns_nr",
    "Vehicle.v_sportbike1_yaiba_muramasa_naked_nr",
    "Vehicle.v_sportbike1_yaiba_muramasa_naked_ns",
    "Vehicle.v_sportbike1_yaiba_muramasa_naked_ns_nr",
    "Vehicle.v_sportbike1_yaiba_muramasa_regular",
    "Vehicle.v_sportbike1_yaiba_muramasa_regular_as",
    "Vehicle.v_sportbike1_yaiba_muramasa_regular_as_nr",
    "Vehicle.v_sportbike1_yaiba_muramasa_regular_as_ns",
    "Vehicle.v_sportbike1_yaiba_muramasa_regular_as_ns_nr",
    "Vehicle.v_sportbike1_yaiba_muramasa_regular_nr",
    "Vehicle.v_sportbike1_yaiba_muramasa_regular_ns",
    "Vehicle.v_sportbike1_yaiba_muramasa_regular_ns_nr",
}

local function vehicleIdString(value)
    if type(value) == "string" then return value end
    local ok, name = pcall(function() return TDBID.ToStringDEBUG(value) end)
    if ok and name and name ~= "" then return tostring(name) end
    return tostring(value or "")
end

local function friendlyVehicleName(id)
    local name = tostring(id or "")
    name = name:gsub("^Vehicle%.v_", "")
    name = name:gsub("^(sportbike%d*)_", "")
    name = name:gsub("^(sport%d*)_", "")
    name = name:gsub("^(standard%d*)_", "")
    name = name:gsub("^(utility%d*)_", "")
    name = name:gsub("_player", "")
    name = name:gsub("_", " ")
    name = name:gsub("(%a)([%w']*)", function(first, rest)
        return first:upper() .. rest
    end)
    return name
end

local function discoverOfficialVehicles()
    local byId = {}
    for _, veh in ipairs(VEHICLES) do byId[veh.id:lower()] = veh end

    local muramasa = byId["vehicle.v_sportbike1_yaiba_muramasa_player"]
    if muramasa then
        muramasa.variants = muramasa.variants or {}
        local known = {}
        for _, id in ipairs(muramasa.variants) do known[id:lower()] = true end
        for _, id in ipairs(MURAMASA_VARIANTS) do
            if not known[id:lower()] then table.insert(muramasa.variants, id) end
            byId[id:lower()] = muramasa
        end
    end

    local ok, list = pcall(function()
        return TweakDB:GetFlat(TweakDBID.new("Vehicle.vehicle_list.list"))
    end)
    if not ok or type(list) ~= "table" then
        print("[UltimateVehicleTuning] Could not read Vehicle.vehicle_list.list; using built-in roster.")
        return
    end

    local added = 0
    for _, rawId in ipairs(list) do
        local id = vehicleIdString(rawId)
        if id ~= "" and not id:find("^Vehicle%.") then id = "Vehicle." .. id end
        if id:find("^Vehicle%.") and not byId[id:lower()] then
            local veh = {
                id = id,
                name = friendlyVehicleName(id),
                class = "Additional Player Vehicles",
            }
            table.insert(VEHICLES, veh)
            byId[id:lower()] = veh
            added = added + 1
        end
    end
    print("[UltimateVehicleTuning] Loaded " .. #VEHICLES ..
        " player vehicle physics entries (" .. added .. " discovered).")
end

local PARAMS = {
    { key = "total_mass",         group = "MASS & DYNAMICS",    label = "Total Mass",       fmt = "%.0f kg",  absMin = 50,    absMax = 30000 },
    { key = "chassis_mass",       group = "MASS & DYNAMICS",    label = "Chassis Mass",     fmt = "%.0f kg",  absMin = 50,    absMax = 30000 },
    { key = "air_resistance",     group = "MASS & DYNAMICS",    label = "Air Resistance",   fmt = "%.2f",     absMin = 0.05,  absMax = 12 },
    { key = "com_x", group = "CENTER OF MASS & BODY ROTATION", label = "COM X (Left/Right)", fmt = "%.2f m", absMin = -2, absMax = 2 },
    { key = "com_y", group = "CENTER OF MASS & BODY ROTATION", label = "COM Y (Forward/Back)", fmt = "%.2f m", absMin = -3, absMax = 3 },
    { key = "com_z", group = "CENTER OF MASS & BODY ROTATION", label = "COM Z (Vertical)", fmt = "%.2f m", absMin = -2, absMax = 2 },
    { key = "inertia_x", group = "CENTER OF MASS & BODY ROTATION", label = "Pitch Inertia X", fmt = "%.0f", absMin = 0, absMax = 50000 },
    { key = "inertia_y", group = "CENTER OF MASS & BODY ROTATION", label = "Roll Inertia Y", fmt = "%.0f", absMin = 0, absMax = 50000 },
    { key = "inertia_z", group = "CENTER OF MASS & BODY ROTATION", label = "Yaw Inertia Z", fmt = "%.0f", absMin = 0, absMax = 50000 },
    { key = "inertia_scale_x", group = "CENTER OF MASS & BODY ROTATION", label = "Pitch Inertia Scale X", fmt = "%.2f x", absMin = 0.1, absMax = 5 },
    { key = "inertia_scale_y", group = "CENTER OF MASS & BODY ROTATION", label = "Roll Inertia Scale Y", fmt = "%.2f x", absMin = 0.1, absMax = 5 },
    { key = "inertia_scale_z", group = "CENTER OF MASS & BODY ROTATION", label = "Yaw Inertia Scale Z", fmt = "%.2f x", absMin = 0.1, absMax = 5 },
    { key = "weight_transfer_fwd", group = "CENTER OF MASS & BODY ROTATION", label = "Forward Weight Transfer", fmt = "%.2f", absMin = 0, absMax = 3 },
    { key = "weight_transfer_side", group = "CENTER OF MASS & BODY ROTATION", label = "Side Weight Transfer", fmt = "%.2f", absMin = 0, absMax = 3 },
    { key = "turning_roll", group = "CENTER OF MASS & BODY ROTATION", label = "Turning Roll Factor", fmt = "%.2f", absMin = 0, absMax = 3 },
    { key = "bank_body_fb", group = "CENTER OF MASS & BODY ROTATION", label = "Body Bank Front/Back", fmt = "%.2f", absMin = 0, absMax = 3 },
    { key = "bank_body_lr", group = "CENTER OF MASS & BODY ROTATION", label = "Body Bank Left/Right", fmt = "%.2f", absMin = 0, absMax = 3 },
    { key = "body_friction", group = "CENTER OF MASS & BODY ROTATION", label = "Body Friction", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "anti_sway_damping", group = "CENTER OF MASS & BODY ROTATION", label = "Anti-Swaybar Damping Scale", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "turn_roll_weak_mul", group = "CENTER OF MASS & BODY ROTATION", label = "Weak-Contact Roll Multiplier", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "turn_roll_weak_min", group = "CENTER OF MASS & BODY ROTATION", label = "Weak-Contact Threshold Minimum", fmt = "%.2f", absMin = 0, absMax = 2 },
    { key = "turn_roll_weak_max", group = "CENTER OF MASS & BODY ROTATION", label = "Weak-Contact Threshold Maximum", fmt = "%.2f", absMin = 0, absMax = 2 },
    { key = "max_torque",         group = "ENGINE",             label = "Max Torque",       fmt = "%.0f Nm",  absMin = 0,     absMax = 10000 },
    { key = "resistance_torque",  group = "ENGINE",             label = "Resistance",       fmt = "%.0f Nm",  absMin = 0,     absMax = 800 },
    { key = "max_rpm",            group = "ENGINE",             label = "Max RPM",          fmt = "%.0f",     absMin = 2000,  absMax = 16000 },
    { key = "susp_front_spring",  group = "SUSPENSION // FRONT", label = "Spring Rate",     fmt = "%.1f",     absMin = 0,     absMax = 500 },
    { key = "susp_front_damp",    group = "SUSPENSION // FRONT", label = "Damping",         fmt = "%.0f",     absMin = 0,     absMax = 30000 },
    { key = "susp_front_rebound", group = "SUSPENSION // FRONT", label = "Rebound",         fmt = "%.0f",     absMin = 0,     absMax = 30000 },
    { key = "susp_front_antiroll",group = "SUSPENSION // FRONT", label = "Anti-Roll",       fmt = "%.1f",     absMin = 0,     absMax = 300 },
    { key = "susp_rear_spring",   group = "SUSPENSION // REAR",  label = "Spring Rate",     fmt = "%.1f",     absMin = 0,     absMax = 500 },
    { key = "susp_rear_damp",     group = "SUSPENSION // REAR",  label = "Damping",         fmt = "%.0f",     absMin = 0,     absMax = 30000 },
    { key = "susp_rear_rebound",  group = "SUSPENSION // REAR",  label = "Rebound",         fmt = "%.0f",     absMin = 0,     absMax = 30000 },
    { key = "susp_rear_antiroll", group = "SUSPENSION // REAR",  label = "Anti-Roll",       fmt = "%.1f",     absMin = 0,     absMax = 300 },
    { key = "tire_front_lat",     group = "TIRES",              label = "Front Lateral Grip",    fmt = "%.2f",     absMin = 0.05,  absMax = 3 },
    { key = "tire_front_long",    group = "TIRES",              label = "Front Longit. Grip",    fmt = "%.2f",     absMin = 0.05,  absMax = 3 },
    { key = "tire_rear_lat",      group = "TIRES",              label = "Rear Lateral Grip",     fmt = "%.2f",     absMin = 0.05,  absMax = 3 },
    { key = "tire_rear_long",     group = "TIRES",              label = "Rear Longit. Grip",     fmt = "%.2f",     absMin = 0.05,  absMax = 3 },
    { key = "tire_front_base_friction", group = "TIRES", label = "Front Base Friction", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "tire_front_rolling", group = "TIRES", label = "Front Rolling Resistance", fmt = "%.3f", absMin = 0, absMax = 10 },
    { key = "wheel_front_mass", group = "TIRES", label = "Front Wheel Mass", fmt = "%.1f kg", absMin = 0, absMax = 500 },
    { key = "tire_rear_base_friction", group = "TIRES", label = "Rear Base Friction", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "tire_rear_rolling", group = "TIRES", label = "Rear Rolling Resistance", fmt = "%.3f", absMin = 0, absMax = 10 },
    { key = "wheel_rear_mass", group = "TIRES", label = "Rear Wheel Mass", fmt = "%.1f kg", absMin = 0, absMax = 500 },
    { key = "steer_turn_add",     group = "STEERING",           label = "Turn Speed+",      fmt = "%.0f %%",  absMin = 10,    absMax = 2000 },
    { key = "steer_turn_sub",     group = "STEERING",           label = "Turn Speed-",      fmt = "%.0f %%",  absMin = 10,    absMax = 2000 },
    { key = "steer_assist",       group = "STEERING",           label = "Steering Assist",  fmt = "%.2f",     absMin = 0,     absMax = 3 },
    { key = "steer_speed_enabled",group = "SPEED-SENSITIVE STEERING", label = "Enable Speed Scaling", type = "bool" },
    { key = "steer_max_angle",    group = "SPEED-SENSITIVE STEERING", label = "Low-Speed Max Angle", fmt = "%.1f deg", absMin = 5,    absMax = 75 },
    { key = "steer_base_speed",   group = "SPEED-SENSITIVE STEERING", label = "Base Threshold",      fmt = "%.1f m/s", absMin = 0,    absMax = 50 },
    { key = "steer_mid_speed",    group = "SPEED-SENSITIVE STEERING", label = "Mid Threshold",       fmt = "%.1f m/s", absMin = 0,    absMax = 80 },
    { key = "steer_max_speed",    group = "SPEED-SENSITIVE STEERING", label = "High Threshold",      fmt = "%.1f m/s", absMin = 0,    absMax = 120 },
    { key = "steer_mid_angle_mul",group = "SPEED-SENSITIVE STEERING", label = "Mid Angle Multiplier", fmt = "%.2f x",   absMin = 0.01, absMax = 1.5 },
    { key = "steer_max_angle_mul",group = "SPEED-SENSITIVE STEERING", label = "High Angle Multiplier",fmt = "%.2f x",   absMin = 0.01, absMax = 1.5 },
    { key = "steer_mid_rate_mul", group = "SPEED-SENSITIVE STEERING", label = "Mid Speed Multiplier", fmt = "%.2f x",   absMin = 0.1,  absMax = 5 },
    { key = "steer_max_rate_mul", group = "SPEED-SENSITIVE STEERING", label = "High Speed Multiplier",fmt = "%.2f x",   absMin = 0.1,  absMax = 5 },
    { key = "steer_input_pow",    group = "SPEED-SENSITIVE STEERING", label = "Input Progression",     fmt = "%.2f",     absMin = 0.1,  absMax = 5 },
    { key = "steer_slow_rate",    group = "SPEED-SENSITIVE STEERING", label = "Slow Input Change",     fmt = "%.2f",     absMin = 0.01, absMax = 3 },
    { key = "steer_input_diff_slow", group = "SPEED-SENSITIVE STEERING", label = "Slow-Change Input Difference", fmt = "%.2f", absMin = 0, absMax = 2 },
    { key = "steer_input_diff_fast", group = "SPEED-SENSITIVE STEERING", label = "Fast-Change Input Difference", fmt = "%.2f", absMin = 0, absMax = 2 },
    { key = "steer_fast_rate", group = "SPEED-SENSITIVE STEERING", label = "Fast Input Change", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "slip_angle_min_speed", group = "GRIP & SLIP MODEL", label = "Slip-Angle Min Speed", fmt = "%.2f m/s", absMin = -10, absMax = 100 },
    { key = "slip_ratio_min_speed", group = "GRIP & SLIP MODEL", label = "Slip-Ratio Min Speed", fmt = "%.2f m/s", absMin = -10, absMax = 100 },
    { key = "slope_traction_factor", group = "GRIP & SLIP MODEL", label = "Slope Traction Reduction", fmt = "%.2f", absMin = 0, absMax = 20 },
    { key = "slope_traction_begin", group = "GRIP & SLIP MODEL", label = "Slope Reduction Begin", fmt = "%.1f deg", absMin = 0, absMax = 90 },
    { key = "slope_traction_max", group = "GRIP & SLIP MODEL", label = "Slope Reduction Maximum", fmt = "%.1f deg", absMin = 0, absMax = 90 },
    { key = "slip_angle_curve_scale", group = "GRIP & SLIP MODEL", label = "Slip-Angle Curve Scale", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "slip_ratio_curve_scale", group = "GRIP & SLIP MODEL", label = "Slip-Ratio Curve Scale", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "contact_increase_time", group = "WHEEL CONTACT MODEL", label = "Contact Increase Smoothing", fmt = "%.3f s", absMin = 0, absMax = 10 },
    { key = "contact_decrease_time", group = "WHEEL CONTACT MODEL", label = "Contact Decrease Smoothing", fmt = "%.3f s", absMin = 0, absMax = 10 },
    { key = "low_speed_stop_decel", group = "WHEEL CONTACT MODEL", label = "Low-Speed Stopping Deceleration", fmt = "%.2f", absMin = 0, absMax = 20 },
    { key = "braking_friction_factor", group = "WHEEL CONTACT MODEL", label = "Braking Friction Factor", fmt = "%.2f", absMin = 0, absMax = 20 },
    { key = "differential_overshoot", group = "WHEEL CONTACT MODEL", label = "Differential Overshoot Factor", fmt = "%.2f", absMin = 0, absMax = 20 },
    { key = "braking_estimation", group = "WHEEL CONTACT MODEL", label = "Braking Estimation Factor", fmt = "%.2f", absMin = 0, absMax = 20 },
    { key = "engine_min_rpm", group = "ENGINE RESPONSE", label = "Minimum RPM", fmt = "%.0f", absMin = 0, absMax = 10000 },
    { key = "gear_change_time", group = "ENGINE RESPONSE", label = "Gear Change Time", fmt = "%.3f s", absMin = 0, absMax = 5 },
    { key = "wheel_resistance_ratio", group = "ENGINE RESPONSE", label = "Wheels Resistance Ratio", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "gear_change_cooldown", group = "ENGINE RESPONSE", label = "Gear Change Cooldown", fmt = "%.3f s", absMin = 0, absMax = 10 },
    { key = "final_gear_torque_decay", group = "ENGINE RESPONSE", label = "Final-Gear Torque Decimation", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "flywheel_inertia", group = "ENGINE RESPONSE", label = "Flywheel Inertia", fmt = "%.2f", absMin = 0, absMax = 100 },
    { key = "reverse_direction_delay", group = "ENGINE RESPONSE", label = "Reverse Direction Delay", fmt = "%.3f s", absMin = 0, absMax = 10 },
    { key = "fast_r1_change", group = "ENGINE RESPONSE", label = "Fast Reverse/First-Gear Change", type = "bool" },
    { key = "force_reverse_min_rpm", group = "ENGINE RESPONSE", label = "Force Reverse RPM to Minimum", type = "bool" },
    { key = "brake_front",        group = "BRAKING",            label = "Front Brake",      fmt = "%.0f Nm",  absMin = 0,     absMax = 20000 },
    { key = "brake_rear",         group = "BRAKING",            label = "Rear Brake",       fmt = "%.0f Nm",  absMin = 0,     absMax = 20000 },
    { key = "brake_handbrake",    group = "BRAKING",            label = "Handbrake",        fmt = "%.0f Nm",  absMin = 0,     absMax = 20000 },
    { key = "front_sway_limit", group = "SUSPENSION // FRONT", label = "Swaybar Displacement Limit", fmt = "%.3f m", absMin = 0, absMax = 5 },
    { key = "front_sway_length", group = "ADVANCED SUSPENSION // FRONT", label = "Swaybar Length Scalar", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "front_bound_low", group = "SUSPENSION // FRONT", label = "Low-Rate Bound Damping", fmt = "%.0f", absMin = 0, absMax = 30000 },
    { key = "front_rebound_low", group = "SUSPENSION // FRONT", label = "Low-Rate Rebound Damping", fmt = "%.0f", absMin = 0, absMax = 30000 },
    { key = "front_comp_low", group = "SUSPENSION // FRONT", label = "Low-Rate Compression Point", fmt = "%.3f", absMin = 0, absMax = 5 },
    { key = "front_comp_high", group = "SUSPENSION // FRONT", label = "High-Rate Compression Point", fmt = "%.3f", absMin = 0, absMax = 5 },
    { key = "front_extreme_comp", group = "SUSPENSION // FRONT", label = "Extreme Compression Scale", fmt = "%.3f", absMin = 0, absMax = 10 },
    { key = "front_logical_comp", group = "SUSPENSION // FRONT", label = "Logical Compression Length", fmt = "%.3f m", absMin = 0, absMax = 3 },
    { key = "front_visual_droop", group = "SUSPENSION // FRONT", label = "Visual Suspension Droop", fmt = "%.3f m", absMin = 0, absMax = 3 },
    { key = "front_visual_comp", group = "SUSPENSION // FRONT", label = "Visual Compression Length", fmt = "%.3f m", absMin = 0, absMax = 3 },
    { key = "front_tender_length", group = "ADVANCED SUSPENSION // FRONT", label = "Tender Spring Length", fmt = "%.3f m", absMin = 0, absMax = 3 },
    { key = "front_wheel_offset_z", group = "SUSPENSION // FRONT", label = "Wheel Vertical Offset", fmt = "%.3f m", absMin = -2, absMax = 2 },
    { key = "tire_front_lat_fx", group = "TIRES", label = "Front Lateral Slip Effects", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "tire_front_long_fx", group = "TIRES", label = "Front Longitudinal Slip Effects", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "rear_sway_limit", group = "SUSPENSION // REAR", label = "Swaybar Displacement Limit", fmt = "%.3f m", absMin = 0, absMax = 5 },
    { key = "rear_sway_length", group = "ADVANCED SUSPENSION // REAR", label = "Swaybar Length Scalar", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "rear_bound_low", group = "SUSPENSION // REAR", label = "Low-Rate Bound Damping", fmt = "%.0f", absMin = 0, absMax = 30000 },
    { key = "rear_rebound_low", group = "SUSPENSION // REAR", label = "Low-Rate Rebound Damping", fmt = "%.0f", absMin = 0, absMax = 30000 },
    { key = "rear_comp_low", group = "SUSPENSION // REAR", label = "Low-Rate Compression Point", fmt = "%.3f", absMin = 0, absMax = 5 },
    { key = "rear_comp_high", group = "SUSPENSION // REAR", label = "High-Rate Compression Point", fmt = "%.3f", absMin = 0, absMax = 5 },
    { key = "rear_extreme_comp", group = "SUSPENSION // REAR", label = "Extreme Compression Scale", fmt = "%.3f", absMin = 0, absMax = 10 },
    { key = "rear_logical_comp", group = "SUSPENSION // REAR", label = "Logical Compression Length", fmt = "%.3f m", absMin = 0, absMax = 3 },
    { key = "rear_visual_droop", group = "SUSPENSION // REAR", label = "Visual Suspension Droop", fmt = "%.3f m", absMin = 0, absMax = 3 },
    { key = "rear_visual_comp", group = "SUSPENSION // REAR", label = "Visual Compression Length", fmt = "%.3f m", absMin = 0, absMax = 3 },
    { key = "rear_tender_length", group = "ADVANCED SUSPENSION // REAR", label = "Tender Spring Length", fmt = "%.3f m", absMin = 0, absMax = 3 },
    { key = "rear_wheel_offset_z", group = "SUSPENSION // REAR", label = "Wheel Vertical Offset", fmt = "%.3f m", absMin = -2, absMax = 2 },
    { key = "tire_rear_lat_fx", group = "TIRES", label = "Rear Lateral Slip Effects", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "tire_rear_long_fx", group = "TIRES", label = "Rear Longitudinal Slip Effects", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "front_is_drive", group = "DRIVETRAIN & BRAKE ROLES", label = "Front Wheels Driven", type = "bool" },
    { key = "rear_is_drive", group = "DRIVETRAIN & BRAKE ROLES", label = "Rear Wheels Driven", type = "bool" },
    { key = "front_is_main_brake", group = "DRIVETRAIN & BRAKE ROLES", label = "Front Main Brake", type = "bool" },
    { key = "rear_is_main_brake", group = "DRIVETRAIN & BRAKE ROLES", label = "Rear Main Brake", type = "bool" },
    { key = "front_is_handbrake", group = "DRIVETRAIN & BRAKE ROLES", label = "Front Handbrake", type = "bool" },
    { key = "rear_is_handbrake", group = "DRIVETRAIN & BRAKE ROLES", label = "Rear Handbrake", type = "bool" },
    { key = "front_tire_radius", group = "WHEEL GEOMETRY // FRONT", label = "Tire Radius", fmt = "%.3f m", absMin = 0.05, absMax = 2 },
    { key = "front_rim_radius", group = "WHEEL GEOMETRY // FRONT", label = "Rim Radius", fmt = "%.3f m", absMin = 0.05, absMax = 2 },
    { key = "front_tire_width", group = "WHEEL GEOMETRY // FRONT", label = "Tire Width", fmt = "%.3f m", absMin = 0.02, absMax = 2 },
    { key = "front_wheel_offset", group = "WHEEL GEOMETRY // FRONT", label = "Wheel Offset", fmt = "%.3f m", absMin = -2, absMax = 2 },
    { key = "rear_tire_radius", group = "WHEEL GEOMETRY // REAR", label = "Tire Radius", fmt = "%.3f m", absMin = 0.05, absMax = 2 },
    { key = "rear_rim_radius", group = "WHEEL GEOMETRY // REAR", label = "Rim Radius", fmt = "%.3f m", absMin = 0.05, absMax = 2 },
    { key = "rear_tire_width", group = "WHEEL GEOMETRY // REAR", label = "Tire Width", fmt = "%.3f m", absMin = 0.02, absMax = 2 },
    { key = "rear_wheel_offset", group = "WHEEL GEOMETRY // REAR", label = "Wheel Offset", fmt = "%.3f m", absMin = -2, absMax = 2 },
    { key = "burnout_max_start_speed", group = "BURNOUT & LAUNCH GRIP", label = "Maximum Initiation Speed", fmt = "%.1f m/s", absMin = 0, absMax = 200 },
    { key = "burnout_lat_accel_max", group = "BURNOUT & LAUNCH GRIP", label = "Maximum Lateral Acceleration", fmt = "%.2f", absMin = 0, absMax = 20 },
    { key = "burnout_lat_speed_max", group = "BURNOUT & LAUNCH GRIP", label = "Maximum Lateral Speed", fmt = "%.1f m/s", absMin = 0, absMax = 200 },
    { key = "burnout_forward_decay", group = "BURNOUT & LAUNCH GRIP", label = "Forward-Speed Lateral Decimation", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "burnout_drive_slip_max", group = "BURNOUT & LAUNCH GRIP", label = "Maximum Drive-Wheel Slip Ratio", fmt = "%.2f", absMin = 0, absMax = 100 },
    { key = "burnout_lat_slip_influence", group = "BURNOUT & LAUNCH GRIP", label = "Lateral Slip-Ratio Influence", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "burnout_lat_accel_slip_mul", group = "BURNOUT & LAUNCH GRIP", label = "Max Lateral-Accel Slip Multiplier", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "burnout_long_friction_slip_mul", group = "BURNOUT & LAUNCH GRIP", label = "Max Longitudinal-Friction Slip Multiplier", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "burnout_long_friction_min_scaled", group = "BURNOUT & LAUNCH GRIP", label = "Minimum Scaled Longitudinal Slip", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "burnout_long_coeff_min", group = "BURNOUT & LAUNCH GRIP", label = "Minimum Longitudinal Friction", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "burnout_grip_bonus", group = "BURNOUT & LAUNCH GRIP", label = "Burnout Grip Bonus", fmt = "%.2f", absMin = 0, absMax = 30 },
    { key = "burnout_grip_speed_mul", group = "BURNOUT & LAUNCH GRIP", label = "Grip-Bonus Speed Multiplier", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "burnout_grip_launch_speed", group = "BURNOUT & LAUNCH GRIP", label = "Grip-Bonus Maximum Launch Speed", fmt = "%.1f m/s", absMin = 0, absMax = 200 },
    { key = "burnout_brake_mod_min", group = "BURNOUT & LAUNCH GRIP", label = "Minimum Brake Modifier", fmt = "%.3f", absMin = 0, absMax = 10 },
    { key = "burnout_brake_mod_max", group = "BURNOUT & LAUNCH GRIP", label = "Maximum Brake Modifier", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "bike_tilt_speed", group = "BIKE DYNAMICS", label = "Tilt Speed", fmt = "%.2f", absMin = 0, absMax = 50 },
    { key = "bike_tilt_return_speed", group = "BIKE DYNAMICS", label = "Tilt Return Speed", fmt = "%.2f", absMin = 0, absMax = 50 },
    { key = "bike_tilt_custom_speed", group = "BIKE DYNAMICS", label = "Custom Tilt Speed", fmt = "%.2f", absMin = 0, absMax = 50 },
    { key = "bike_max_tilt", group = "BIKE DYNAMICS", label = "Maximum Tilt", fmt = "%.1f deg", absMin = 0, absMax = 90 },
    { key = "bike_max_com_long", group = "BIKE DYNAMICS", label = "Maximum COM Longitudinal Offset", fmt = "%.3f m", absMin = -3, absMax = 3 },
    { key = "bike_min_com_long", group = "BIKE DYNAMICS", label = "Minimum COM Longitudinal Offset", fmt = "%.3f m", absMin = -3, absMax = 3 },
    { key = "bike_com_damping", group = "BIKE DYNAMICS", label = "COM Offset Damping", fmt = "%.2f", absMin = 0, absMax = 20 },
}

for gear = 1, 8 do
    table.insert(PARAMS, { key = "gear_" .. gear .. "_min_speed", group = "INDIVIDUAL GEARS", label = "Gear " .. gear .. " Minimum Speed", fmt = "%.1f m/s", absMin = -50, absMax = 300 })
    table.insert(PARAMS, { key = "gear_" .. gear .. "_max_speed", group = "INDIVIDUAL GEARS", label = "Gear " .. gear .. " Maximum Speed", fmt = "%.1f m/s", absMin = 0, absMax = 400 })
    table.insert(PARAMS, { key = "gear_" .. gear .. "_min_rpm", group = "INDIVIDUAL GEARS", label = "Gear " .. gear .. " Minimum RPM", fmt = "%.0f", absMin = 0, absMax = 20000 })
    table.insert(PARAMS, { key = "gear_" .. gear .. "_max_rpm", group = "INDIVIDUAL GEARS", label = "Gear " .. gear .. " Maximum RPM", fmt = "%.0f", absMin = 0, absMax = 25000 })
    table.insert(PARAMS, { key = "gear_" .. gear .. "_torque", group = "INDIVIDUAL GEARS", label = "Gear " .. gear .. " Torque Multiplier", fmt = "%.2f x", absMin = 0, absMax = 10 })
end

local GROUPS = {
    "MASS & DYNAMICS",
    "CENTER OF MASS & BODY ROTATION",
    "ENGINE",
    "SUSPENSION // FRONT",
    "SUSPENSION // REAR",
    "TIRES",
    "STEERING",
    "SPEED-SENSITIVE STEERING",
    "GRIP & SLIP MODEL",
    "ROTATION & DRIFT LIMITER",
    "BRAKING",
    "INDIVIDUAL GEARS",
    "WHEEL CONTACT MODEL",
    "ADVANCED SUSPENSION // FRONT",
    "ADVANCED SUSPENSION // REAR",
    "ENGINE RESPONSE",
    "DRIVETRAIN & BRAKE ROLES",
    "WHEEL GEOMETRY // FRONT",
    "WHEEL GEOMETRY // REAR",
    "DYNAMIC REAR GRIP",
    "HANDBRAKE GRIP HELPER",
    "TRACTION & ACCELERATION HELPERS",
    "DOWNFORCE & AIR CONTROL",
    "BURNOUT & LAUNCH GRIP",
    "BIKE DYNAMICS",
    "AIR CONTROL // GENERAL",
    "AIR CONTROL // PITCH",
    "AIR CONTROL // YAW",
    "AIR CONTROL // ROLL",
    "WATER & BUOYANCY",
    "FLAT TIRE // FRONT",
    "FLAT TIRE // REAR",
}

local DM = {
    total_mass = "total_mass", chassis_mass = "chassis_mass",
    air_resistance = "airResistanceFactor",
    brake_handbrake = "handbrakeBrakingTorque",
    steer_turn_add = "wheelTurnMaxAddPerSecond",
    steer_turn_sub = "wheelTurnMaxSubPerSecond",
    steer_assist = "perfectSteeringFactor",
    steer_speed_enabled = "useAlternativeTurnUpdate",
    steer_max_angle = "maxWheelTurnDeg",
    steer_base_speed = "turnUpdateBaseSpeedThreshold",
    steer_mid_speed = "turnUpdateMidSpeedThreshold",
    steer_max_speed = "turnUpdateMaxSpeedThreshold",
    steer_mid_angle_mul = "turnUpdateMidSpeedTurnMul",
    steer_max_angle_mul = "turnUpdateMaxSpeedTurnMul",
    steer_mid_rate_mul = "turnUpdateMidSpeedTurnChangeMul",
    steer_max_rate_mul = "turnUpdateMaxSpeedTurnChangeMul",
    steer_input_pow = "turnUpdateInputDiffProgressionPow",
    steer_slow_rate = "turnUpdateInputSlowChangeSpeed",
    steer_input_diff_slow = "turnUpdateInputDiffForSlowChange",
    steer_input_diff_fast = "turnUpdateInputDiffForFastChange",
    steer_fast_rate = "turnUpdateInputFastChangeSpeed",
    weight_transfer_fwd = "forwardWeightTransferFactor",
    weight_transfer_side = "sideWeightTransferFactor",
    turning_roll = "turningRollFactor",
    bank_body_fb = "bankBodyFBTanMultiplier",
    bank_body_lr = "bankBodyLRTanMultiplier",
    body_friction = "bodyFriction",
    anti_sway_damping = "antiSwaybarDampingScalor",
    turn_roll_weak_mul = "turningRollFactorWeakContactMul",
    turn_roll_weak_min = "turningRollFactorWeakContactThresholdMin",
    turn_roll_weak_max = "turningRollFactorWeakContactThresholdMax",
    slip_angle_min_speed = "slipAngleMinSpeedThreshold",
    slip_ratio_min_speed = "slipRatioMinSpeedThreshold",
    slope_traction_factor = "slopeTractionReductionFactor",
    slope_traction_begin = "slopeTractionReductionBegin",
    slope_traction_max = "slopeTractionReductionMax",
    slip_angle_curve_scale = "slipAngleCurveScale",
    slip_ratio_curve_scale = "slipRatioCurveScale",
    contact_increase_time = "smoothWheelContactIncreseTime",
    contact_decrease_time = "smoothWheelContactDecreaseTime",
    low_speed_stop_decel = "lowVelStoppingDeceleration",
    braking_friction_factor = "brakingFrictionFactor",
    differential_overshoot = "differentialOvershootFactor",
    braking_estimation = "brakingEstimationMagicFactor",
    bike_tilt_speed = "bikeTiltSpeed",
    bike_tilt_return_speed = "bikeTiltReturnSpeed",
    bike_tilt_custom_speed = "bikeTiltCustomSpeed",
    bike_max_tilt = "bikeMaxTilt",
    bike_max_com_long = "bikeMaxCOMLongOffset",
    bike_min_com_long = "bikeMinCOMLongOffset",
    bike_com_damping = "bikeCOMOffsetDampFactor",
}
local VECTOR_DM = {
    center_of_mass_offset = { x = "com_x", y = "com_y", z = "com_z" },
    momentOfInertia = { x = "inertia_x", y = "inertia_y", z = "inertia_z" },
    momentOfInertiaScale = { x = "inertia_scale_x", y = "inertia_scale_y", z = "inertia_scale_z" },
}
local ENG = {
    max_torque = "engineMaxTorque", resistance_torque = "resistanceTorque",
    max_rpm = "maxRPM",
    engine_min_rpm = "minRPM",
    gear_change_time = "gearChangeTime",
    wheel_resistance_ratio = "wheelsResistanceRatio",
    gear_change_cooldown = "gearChangeCooldown",
    final_gear_torque_decay = "finalGearTorqueDecimationScalor",
    flywheel_inertia = "flyWheelMomentOfInertia",
    reverse_direction_delay = "reverseDirDelay",
    fast_r1_change = "fastR1GearChange",
    force_reverse_min_rpm = "forceReverseRPMToMin",
}
local FRONT = {
    susp_front_spring = "springStiffness", susp_front_damp = "springDamping",
    susp_front_rebound = "springReboundDamping", susp_front_antiroll = "swaybarStiffness",
    tire_front_lat = "frictionMulLateral", tire_front_long = "frictionMulLongitudinal",
    brake_front = "maxBrakingTorque",
    tire_front_base_friction = "tireFrictionCoef",
    tire_front_rolling = "tireRollingResistanceCoef",
    wheel_front_mass = "mass",
    front_sway_limit = "swaybarDisplacementLimit",
    front_sway_length = "swaybarLengthScalar",
    front_bound_low = "springBoundDampingLowRate",
    front_rebound_low = "springReboundDampingLowRate",
    front_comp_low = "springDampingLowRateCompression",
    front_comp_high = "springDampingHighRateCompression",
    front_extreme_comp = "extremeCompressionEventScalor",
    front_logical_comp = "logicalSuspensionCompressionLength",
    front_visual_droop = "visualSuspensionDroop",
    front_visual_comp = "visualSuspensionCompressionLength",
    front_tender_length = "tenderSpringLength",
    front_wheel_offset_z = "wheelsVerticalOffset",
    tire_front_lat_fx = "tireLateralSlipEffectsMul",
    tire_front_long_fx = "tireLongitudinalSlipEffectsMul",
}
local REAR = {
    susp_rear_spring = "springStiffness", susp_rear_damp = "springDamping",
    susp_rear_rebound = "springReboundDamping", susp_rear_antiroll = "swaybarStiffness",
    tire_rear_lat = "frictionMulLateral", tire_rear_long = "frictionMulLongitudinal",
    brake_rear = "maxBrakingTorque",
    tire_rear_base_friction = "tireFrictionCoef",
    tire_rear_rolling = "tireRollingResistanceCoef",
    wheel_rear_mass = "mass",
    rear_sway_limit = "swaybarDisplacementLimit",
    rear_sway_length = "swaybarLengthScalar",
    rear_bound_low = "springBoundDampingLowRate",
    rear_rebound_low = "springReboundDampingLowRate",
    rear_comp_low = "springDampingLowRateCompression",
    rear_comp_high = "springDampingHighRateCompression",
    rear_extreme_comp = "extremeCompressionEventScalor",
    rear_logical_comp = "logicalSuspensionCompressionLength",
    rear_visual_droop = "visualSuspensionDroop",
    rear_visual_comp = "visualSuspensionCompressionLength",
    rear_tender_length = "tenderSpringLength",
    rear_wheel_offset_z = "wheelsVerticalOffset",
    tire_rear_lat_fx = "tireLateralSlipEffectsMul",
    tire_rear_long_fx = "tireLongitudinalSlipEffectsMul",
}
local FRONT_ROLE = { front_is_drive = "isDrive", front_is_main_brake = "isMainBrake", front_is_handbrake = "isHandBrake" }
local REAR_ROLE = { rear_is_drive = "isDrive", rear_is_main_brake = "isMainBrake", rear_is_handbrake = "isHandBrake" }
local FRONT_DIMENSIONS = { front_tire_radius = "tireRadius", front_rim_radius = "rimRadius", front_tire_width = "tireWidth", front_wheel_offset = "wheelOffset" }
local REAR_DIMENSIONS = { rear_tire_radius = "tireRadius", rear_rim_radius = "rimRadius", rear_tire_width = "tireWidth", rear_wheel_offset = "wheelOffset" }
local BURNOUT = {
    burnout_max_start_speed = "maxSpeedToInitiateBurnOut",
    burnout_lat_accel_max = "lateralForceMaxAcceleration",
    burnout_lat_speed_max = "lateralForceMaxSpeed",
    burnout_forward_decay = "lateralAccelForwardSpeedMaxDecimation",
    burnout_drive_slip_max = "maxDriveWheelSlipRatio",
    burnout_lat_slip_influence = "lateralSlipRatioInfluence",
    burnout_lat_accel_slip_mul = "maxLateralAccelSlipRatioMultipler",
    burnout_long_friction_slip_mul = "maxLongFrictionSlipRatioMultipler",
    burnout_long_friction_min_scaled = "minLongFrictionSlipRatioScaled",
    burnout_long_coeff_min = "minLongFrictionCoeff",
    burnout_grip_bonus = "burnOutGripBonus",
    burnout_grip_speed_mul = "gripBonusMaxSpeedMultiplier",
    burnout_grip_launch_speed = "gripBonusMaxLaunchSpeed",
    burnout_brake_mod_min = "minBrakeForceModifier",
    burnout_brake_mod_max = "maxBrakeForceModifier",
}

local AIR_CONTROL = { air_mass_reference = "massReference" }
table.insert(PARAMS, { key = "air_mass_reference", group = "AIR CONTROL // GENERAL", label = "Mass Reference", fmt = "%.0f kg", absMin = 0, absMax = 10000 })

local AIR_AXIS_FIELDS = {
    { "max_velocity", "Maximum Velocity", "maxVelocity", "%.2f", 0, 100 },
    { "no_input_brake", "No-Input Brake Multiplier", "brakeMultiplierWhenNoInput", "%.2f", 0, 20 },
    { "input_damp", "Input Damping", "inputDampFactor", "%.2f", 0, 20 },
    { "stabilize", "Stabilize Axis", "stabilizeAxis", nil, nil, nil, "bool" },
    { "velocity_damp", "Velocity Damping", "velocityDampFactor", "%.2f", 0, 20 },
    { "velocity_threshold_min", "Velocity Threshold Minimum", "velocityDampingThresholdMin", "%.2f", 0, 200 },
    { "velocity_threshold_max", "Velocity Threshold Maximum", "velocityDampingThresholdMax", "%.2f", 0, 300 },
    { "velocity_factor_min", "Velocity Factor Minimum", "velocityDampingFactorMin", "%.2f", -20, 20 },
    { "velocity_factor_max", "Velocity Factor Maximum", "velocityDampingFactorMax", "%.2f", -20, 20 },
    { "angle_damp", "Angle Damping", "angleDampFactor", "%.2f", 0, 20 },
    { "angle_threshold_min", "Angle Threshold Minimum", "angleCorrectionThresholdMin", "%.1f deg", 0, 180 },
    { "angle_threshold_max", "Angle Threshold Maximum", "angleCorrectionThresholdMax", "%.1f deg", 0, 180 },
    { "angle_factor_min", "Angle Factor Minimum", "angleCorrectionFactorMin", "%.2f", -20, 20 },
    { "angle_factor_max", "Angle Factor Maximum", "angleCorrectionFactorMax", "%.2f", -20, 20 },
    { "velocity_compensation", "Maximum Velocity Compensation", "maxVelocityCompensation", "%.2f", 0, 500 },
    { "angle_compensation", "Maximum Angle Compensation", "maxAngleCompensation", "%.2f", 0, 500 },
    { "zero_angle", "Zero-Angle Threshold", "zeroAngleThreshold", "%.1f deg", 0, 180 },
    { "compensation_angle", "Maximum Compensation Angle", "maxAngleToCompensateThreshold", "%.1f deg", 0, 360 },
}

local AIR_AXIS_MAPS = { pitch = {}, yaw = {}, roll = {} }
for axis, map in pairs(AIR_AXIS_MAPS) do
    local group = "AIR CONTROL // " .. axis:upper()
    for _, spec in ipairs(AIR_AXIS_FIELDS) do
        local key = "air_" .. axis .. "_" .. spec[1]
        map[key] = spec[3]
        if spec[7] == "bool" then
            table.insert(PARAMS, { key = key, group = group, label = spec[2], type = "bool" })
        else
            table.insert(PARAMS, { key = key, group = group, label = spec[2], fmt = spec[4], absMin = spec[5], absMax = spec[6] })
        end
    end
end

local WATER = {
    water_disable_engine = "disableEngine",
    water_disable_air_control = "disableAirControl",
    water_submerged_threshold = "submergedThreshold",
    water_buoyancy = "buoyancyCoef",
    water_linear_damping = "linearDampingCoef",
    water_angular_damping = "angularDampingCoef",
    water_impulse_min_speed = "minSpeedToApplyImpulses",
    water_impulse_min_distance = "minDistanceBetweenImpulses",
    water_impulse_radius = "impulseRadius",
    water_impulse_strength = "impulseStrength",
    water_impulse_overhang = "impulseOverhangDistance",
    water_max_speed = "maxVehicleSpeed",
    water_fall_strength_min = "impulseStrengthFallMultiplierMin",
    water_fall_strength_max = "impulseStrengthFallMultiplierMax",
    water_fall_vertical_threshold = "verticalVelocityThresholdForFallFx",
    water_fall_depth_threshold = "depthThresholdForFallFx",
    water_fx_min_distance = "minDistanceBetweenFx",
}
local WATER_PARAM_SPECS = {
    { "water_disable_engine", "Disable Engine When Submerged", "bool" },
    { "water_disable_air_control", "Disable Air Control When Submerged", "bool" },
    { "water_submerged_threshold", "Submerged Threshold", "%.2f", 0, 10 },
    { "water_buoyancy", "Buoyancy", "%.2f", -20, 20 },
    { "water_linear_damping", "Linear Damping", "%.2f", 0, 20 },
    { "water_angular_damping", "Angular Damping", "%.2f", 0, 20 },
    { "water_impulse_min_speed", "Impulse Minimum Speed", "%.2f m/s", 0, 100 },
    { "water_impulse_min_distance", "Minimum Impulse Distance", "%.2f m", 0, 20 },
    { "water_impulse_radius", "Impulse Radius", "%.2f m", 0, 20 },
    { "water_impulse_strength", "Impulse Strength", "%.4f", -100, 100 },
    { "water_impulse_overhang", "Impulse Overhang Distance", "%.2f m", 0, 20 },
    { "water_max_speed", "Maximum Water Speed", "%.1f m/s", 0, 200 },
    { "water_fall_strength_min", "Fall Strength Minimum", "%.2f", 0, 100 },
    { "water_fall_strength_max", "Fall Strength Maximum", "%.2f", 0, 100 },
    { "water_fall_vertical_threshold", "Fall Vertical-Velocity Threshold", "%.2f m/s", -100, 100 },
    { "water_fall_depth_threshold", "Fall Depth Threshold", "%.2f m", 0, 20 },
    { "water_fx_min_distance", "Minimum FX Distance", "%.2f m", 0, 20 },
}
for _, spec in ipairs(WATER_PARAM_SPECS) do
    if spec[3] == "bool" then
        table.insert(PARAMS, { key = spec[1], group = "WATER & BUOYANCY", label = spec[2], type = "bool" })
    else
        table.insert(PARAMS, { key = spec[1], group = "WATER & BUOYANCY", label = spec[2], fmt = spec[3], absMin = spec[4], absMax = spec[5] })
    end
end

local FLAT_TIRE_FIELDS = {
    { "lateral_friction", "Lateral Friction Decimation", "lateralFrictionDecimation", "%.2f", 0, 10 },
    { "longitudinal_friction", "Longitudinal Friction Decimation", "longitudinalFrictionDecimation", "%.2f", 0, 10 },
    { "rotation_resistance", "Rotation Resistance Torque", "rotationResistanceTorque", "%.0f Nm", 0, 10000 },
    { "blowout_impulse", "Blowout Impulse", "blowOutImpulse", "%.0f", 0, 10000 },
}
local FLAT_TIRE_MAPS = { front = {}, rear = {} }
for axle, map in pairs(FLAT_TIRE_MAPS) do
    local group = "FLAT TIRE // " .. axle:upper()
    for _, spec in ipairs(FLAT_TIRE_FIELDS) do
        local key = "flat_" .. axle .. "_" .. spec[1]
        map[key] = spec[3]
        table.insert(PARAMS, { key = key, group = group, label = spec[2], fmt = spec[4], absMin = spec[5], absMax = spec[6] })
    end
end

local HELPER_SPECS = {
    { "rotation", "ROTATION & DRIFT LIMITER", "max_angular", "Maximum Angular Speed", "maxAngularSpeedRad", "%.2f rad/s", 0, 20 },
    { "rotation", "ROTATION & DRIFT LIMITER", "handbrake_limit", "Handbrake Rotation Limit", "handbrakeLimit", "%.2f", 0, 20 },
    { "rotation", "ROTATION & DRIFT LIMITER", "drift_limit", "Drift Rotation Limit", "driftLimit", "%.2f", 0, 20 },
    { "rotation", "ROTATION & DRIFT LIMITER", "drift_angle_begin", "Full Drift Angle Begin", "driftFullAngleBegin", "%.1f deg", 0, 180 },
    { "rotation", "ROTATION & DRIFT LIMITER", "drift_angle_end", "Full Drift Angle End", "driftFullAngleEnd", "%.1f deg", 0, 180 },
    { "rotation", "ROTATION & DRIFT LIMITER", "drift_vel_begin", "Drift Limit Start Speed", "driftLimitStartVel", "%.1f m/s", 0, 200 },
    { "rotation", "ROTATION & DRIFT LIMITER", "drift_vel_max", "Drift Limit Maximum Speed", "driftLimitMaxVel", "%.1f m/s", 0, 300 },
    { "rotation", "ROTATION & DRIFT LIMITER", "exceeded_angle", "Drift Exceeded Angle", "driftExceededAngle", "%.1f deg", 0, 180 },
    { "rotation", "ROTATION & DRIFT LIMITER", "smoothing", "Rotation Smoothing Time", "smoothingTime", "%.3f s", 0, 10 },
    { "rear_helper", "DYNAMIC REAR GRIP", "long_slip_min", "Minimum Longitudinal Slip", "minLongSlipRatio", "%.2f", 0, 20 },
    { "rear_helper", "DYNAMIC REAR GRIP", "long_slip_max", "Maximum Longitudinal Slip", "maxLongSlipRatio", "%.2f", 0, 20 },
    { "rear_helper", "DYNAMIC REAR GRIP", "lat_slip_min", "Minimum Lateral Slip", "minLatSlipRatio", "%.2f", 0, 20 },
    { "rear_helper", "DYNAMIC REAR GRIP", "lat_slip_max", "Maximum Lateral Slip", "maxLatSlipRatio", "%.2f", 0, 20 },
    { "rear_helper", "DYNAMIC REAR GRIP", "long_friction_min", "Minimum Longitudinal Friction", "minLongFrictionCoef", "%.2f", 0, 10 },
    { "rear_helper", "DYNAMIC REAR GRIP", "lat_friction_min", "Minimum Lateral Friction", "minLatFrictionCoef", "%.2f", 0, 10 },
    { "rear_helper", "DYNAMIC REAR GRIP", "max_speed", "Maximum Helper Speed", "maxSpeed", "%.1f m/s", 0, 300 },
    { "rear_helper", "DYNAMIC REAR GRIP", "max_accel", "Maximum Helper Acceleration", "maxHelperAcceleration", "%.2f", 0, 100 },
    { "handbrake", "HANDBRAKE GRIP HELPER", "lat_friction", "Rear Lateral Friction", "rearWheelsLatFrictionCoef", "%.2f", 0, 10 },
    { "handbrake", "HANDBRAKE GRIP HELPER", "long_friction", "Rear Longitudinal Friction", "rearWheelsLongFrictionCoef", "%.2f", 0, 10 },
    { "handbrake", "HANDBRAKE GRIP HELPER", "blend_time", "Blend-Out Time", "blendOutTime", "%.3f s", 0, 20 },
    { "handbrake", "HANDBRAKE GRIP HELPER", "extra_brake", "Additional Brake for Long Use", "additionalBrakeForLongUse", "%.2f", 0, 10 },
    { "handbrake", "HANDBRAKE GRIP HELPER", "post_grip", "Post-Handbrake Traction Boost", "postHandbrakeTractionBoost", "%.2f", 0, 20 },
    { "uphill", "TRACTION & ACCELERATION HELPERS", "factor", "Uphill Compensation Factor", "slopeCompensationFactor", "%.2f", 0, 20 },
    { "uphill", "TRACTION & ACCELERATION HELPERS", "max_angle", "Uphill Maximum Angle", "slopeCompensationMaxAngle", "%.1f deg", 0, 90 },
    { "accel_noise", "TRACTION & ACCELERATION HELPERS", "boost", "Acceleration Boost", "accelerationBoost", "%.2f", 0, 20 },
    { "accel_noise", "TRACTION & ACCELERATION HELPERS", "reverse", "Reverse Acceleration Boost", "accelerationBoostReverse", "%.2f", 0, 20 },
    { "accel_noise", "TRACTION & ACCELERATION HELPERS", "boost_speed", "Boost Maximum Speed", "accelerationBoostMaxSpeed", "%.1f m/s", 0, 300 },
    { "accel_noise", "TRACTION & ACCELERATION HELPERS", "force_min", "Minimum Force Difference", "minForcesDifference", "%.2f", 0, 20 },
    { "accel_noise", "TRACTION & ACCELERATION HELPERS", "force_max", "Maximum Force Difference", "maxForcesDifference", "%.2f", 0, 20 },
    { "accel_noise", "TRACTION & ACCELERATION HELPERS", "time_min", "Minimum Apply Time", "minApplyTime", "%.2f s", 0, 20 },
    { "accel_noise", "TRACTION & ACCELERATION HELPERS", "time_max", "Maximum Apply Time", "maxApplyTime", "%.2f s", 0, 20 },
    { "accel_noise", "TRACTION & ACCELERATION HELPERS", "max_speed", "Noise Maximum Speed", "accelerationNoiseMaxSpeed", "%.1f m/s", 0, 300 },
    { "downforce", "DOWNFORCE & AIR CONTROL", "min_speed", "Downforce Minimum Speed", "minSpeed", "%.1f m/s", 0, 200 },
    { "downforce", "DOWNFORCE & AIR CONTROL", "max_speed", "Downforce Maximum Speed", "maxSpeed", "%.1f m/s", 0, 300 },
    { "downforce", "DOWNFORCE & AIR CONTROL", "ground_factor", "Maximum Ground Factor", "maxSpeedFactorGround", "%.2f", 0, 20 },
    { "downforce", "DOWNFORCE & AIR CONTROL", "air_factor", "Maximum Air Factor", "maxSpeedFactorAir", "%.2f", 0, 20 },
    { "air", "DOWNFORCE & AIR CONTROL", "gravity_smoothing", "In-Air Smoothing", "smoothingFactor", "%.2f", 0, 20 },
    { "air", "DOWNFORCE & AIR CONTROL", "gravity_base", "Base Added Gravity", "baseAddedGravity", "%.2f", -20, 20 },
    { "air", "DOWNFORCE & AIR CONTROL", "gravity_speed_min", "Gravity Minimum Drive Speed", "minDriveSpeed", "%.1f m/s", 0, 200 },
    { "air", "DOWNFORCE & AIR CONTROL", "gravity_speed_max", "Gravity Maximum Drive Speed", "maxDriveSpeed", "%.1f m/s", 0, 300 },
    { "air", "DOWNFORCE & AIR CONTROL", "gravity_speed_add", "Drive-Speed Added Gravity", "driveSpeedAddedGravity", "%.2f", -20, 20 },
    { "air", "DOWNFORCE & AIR CONTROL", "z_reduction_start", "Vertical Reduction Start", "zVelReductionStart", "%.2f m/s", -100, 100 },
    { "air", "DOWNFORCE & AIR CONTROL", "z_reduction_end", "Vertical Reduction End", "zVelReductionEnd", "%.2f m/s", -100, 100 },
}

local HELPER_MAPS = {}
for _, spec in ipairs(HELPER_SPECS) do
    local helper, group, suffix, label, flat, fmt, absMin, absMax =
        spec[1], spec[2], spec[3], spec[4], spec[5], spec[6], spec[7], spec[8]
    local key = helper .. "_" .. suffix
    HELPER_MAPS[helper] = HELPER_MAPS[helper] or {}
    HELPER_MAPS[helper][key] = flat
    table.insert(PARAMS, { key = key, group = group, label = label, fmt = fmt, absMin = absMin, absMax = absMax })
end

local showOverlay = false
local showAdvanced = false
local selected = 1
local edit = {}
local stock = {}
local vanillaStock = {}
local runtimeStock = {}
local saved = {}
local diskSaved = {}
local vehicleCount = 0
local lastError = ""
local appliedList = {}
local statusMessage = "Open this window in the CET overlay to tune vehicles."
local configStatus = "Loading presets..."
local tdbReady = false
local pendingRespawn = nil
local lastMountedRecordName = nil
local autoSave = true
local activeConfigFile = "config.json"
local activeConfigReadOnly = false
local presetDirty = false
local presetFiles = {}
local saveAsName = "config_new.json"
local metadata = { version = 1, activeConfig = "config.json", autoSave = true, presetIndex = { "config.json" } }

local STOCK_FILE = "stock.json"
local RUNTIME_STOCK_FILE = "stock_runtime.json"
local BASE_CONFIG_FILE = "config_base.json"
local DEFAULT_CONFIG_FILE = "config.json"
local METADATA_FILE = "metadata.json"

local LEGACY_KEYS = {
    ["Vehicle.v_sport1_quadra_turbo_r_player"] = { "Vehicle.v_sport1_quadra_turbo_r_v_tech" },
    ["Vehicle.v_sport2_mizutani_shion_player"] = { "Vehicle.v_sport2_mizutani_shion_mz2" },
    ["Vehicle.v_sport2_mizutani_shion_base_player"] = { "Vehicle.v_sport2_mizutani_shion" },
    ["Vehicle.v_standard3_thorton_mackinaw_player"] = {
        "Vehicle.v_standard3_thorton_mackinaw_mtl1",
        "Vehicle.v_standard3_thorton_mackinaw",
    },
    ["Vehicle.v_standard3_thorton_mackinaw_ncu_player"] = { "Vehicle.v_standard3_thorton_mackinaw_02" },
}

local function migrateLegacyKeys(target)
    for _, veh in ipairs(VEHICLES) do
        local legacy = {}
        for _, id in ipairs(LEGACY_KEYS[veh.id] or {}) do table.insert(legacy, id) end
        local bare = veh.id:gsub("_player$", "")
        if bare ~= veh.id then table.insert(legacy, bare) end
        if target[veh.id] == nil then
            for _, oldId in ipairs(legacy) do
                if target[oldId] ~= nil then
                    target[veh.id] = target[oldId]
                    break
                end
            end
        end
        for _, oldId in ipairs(legacy) do target[oldId] = nil end
    end
end

local PARAM_KEY_ALIASES = {
    burnout_max_speed = "burnout_max_start_speed",
    burnout_lateral_force_max_accel = "burnout_lat_accel_max",
    burnout_lateral_force_max_speed = "burnout_lat_speed_max",
    engine_gear_change_time = "gear_change_time",
    engine_wheels_resistance = "wheel_resistance_ratio",
    susp_front_swaybar_disp_limit = "front_sway_limit",
    susp_front_swaybar_length_scalar = "front_sway_length",
    susp_rear_swaybar_disp_limit = "rear_sway_limit",
    susp_rear_swaybar_length_scalar = "rear_sway_length",
    rear_grip_max_speed = "rear_helper_max_speed",
    bike_com_damp = "bike_com_damping",
}

for gear = 1, 8 do
    PARAM_KEY_ALIASES["gear_" .. gear .. "_torque_mul"] = "gear_" .. gear .. "_torque"
end

local function migrateParamKeys(target)
    for _, params in pairs(target) do
        if type(params) == "table" then
            for oldKey, newKey in pairs(PARAM_KEY_ALIASES) do
                if params[newKey] == nil and params[oldKey] ~= nil then
                    params[newKey] = params[oldKey]
                end
                params[oldKey] = nil
            end
        end
    end
end

local function copyTbl(src)
    local dst = {}
    if not src then return dst end
    for k, v in pairs(src) do
        dst[k] = v
    end
    return dst
end

local function copyVehicleMap(src)
    local dst = {}
    for id, params in pairs(src or {}) do
        if type(params) == "table" then dst[id] = copyTbl(params) end
    end
    return dst
end

local function tablesEqual(a, b)
    if a == b then return true end
    if type(a) ~= "table" or type(b) ~= "table" then return false end
    for key, value in pairs(a) do
        if type(value) == "number" and type(b[key]) == "number" then
            if math.abs(value - b[key]) > 0.000001 then return false end
        elseif value ~= b[key] then
            if type(value) ~= "table" or not tablesEqual(value, b[key]) then return false end
        end
    end
    for key in pairs(b) do
        if a[key] == nil then return false end
    end
    return true
end

local function asNumber(v)
    if v == nil then return nil end
    if type(v) == "boolean" then return v end
    local n = tonumber(v)
    return n
end

local function loadJSON(path)
    local ok, data = pcall(function()
        local f = io.open(path, "r")
        if not f then return nil end
        local content = f:read("*a")
        f:close()
        if not content or content == "" then return nil end
        return json.decode(content)
    end)
    if ok and type(data) == "table" then return data end
    return nil
end

local function fileExists(path)
    local ok, exists = pcall(function()
        local f = io.open(path, "r")
        if not f then return false end
        f:close()
        return true
    end)
    return ok and exists
end

local function saveJSON(path, data)
    local ok, err = pcall(function()
        local f = io.open(path, "w")
        if not f then error("Could not open " .. tostring(path) .. " for writing") end
        f:write(json.encode(data))
        f:close()
    end)
    return ok, err
end

local function safeConfigFilename(name)
    if type(name) ~= "string" then return nil end
    name = name:match("^%s*(.-)%s*$")
    if name == "" or name:find("..", 1, true) or
        name:find("/", 1, true) or name:find("\\", 1, true) then return nil end
    if not name:lower():match("^config.*%.json$") then return nil end
    return name
end

local function countSavedVehicles()
    local count = 0
    for vehId, params in pairs(saved) do
        local edited = stock[vehId] == nil
        if type(params) == "table" then
            for key, value in pairs(params) do
                local vanilla = stock[vehId] and stock[vehId][key] or nil
                if type(value) == "number" and type(vanilla) == "number" then
                    if math.abs(value - vanilla) > 0.001 then edited = true break end
                elseif value ~= vanilla then
                    edited = true
                    break
                end
            end
        end
        if edited then count = count + 1 end
    end
    vehicleCount = count
    return count
end

local function activeConfigDirty()
    return presetDirty
end

local function persistMetadata()
    metadata.version = 1
    metadata.activeConfig = activeConfigFile
    metadata.autoSave = autoSave
    local index, seen = {}, {}
    for _, preset in ipairs(presetFiles) do
        local file = safeConfigFilename(preset.file)
        if file and not seen[file:lower()] then
            table.insert(index, file)
            seen[file:lower()] = true
        end
    end
    metadata.presetIndex = index
    return saveJSON(METADATA_FILE, metadata)
end

local function persistActiveConfig()
    if activeConfigReadOnly then
        return false, "The selected baseline is read-only. Use Save As to create an editable preset."
    end
    local ok, err = saveJSON(activeConfigFile, {
        selectedId = VEHICLES[selected] and VEHICLES[selected].id or nil,
        vehicles = saved,
    })
    if ok then
        diskSaved = copyVehicleMap(saved)
        presetDirty = false
        countSavedVehicles()
        configStatus = "Saved " .. activeConfigFile
        persistMetadata()
        return true
    end
    return false, tostring(err or "Could not save preset")
end

local function persistRuntimeStock()
    return saveJSON(RUNTIME_STOCK_FILE, runtimeStock)
end

local function validPresetDocument(data)
    return type(data) == "table" and type(data.vehicles) == "table"
end

local function refreshPresetFiles()
    local names, seen = {}, {}
    local function addName(name)
        name = safeConfigFilename(name)
        if not name then return end
        local key = name:lower()
        if not seen[key] then
            seen[key] = true
            table.insert(names, name)
        end
    end

    addName(DEFAULT_CONFIG_FILE)
    addName(BASE_CONFIG_FILE)
    for _, name in ipairs(metadata.presetIndex or {}) do addName(name) end

    local ok, entries = pcall(function() return dir(".") end)
    if ok and type(entries) == "table" then
        for _, entry in ipairs(entries) do
            if type(entry) == "table" and (entry.type == nil or entry.type == "file") then
                addName(entry.name)
            elseif type(entry) == "string" then
                addName(entry)
            end
        end
    end

    table.sort(names, function(a, b)
        if a:lower() == DEFAULT_CONFIG_FILE then return true end
        if b:lower() == DEFAULT_CONFIG_FILE then return false end
        if a:lower() == BASE_CONFIG_FILE then return false end
        if b:lower() == BASE_CONFIG_FILE then return true end
        return a:lower() < b:lower()
    end)

    presetFiles = {}
    for _, name in ipairs(names) do
        local data = loadJSON(name)
        if validPresetDocument(data) then
            table.insert(presetFiles, {
                file = name,
                label = name,
                readOnly = name:lower() == BASE_CONFIG_FILE,
                vanilla = false,
            })
        end
    end
    table.insert(presetFiles, {
        file = STOCK_FILE,
        label = "Vanilla (stock.json)",
        readOnly = true,
        vanilla = true,
    })
end

local function getRecord(vehId)
    local ok, rec = pcall(function()
        return TweakDB:GetRecord(TweakDBID.new(vehId))
    end)
    if ok and rec then return rec end
    return nil
end

local function candidateIds(veh)
    local ids = { veh.id }
    for _, id in ipairs(veh.variants or {}) do table.insert(ids, id) end
    if veh.alias then table.insert(ids, veh.alias) end
    if not veh.id:match("_player$") then table.insert(ids, veh.id .. "_player") end
    if veh.alias and not veh.alias:match("_player$") then table.insert(ids, veh.alias .. "_player") end
    return ids
end

local getRawFlat

local function resolveChain(vehId)
    local rec = getRecord(vehId)
    if not rec then return nil, "Record not found: " .. tostring(vehId) end

    local ok, chainOrErr = pcall(function()
        local dmRec = nil
        local dmOk, vehDm = pcall(function() return rec:VehDriveModelData() end)
        if dmOk then dmRec = vehDm end
        if not dmRec then
            local bikeOk, bikeDm = pcall(function() return rec:BikeDriveModelData() end)
            if bikeOk then dmRec = bikeDm end
        end
        if not dmRec then error("No vehicle or bike drive model data") end

        local chain = {
            dmId = dmRec:GetID(),
            engId = nil,
            frontId = nil,
            rearId = nil,
            rearShared = false,
            frontDimensionsId = nil,
            rearDimensionsId = nil,
            frontRoleIds = {},
            rearRoleIds = {},
            burnoutId = nil,
            gearIds = {},
            helperIds = {},
            airControlId = nil,
            airAxisIds = {},
            waterId = nil,
            flatTireIds = {},
        }

        local engRec = rec:VehEngineData()
        if engRec then
            chain.engId = engRec:GetID()
            local gearsOk, gears = pcall(function() return engRec:Gears() end)
            if gearsOk and type(gears) == "table" then
                for i, gear in ipairs(gears) do
                    if gear then chain.gearIds[i] = gear:GetID() end
                end
            end
        end

        local burnoutOk, burnoutRec = pcall(function() return dmRec:BurnOut() end)
        if burnoutOk and burnoutRec then chain.burnoutId = burnoutRec:GetID() end

        local waterOk, waterRec = pcall(function() return dmRec:WaterParams() end)
        if waterOk and waterRec then chain.waterId = waterRec:GetID() end

        local flatOk, flatRec = pcall(function() return dmRec:FlatTireSim() end)
        if flatOk and flatRec then
            local frontOk, frontRec = pcall(function() return flatRec:Front() end)
            if frontOk and frontRec then chain.flatTireIds.front = frontRec:GetID() end
            local rearOk, rearRec = pcall(function() return flatRec:Rear() end)
            if rearOk and rearRec then chain.flatTireIds.rear = rearRec:GetID() end
        end

        local helperTypes = {
            rotationlimiter = "rotation_limiter",
            rearwheelsfrictionmodifier = "rear_grip",
            handbrakefrictionmodifier = "handbrake_helper",
            uphilldrivehelper = "uphill_helper",
            drivewheelsacceleratenoise = "accel_noise",
            dynamicdownforcehelper = "downforce",
            inairgravitymodifier = "air_gravity",
        }
        local helpersOk, helpers = pcall(function() return dmRec:DriveHelpers() end)
        if helpersOk and type(helpers) == "table" then
            for _, helperRec in ipairs(helpers) do
                if helperRec then
                    local helperId = helperRec:GetID()
                    local signature = (TDBID.ToStringDEBUG(helperId) .. " " ..
                        tostring(getRawFlat(helperId, "type") or "")):lower()
                    for needle, helper in pairs(helperTypes) do
                        if signature:find(needle, 1, true) then
                            chain.helperIds[helper] = helperId
                            break
                        end
                    end
                end
            end
        end
        chain.helperIds.rotation = chain.helperIds.rotation_limiter
        chain.helperIds.rear_helper = chain.helperIds.rear_grip
        chain.helperIds.handbrake = chain.helperIds.handbrake_helper
        chain.helperIds.uphill = chain.helperIds.uphill_helper
        chain.helperIds.accel = chain.helperIds.accel_noise
        chain.helperIds.downforce_real = chain.helperIds.downforce
        chain.helperIds.air = chain.helperIds.air_gravity

        local airOk, airRec = pcall(function() return rec:VehAirControl() end)
        if airOk and airRec then
            chain.airControlId = airRec:GetID()
            local axisGetters = {
                pitch = function() return airRec:Pitch() end,
                yaw = function() return airRec:Yaw() end,
                roll = function() return airRec:Roll() end,
            }
            for axis, getter in pairs(axisGetters) do
                local axisOk, axisRec = pcall(getter)
                if axisOk and axisRec then chain.airAxisIds[axis] = axisRec:GetID() end
            end
        end

        local dimensionsOk, dimensions = pcall(function() return rec:VehWheelDimensionsSetup() end)
        if dimensionsOk and dimensions then
            local frontOk, frontDimensions = pcall(function() return dimensions:FrontPreset() end)
            if frontOk and frontDimensions then chain.frontDimensionsId = frontDimensions:GetID() end
            local backOk, backDimensions = pcall(function() return dimensions:BackPreset() end)
            if backOk and backDimensions then chain.rearDimensionsId = backDimensions:GetID() end
        end

        local wsRec = dmRec:WheelSetup()
        if wsRec then
            local fOk, fp = pcall(function() return wsRec:FrontPreset() end)
            if fOk and fp then
                chain.frontId = fp:GetID()
            end

            local rearId = nil
            local rOk, rp = pcall(function() return wsRec:BackPreset() end)
            if rOk and rp then
                rearId = rp:GetID()
            else
                rOk, rp = pcall(function() return wsRec:RearPreset() end)
                if rOk and rp then rearId = rp:GetID() end
            end

            if rearId then
                chain.rearId = rearId
            elseif chain.frontId then
                chain.rearId = chain.frontId
                chain.rearShared = true
            end

            local roleGetters = {
                { "frontRoleIds", function() return wsRec:LF() end },
                { "frontRoleIds", function() return wsRec:RF() end },
                { "rearRoleIds", function() return wsRec:LB() end },
                { "rearRoleIds", function() return wsRec:RB() end },
            }
            for _, roleGetter in ipairs(roleGetters) do
                local roleOk, roleRec = pcall(roleGetter[2])
                if roleOk and roleRec then
                    table.insert(chain[roleGetter[1]], roleRec:GetID())
                end
            end
            if #chain.frontRoleIds == 0 then
                local roleOk, roleRec = pcall(function() return wsRec:F() end)
                if roleOk and roleRec then table.insert(chain.frontRoleIds, roleRec:GetID()) end
            end
            if #chain.rearRoleIds == 0 then
                local roleOk, roleRec = pcall(function() return wsRec:B() end)
                if roleOk and roleRec then table.insert(chain.rearRoleIds, roleRec:GetID()) end
            end
        end

        return chain
    end)

    if not ok then return nil, tostring(chainOrErr) end
    return chainOrErr
end

local function getFlat(baseId, flatName)
    local ok, val = pcall(function()
        return TweakDB:GetFlat(TweakDBID.new(baseId, "." .. flatName))
    end)
    if ok then return asNumber(val) end
    return nil
end

getRawFlat = function(baseId, flatName)
    local ok, val = pcall(function()
        return TweakDB:GetFlat(TweakDBID.new(baseId, "." .. flatName))
    end)
    if ok then return val end
    return nil
end

local function vectorComponent(value, lower, upper)
    if value == nil then return nil end
    local ok, component = pcall(function()
        return value[upper] ~= nil and value[upper] or value[lower]
    end)
    if ok then return asNumber(component) end
    return nil
end

local function setFlat(baseId, flatName, val)
    local flatId = TweakDBID.new(baseId, "." .. flatName)
    local before = TweakDB:GetFlat(flatId)
    TweakDB:SetFlat(flatId, val)
    local after = TweakDB:GetFlat(flatId)
    local function display(value)
        if value == nil then return "nil" end
        if type(value) == "number" then return string.format("%.2f", value) end
        return tostring(value)
    end
    local matched = false
    if type(after) == "number" and type(val) == "number" then
        matched = math.abs(after - val) < 0.01
    else
        matched = after == val
    end
    local status = matched and "OK" or "MISS"
    table.insert(appliedList, "  " .. flatName .. ": " .. display(before) .. " -> " .. display(val) .. " [" .. status .. "]")
end

local function applyMap(recordId, map, params)
    if not recordId then return false end
    local changed = false
    for key, flat in pairs(map) do
        if params[key] ~= nil then
            setFlat(recordId, flat, params[key])
            changed = true
        end
    end
    if changed then TweakDB:Update(recordId) end
    return changed
end

local function readMap(recordId, map, params)
    if not recordId then return end
    for key, flat in pairs(map) do
        local val = getFlat(recordId, flat)
        if val ~= nil then params[key] = val end
    end
end

local function readVectorMap(recordId, map, params)
    if not recordId then return end
    for flat, keys in pairs(map) do
        local value = getRawFlat(recordId, flat)
        local x = vectorComponent(value, "x", "X")
        local y = vectorComponent(value, "y", "Y")
        local z = vectorComponent(value, "z", "Z")
        if x ~= nil then params[keys.x] = x end
        if y ~= nil then params[keys.y] = y end
        if z ~= nil then params[keys.z] = z end
    end
end

local function applyVectorMap(recordId, map, params)
    if not recordId then return false end
    local changed = false
    for flat, keys in pairs(map) do
        local before = getRawFlat(recordId, flat)
        local bx = vectorComponent(before, "x", "X")
        local by = vectorComponent(before, "y", "Y")
        local bz = vectorComponent(before, "z", "Z")
        local tx = params[keys.x] ~= nil and params[keys.x] or bx
        local ty = params[keys.y] ~= nil and params[keys.y] or by
        local tz = params[keys.z] ~= nil and params[keys.z] or bz
        if bx ~= nil and by ~= nil and bz ~= nil and tx ~= nil and ty ~= nil and tz ~= nil then
            local after = Vector3.new(tx, ty, tz)
            TweakDB:SetFlat(TweakDBID.new(recordId, "." .. flat), after)
            table.insert(appliedList, string.format("  %s: (%.2f, %.2f, %.2f) -> (%.2f, %.2f, %.2f) [OK]",
                flat, bx, by, bz, tx, ty, tz))
            changed = true
        end
    end
    if changed then TweakDB:Update(recordId) end
    return changed
end

local GEAR_FLATS = {
    min_speed = "minSpeed", max_speed = "maxSpeed",
    min_rpm = "minEngineRPM", max_rpm = "maxEngineRPM",
    torque = "torqueMultiplier",
}

local function readGearMaps(gearIds, params)
    for index, gearId in ipairs(gearIds or {}) do
        if index <= 8 then
            for suffix, flat in pairs(GEAR_FLATS) do
                local value = getFlat(gearId, flat)
                if value ~= nil then params["gear_" .. index .. "_" .. suffix] = value end
            end
        end
    end
end

local function applyGearMaps(gearIds, params)
    for index, gearId in ipairs(gearIds or {}) do
        if index <= 8 then
            local map = {}
            for suffix, flat in pairs(GEAR_FLATS) do
                map["gear_" .. index .. "_" .. suffix] = flat
            end
            applyMap(gearId, map, params)
        end
    end
end

local function readFirstMap(recordIds, map, params)
    local recordId = recordIds and recordIds[1] or nil
    if recordId then readMap(recordId, map, params) end
end

local function applyMaps(recordIds, map, params)
    for _, recordId in ipairs(recordIds or {}) do
        applyMap(recordId, map, params)
    end
end

local function readHelperMaps(helperIds, params)
    for helper, map in pairs(HELPER_MAPS) do
        readMap(helperIds and helperIds[helper] or nil, map, params)
    end
end

local function applyHelperMaps(helperIds, params)
    for helper, map in pairs(HELPER_MAPS) do
        applyMap(helperIds and helperIds[helper] or nil, map, params)
    end
end

local function readVehicle(vehId)
    local chain, err = resolveChain(vehId)
    if not chain then return nil, err end
    local params = {}
    readMap(chain.dmId, DM, params)
    readVectorMap(chain.dmId, VECTOR_DM, params)
    if chain.engId then readMap(chain.engId, ENG, params) end
    readGearMaps(chain.gearIds, params)
    readMap(chain.frontDimensionsId, FRONT_DIMENSIONS, params)
    readMap(chain.rearDimensionsId, REAR_DIMENSIONS, params)
    readFirstMap(chain.frontRoleIds, FRONT_ROLE, params)
    readFirstMap(chain.rearRoleIds, REAR_ROLE, params)
    readMap(chain.burnoutId, BURNOUT, params)
    readHelperMaps(chain.helperIds, params)
    readMap(chain.airControlId, AIR_CONTROL, params)
    for axis, map in pairs(AIR_AXIS_MAPS) do
        readMap(chain.airAxisIds[axis], map, params)
    end
    readMap(chain.waterId, WATER, params)
    for axle, map in pairs(FLAT_TIRE_MAPS) do
        readMap(chain.flatTireIds[axle], map, params)
    end
    if chain.frontId then readMap(chain.frontId, FRONT, params) end
    if chain.rearId and not chain.rearShared then
        readMap(chain.rearId, REAR, params)
    elseif chain.rearShared and chain.frontId then
        -- Bikes / shared axle: mirror front into rear so sliders still have values.
        readMap(chain.frontId, REAR, params)
    end
    return params, nil, chain
end

local function writeVehicle(vehId, params)
    local ok, err = pcall(function()
        local chain, resolveErr = resolveChain(vehId)
        if not chain then error(resolveErr or "resolve failed") end

        table.insert(appliedList, "--- " .. vehId .. " ---")
        table.insert(appliedList, "DM: " .. TDBID.ToStringDEBUG(chain.dmId))
        applyMap(chain.dmId, DM, params)
        applyVectorMap(chain.dmId, VECTOR_DM, params)

        if chain.engId then
            table.insert(appliedList, "ENG: " .. TDBID.ToStringDEBUG(chain.engId))
            applyMap(chain.engId, ENG, params)
        end
        applyGearMaps(chain.gearIds, params)
        applyMap(chain.frontDimensionsId, FRONT_DIMENSIONS, params)
        if chain.rearDimensionsId ~= chain.frontDimensionsId then
            applyMap(chain.rearDimensionsId, REAR_DIMENSIONS, params)
        elseif chain.rearDimensionsId then
            applyMap(chain.rearDimensionsId, REAR_DIMENSIONS, params)
        end
        applyMaps(chain.frontRoleIds, FRONT_ROLE, params)
        applyMaps(chain.rearRoleIds, REAR_ROLE, params)
        applyMap(chain.burnoutId, BURNOUT, params)
        applyHelperMaps(chain.helperIds, params)
        applyMap(chain.airControlId, AIR_CONTROL, params)
        for axis, map in pairs(AIR_AXIS_MAPS) do
            applyMap(chain.airAxisIds[axis], map, params)
        end
        applyMap(chain.waterId, WATER, params)
        for axle, map in pairs(FLAT_TIRE_MAPS) do
            applyMap(chain.flatTireIds[axle], map, params)
        end

        if chain.frontId then
            table.insert(appliedList, "FRONT: " .. TDBID.ToStringDEBUG(chain.frontId))
            applyMap(chain.frontId, FRONT, params)
        end

        if chain.rearId and not chain.rearShared then
            table.insert(appliedList, "REAR: " .. TDBID.ToStringDEBUG(chain.rearId))
            applyMap(chain.rearId, REAR, params)
        elseif chain.rearShared then
            table.insert(appliedList, "REAR skipped (shared with front)")
        end

        TweakDB:Update(TweakDBID.new(vehId))
    end)
    if not ok then
        table.insert(appliedList, "FAILED: " .. tostring(err))
        return false, err
    end
    return true
end

local function firstReadableId(veh)
    for _, id in ipairs(candidateIds(veh)) do
        local params = readVehicle(id)
        if params and next(params) then
            return id, params
        end
    end
    return nil, nil
end

local function applyToVariants(veh, params)
    local okAny = false
    local lastErr = nil
    local seen = {}
    for _, id in ipairs(candidateIds(veh)) do
        if not seen[id] and getRecord(id) then
            seen[id] = true
            local ok, err = writeVehicle(id, params)
            if ok then
                okAny = true
            else
                lastErr = err
            end
        end
    end
    return okAny, lastErr
end

local function loadEditorFrom(params)
    edit = copyTbl(params)
end

local function currentVeh()
    return VEHICLES[selected]
end

local function currentStock()
    local veh = currentVeh()
    if not veh then return {} end
    return stock[veh.id] or {}
end

local function mergedPresetParams(vehId, presetVehicles)
    local params = copyTbl(stock[vehId] or {})
    for key, value in pairs((presetVehicles or saved)[vehId] or {}) do
        params[key] = value
    end
    return params
end

local function ensureVehicleInRoster(vehId)
    if type(vehId) ~= "string" or vehId == "" then return nil end
    for index, veh in ipairs(VEHICLES) do
        for _, id in ipairs(candidateIds(veh)) do
            if id:lower() == vehId:lower() then return index, veh end
        end
    end
    local veh = {
        id = vehId,
        name = friendlyVehicleName(vehId),
        class = vehId:lower():find("sportbike", 1, true) and "Bike" or "Additional Player Vehicles",
    }
    table.insert(VEHICLES, veh)
    return #VEHICLES, veh
end

local function addPresetVehiclesToRoster(presetVehicles)
    for vehId in pairs(presetVehicles or {}) do ensureVehicleInRoster(vehId) end
end

local function captureVehicleStock(veh)
    if not veh then return nil end
    local _, liveParams = firstReadableId(veh)
    if not liveParams then return nil end

    local changed = false
    stock[veh.id] = stock[veh.id] or {}
    runtimeStock[veh.id] = runtimeStock[veh.id] or {}
    for key, value in pairs(liveParams) do
        if stock[veh.id][key] == nil then
            stock[veh.id][key] = value
            runtimeStock[veh.id][key] = value
            changed = true
        end
    end
    if changed then persistRuntimeStock() end
    return stock[veh.id]
end

local function selectVehicle(index)
    if index < 1 or index > #VEHICLES then return end
    selected = index
    local veh = VEHICLES[selected]
    if not stock[veh.id] then captureVehicleStock(veh) end
    if stock[veh.id] then
        loadEditorFrom(mergedPresetParams(veh.id))
    else
        edit = {}
        lastError = "Could not read TweakDB record for " .. veh.name
    end
end

local function applyCurrent(reason)
    local veh = currentVeh()
    if not veh then return end
    if activeConfigReadOnly then
        configStatus = "Read-only baseline. Use Save As before editing."
        return
    end
    appliedList = {}
    lastError = ""
    local ok, err = applyToVariants(veh, edit)
    if ok then
        saved[veh.id] = copyTbl(edit)
        presetDirty = not tablesEqual(saved, diskSaved)
        countSavedVehicles()
        if autoSave then
            local savedOk, saveErr = persistActiveConfig()
            if not savedOk then
                lastError = tostring(saveErr)
                configStatus = "Auto-save failed: " .. lastError
            end
        else
            configStatus = "Unsaved changes in " .. activeConfigFile
        end
        statusMessage = (reason or "Applied") .. " " .. veh.name ..
            ". Exit and re-enter the vehicle to load changed physics."
        print("[VPC] Applied " .. veh.name)
    else
        lastError = tostring(err or "Apply failed")
        statusMessage = "Apply failed for " .. veh.name
        print("[VPC] ERROR applying " .. veh.name .. ": " .. lastError)
    end
end

local function applyGroupToAll(groupName)
    if activeConfigReadOnly then
        configStatus = "Read-only baseline. Use Save As before editing."
        return
    end
    local base = currentStock()
    if not next(base) then
        lastError = "No stock values captured yet for the selected vehicle."
        return
    end

    local directValues = {}
    for _, def in ipairs(PARAMS) do
        if def.group == groupName then
            local e = edit[def.key]
            if e ~= nil then directValues[def.key] = e end
        end
    end

    appliedList = {}
    lastError = ""
    local count = 0
    for _, other in ipairs(VEHICLES) do
        local otherStock = stock[other.id]
        if otherStock and next(otherStock) then
            local sectionParams = {}
            for key, value in pairs(directValues) do
                if otherStock[key] ~= nil then
                    sectionParams[key] = value
                end
            end

            if next(sectionParams) then
                local ok = applyToVariants(other, sectionParams)
                if ok then
                    local merged = copyTbl(otherStock)
                    for key, value in pairs(saved[other.id] or {}) do
                        merged[key] = value
                    end
                    for key, value in pairs(sectionParams) do
                        merged[key] = value
                    end
                    saved[other.id] = merged
                    count = count + 1
                end
            end
        end
    end

    presetDirty = not tablesEqual(saved, diskSaved)
    countSavedVehicles()
    if autoSave then
        local ok, err = persistActiveConfig()
        if not ok then
            lastError = tostring(err)
            configStatus = "Auto-save failed: " .. lastError
        end
    else
        configStatus = "Unsaved changes in " .. activeConfigFile
    end
    statusMessage = "Applied " .. groupName .. " values to " .. count ..
        " vehicles. Exit and re-enter a vehicle to load changed physics."
end

local function captureMissingStock()
    local changed = false
    for _, veh in ipairs(VEHICLES) do
        local _, liveParams = firstReadableId(veh)
        if liveParams then
            if not stock[veh.id] then stock[veh.id] = {} end
            if not runtimeStock[veh.id] then runtimeStock[veh.id] = {} end
            for key, value in pairs(liveParams) do
                if stock[veh.id][key] == nil then
                    stock[veh.id][key] = value
                    runtimeStock[veh.id][key] = value
                    changed = true
                end
            end
        end
    end
    if changed then persistRuntimeStock() end
end

local function applyPresetState()
    appliedList = {}
    local count = 0
    local errors = 0
    for _, veh in ipairs(VEHICLES) do
        local params = mergedPresetParams(veh.id)
        if next(params) then
            local ok, err = applyToVariants(veh, params)
            if ok then
                if saved[veh.id] then count = count + 1 end
            else
                errors = errors + 1
                lastError = tostring(err)
            end
        end
    end
    countSavedVehicles()
    statusMessage = "Loaded " .. activeConfigFile .. " (" .. vehicleCount .. " edited vehicles)."
    print("[VPC] Applied preset " .. activeConfigFile .. ": " .. count ..
        " configured vehicles, " .. errors .. " errors")
end

local function findPreset(file)
    for _, preset in ipairs(presetFiles) do
        if preset.file:lower() == tostring(file):lower() then return preset end
    end
    return nil
end

local function selectedIndexForId(vehId)
    if not vehId then return selected end
    for index, veh in ipairs(VEHICLES) do
        if veh.id == vehId then return index end
    end
    return selected
end

local function loadPreset(file, discardDirty)
    if activeConfigDirty() and not discardDirty then
        if autoSave and not activeConfigReadOnly then
            local ok, err = persistActiveConfig()
            if not ok then
                configStatus = "Could not save before switching: " .. tostring(err)
                return false
            end
        else
            configStatus = "Unsaved changes: Save or Discard before switching presets."
            return false
        end
    end

    local preset = findPreset(file)
    if not preset then
        refreshPresetFiles()
        preset = findPreset(file)
    end
    if not preset then
        configStatus = "Preset not found or invalid: " .. tostring(file)
        return false
    end

    local document
    if preset.vanilla then
        document = { selectedId = currentVeh() and currentVeh().id or nil, vehicles = {} }
    else
        document = loadJSON(preset.file)
        if not validPresetDocument(document) then
            configStatus = "Invalid preset: " .. preset.file
            return false
        end
    end

    local loadedVehicles = copyVehicleMap(document and document.vehicles or {})
    migrateLegacyKeys(loadedVehicles)
    migrateParamKeys(loadedVehicles)
    addPresetVehiclesToRoster(loadedVehicles)
    captureMissingStock()

    activeConfigFile = preset.file
    activeConfigReadOnly = preset.readOnly
    saved = loadedVehicles
    diskSaved = copyVehicleMap(loadedVehicles)
    presetDirty = false
    selected = selectedIndexForId(document and document.selectedId or nil)
    countSavedVehicles()
    applyPresetState()
    selectVehicle(selected)
    configStatus = "Loaded " .. preset.label .. (preset.readOnly and " (read-only)" or "")
    persistMetadata()
    return true
end

local function discardActiveChanges()
    return loadPreset(activeConfigFile, true)
end

local function normalizedSaveAsFilename(raw)
    if type(raw) ~= "string" then return nil end
    local name = raw:match("^%s*(.-)%s*$")
    if name == "" or name:find("..", 1, true) or
        name:find("/", 1, true) or name:find("\\", 1, true) then return nil end
    if not name:lower():match("%.json$") then name = name .. ".json" end
    if not name:lower():match("^config") then name = "config_" .. name end
    return safeConfigFilename(name)
end

local function saveAsPreset(rawName)
    local filename = normalizedSaveAsFilename(rawName)
    if not filename then
        configStatus = "Use a simple config name without folders or '..'."
        return false
    end
    if filename:lower() == BASE_CONFIG_FILE or filename:lower() == STOCK_FILE then
        configStatus = "That filename is reserved for a read-only baseline."
        return false
    end
    if fileExists(filename) then
        configStatus = filename .. " already exists. Select it and use Save."
        return false
    end

    local previousFile = activeConfigFile
    local previousReadOnly = activeConfigReadOnly
    activeConfigFile = filename
    activeConfigReadOnly = false
    local ok, err = persistActiveConfig()
    if not ok then
        activeConfigFile = previousFile
        activeConfigReadOnly = previousReadOnly
        configStatus = "Save As failed: " .. tostring(err)
        return false
    end
    refreshPresetFiles()
    persistMetadata()
    configStatus = "Created and selected " .. filename
    return true
end

local function normalizeRecordName(raw)
    if not raw or raw == "" then return nil end
    raw = tostring(raw)
    if not raw:find("Vehicle%.") then
        raw = "Vehicle." .. raw
    end
    return raw
end

local function mountedRecordName()
    local ok, name = pcall(function()
        local player = Game.GetPlayer()
        if not player then return nil end
        local veh = player:GetMountedVehicle()
        if not veh then return nil end
        local rid = veh:GetRecordID()
        if rid and rid.value and rid.value ~= "" then
            return normalizeRecordName(rid.value)
        end
        return normalizeRecordName(TDBID.ToStringDEBUG(rid))
    end)
    if ok then return name end
    return nil
end

local function recycleLastVehicle()
    if pendingRespawn then
        statusMessage = "A vehicle recycle is already in progress."
        return
    end

    local currentlyMounted = mountedRecordName()
    if currentlyMounted then
        lastMountedRecordName = currentlyMounted
        statusMessage = "Exit the vehicle, then click recycle again."
        return
    end

    local recordName = lastMountedRecordName
    if not recordName then
        statusMessage = "No previously mounted vehicle has been detected this session."
        return
    end

    local isBike = recordName:lower():find("v_sportbike", 1, true) ~= nil
    local vehicleType = isBike and "Bike" or "Car"
    local ok, err = pcall(function()
        local garageID = GetSingleton("vehicleGarageVehicleID"):Resolve(recordName)
        if not garageID then error("Could not resolve GarageVehicleID") end
        Game.GetVehicleSystem():DespawnPlayerVehicle(garageID)
    end)

    if not ok then
        lastError = "Recycle despawn failed: " .. tostring(err)
        statusMessage = "Could not despawn the last mounted vehicle."
        print("[VPC] " .. lastError)
        return
    end

    pendingRespawn = {
        delay = 1.25,
        recordName = recordName,
        vehicleType = vehicleType,
        attempts = 0,
    }
    lastError = ""
    statusMessage = "Despawn requested; waiting to respawn " .. recordName .. "..."
end

local function updatePendingRespawn(deltaTime)
    if not pendingRespawn then return end
    pendingRespawn.delay = pendingRespawn.delay - deltaTime
    if pendingRespawn.delay > 0 then return end

    local request = pendingRespawn
    request.attempts = request.attempts + 1
    local ok, spawnedOrErr = pcall(function()
        return Game.GetVehicleSystem():SpawnPlayerVehicle(
            request.vehicleType,
            TweakDBID.new(request.recordName),
            false
        )
    end)

    if ok and spawnedOrErr ~= false then
        pendingRespawn = nil
        statusMessage = "Respawn requested for " .. request.recordName .. "."
        print("[VPC] Recycled " .. request.recordName)
    elseif request.attempts < 3 then
        request.delay = 0.75
        statusMessage = "Respawn not ready; retrying (" .. request.attempts .. "/3)..."
    else
        pendingRespawn = nil
        lastError = "Recycle respawn failed: " .. tostring(spawnedOrErr)
        statusMessage = "Automatic respawn failed. Use the normal vehicle summon."
        print("[VPC] " .. lastError)
    end
end

local function recordMatches(mounted, listed)
    if not mounted or not listed then return false end
    mounted = mounted:lower()
    listed = listed:lower()
    if mounted == listed then return true end
    local m = mounted:gsub("^vehicle%.", "")
    local l = listed:gsub("^vehicle%.", "")
    if m == l then return true end
    if m:sub(1, #l) == l then
        local rest = m:sub(#l + 1)
        return rest == "" or rest:sub(1, 1) == "_"
    end
    return false
end

local function selectMounted(silent)
    local mounted = mountedRecordName()
    if not mounted then
        if not silent then statusMessage = "You are not in a vehicle." end
        return false
    end

    local function selectMatch(index, veh)
        selectVehicle(index)
        statusMessage = "Selected " .. veh.name .. " from your current vehicle."
        return true
    end

    -- Prefer an exact player-record match so named variants do not collapse
    -- into an earlier base model that happens to share the same ID prefix.
    for i, veh in ipairs(VEHICLES) do
        for _, id in ipairs(candidateIds(veh)) do
            if mounted:lower() == id:lower() then
                return selectMatch(i, veh)
            end
        end
    end

    -- Cosmetic/configuration records (notably Muramasa) may only share a
    -- prefix with the physics entry represented in this UI.
    for i, veh in ipairs(VEHICLES) do
        for _, id in ipairs(candidateIds(veh)) do
            if recordMatches(mounted, id) then
                return selectMatch(i, veh)
            end
        end
    end

    -- A mounted record is the final authority. This also supports a new game
    -- record or a custom vehicle that is absent from the official garage list.
    local mountedVehicle = {
        id = mounted,
        name = friendlyVehicleName(mounted),
        class = mounted:lower():find("sportbike", 1, true) and "Bike" or "Mounted Vehicle",
    }
    local _, params = firstReadableId(mountedVehicle)
    if params and next(params) then
        table.insert(VEHICLES, mountedVehicle)
        captureVehicleStock(mountedVehicle)
        return selectMatch(#VEHICLES, mountedVehicle)
    end

    if not silent then statusMessage = "Mounted vehicle is not in the list: " .. mounted end
    return false
end

local function sliderRange(def)
    -- Fixed per-parameter limits: every vehicle gets exactly the same range.
    return def.absMin, def.absMax
end

local function isChanged(key)
    local s = currentStock()[key]
    local e = edit[key]
    if s == nil or e == nil then return false end
    if type(s) == "number" and type(e) == "number" then
        return math.abs(s - e) > 0.001
    end
    return s ~= e
end

local function isUnsaved(key)
    local veh = currentVeh()
    if not veh then return false end
    local diskValue = nil
    if diskSaved[veh.id] and diskSaved[veh.id][key] ~= nil then
        diskValue = diskSaved[veh.id][key]
    elseif stock[veh.id] then
        diskValue = stock[veh.id][key]
    end
    local value = edit[key]
    if type(value) == "number" and type(diskValue) == "number" then
        return math.abs(value - diskValue) > 0.001
    end
    return value ~= diskValue
end

local function resetParam(key)
    local s = currentStock()[key]
    if s == nil then return end
    edit[key] = s
    applyCurrent("Reset " .. key)
end

local function drawGroup(groupName)
    ImGui.PushStyleColor(ImGuiCol.Header, 0.10, 0.42, 0.66, 1.0)
    ImGui.PushStyleColor(ImGuiCol.HeaderHovered, 0.14, 0.50, 0.76, 1.0)
    ImGui.PushStyleColor(ImGuiCol.HeaderActive, 0.08, 0.36, 0.58, 1.0)
    local open = ImGui.CollapsingHeader(groupName, ImGuiTreeNodeFlags.DefaultOpen)
    ImGui.PopStyleColor(3)
    if not open then return end

    local stockVals = currentStock()
    local width = ImGui.GetWindowContentRegionWidth()
    local labelW = width * 0.5
    local gap = 8
    local padX, padY = 10, 4
    local textW = ImGui.CalcTextSize("Reset")
    local resetW = textW + padX * 2
    local sliderW = math.max(40, width * 0.5 - gap - resetW)
    if activeConfigReadOnly then ImGui.BeginDisabled() end

    for _, def in ipairs(PARAMS) do
        if def.group == groupName then
            if edit[def.key] == nil then
                ImGui.TextDisabled(def.label .. "  (not on this vehicle)")
            else
                local changed = isChanged(def.key)
                local unsaved = isUnsaved(def.key)
                local label = (unsaved and "! " or "") .. (changed and "* " or "") .. def.label
                if unsaved then
                    ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.67, 0.15, 1.0)
                    ImGui.PushStyleColor(ImGuiCol.SliderGrab, 1.0, 0.55, 0.10, 1.0)
                elseif changed then
                    ImGui.PushStyleColor(ImGuiCol.Text, 0.25, 1.0, 0.55, 1.0)
                    ImGui.PushStyleColor(ImGuiCol.SliderGrab, 0.20, 0.90, 0.45, 1.0)
                end

                ImGui.AlignTextToFramePadding()
                ImGui.Text(label)

                ImGui.SameLine(labelW)
                local value, used
                if def.type == "bool" then
                    value, used = ImGui.Checkbox("##sl_" .. def.key, edit[def.key])
                else
                    local lo, hi = sliderRange(def)
                    ImGui.PushItemWidth(sliderW)
                    value, used = ImGui.SliderFloat("##sl_" .. def.key, edit[def.key], lo, hi, def.fmt)
                    ImGui.PopItemWidth()
                end
                if used then
                    edit[def.key] = value
                end
                if ImGui.IsItemDeactivatedAfterEdit() then
                    applyCurrent("Auto-applied")
                end
                if unsaved or changed then ImGui.PopStyleColor(2) end

                ImGui.SameLine(labelW + sliderW + gap)
                local canReset = stockVals[def.key] ~= nil
                if not canReset then ImGui.BeginDisabled() end
                ImGui.PushStyleVar(ImGuiStyleVar.FramePadding, padX, padY)
                if ImGui.Button("Reset###rst_" .. def.key, resetW, 0) then
                    resetParam(def.key)
                end
                ImGui.PopStyleVar()
                if ImGui.IsItemHovered() then
                    ImGui.SetTooltip("Reset to vanilla")
                end
                if not canReset then ImGui.EndDisabled() end
            end
        end
    end

    if groupName == "SPEED-SENSITIVE STEERING" then
        ImGui.Spacing()
        -- if ImGui.Button("APPLY THIS SECTION TO ALL VEHICLES###apply_all_" .. groupName, width, 28) then
        --     applyGroupToAll(groupName)
        -- end
        if ImGui.IsItemHovered() then
            ImGui.SetTooltip("Copy this section's exact absolute values; other tuned sections are preserved.")
        end
    end
    if activeConfigReadOnly then ImGui.EndDisabled() end
end

local function pushWindowStyle()
    ImGui.PushStyleColor(ImGuiCol.WindowBg, 0.05, 0.06, 0.08, 0.96)
    ImGui.PushStyleColor(ImGuiCol.TitleBg, 0.08, 0.10, 0.14, 1.0)
    ImGui.PushStyleColor(ImGuiCol.TitleBgActive, 0.10, 0.16, 0.22, 1.0)
    ImGui.PushStyleColor(ImGuiCol.FrameBg, 0.12, 0.16, 0.22, 1.0)
    ImGui.PushStyleColor(ImGuiCol.FrameBgHovered, 0.16, 0.22, 0.30, 1.0)
    ImGui.PushStyleColor(ImGuiCol.FrameBgActive, 0.18, 0.28, 0.38, 1.0)
    ImGui.PushStyleColor(ImGuiCol.SliderGrab, 0.20, 0.62, 0.92, 1.0)
    ImGui.PushStyleColor(ImGuiCol.SliderGrabActive, 0.30, 0.75, 1.0, 1.0)
    ImGui.PushStyleColor(ImGuiCol.Button, 0.10, 0.18, 0.16, 1.0)
    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.14, 0.32, 0.22, 1.0)
    ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.08, 0.40, 0.22, 1.0)
    ImGui.PushStyleColor(ImGuiCol.CheckMark, 0.25, 1.0, 0.55, 1.0)
    ImGui.PushStyleVar(ImGuiStyleVar.FrameRounding, 3)
    ImGui.PushStyleVar(ImGuiStyleVar.GrabRounding, 3)
end

local function popWindowStyle()
    ImGui.PopStyleVar(2)
    ImGui.PopStyleColor(12)
end

local function drawConfigPanel()
    ImGui.TextDisabled("CONFIG")
    ImGui.SetNextItemWidth(ImGui.GetWindowContentRegionWidth())
    local activePreset = findPreset(activeConfigFile)
    local presetLabel = activePreset and activePreset.label or activeConfigFile
    if activeConfigReadOnly then presetLabel = presetLabel .. " [READ ONLY]" end
    if ImGui.BeginCombo("##active_config", presetLabel, ImGuiComboFlags.HeightLargest) then
        for _, preset in ipairs(presetFiles) do
            local isActive = preset.file:lower() == activeConfigFile:lower()
            local label = (isActive and "> " or "") .. preset.label ..
                (preset.readOnly and " [READ ONLY]" or "")
            if ImGui.Selectable(label, false) and not isActive then
                loadPreset(preset.file, false)
            end
        end
        ImGui.EndCombo()
    end

    if activeConfigReadOnly then ImGui.BeginDisabled() end
    if ImGui.Button("Save", 100, 0) then
        local ok, err = persistActiveConfig()
        if not ok then configStatus = tostring(err) end
    end
    if activeConfigReadOnly then ImGui.EndDisabled() end
    ImGui.SameLine()
    local wasDirty = activeConfigDirty()
    if not wasDirty then ImGui.BeginDisabled() end
    if ImGui.Button("Discard", 100, 0) then discardActiveChanges() end
    if not wasDirty then ImGui.EndDisabled() end
    ImGui.SameLine()
    local autoValue, autoChanged = ImGui.Checkbox("Auto-save", autoSave)
    if autoChanged then
        autoSave = autoValue
        if autoSave and activeConfigDirty() and not activeConfigReadOnly then
            local ok, err = persistActiveConfig()
            if not ok then configStatus = tostring(err) end
        else
            persistMetadata()
            configStatus = autoSave and "Auto-save enabled" or "Auto-save disabled"
        end
    end

    ImGui.SetNextItemWidth(ImGui.GetWindowContentRegionWidth() - 115)
    saveAsName = ImGui.InputText("##save_as_name", saveAsName, 96)
    ImGui.SameLine()
    if ImGui.Button("Save As", 105, 0) then saveAsPreset(saveAsName) end

    if activeConfigReadOnly then
        ImGui.PushStyleColor(ImGuiCol.Text, 0.55, 0.75, 1.0, 1.0)
        ImGui.Text("READ ONLY: use Save As to create an editable preset.")
        ImGui.PopStyleColor()
    elseif activeConfigDirty() then
        ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.67, 0.15, 1.0)
        ImGui.Text("UNSAVED CHANGES")
        ImGui.PopStyleColor()
    else
        ImGui.PushStyleColor(ImGuiCol.Text, 0.25, 1.0, 0.55, 1.0)
        ImGui.Text("SAVED")
        ImGui.PopStyleColor()
    end
    ImGui.Text("Vehicles edited in this preset: " .. tostring(vehicleCount))
    ImGui.TextWrapped(configStatus)
    ImGui.TextDisabled("* green = differs from vanilla    ! amber = not saved to this preset")
end

local function drawVehiclePanel()
    local veh = currentVeh()
    local preview = veh and (veh.name .. " [" .. veh.class .. "]") or "Select vehicle"

    ImGui.TextDisabled("VEHICLE TO EDIT")
    ImGui.SetNextItemWidth(ImGui.GetWindowContentRegionWidth())
    if ImGui.BeginCombo("##vehicle", preview, ImGuiComboFlags.HeightLargest) then
        local lastClass = nil
        for i, v in ipairs(VEHICLES) do
            if v.class ~= lastClass then
                ImGui.Separator()
                ImGui.TextDisabled(v.class)
                lastClass = v.class
            end
            local isActive = i == selected
            local label = (isActive and "> " or "") .. v.name .. " [" .. v.class .. "]"
            if ImGui.Selectable(label, false) and not isActive then selectVehicle(i) end
        end
        ImGui.EndCombo()
    end

    if ImGui.Button("Use current vehicle", 180, 0) then selectMounted() end
    ImGui.SameLine()
    if pendingRespawn then ImGui.BeginDisabled() end
    if ImGui.Button("Recycle last vehicle (exit first)", ImGui.GetContentRegionAvail(), 0) then
        recycleLastVehicle()
    end
    if pendingRespawn then ImGui.EndDisabled() end

    ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.78, 0.20, 1.0)
    ImGui.TextWrapped("Exit and get back into the vehicle to load changed physics. Recycle is an optional shortcut after exiting.")
    ImGui.PopStyleColor()
    if veh and saved[veh.id] then
        ImGui.Text("Preset contains values for " .. veh.name .. ".")
    elseif veh then
        ImGui.Text("This vehicle currently uses the selected baseline.")
    end
    ImGui.TextWrapped(statusMessage)
end

local function drawUI()
    ImGui.SetNextWindowSize(720, 820, ImGuiCond.FirstUseEver)
    pushWindowStyle()
    local ok, err = pcall(function()
    if ImGui.Begin("Ultimate Vehicle Tuning") then
        if not tdbReady then
            ImGui.TextWrapped("Waiting for TweakDB... reload CET mods after the session has started.")
        else
            ImGui.Separator()
            drawConfigPanel()
            ImGui.Separator()
            drawVehiclePanel()

            if lastError ~= "" then
                ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.25, 0.15, 1.0)
                ImGui.TextWrapped(lastError)
                ImGui.PopStyleColor()
            end

            ImGui.Separator()
            local advancedGroup = false
            for _, group in ipairs(GROUPS) do
                if group == "WHEEL CONTACT MODEL" then
                    ImGui.Separator()
                    local advancedValue, advancedChanged = ImGui.Checkbox("Show advanced", showAdvanced)
                    if advancedChanged then showAdvanced = advancedValue end
                    ImGui.Separator()
                    advancedGroup = true
                end
                if not advancedGroup or showAdvanced then
                    drawGroup(group)
                end
            end

            if #appliedList > 0 then
                ImGui.Separator()
                if ImGui.CollapsingHeader("Apply log") then
                    for _, entry in ipairs(appliedList) do
                        if entry:find("%[OK%]") then
                            ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.53, 1.0)
                            ImGui.Text(entry)
                            ImGui.PopStyleColor()
                        elseif entry:find("%[MISS%]") then
                            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.3, 0.3, 1.0)
                            ImGui.Text(entry)
                            ImGui.PopStyleColor()
                        else
                            ImGui.Text(entry)
                        end
                    end
                end
            end
        end
    end
    end)
    ImGui.End()
    popWindowStyle()
    if not ok then error(err) end
end

registerForEvent("onInit", function()
    discoverOfficialVehicles()

    vanillaStock = loadJSON(STOCK_FILE) or {}
    runtimeStock = loadJSON(RUNTIME_STOCK_FILE) or {}
    migrateLegacyKeys(vanillaStock)
    migrateLegacyKeys(runtimeStock)
    migrateParamKeys(vanillaStock)
    migrateParamKeys(runtimeStock)
    stock = copyVehicleMap(vanillaStock)
    for vehId, params in pairs(runtimeStock) do
        stock[vehId] = stock[vehId] or {}
        for key, value in pairs(params) do
            if stock[vehId][key] == nil then stock[vehId][key] = value end
        end
    end
    addPresetVehiclesToRoster(runtimeStock)

    local loadedMetadata = loadJSON(METADATA_FILE)
    if type(loadedMetadata) == "table" then
        metadata = loadedMetadata
        if type(metadata.autoSave) == "boolean" then autoSave = metadata.autoSave end
        if type(metadata.activeConfig) == "string" then
            activeConfigFile = metadata.activeConfig
        end
        if type(metadata.presetIndex) ~= "table" then metadata.presetIndex = {} end
    end

    if not fileExists(DEFAULT_CONFIG_FILE) then
        saveJSON(DEFAULT_CONFIG_FILE, {
            selectedId = VEHICLES[selected] and VEHICLES[selected].id or nil,
            vehicles = {},
        })
    end

    refreshPresetFiles()
    if not findPreset(activeConfigFile) then
        activeConfigFile = DEFAULT_CONFIG_FILE
        if not findPreset(activeConfigFile) then
            activeConfigFile = BASE_CONFIG_FILE
        end
        if not findPreset(activeConfigFile) then
            activeConfigFile = STOCK_FILE
        end
    end

    if not loadPreset(activeConfigFile, true) then
        saved = {}
        diskSaved = {}
        activeConfigFile = STOCK_FILE
        activeConfigReadOnly = true
        captureMissingStock()
        applyPresetState()
        selectVehicle(selected)
        configStatus = "Loaded vanilla fallback (read-only)"
    end

    tdbReady = true
    print("[UltimateVehicleTuning] CET UI ready. Open the overlay to tune vehicles.")
end)

registerForEvent("onOverlayOpen", function()
    showOverlay = true
    if tdbReady then selectMounted(true) end
end)
registerForEvent("onOverlayClose", function() showOverlay = false end)

registerForEvent("onUpdate", function(deltaTime)
    local mounted = mountedRecordName()
    if mounted then lastMountedRecordName = mounted end
    updatePendingRespawn(deltaTime)
end)

registerForEvent("onDraw", function()
    if not showOverlay then return end
    local ok, err = pcall(drawUI)
    if not ok then
        lastError = tostring(err)
        print("[VPC] UI error: " .. lastError)
    end
end)
