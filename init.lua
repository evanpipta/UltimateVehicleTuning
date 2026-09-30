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
    -- The shared parent is not summonable, so use one concrete configuration
    -- when testing it through the panel.
    {
        id = "Vehicle.v_sportbike1_yaiba_muramasa_player",
        spawnId = "Vehicle.v_sportbike1_yaiba_muramasa_regular",
        name = "Yaiba ASM-R250 Muramasa",
        class = "Bike",
    },
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

local VEHICLE_CLASS_ORDER = {
    Hypercar = 1,
    Sport = 2,
    Truck = 3,
    Luxury = 4,
    Economy = 5,
    Bike = 6,
    ["Additional Player Vehicles"] = 7,
}

local function vehicleFamilyId(id)
    return tostring(id or ""):lower():gsub("_player.*$", "")
end

local function classifyPlayerVehicle(id)
    local target = vehicleFamilyId(id)
    local bestClass, bestLength = nil, 0

    -- Prefer the longest family represented by the curated roster. This makes
    -- newly discovered cosmetic, quest, and expansion variants inherit the
    -- same class as their known model without maintaining every record ID.
    for _, known in ipairs(VEHICLES) do
        if known.class ~= "Additional Player Vehicles" then
            local family = vehicleFamilyId(known.id)
            if #family > bestLength and
                (target == family or target:sub(1, #family + 1) == family .. "_") then
                bestClass = known.class
                bestLength = #family
            end
        end
    end
    if bestClass then return bestClass end

    if target:find("sportbike", 1, true) then return "Bike" end
    if target:find("colby_nomad", 1, true) or target:find("colby_pickup", 1, true) then
        return "Truck"
    end
    if target:find("^vehicle%.v_utility") or target:find("^vehicle%.v_standard3") then
        return "Truck"
    end
    if target:find("^vehicle%.v_sport") then return "Sport" end
    if target:find("^vehicle%.v_standard") then return "Economy" end
    return "Additional Player Vehicles"
end

local function sortVehicleRosterByClass()
    for index, veh in ipairs(VEHICLES) do
        if not veh._rosterOrder then veh._rosterOrder = index end
    end
    table.sort(VEHICLES, function(a, b)
        local aRank = VEHICLE_CLASS_ORDER[a.class] or 99
        local bRank = VEHICLE_CLASS_ORDER[b.class] or 99
        if aRank ~= bRank then return aRank < bRank end
        local aName = tostring(a.name or a.id):lower()
        local bName = tostring(b.name or b.id):lower()
        if aName ~= bName then return aName < bName end
        return tostring(a.id):lower() < tostring(b.id):lower()
    end)
end

local function discoverOfficialVehicles()
    local byId = {}
    for index, veh in ipairs(VEHICLES) do
        veh._rosterOrder = index
        byId[veh.id:lower()] = veh
    end

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
                class = classifyPlayerVehicle(id),
                _rosterOrder = #VEHICLES + 1,
            }
            table.insert(VEHICLES, veh)
            byId[id:lower()] = veh
            added = added + 1
        end
    end
    sortVehicleRosterByClass()
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
    { key = "max_torque",         group = "ENGINE & GEARING",   label = "Max Torque",       fmt = "%.0f Nm",  absMin = 0,     absMax = 10000 },
    { key = "resistance_torque",  group = "ENGINE & GEARING",   label = "Resistance",       fmt = "%.0f Nm",  absMin = 0,     absMax = 800 },
    { key = "max_rpm",            group = "ENGINE & GEARING",   label = "Max RPM",          fmt = "%.0f",     absMin = 2000,  absMax = 16000 },
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
    { key = "engine_min_rpm", group = "ENGINE & GEARING", label = "Minimum RPM", fmt = "%.0f", absMin = 0, absMax = 10000 },
    { key = "gear_change_time", group = "ENGINE & GEARING", label = "Gear Change Time", fmt = "%.3f s", absMin = 0, absMax = 5 },
    { key = "wheel_resistance_ratio", group = "ENGINE & GEARING", label = "Wheels Resistance Ratio", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "gear_change_cooldown", group = "ENGINE & GEARING", label = "Gear Change Cooldown", fmt = "%.3f s", absMin = 0, absMax = 10 },
    { key = "final_gear_torque_decay", group = "ENGINE & GEARING", label = "Final-Gear Torque Decimation", fmt = "%.2f", absMin = 0, absMax = 10 },
    { key = "flywheel_inertia", group = "ENGINE & GEARING", label = "Flywheel Inertia", fmt = "%.2f", absMin = 0, absMax = 100 },
    { key = "reverse_direction_delay", group = "ENGINE & GEARING", label = "Reverse Direction Delay", fmt = "%.3f s", absMin = 0, absMax = 10 },
    { key = "fast_r1_change", group = "ENGINE & GEARING", label = "Fast Reverse/First-Gear Change", type = "bool" },
    { key = "force_reverse_min_rpm", group = "ENGINE & GEARING", label = "Force Reverse RPM to Minimum", type = "bool" },
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
    { key = "bike_tilt_speed", group = "BIKE DYNAMICS", label = "Tilt Speed", fmt = "%.2f", absMin = 0, absMax = 200 },
    { key = "bike_tilt_return_speed", group = "BIKE DYNAMICS", label = "Tilt Return Speed", fmt = "%.2f", absMin = 0, absMax = 200 },
    { key = "bike_tilt_custom_speed", group = "BIKE DYNAMICS", label = "Custom Tilt Speed", fmt = "%.2f", absMin = 0, absMax = 200 },
    { key = "bike_max_tilt", group = "BIKE DYNAMICS", label = "Maximum Tilt", fmt = "%.1f deg", absMin = 0, absMax = 90 },
    { key = "bike_max_com_long", group = "BIKE DYNAMICS", label = "Maximum COM Longitudinal Offset", fmt = "%.3f m", absMin = -3, absMax = 3 },
    { key = "bike_min_com_long", group = "BIKE DYNAMICS", label = "Minimum COM Longitudinal Offset", fmt = "%.3f m", absMin = -3, absMax = 3 },
    { key = "bike_com_damping", group = "BIKE DYNAMICS", label = "COM Offset Damping", fmt = "%.2f", absMin = 0, absMax = 20 },
    { key = "bike_tilt_pid_p", group = "BIKE DYNAMICS", label = "Tilt PID Proportional", fmt = "%.3f", absMin = 0, absMax = 20 },
    { key = "bike_tilt_pid_i", group = "BIKE DYNAMICS", label = "Tilt PID Integral", fmt = "%.3f", absMin = 0, absMax = 10 },
    { key = "bike_tilt_pid_d", group = "BIKE DYNAMICS", label = "Tilt PID Derivative", fmt = "%.3f", absMin = -10, absMax = 20 },
}

for gear = 1, 8 do
    local gearLabel = gear == 1 and "Gear 1 (Reverse)" or ("Gear " .. gear)
    table.insert(PARAMS, { key = "gear_" .. gear .. "_min_speed", group = "INDIVIDUAL GEARS", label = gearLabel .. " Minimum Speed", fmt = "%.1f m/s", absMin = -50, absMax = 300 })
    table.insert(PARAMS, { key = "gear_" .. gear .. "_max_speed", group = "INDIVIDUAL GEARS", label = gearLabel .. " Maximum Speed", fmt = "%.1f m/s", absMin = 0, absMax = 400 })
    table.insert(PARAMS, { key = "gear_" .. gear .. "_min_rpm", group = "INDIVIDUAL GEARS", label = gearLabel .. " Minimum RPM", fmt = "%.0f", absMin = 0, absMax = 20000 })
    table.insert(PARAMS, { key = "gear_" .. gear .. "_max_rpm", group = "INDIVIDUAL GEARS", label = gearLabel .. " Maximum RPM", fmt = "%.0f", absMin = 0, absMax = 25000 })
    table.insert(PARAMS, { key = "gear_" .. gear .. "_torque", group = "INDIVIDUAL GEARS", label = gearLabel .. " Torque Multiplier", fmt = "%.2f x", absMin = 0, absMax = 10 })
end

local GROUPS = {
    "MASS & DYNAMICS",
    "CENTER OF MASS & BODY ROTATION",
    "ENGINE & GEARING",
    "SUSPENSION // FRONT",
    "SUSPENSION // REAR",
    "TIRES",
    "FRICTION MAP",
    "STEERING",
    "SPEED-SENSITIVE STEERING",
    "GRIP & SLIP MODEL",
    "ROTATION & DRIFT LIMITER",
    "BRAKING",
    "WHEEL CONTACT MODEL",
    "ADVANCED SUSPENSION // FRONT",
    "ADVANCED SUSPENSION // REAR",
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

UVT = UVT or {}
UVT.frictionMaps = {}

UVT.discoverFrictionMaps = function()
    UVT.frictionMaps = {}
    local seen = {}
    local ok, records = pcall(function()
        return TweakDB:GetRecords("gamedataVehicleWheelsFrictionMap_Record")
    end)
    if ok and type(records) == "table" then
        for _, record in ipairs(records) do
            local idOk, mapId = pcall(function()
                return vehicleIdString(record:GetID())
            end)
            local family = type(mapId) == "string" and
                (mapId:find("^BikeDrivingFrictionMap%.") and "Bike maps" or
                (mapId:find("^CarDrivingFrictionMap%.") and "Car maps" or nil)) or nil
            if idOk and type(mapId) == "string" and mapId ~= "" and
                family and not mapId:find("<TDBID:", 1, true) and not seen[mapId] then
                seen[mapId] = true
                table.insert(UVT.frictionMaps, {
                    id = mapId,
                    family = family,
                })
            end
        end
    end
    table.sort(UVT.frictionMaps, function(a, b)
        if a.family ~= b.family then return a.family < b.family end
        return a.id:lower() < b.id:lower()
    end)
    print("[UltimateVehicleTuning] Discovered " .. #UVT.frictionMaps ..
        " wheel friction maps.")
end

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
local ARRAY_DM = {
    bikeTiltPID = { "bike_tilt_pid_p", "bike_tilt_pid_i", "bike_tilt_pid_d" },
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
local easyGearing = {
    advanced = false,
    stopwatchOpen = false,
    finalDrive = 1.0,
    torqueDecay = 1.0,
    finalDriveKey = "easy_final_drive",
    torqueDecayKey = "easy_torque_decay",
    versionKey = "easy_gearing_version",
    baseline = {},
}
local selected = 1
local edit = {}
local stock = {}
local saved = {}
local diskSaved = {}
local lastError = ""
local appliedList = {}
local statusMessage = "Open this window in the CET overlay to tune vehicles."
local configStatus = "Loading vehicle tunes..."
local tdbReady = false
local GEAR_DEBUG_LOG = "UltimateVehicleTuning.log"
local gearRecordWriters = {}
local pendingRespawn = nil
local lastMountedRecordName = nil
local autoSave = false
local activeTuneId = "vanilla"
local activeTunePath = nil
local activeTuneReadOnly = true
local presetDirty = false
local tuneFiles = {}
local saveAsName = "my_tune.json"
local copyTuneState = { name = "copied_tune.json", targetIndex = nil }
local pendingDeleteTuneId = nil
local metadata = { version = 2, autoSave = false, autoSaveExplicit = false, vehicles = {} }
local gameSessionActive = false
local loadingTunesApplied = false
local loadingMountedTuneApplied = false
local genericTrafficDefaults = {}
local genericTrafficBaselines = {}
local resetAccelerationTimer
local selectMounted
local accelerationTimer = {
    active = false,
    started = false,
    elapsed = 0,
    speedMps = 0,
    topSpeedMps = 0,
    previousSpeedKph = 0,
    times = {},
    status = "Ready",
    vehicleId = nil,
    mountedVehicleId = nil,
    tuneId = nil,
    observedMountedVehicleId = nil,
    lastVehicle = nil,
    lastPosition = nil,
}

local TUNES_ROOT = "tunes"
local VANILLA_TUNE = "vanilla"
local MODDED_DEFAULT_TUNE = "modded_default"
local TRAFFIC_VEHICLE_LOG = "UltimateVehicleTuning_TrafficVehicles.log"
local ACCELERATION_RESULTS_FILE = "acceleration_results.json"
-- Authoring switch: allow Modded default tunes to be edited and saved in-game.
local MODDED_DEFAULT_EDITABLE = false
-- Public feature switch for the in-game acceleration stopwatch.
local ACCELERATION_TIMER_ENABLED = true
-- Developer switch: write completed stopwatch runs to acceleration_results.json.
local DEV_SAVE_ACCELERATION_RESULTS = false
local ACCELERATION_CHECKPOINTS_KPH = { 100, 150, 200, 300 }
local BASE_CONFIG_FILE = "config_base.json"
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

local function safeTuneFilename(name)
    if type(name) ~= "string" then return nil end
    name = name:match("^%s*(.-)%s*$")
    if name == "" or name:find("..", 1, true) or
        name:find("/", 1, true) or name:find("\\", 1, true) then return nil end
    if not name:match("^[%w _%-%.]+$") then return nil end
    if not name:lower():match("%.json$") then name = name .. ".json" end
    local lower = name:lower()
    if lower == "vanilla.json" or lower == MODDED_DEFAULT_TUNE .. ".json" then return nil end
    return name
end

local function vehicleFolderName(vehId)
    local folder = tostring(vehId or ""):gsub("[^%w%._%-]", "_")
    if folder == "" or folder == "." or folder == ".." then return nil end
    return folder
end

local function vehicleTuneDir(vehId)
    local folder = vehicleFolderName(vehId)
    if not folder then return nil end
    return TUNES_ROOT .. "/" .. folder
end

local function ensureDirectory(path)
    if type(path) ~= "string" or path == "" or path:find("..", 1, true) then return false end
    local ok, entries = pcall(function() return dir(path) end)
    if ok and type(entries) == "table" then return true end
    local command = 'mkdir "' .. path:gsub("/", "\\") .. '" >nul 2>nul'
    pcall(function() os.execute(command) end)
    ok, entries = pcall(function() return dir(path) end)
    return ok and type(entries) == "table"
end

local function ensureVehicleTuneDirectory(vehId)
    if not ensureDirectory(TUNES_ROOT) then return false end
    local path = vehicleTuneDir(vehId)
    return path ~= nil and ensureDirectory(path)
end

-- CET can read and write files in the mod sandbox, but creating a new
-- directory through os.execute is not reliable on every installation. Bundled
-- vehicles already have tune directories; dynamically discovered mod vehicles
-- do not. Fall back to a vehicle-namespaced file in the existing tunes root.
local function flatTunePrefix(vehId)
    local folder = vehicleFolderName(vehId)
    return folder and ("__custom__" .. folder .. "__") or nil
end

local function flatTunePath(vehId, filename)
    local prefix = flatTunePrefix(vehId)
    if not prefix or not filename then return nil end
    return TUNES_ROOT .. "/" .. prefix .. filename
end

local function tuneFilePath(vehId, filename)
    local tuneDir = vehicleTuneDir(vehId)
    if not tuneDir or not filename then return nil end

    local nestedPath = tuneDir .. "/" .. filename
    local fallbackPath = flatTunePath(vehId, filename)
    if fileExists(nestedPath) then return nestedPath end
    if fallbackPath and fileExists(fallbackPath) then return fallbackPath end

    local ok, entries = pcall(function() return dir(tuneDir) end)
    if ok and type(entries) == "table" then return nestedPath end
    return fallbackPath
end

local function countEditedParameters()
    local veh = VEHICLES[selected]
    if not veh then return 0 end
    local count = 0
    for key, value in pairs(saved[veh.id] or {}) do
        local vanilla = stock[veh.id] and stock[veh.id][key] or nil
        if type(value) == "number" and type(vanilla) == "number" then
            if math.abs(value - vanilla) > 0.001 then count = count + 1 end
        elseif value ~= vanilla then
            count = count + 1
        end
    end
    return count
end

local function activeTuneDirty()
    return presetDirty
end

local function persistMetadata()
    metadata.version = 2
    metadata.autoSave = autoSave
    metadata.vehicles = metadata.vehicles or {}
    return saveJSON(METADATA_FILE, metadata)
end

local function persistActiveTune()
    local veh = VEHICLES[selected]
    if not veh then return false, "No vehicle selected." end
    if activeTuneReadOnly or not activeTunePath then
        return false, "The selected tune is read-only. Use Save As to create an editable tune."
    end
    local ok, err = saveJSON(activeTunePath, {
        version = 1,
        vehicleId = veh.id,
        values = saved[veh.id] or {},
    })
    if ok then
        diskSaved = copyVehicleMap(saved)
        presetDirty = false
        configStatus = "Saved " .. activeTuneId
        persistMetadata()
        return true
    end
    return false, tostring(err or "Could not save tune")
end

local function validTuneDocument(data, vehId)
    return type(data) == "table" and data.vehicleId == vehId and type(data.values) == "table"
end

local function validPresetDocument(data)
    return type(data) == "table" and type(data.vehicles) == "table"
end

local function vehicleMetadata(vehId)
    metadata.vehicles = metadata.vehicles or {}
    local state = metadata.vehicles[vehId]
    if type(state) ~= "table" then
        state = { activeTune = VANILLA_TUNE, tuneIndex = {} }
        metadata.vehicles[vehId] = state
    end
    if type(state.tuneIndex) ~= "table" then state.tuneIndex = {} end
    if type(state.activeTune) ~= "string" then state.activeTune = VANILLA_TUNE end
    return state
end

local function refreshTuneFiles(vehId)
    local names, seen = {}, {}
    local function addName(name)
        name = safeTuneFilename(name)
        if not name then return end
        local key = name:lower()
        if not seen[key] then
            seen[key] = true
            table.insert(names, name)
        end
    end

    local state = vehicleMetadata(vehId)
    for _, name in ipairs(state.tuneIndex) do addName(name) end

    local tuneDir = vehicleTuneDir(vehId)
    local ok, entries = pcall(function() return tuneDir and dir(tuneDir) or nil end)
    if ok and type(entries) == "table" then
        for _, entry in ipairs(entries) do
            if type(entry) == "table" and (entry.type == nil or entry.type == "file") then
                addName(entry.name)
            elseif type(entry) == "string" then
                addName(entry)
            end
        end
    end

    local prefix = flatTunePrefix(vehId)
    local rootOk, rootEntries = pcall(function() return dir(TUNES_ROOT) end)
    if prefix and rootOk and type(rootEntries) == "table" then
        for _, entry in ipairs(rootEntries) do
            local entryName, isFile
            if type(entry) == "table" then
                entryName = entry.name
                isFile = entry.type == nil or entry.type == "file"
            elseif type(entry) == "string" then
                entryName = entry
                isFile = true
            end
            if isFile and type(entryName) == "string" and
                entryName:sub(1, #prefix):lower() == prefix:lower() then
                addName(entryName:sub(#prefix + 1))
            end
        end
    end

    table.sort(names, function(a, b) return a:lower() < b:lower() end)
    tuneFiles = {
        { id = VANILLA_TUNE, label = "Vanilla", readOnly = true, vanilla = true },
    }
    local defaultPath = tuneFilePath(vehId, MODDED_DEFAULT_TUNE .. ".json")
    local defaultData = defaultPath and loadJSON(defaultPath) or nil
    if validTuneDocument(defaultData, vehId) then
        table.insert(tuneFiles, {
            id = MODDED_DEFAULT_TUNE,
            file = defaultPath,
            label = "Modded default",
            readOnly = not MODDED_DEFAULT_EDITABLE,
        })
    elseif genericTrafficDefaults[vehId] then
        table.insert(tuneFiles, {
            id = MODDED_DEFAULT_TUNE,
            values = copyTbl(genericTrafficDefaults[vehId]),
            label = "Generic modded default",
            readOnly = true,
        })
    end

    local validIndex = {}
    for _, name in ipairs(names) do
        local path = tuneFilePath(vehId, name)
        local data = path and loadJSON(path) or nil
        if validTuneDocument(data, vehId) then
            table.insert(tuneFiles, {
                id = name,
                file = path,
                label = name:gsub("%.json$", ""),
                readOnly = false,
            })
            table.insert(validIndex, name)
        end
    end
    state.tuneIndex = validIndex
    return tuneFiles
end

local function findTune(tuneId)
    for _, tune in ipairs(tuneFiles) do
        if tune.id:lower() == tostring(tuneId):lower() then return tune end
    end
    return nil
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

local function arrayComponent(value, index)
    if value == nil then return nil end
    local ok, component = pcall(function() return value[index] end)
    if ok then return asNumber(component) end
    return nil
end

local function readArrayMap(recordId, map, params)
    if not recordId then return end
    for flat, keys in pairs(map) do
        local value = getRawFlat(recordId, flat)
        for index, key in ipairs(keys) do
            local component = arrayComponent(value, index)
            if component ~= nil then params[key] = component end
        end
    end
end

local function applyArrayMap(recordId, map, params)
    if not recordId then return false end
    local changed = false
    for flat, keys in pairs(map) do
        local before = getRawFlat(recordId, flat)
        local values = {}
        local complete = true
        for index, key in ipairs(keys) do
            values[index] = params[key] ~= nil and params[key] or arrayComponent(before, index)
            if values[index] == nil then complete = false end
        end
        if complete then
            TweakDB:SetFlat(TweakDBID.new(recordId, "." .. flat), values)
            table.insert(appliedList, string.format(
                "  %s: [%.3f, %.3f, %.3f] [OK]",
                flat, values[1], values[2], values[3]))
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

local function debugRecordName(recordId)
    local ok, name = pcall(function() return TDBID.ToStringDEBUG(recordId) end)
    if ok and name and name ~= "" then return tostring(name) end
    return tostring(recordId)
end

local function appendGearDebug(message)
    pcall(function()
        local file = io.open(GEAR_DEBUG_LOG, "a")
        if not file then return end
        file:write(tostring(os.date("%Y-%m-%d %H:%M:%S")), " ", tostring(message), "\n")
        file:close()
    end)
end

local function resetGearDebug()
    gearRecordWriters = {}
    pcall(function()
        local file = io.open(GEAR_DEBUG_LOG, "w")
        if not file then return end
        file:write("Ultimate Vehicle Tuning bike gear trace\n")
        file:write("Each engine contains reverse followed by its forward gears.\n")
        file:close()
    end)
end

local function isBikeRecord(vehId)
    local id = tostring(vehId or ""):lower()
    return id:find("sportbike", 1, true) ~= nil or id:find("_bike", 1, true) ~= nil
end

local function captureGearMaxSpeeds(gearIds)
    local values = {}
    for index, gearId in ipairs(gearIds or {}) do
        values[index] = getFlat(gearId, "maxSpeed")
    end
    return values
end

local function logBikeGearWrite(vehId, chain, params, before)
    if not isBikeRecord(vehId) then return end

    appendGearDebug(string.format(
        "VEHICLE %s | engine=%s | records=%d",
        tostring(vehId), debugRecordName(chain.engId), #(chain.gearIds or {})))

    for index, gearId in ipairs(chain.gearIds or {}) do
        local recordName = debugRecordName(gearId)
        local previousWriter = gearRecordWriters[recordName]
        local requested = params["gear_" .. index .. "_max_speed"]
        local after = getFlat(gearId, "maxSpeed")
        local collision = previousWriter and previousWriter ~= vehId
            and (" | PREVIOUS_WRITER=" .. previousWriter) or ""
        appendGearDebug(string.format(
            "  record[%d]=%s | maxSpeed %s -> requested %s -> live %s%s",
            index,
            recordName,
            tostring(before[index]),
            tostring(requested),
            tostring(after),
            collision))
        gearRecordWriters[recordName] = vehId
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
    local frictionMap = getRawFlat(chain.dmId, "wheelsFrictionMap")
    local frictionMapId = vehicleIdString(frictionMap)
    if frictionMapId ~= "" and not frictionMapId:find("<TDBID:", 1, true) then
        params.wheels_friction_map = frictionMapId
    end
    readVectorMap(chain.dmId, VECTOR_DM, params)
    readArrayMap(chain.dmId, ARRAY_DM, params)
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

UVT.applyFrictionMap = function(driveModelId, params)
    local target = params and params.wheels_friction_map or nil
    if not driveModelId or type(target) ~= "string" or target == "" then return false end
    local targetOk, targetRecord = pcall(function()
        return TweakDB:GetRecord(TweakDBID.new(target))
    end)
    if not targetOk or not targetRecord then
        table.insert(appliedList, "  wheelsFrictionMap: missing record " ..
            target .. " [SKIPPED]")
        return false
    end

    local flatId = TweakDBID.new(driveModelId, ".wheelsFrictionMap")
    local before = vehicleIdString(TweakDB:GetFlat(flatId))
    TweakDB:SetFlat(flatId, TweakDBID.new(target))
    local after = vehicleIdString(TweakDB:GetFlat(flatId))
    local status = after == target and "OK" or "MISS"
    table.insert(appliedList, "  wheelsFrictionMap: " .. before .. " -> " ..
        target .. " [" .. status .. "]")
    TweakDB:Update(driveModelId)
    return true
end

local function writeVehicle(vehId, params)
    local ok, err = pcall(function()
        local chain, resolveErr = resolveChain(vehId)
        if not chain then error(resolveErr or "resolve failed") end
        local gearMaxSpeedsBefore = captureGearMaxSpeeds(chain.gearIds)

        table.insert(appliedList, "--- " .. vehId .. " ---")
        table.insert(appliedList, "DM: " .. TDBID.ToStringDEBUG(chain.dmId))
        applyMap(chain.dmId, DM, params)
        UVT.applyFrictionMap(chain.dmId, params)
        applyVectorMap(chain.dmId, VECTOR_DM, params)
        applyArrayMap(chain.dmId, ARRAY_DM, params)

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

        logBikeGearWrite(vehId, chain, params, gearMaxSpeedsBefore)
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

local function resetEasyGearBaseline(storeNeutralValues)
    easyGearing.baseline = {}
    for gear = 1, 8 do
        for _, suffix in ipairs({ "min_speed", "max_speed", "min_rpm", "max_rpm", "torque" }) do
            local key = "gear_" .. gear .. "_" .. suffix
            easyGearing.baseline[key] = edit[key]
        end
    end
    easyGearing.finalDrive = 1.0
    easyGearing.torqueDecay = 1.0
    if storeNeutralValues then
        edit[easyGearing.finalDriveKey] = 1.0
        edit[easyGearing.torqueDecayKey] = 1.0
        edit[easyGearing.versionKey] = 2
    end
end

local function loadEasyGearStateFromEditor()
    local driveScale = tonumber(edit[easyGearing.finalDriveKey]) or 1.0
    local torqueDecay = tonumber(edit[easyGearing.torqueDecayKey]) or 1.0
    local gearingVersion = tonumber(edit[easyGearing.versionKey]) or 1
    if driveScale <= 0 then driveScale = 1.0 end
    if torqueDecay <= 0 then torqueDecay = 1.0 end

    easyGearing.finalDrive = driveScale
    easyGearing.torqueDecay = torqueDecay
    easyGearing.baseline = {}

    local firstCurrentTorque = nil
    for gear = 2, 8 do
        local torque = edit["gear_" .. gear .. "_torque"]
        if type(torque) == "number" and torque > 0 then
            firstCurrentTorque = torque
            break
        end
    end

    local decayExponent = math.max(0.05,
        gearingVersion >= 2 and torqueDecay / driveScale or torqueDecay * driveScale)
    local firstBaseTorque = firstCurrentTorque and firstCurrentTorque * driveScale or nil
    for gear = 1, 8 do
        local prefix = "gear_" .. gear .. "_"
        easyGearing.baseline[prefix .. "min_rpm"] = edit[prefix .. "min_rpm"]
        easyGearing.baseline[prefix .. "max_rpm"] = edit[prefix .. "max_rpm"]

        local minSpeed = edit[prefix .. "min_speed"]
        local maxSpeed = edit[prefix .. "max_speed"]
        local torque = edit[prefix .. "torque"]
        if gear == 1 then
            easyGearing.baseline[prefix .. "min_speed"] = minSpeed
            easyGearing.baseline[prefix .. "max_speed"] = maxSpeed
            easyGearing.baseline[prefix .. "torque"] = torque
        else
            easyGearing.baseline[prefix .. "min_speed"] =
                type(minSpeed) == "number" and minSpeed / driveScale or minSpeed
            easyGearing.baseline[prefix .. "max_speed"] =
                type(maxSpeed) == "number" and maxSpeed / driveScale or maxSpeed
            if firstBaseTorque and type(torque) == "number" and torque > 0 then
                easyGearing.baseline[prefix .. "torque"] = firstBaseTorque *
                    ((torque / firstCurrentTorque) ^ (1.0 / decayExponent))
            else
                easyGearing.baseline[prefix .. "torque"] = torque
            end
        end
    end
end

local function loadEditorFrom(params)
    edit = copyTbl(params)
    loadEasyGearStateFromEditor()
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
        class = classifyPlayerVehicle(vehId),
        _rosterOrder = #VEHICLES + 1,
    }
    table.insert(VEHICLES, veh)
    return #VEHICLES, veh
end

local function addPresetVehiclesToRoster(presetVehicles)
    for vehId in pairs(presetVehicles or {}) do ensureVehicleInRoster(vehId) end
end

local function addCustomTuneVehiclesToRoster()
    for vehId, state in pairs(metadata.vehicles or {}) do
        if type(state) == "table" and type(state.tuneIndex) == "table" and
            #state.tuneIndex > 0 then
            ensureVehicleInRoster(vehId)
        end
    end
end

local function captureVehicleStock(veh)
    if not veh then return nil end
    if stock[veh.id] and next(stock[veh.id]) then return stock[veh.id] end
    local _, liveParams = firstReadableId(veh)
    if not liveParams then return nil end
    stock[veh.id] = copyTbl(liveParams)
    return stock[veh.id]
end

local function isLikelyTrafficVehicleRecord(vehId)
    if type(vehId) ~= "string" then return false end
    local lower = vehId:lower()
    if lower:find("_player", 1, true) or lower:find("bike", 1, true) then return false end
    local roadClass = lower:find("^vehicle%.v_standard") or
        lower:find("^vehicle%.v_sport") or lower:find("^vehicle%.v_utility") or
        lower:find("^vehicle%.ncpd_")
    if not roadClass then return false end
    return getRecord(vehId) ~= nil
end

local function exactVehicleInRoster(vehId)
    for index, veh in ipairs(VEHICLES) do
        for _, id in ipairs(candidateIds(veh)) do
            if id:lower() == vehId:lower() then return index, veh end
        end
    end
    return nil, nil
end

local function registerGenericTrafficVehicle(vehId)
    if not isLikelyTrafficVehicleRecord(vehId) then return nil, nil end
    local index, veh = exactVehicleInRoster(vehId)
    if not veh then
        index, veh = ensureVehicleInRoster(vehId)
        if veh then
            veh.class = "Generic Traffic Vehicles"
            veh.hidden = true
            veh.genericTraffic = true
        end
    end
    return index, veh
end

local function removeLegacyGenericTrafficMetadata()
    for vehId in pairs(metadata.genericTrafficVehicles or {}) do
        local _, knownVehicle = exactVehicleInRoster(vehId)
        if not knownVehicle and type(metadata.vehicles) == "table" then
            metadata.vehicles[vehId] = nil
        end
    end
    metadata.genericTrafficVehicles = nil
end

local function genericTrafficTuneValues(baseline)
    local values = {}
    local function setIfPresent(key, value)
        if baseline[key] ~= nil then values[key] = value end
    end
    local function setHalvedAndClamped(key)
        if type(baseline[key]) == "number" then
            values[key] = math.max(0.08, math.min(0.15, baseline[key] * 0.5))
        end
    end

    setHalvedAndClamped("weight_transfer_fwd")
    setHalvedAndClamped("weight_transfer_side")
    setIfPresent("turning_roll", 0.65)
    setIfPresent("steer_turn_add", 180)
    setIfPresent("steer_turn_sub", 250)
    setIfPresent("steer_assist", 1)
    setIfPresent("steer_speed_enabled", true)
    setIfPresent("steer_base_speed", 3)
    setIfPresent("steer_mid_speed", 28)
    setIfPresent("steer_max_speed", 60)
    setIfPresent("steer_mid_angle_mul", 0.34)
    setIfPresent("steer_max_angle_mul", 0.15)
    setIfPresent("steer_mid_rate_mul", 1.2)
    setIfPresent("steer_max_rate_mul", 1.35)
    setIfPresent("steer_input_pow", 0.8)
    setIfPresent("steer_slow_rate", 0.08)
    setIfPresent("steer_input_diff_slow", 0)
    setIfPresent("steer_input_diff_fast", 1)
    setIfPresent("steer_fast_rate", 1)

    if type(baseline.inertia_x) == "number" and type(baseline.inertia_z) == "number" and
        baseline.inertia_y ~= nil then
        values.inertia_y = (baseline.inertia_x + baseline.inertia_z) * 0.5
    end
    return values
end

local function ensureGenericTrafficDefault(veh, applyNow)
    if not veh then return false end
    local baseline = genericTrafficBaselines[veh.id] or captureVehicleStock(veh)
    if not baseline or not next(baseline) then return false end
    local values = genericTrafficDefaults[veh.id] or genericTrafficTuneValues(baseline)
    if not next(values) then return false end
    genericTrafficBaselines[veh.id] = copyTbl(baseline)
    genericTrafficDefaults[veh.id] = copyTbl(values)
    stock[veh.id] = copyTbl(baseline)

    local state = vehicleMetadata(veh.id)
    state.activeTune = MODDED_DEFAULT_TUNE
    if applyNow and state.activeTune:lower() == MODDED_DEFAULT_TUNE then
        local ok = writeVehicle(veh.id, values)
        if not ok then return false end
    end
    persistMetadata()
    return true
end

local function prepareGenericTrafficDefaults()
    local ok, records = pcall(function()
        return TweakDB:GetRecords("gamedataVehicle_Record")
    end)
    if not ok or type(records) ~= "table" then
        print("[UltimateVehicleTuning] Could not enumerate gamedataVehicle_Record records.")
        return 0
    end

    local ids, seen = {}, {}
    for _, record in ipairs(records) do
        local idOk, vehId = pcall(function()
            return vehicleIdString(record:GetID())
        end)
        if idOk and isLikelyTrafficVehicleRecord(vehId) and not seen[vehId] then
            seen[vehId] = true
            table.insert(ids, vehId)
        end
    end
    table.sort(ids)

    -- Capture every Vanilla baseline before changing any shared drive-model
    -- record, then apply the partial generic values in a second pass.
    for _, vehId in ipairs(ids) do
        local _, baseline = firstReadableId({ id = vehId })
        if baseline and next(baseline) then
            genericTrafficBaselines[vehId] = copyTbl(baseline)
        end
    end

    local prepared, failed = 0, 0
    for _, vehId in ipairs(ids) do
        local baseline = genericTrafficBaselines[vehId]
        local values = baseline and genericTrafficTuneValues(baseline) or nil
        local applied = values and next(values) and writeVehicle(vehId, values)
        if applied then
            genericTrafficDefaults[vehId] = copyTbl(values)
            prepared = prepared + 1
        else
            failed = failed + 1
        end
    end

    pcall(function()
        local file = io.open(TRAFFIC_VEHICLE_LOG, "w")
        if not file then return end
        file:write("Non-player road-vehicle records in the installed TweakDB\n")
        file:write("APPLIED marks records receiving the hidden generic Modded default.\n\n")
        for _, vehId in ipairs(ids) do
            file:write(genericTrafficDefaults[vehId] and "APPLIED " or "FAILED  ", vehId, "\n")
        end
        file:close()
    end)
    print("[UltimateVehicleTuning] Prepared hidden generic defaults for " .. prepared ..
        " non-player road vehicles (" .. failed .. " unreadable/failed).")
    return prepared
end

local function captureSessionStock()
    stock = {}
    local count = 0
    for _, veh in ipairs(VEHICLES) do
        if captureVehicleStock(veh) then
            count = count + 1
        else
            print("[UltimateVehicleTuning] No live Vanilla baseline for " .. veh.id)
        end
    end
    print("[UltimateVehicleTuning] Captured live Vanilla baseline for " .. count .. " vehicles.")
    return count
end

local function applyCurrent(reason)
    local veh = currentVeh()
    if not veh then return end
    if activeTuneReadOnly then
        configStatus = "Read-only tune. Use Save As before editing."
        return
    end
    appliedList = {}
    lastError = ""
    local ok, err = applyToVariants(veh, edit)
    if ok then
        saved[veh.id] = copyTbl(edit)
        presetDirty = not tablesEqual(saved, diskSaved)
        if autoSave then
            local savedOk, saveErr = persistActiveTune()
            if not savedOk then
                lastError = tostring(saveErr)
                configStatus = "Auto-save failed: " .. lastError
            end
        else
            configStatus = "Unsaved changes in " .. activeTuneId
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

local function applySelectedTunes()
    appliedList = {}
    local count = 0
    local errors = 0
    for _, veh in ipairs(VEHICLES) do
        local state = vehicleMetadata(veh.id)
        refreshTuneFiles(veh.id)
        local tune = findTune(state.activeTune)
        if not tune then
            errors = errors + 1
            print("[UltimateVehicleTuning] Preserving unavailable tune selection \"" ..
                tostring(state.activeTune) .. "\" for " .. veh.id)
        end
        if tune and not tune.vanilla then
            local document = type(tune.file) == "string" and loadJSON(tune.file) or nil
            local documentValues = tune.values or
                (type(document) == "table" and document.values or nil)
            local documentVehicleId = tune.values and veh.id or
                (type(document) == "table" and document.vehicleId or nil)
            if type(documentValues) == "table" and documentVehicleId == veh.id then
                local params = copyTbl(stock[veh.id] or {})
                for key, value in pairs(documentValues) do params[key] = value end
                if next(params) then
                    local ok, err
                    if veh.genericTraffic then
                        ok, err = writeVehicle(veh.id, documentValues)
                    else
                        ok, err = applyToVariants(veh, params)
                    end
                    if ok then
                        count = count + 1
                    else
                        errors = errors + 1
                        lastError = tostring(err)
                    end
                end
            else
                errors = errors + 1
                print("[UltimateVehicleTuning] Invalid selected tune \"" ..
                    tostring(state.activeTune) .. "\" for " .. veh.id)
            end
        end
    end
    local activeVeh = currentVeh()
    if activeVeh then refreshTuneFiles(activeVeh.id) end
    statusMessage = "Applied selected tunes to " .. count .. " vehicles."
    print("[UltimateVehicleTuning] Applied per-vehicle tunes: " .. count ..
        " vehicles, " .. errors .. " errors")
end

local function initializeTuneStorage(baseDocument)
    local baseVehicles = validPresetDocument(baseDocument) and copyVehicleMap(baseDocument.vehicles) or {}
    migrateLegacyKeys(baseVehicles)
    migrateParamKeys(baseVehicles)
    addPresetVehiclesToRoster(baseVehicles)

    local cleanSlate = metadata.version ~= 2 or type(metadata.vehicles) ~= "table"
    local autoSaveExplicit = metadata.autoSaveExplicit == true
    local priorAutoSave = autoSaveExplicit and metadata.autoSave == true or false
    if cleanSlate then
        metadata = {
            version = 2,
            autoSave = false,
            autoSaveExplicit = false,
            vehicles = {},
        }
        priorAutoSave = false
        autoSaveExplicit = false
    end
    metadata.autoSave = priorAutoSave
    metadata.autoSaveExplicit = autoSaveExplicit
    autoSave = priorAutoSave

    for _, veh in ipairs(VEHICLES) do
        local values = baseVehicles[veh.id]
        local hasDefault = false
        if values and ensureVehicleTuneDirectory(veh.id) then
            local path = tuneFilePath(veh.id, MODDED_DEFAULT_TUNE .. ".json")
            if path then
                local document = { version = 1, vehicleId = veh.id, values = values }
                local existing = loadJSON(path)
                local existingValues = type(existing) == "table" and existing.values or nil
                if not validTuneDocument(existing, veh.id) or
                    type(existingValues) ~= "table" or not tablesEqual(existingValues, values) then
                    saveJSON(path, document)
                end
                hasDefault = validTuneDocument(loadJSON(path), veh.id)
            end
        end
        local state = vehicleMetadata(veh.id)
        if cleanSlate then
            state.activeTune = hasDefault and MODDED_DEFAULT_TUNE or VANILLA_TUNE
            state.tuneIndex = {}
        end
    end
    persistMetadata()
    return cleanSlate
end

local function prepareContextSwitch(discardDirty)
    if not activeTuneDirty() or discardDirty then return true end
    if autoSave and not activeTuneReadOnly then
        local ok, err = persistActiveTune()
        if ok then return true end
        configStatus = "Could not save before switching: " .. tostring(err)
        return false
    end
    configStatus = "Unsaved changes: Save or Discard before switching vehicle or tune."
    return false
end

local function loadVehicleTune(index, tuneId, discardDirty, applyLive)
    if index < 1 or index > #VEHICLES then return false end
    if not prepareContextSwitch(discardDirty) then return false end

    local previousVehicle = currentVeh()
    local previousVehicleId = previousVehicle and previousVehicle.id or nil
    local previousTuneId = tostring(activeTuneId or ""):lower()
    selected = index
    local veh = currentVeh()
    if not captureVehicleStock(veh) then
        edit = {}
        lastError = "Could not read live TweakDB record for " .. veh.name
        return false
    end

    refreshTuneFiles(veh.id)
    local state = vehicleMetadata(veh.id)
    local tune = findTune(tuneId or state.activeTune)
    if not tune then
        tune = findTune(MODDED_DEFAULT_TUNE) or findTune(VANILLA_TUNE)
    end
    if not tune then return false end

    local values = {}
    if type(tune.values) == "table" then
        values = copyTbl(tune.values)
    elseif not tune.vanilla and type(tune.file) == "string" then
        local document = loadJSON(tune.file)
        if not validTuneDocument(document, veh.id) then
            configStatus = "Invalid tune file for " .. veh.name
            return false
        end
        local documentValues = type(document) == "table" and document.values or nil
        if type(documentValues) ~= "table" then return false end
        values = copyTbl(documentValues)
    end

    activeTuneId = tune.id
    activeTunePath = tune.file
    activeTuneReadOnly = tune.readOnly
    state.activeTune = tune.id
    saved = { [veh.id] = values }
    diskSaved = copyVehicleMap(saved)
    presetDirty = false
    loadEditorFrom(mergedPresetParams(veh.id, saved))

    local metadataOk, metadataErr = persistMetadata()
    if not metadataOk then
        lastError = "Could not save selected tune: " .. tostring(metadataErr)
        configStatus = lastError
        return false
    end

    local contextChanged = previousVehicleId ~= veh.id or
        previousTuneId ~= tostring(tune.id or ""):lower()
    if contextChanged and ACCELERATION_TIMER_ENABLED and resetAccelerationTimer then
        resetAccelerationTimer()
        accelerationTimer.status = "Ready - vehicle/tune changed"
    end

    if applyLive then
        local ok, err = applyToVariants(veh, edit)
        if not ok then
            lastError = tostring(err or "Apply failed")
            configStatus = "Could not apply " .. tune.label
            return false
        end
    end
    configStatus = "Loaded " .. tune.label .. (tune.readOnly and " (read-only)" or "")
    return true
end

local function selectVehicle(index)
    local state = VEHICLES[index] and vehicleMetadata(VEHICLES[index].id) or nil
    return state and loadVehicleTune(index, state.activeTune, false, false) or false
end

local function loadTune(tuneId, discardDirty)
    return loadVehicleTune(selected, tuneId, discardDirty, true)
end

local function discardActiveChanges()
    return loadTune(activeTuneId, true)
end

local function saveAsTune(rawName)
    local veh = currentVeh()
    local filename = safeTuneFilename(rawName)
    if not veh or not filename then
        configStatus = "Use a simple tune name without folders or '..'."
        return false
    end
    if not ensureDirectory(TUNES_ROOT) then
        configStatus = "Could not access the tune storage folder."
        return false
    end
    -- Prefer the normal per-vehicle directory. If CET cannot create one for a
    -- newly discovered mod vehicle, tuneFilePath uses the flat fallback.
    ensureVehicleTuneDirectory(veh.id)
    local path = tuneFilePath(veh.id, filename)
    if not path then
        configStatus = "Could not resolve a tune path for " .. veh.name
        return false
    end
    if fileExists(path) then
        configStatus = filename .. " already exists. Select it and use Save."
        return false
    end

    local ok, err = saveJSON(path, {
        version = 1,
        vehicleId = veh.id,
        values = copyTbl(edit),
    })
    if not ok then
        configStatus = "Save As failed: " .. tostring(err)
        return false
    end

    local state = vehicleMetadata(veh.id)
    table.insert(state.tuneIndex, filename)
    state.activeTune = filename
    refreshTuneFiles(veh.id)
    return loadTune(filename, true)
end

copyTuneState.firstTarget = function()
    for index, veh in ipairs(VEHICLES) do
        if index ~= selected and not veh.hidden then return index end
    end
    return nil
end

copyTuneState.validTarget = function(index)
    local veh = type(index) == "number" and VEHICLES[index] or nil
    return veh ~= nil and index ~= selected and not veh.hidden
end

copyTuneState.copyToVehicle = function(targetIndex, rawName)
    local sourceVeh = currentVeh()
    local targetVeh = copyTuneState.validTarget(targetIndex) and VEHICLES[targetIndex] or nil
    local filename = safeTuneFilename(rawName)
    if not sourceVeh or not targetVeh then
        configStatus = "Select another vehicle to copy this tune to."
        return false
    end
    if not filename then
        configStatus = "Use a simple tune name without folders or '..'."
        return false
    end
    if not ensureDirectory(TUNES_ROOT) then
        configStatus = "Could not access the tune storage folder."
        return false
    end

    ensureVehicleTuneDirectory(targetVeh.id)
    local path = tuneFilePath(targetVeh.id, filename)
    if not path then
        configStatus = "Could not resolve a tune path for " .. targetVeh.name
        return false
    end
    if fileExists(path) then
        configStatus = filename .. " already exists for " .. targetVeh.name
        return false
    end

    local ok, err = saveJSON(path, {
        version = 1,
        vehicleId = targetVeh.id,
        values = copyTbl(edit),
    })
    if not ok then
        configStatus = "Copy failed: " .. tostring(err)
        return false
    end

    local state = vehicleMetadata(targetVeh.id)
    local indexed = false
    for _, name in ipairs(state.tuneIndex) do
        if tostring(name):lower() == filename:lower() then
            indexed = true
            break
        end
    end
    if not indexed then table.insert(state.tuneIndex, filename) end

    local metadataOk, metadataErr = persistMetadata()
    if metadataOk then
        configStatus = "Copied current tune to " .. targetVeh.name ..
            " as " .. filename:gsub("%.json$", "")
    else
        configStatus = "Tune copied, but metadata could not be saved: " ..
            tostring(metadataErr)
    end
    return true
end

local function deleteActiveTune()
    local veh = currentVeh()
    if not veh or activeTuneReadOnly or not activeTunePath or
        activeTuneId:lower() == MODDED_DEFAULT_TUNE then
        configStatus = "Vanilla and Modded default cannot be deleted."
        return false
    end

    local filename = safeTuneFilename(activeTuneId)
    local expectedPath = filename and tuneFilePath(veh.id, filename) or nil
    if not expectedPath then
        configStatus = "Delete failed: invalid tune path."
        return false
    end
    if activeTunePath:lower() ~= expectedPath:lower() then
        configStatus = "Delete failed: tune path is outside this vehicle's folder."
        return false
    end

    local callOk, removed, removeErr = pcall(function() return os.remove(expectedPath) end)
    if not callOk or not removed then
        configStatus = "Delete failed: " .. tostring(removeErr or removed or "could not remove file")
        return false
    end

    local state = vehicleMetadata(veh.id)
    local kept = {}
    for _, indexedName in ipairs(state.tuneIndex) do
        if tostring(indexedName):lower() ~= filename:lower() then
            table.insert(kept, indexedName)
        end
    end
    state.tuneIndex = kept
    refreshTuneFiles(veh.id)
    local fallback = findTune(MODDED_DEFAULT_TUNE) and MODDED_DEFAULT_TUNE or VANILLA_TUNE
    state.activeTune = fallback
    persistMetadata()

    local loaded = loadVehicleTune(selected, fallback, true, true)
    if loaded then configStatus = "Deleted " .. filename .. " and loaded " .. fallback .. "." end
    return loaded
end

local function restoreSessionStock()
    local count, errors = 0, 0
    for _, veh in ipairs(VEHICLES) do
        local params = stock[veh.id]
        if params and next(params) then
            local ok, err
            if veh.genericTraffic then
                ok, err = writeVehicle(veh.id, params)
            else
                ok, err = applyToVariants(veh, params)
            end
            if ok then
                count = count + 1
            else
                errors = errors + 1
                print("[UltimateVehicleTuning] Baseline restore failed for " ..
                    veh.id .. ": " .. tostring(err))
            end
        else
            print("[UltimateVehicleTuning] Skipped baseline restore without a capture: " .. veh.id)
        end
    end
    print("[UltimateVehicleTuning] Restored session baseline for " .. count ..
        " vehicles before shutdown (" .. errors .. " errors).")
end

local function normalizeRecordName(raw)
    if not raw or raw == "" then return nil end
    raw = tostring(raw)
    if not raw:find("Vehicle%.") then
        raw = "Vehicle." .. raw
    end
    return raw
end

local function isGameSessionReady()
    local ok, ready = pcall(function()
        local player = Game.GetPlayer()
        return player ~= nil and player:IsAttached()
    end)
    return ok and ready == true
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

local function mountedVehicleObject()
    local ok, vehicle = pcall(function()
        local player = Game.GetPlayer()
        return player and player:GetMountedVehicle() or nil
    end)
    return ok and vehicle or nil
end

local function accelerationVectorSpeed(value)
    if type(value) == "number" then return math.abs(value) end
    local x = vectorComponent(value, "x", "X")
    local y = vectorComponent(value, "y", "Y")
    local z = vectorComponent(value, "z", "Z") or 0
    if x == nil or y == nil then return nil end
    return math.sqrt(x * x + y * y + z * z)
end

local function sampleMountedVehicleSpeed(vehicle, deltaTime)
    local ok, value = pcall(function() return vehicle:GetVelocity() end)
    local speed = ok and accelerationVectorSpeed(value) or nil
    if speed == nil then
        ok, value = pcall(function() return vehicle:GetLinearVelocity() end)
        speed = ok and accelerationVectorSpeed(value) or nil
    end
    if speed == nil then
        ok, value = pcall(function() return vehicle:GetCurrentSpeed() end)
        speed = ok and accelerationVectorSpeed(value) or nil
    end
    if speed ~= nil then
        accelerationTimer.lastVehicle = vehicle
        accelerationTimer.lastPosition = nil
        return speed
    end

    local positionOk, position = pcall(function() return vehicle:GetWorldPosition() end)
    if not positionOk or not position then return nil end
    local x = vectorComponent(position, "x", "X")
    local y = vectorComponent(position, "y", "Y")
    local z = vectorComponent(position, "z", "Z") or 0
    if x == nil or y == nil then return nil end

    local previous = accelerationTimer.lastPosition
    local sameVehicle = accelerationTimer.lastVehicle == vehicle
    accelerationTimer.lastVehicle = vehicle
    accelerationTimer.lastPosition = { x = x, y = y, z = z }
    if not sameVehicle or not previous or type(deltaTime) ~= "number" or
        deltaTime <= 0 or deltaTime > 0.25 then
        return nil
    end
    local dx, dy, dz = x - previous.x, y - previous.y, z - previous.z
    return math.sqrt(dx * dx + dy * dy + dz * dz) / deltaTime
end

local function saveAccelerationResult(reason)
    if not accelerationTimer.started or not accelerationTimer.vehicleId or
        not accelerationTimer.tuneId then
        return false, "No acceleration run to save"
    end
    if not DEV_SAVE_ACCELERATION_RESULTS then return true, nil, false end

    local document = loadJSON(ACCELERATION_RESULTS_FILE)
    if type(document) ~= "table" then document = {} end
    document.version = 1
    document.vehicles = type(document.vehicles) == "table" and document.vehicles or {}

    local vehicleResults = document.vehicles[accelerationTimer.vehicleId]
    if type(vehicleResults) ~= "table" then
        vehicleResults = {}
        document.vehicles[accelerationTimer.vehicleId] = vehicleResults
    end

    local checkpoints = {}
    for _, checkpoint in ipairs(ACCELERATION_CHECKPOINTS_KPH) do
        local checkpointTime = accelerationTimer.times[checkpoint]
        if checkpointTime ~= nil then
            checkpoints[tostring(checkpoint)] = checkpointTime
        end
    end

    local topSpeedMps = accelerationTimer.topSpeedMps or 0
    vehicleResults[accelerationTimer.tuneId] = {
        vehicleId = accelerationTimer.vehicleId,
        mountedVehicleId = accelerationTimer.mountedVehicleId,
        tune = accelerationTimer.tuneId,
        stopReason = reason or "stopped",
        elapsedTime = accelerationTimer.elapsed or 0,
        topSpeedMps = topSpeedMps,
        topSpeedKph = topSpeedMps * 3.6,
        topSpeedMph = topSpeedMps * 2.2369362921,
        checkpointsKph = checkpoints,
    }

    local ok, err = saveJSON(ACCELERATION_RESULTS_FILE, document)
    return ok, err, true
end

resetAccelerationTimer = function()
    accelerationTimer.active = false
    accelerationTimer.started = false
    accelerationTimer.elapsed = 0
    accelerationTimer.topSpeedMps = 0
    accelerationTimer.previousSpeedKph = accelerationTimer.speedMps * 3.6
    accelerationTimer.times = {}
    accelerationTimer.vehicleId = nil
    accelerationTimer.mountedVehicleId = nil
    accelerationTimer.tuneId = nil
    accelerationTimer.status = "Ready"
end

local function startAccelerationTimer()
    local mountedVehicle = mountedVehicleObject()
    if not mountedVehicle then
        accelerationTimer.active = false
        accelerationTimer.status = "No vehicle mounted"
        return
    end
    local selectedVehicle = currentVeh()
    if not selectedVehicle then
        accelerationTimer.active = false
        accelerationTimer.status = "No vehicle/tune selected in the main panel"
        return
    end
    resetAccelerationTimer()
    accelerationTimer.vehicleId = selectedVehicle.id
    accelerationTimer.mountedVehicleId = mountedRecordName()
    accelerationTimer.tuneId = tostring(activeTuneId or VANILLA_TUNE)
    accelerationTimer.topSpeedMps = accelerationTimer.speedMps or 0
    accelerationTimer.active = true
    if accelerationTimer.speedMps * 3.6 >= 1 then
        accelerationTimer.started = true
        accelerationTimer.elapsed = 0
        accelerationTimer.status = "Running"
    else
        accelerationTimer.status = "Armed - waiting for launch"
    end
    accelerationTimer.previousSpeedKph = accelerationTimer.speedMps * 3.6
end

local function stopAccelerationTimer()
    accelerationTimer.active = false
    if accelerationTimer.started then
        local savedOk, saveErr, resultsSaved = saveAccelerationResult("stopped")
        accelerationTimer.status = savedOk and
            (resultsSaved and "Stopped - results saved" or "Stopped") or
            ("Stopped - save failed: " .. tostring(saveErr))
    else
        accelerationTimer.status = "Ready"
    end
end

local function updateAccelerationTimer(deltaTime)
    if not ACCELERATION_TIMER_ENABLED then return end
    local vehicle = mountedVehicleObject()
    if not vehicle then
        accelerationTimer.speedMps = 0
        accelerationTimer.previousSpeedKph = 0
        accelerationTimer.lastVehicle = nil
        accelerationTimer.lastPosition = nil
        if accelerationTimer.active then
            accelerationTimer.active = false
            if accelerationTimer.started then
                local savedOk, saveErr, resultsSaved = saveAccelerationResult("vehicle exited")
                accelerationTimer.status = savedOk and
                    (resultsSaved and "Stopped - vehicle exited; results saved" or
                        "Stopped - vehicle exited") or
                    ("Stopped - save failed: " .. tostring(saveErr))
            else
                accelerationTimer.status = "Stopped - vehicle exited"
            end
        end
        return
    end

    local sampledSpeed = sampleMountedVehicleSpeed(vehicle, deltaTime)
    if sampledSpeed == nil then
        if accelerationTimer.active then accelerationTimer.status = "Speed unavailable" end
        return
    end

    accelerationTimer.speedMps = sampledSpeed
    local speedKph = sampledSpeed * 3.6
    local previousSpeedKph = accelerationTimer.previousSpeedKph or speedKph
    accelerationTimer.previousSpeedKph = speedKph
    if not accelerationTimer.active then return end

    if not accelerationTimer.started then
        if speedKph < 1 then return end
        accelerationTimer.started = true
        accelerationTimer.elapsed = 0
        accelerationTimer.status = "Running"
        previousSpeedKph = 0
    end

    accelerationTimer.topSpeedMps = math.max(
        accelerationTimer.topSpeedMps or 0,
        sampledSpeed
    )

    if type(deltaTime) ~= "number" or deltaTime <= 0 or deltaTime > 0.25 then return end
    local previousElapsed = accelerationTimer.elapsed
    accelerationTimer.elapsed = accelerationTimer.elapsed + deltaTime
    local speedGain = speedKph - previousSpeedKph

    if speedGain > 0 then
        for _, checkpoint in ipairs(ACCELERATION_CHECKPOINTS_KPH) do
            if accelerationTimer.times[checkpoint] == nil and
                previousSpeedKph < checkpoint and speedKph >= checkpoint then
                local fraction = (checkpoint - previousSpeedKph) / speedGain
                accelerationTimer.times[checkpoint] = previousElapsed + deltaTime * fraction
            end
        end
    end

    local finalCheckpoint = ACCELERATION_CHECKPOINTS_KPH[#ACCELERATION_CHECKPOINTS_KPH]
    if accelerationTimer.times[finalCheckpoint] ~= nil then
        accelerationTimer.active = false
        local savedOk, saveErr, resultsSaved = saveAccelerationResult("300 km/h reached")
        accelerationTimer.status = savedOk and
            (resultsSaved and "Complete - results saved" or "Complete") or
            ("Complete - save failed: " .. tostring(saveErr))
    end
end

local function vehicleTypeForRecord(recordName)
    local id = tostring(recordName or ""):lower()
    return (id:find("v_sportbike", 1, true) or id:find("_bike", 1, true)) and "Bike" or "Car"
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
        vehicleType = vehicleTypeForRecord(recordName),
        attempts = 0,
        selectedSpawn = false,
    }
    lastError = ""
    statusMessage = "Despawn requested; waiting to respawn " .. recordName .. "..."
end

local function spawnSelectedVehicle()
    if pendingRespawn then
        statusMessage = "A vehicle spawn or recycle is already in progress."
        return
    end

    local veh = currentVeh()
    if not veh or not getRecord(veh.id) then
        statusMessage = "The selected vehicle does not have a valid spawn record."
        return
    end
    local spawnRecordName = veh.spawnId or veh.id
    if not getRecord(spawnRecordName) then
        statusMessage = "The selected vehicle does not have a valid concrete spawn record."
        return
    end

    local applied, applyErr = applyToVariants(veh, edit)
    if not applied then
        lastError = "Could not apply the selected tune before spawning: " .. tostring(applyErr)
        statusMessage = "Could not prepare the selected vehicle for spawning."
        return
    end

    pendingRespawn = {
        delay = 0,
        recordName = spawnRecordName,
        vehicleType = vehicleTypeForRecord(spawnRecordName),
        attempts = 0,
        selectedSpawn = true,
    }
    lastError = ""
    statusMessage = "Requesting selected vehicle: " .. veh.name .. "..."
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
        if request.selectedSpawn then
            statusMessage = "Spawn requested for selected vehicle: " .. request.recordName .. "."
            print("[VPC] Spawned selected vehicle " .. request.recordName)
        else
            statusMessage = "Respawn requested for " .. request.recordName .. "."
            print("[VPC] Recycled " .. request.recordName)
        end
    elseif request.attempts < 3 then
        request.delay = 0.75
        statusMessage = "Vehicle spawn not ready; retrying (" .. request.attempts .. "/3)..."
    else
        pendingRespawn = nil
        lastError = (request.selectedSpawn and "Selected vehicle spawn failed: " or
            "Recycle respawn failed: ") .. tostring(spawnedOrErr)
        statusMessage = request.selectedSpawn and
            "Could not spawn the selected vehicle." or
            "Automatic respawn failed. Use the normal vehicle summon."
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

local function vehicleRecordName(vehicle)
    local ok, name = pcall(function()
        if not vehicle then return nil end
        local rid = vehicle:GetRecordID()
        if rid and rid.value and rid.value ~= "" then
            return normalizeRecordName(rid.value)
        end
        return normalizeRecordName(TDBID.ToStringDEBUG(rid))
    end)
    if ok then return name end
    return nil
end

local function listedVehicleForRecord(recordName)
    if not recordName then return nil, nil end
    for index, veh in ipairs(VEHICLES) do
        for _, id in ipairs(candidateIds(veh)) do
            if recordName:lower() == id:lower() then return index, veh end
        end
    end
    for index, veh in ipairs(VEHICLES) do
        for _, id in ipairs(candidateIds(veh)) do
            if recordMatches(recordName, id) then return index, veh end
        end
    end
    return nil, nil
end

local function applyPersistedTuneBeforeVehicleAttach(recordName)
    -- Hidden traffic defaults are applied once before the normal player tunes.
    -- Do not reapply them here: many traffic variants share a drive-model
    -- record with a tuned player vehicle, whose more specific tune must win.
    if genericTrafficDefaults[recordName] then return true end

    local _, veh = listedVehicleForRecord(recordName)
    if not veh then return false end

    local state = vehicleMetadata(veh.id)
    if state.activeTune:lower() == VANILLA_TUNE then return true end

    local filename
    if state.activeTune:lower() == MODDED_DEFAULT_TUNE then
        filename = MODDED_DEFAULT_TUNE .. ".json"
    else
        filename = safeTuneFilename(state.activeTune)
    end
    local path = filename and tuneFilePath(veh.id, filename) or nil
    local document = path and loadJSON(path) or nil
    if not validTuneDocument(document, veh.id) then
        print("[UltimateVehicleTuning] Could not preload selected tune \"" ..
            tostring(state.activeTune) .. "\" for " .. veh.id)
        return false
    end

    if not captureVehicleStock(veh) then return false end
    local params = copyTbl(stock[veh.id] or {})
    for key, value in pairs(document.values or {}) do params[key] = value end
    local ok, err = applyToVariants(veh, params)
    if not ok then
        print("[UltimateVehicleTuning] Vehicle attach tune failed for " ..
            veh.id .. ": " .. tostring(err))
        return false
    end
    print("[UltimateVehicleTuning] Preloaded " .. tostring(state.activeTune) ..
        " before attaching " .. veh.id)
    return true
end

selectMounted = function(silent, applyLive)
    local mounted = mountedRecordName()
    if not mounted then
        if not silent then statusMessage = "You are not in a vehicle." end
        return false
    end

    local function selectMatch(index, veh, applyLive)
        local ok
        if applyLive then
            ok = loadVehicleTune(index, vehicleMetadata(veh.id).activeTune, false, true)
        else
            ok = selectVehicle(index)
        end
        if not ok then return false end
        statusMessage = "Selected " .. veh.name .. " from your current vehicle."
        return true
    end

    -- Prefer an exact player-record match so named variants do not collapse
    -- into an earlier base model that happens to share the same ID prefix.
    local exactIndex, exactVehicle = exactVehicleInRoster(mounted)
    if exactVehicle then
        return selectMatch(exactIndex, exactVehicle, applyLive == true)
    end

    -- A mounted road vehicle is stronger evidence than a fuzzy shared-prefix
    -- match. Give an unknown traffic variant its own generic default first.
    if isLikelyTrafficVehicleRecord(mounted) then
        local index, trafficVehicle = registerGenericTrafficVehicle(mounted)
        if trafficVehicle and ensureGenericTrafficDefault(trafficVehicle, false) then
            return selectMatch(index, trafficVehicle, false)
        end
    end

    -- Cosmetic/configuration records (notably Muramasa) may only share a
    -- prefix with the physics entry represented in this UI.
    for i, veh in ipairs(VEHICLES) do
        for _, id in ipairs(candidateIds(veh)) do
            if recordMatches(mounted, id) then
                return selectMatch(i, veh, applyLive == true)
            end
        end
    end

    local mountedVehicle = {
        id = mounted,
        name = friendlyVehicleName(mounted),
        class = mounted:lower():find("sportbike", 1, true) and "Bike" or "Mounted Vehicle",
    }
    local _, params = firstReadableId(mountedVehicle)
    if params and next(params) then
        table.insert(VEHICLES, mountedVehicle)
        captureVehicleStock(mountedVehicle)
        return selectMatch(#VEHICLES, mountedVehicle, true)
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
    if key:find("^gear_%d+_") then
        resetEasyGearBaseline(true)
    end
    applyCurrent("Reset " .. key)
end

local function applyEasyGearingValues()
    local firstTorque = nil
    for gear = 2, 8 do
        local torque = easyGearing.baseline["gear_" .. gear .. "_torque"]
        if type(torque) == "number" and torque > 0 then
            firstTorque = torque
            break
        end
    end

    local driveScale = math.max(0.01, easyGearing.finalDrive)
    local decayExponent = math.max(0.05, easyGearing.torqueDecay / driveScale)
    edit[easyGearing.finalDriveKey] = easyGearing.finalDrive
    edit[easyGearing.torqueDecayKey] = easyGearing.torqueDecay
    edit[easyGearing.versionKey] = 2
    for gear = 2, 8 do
        local prefix = "gear_" .. gear .. "_"
        local minSpeed = easyGearing.baseline[prefix .. "min_speed"]
        local maxSpeed = easyGearing.baseline[prefix .. "max_speed"]
        local torque = easyGearing.baseline[prefix .. "torque"]

        if type(minSpeed) == "number" then
            edit[prefix .. "min_speed"] = minSpeed * driveScale
        end
        if type(maxSpeed) == "number" then
            edit[prefix .. "max_speed"] = maxSpeed * driveScale
        end
        if firstTorque and type(torque) == "number" and torque > 0 then
            local relativeTorque = torque / firstTorque
            edit[prefix .. "torque"] =
                (firstTorque / driveScale) * (relativeTorque ^ decayExponent)
        end
    end
end

UVT = UVT or {}
UVT.UI = UVT.UI or {}

UVT.UI.drawGearValue = function(value, format)
    if type(value) == "number" then
        ImGui.Text(string.format(format, value))
    else
        ImGui.TextDisabled("--")
    end
end

UVT.UI.drawGearTable = function()
    if not ImGui.BeginTable("##easy_gearing_table", 6, 0) then return end
    ImGui.TableSetupColumn("Gear")
    ImGui.TableSetupColumn("Low km/h")
    ImGui.TableSetupColumn("High km/h")
    ImGui.TableSetupColumn("Low RPM")
    ImGui.TableSetupColumn("High RPM")
    ImGui.TableSetupColumn("Torque")
    ImGui.TableHeadersRow()

    for gear = 1, 8 do
        local prefix = "gear_" .. gear .. "_"
        local hasGear = edit[prefix .. "min_speed"] ~= nil or
            edit[prefix .. "max_speed"] ~= nil or edit[prefix .. "torque"] ~= nil
        if hasGear then
            ImGui.TableNextRow()
            ImGui.TableSetColumnIndex(0)
            ImGui.Text(gear == 1 and "Reverse" or tostring(gear - 1))
            ImGui.TableSetColumnIndex(1)
            local minSpeed = edit[prefix .. "min_speed"]
            UVT.UI.drawGearValue(type(minSpeed) == "number" and minSpeed * 3.6 or nil, "%.1f")
            ImGui.TableSetColumnIndex(2)
            local maxSpeed = edit[prefix .. "max_speed"]
            UVT.UI.drawGearValue(type(maxSpeed) == "number" and maxSpeed * 3.6 or nil, "%.1f")
            ImGui.TableSetColumnIndex(3)
            UVT.UI.drawGearValue(edit[prefix .. "min_rpm"], "%.0f")
            ImGui.TableSetColumnIndex(4)
            UVT.UI.drawGearValue(edit[prefix .. "max_rpm"], "%.0f")
            ImGui.TableSetColumnIndex(5)
            UVT.UI.drawGearValue(edit[prefix .. "torque"], "%.3f")
        end
    end
    ImGui.EndTable()
end

UVT.UI.drawEasyGearingControls = function()
    local width = ImGui.GetWindowContentRegionWidth()
    local labelW = width * 0.42
    local sliderW = math.max(120, width - labelW)

    if activeTuneReadOnly then ImGui.BeginDisabled() end

    ImGui.AlignTextToFramePadding()
    ImGui.Text("Final Drive")
    ImGui.SameLine(labelW)
    ImGui.PushItemWidth(sliderW)
    local finalDrive, finalDriveChanged =
        ImGui.SliderFloat("##easy_final_drive", easyGearing.finalDrive, 0.60, 1.60, "%.2f x")
    ImGui.PopItemWidth()
    if finalDriveChanged then
        easyGearing.finalDrive = finalDrive
        applyEasyGearingValues()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip(
            "Lower gives stronger low gears with steeper falloff; higher gives weaker low gears with shallower falloff.")
    end
    if ImGui.IsItemDeactivatedAfterEdit() then
        applyCurrent("Auto-applied easy gearing")
    end

    ImGui.AlignTextToFramePadding()
    ImGui.Text("Torque Decay Curve")
    ImGui.SameLine(labelW)
    ImGui.PushItemWidth(sliderW)
    local torqueDecay, torqueDecayChanged =
        ImGui.SliderFloat("##easy_torque_decay", easyGearing.torqueDecay, 0.50, 1.50, "%.2f x")
    ImGui.PopItemWidth()
    if torqueDecayChanged then
        easyGearing.torqueDecay = torqueDecay
        applyEasyGearingValues()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Lower keeps more torque in high gears; higher makes torque fall away faster.")
    end
    if ImGui.IsItemDeactivatedAfterEdit() then
        applyCurrent("Auto-applied easy gearing")
    end

    if activeTuneReadOnly then ImGui.EndDisabled() end

    ImGui.Spacing()
    ImGui.TextDisabled(
        "Final drive also adjusts wheel-torque leverage and automatically biases torque decay.")
    UVT.UI.drawGearTable()
end

UVT.UI.drawGearingGroup = function()
    if ACCELERATION_TIMER_ENABLED then
        if ImGui.Button("Open Acceleration Stopwatch", 260, 0) then
            easyGearing.stopwatchOpen = true
        end
        ImGui.SameLine()
    end
    if pendingRespawn then ImGui.BeginDisabled() end
    if ImGui.Button("Respawn Last Vehicle##gearing", 200, 0) then
        recycleLastVehicle()
    end
    if pendingRespawn then ImGui.EndDisabled() end
    ImGui.TextDisabled("Vehicle must be respawned to apply gearing changes")
    ImGui.Spacing()

    local advancedValue, advancedChanged =
        ImGui.Checkbox("Advanced gearing mode", easyGearing.advanced)
    if advancedChanged then
        easyGearing.advanced = advancedValue
    end
    ImGui.SameLine()
    ImGui.TextDisabled(easyGearing.advanced and
        "Directly edit every gear parameter" or "Simplified final-drive controls")

    if easyGearing.advanced then
        UVT.UI.drawGroup("INDIVIDUAL GEARS", true)
    else
        UVT.UI.drawEasyGearingControls()
    end
end

UVT.UI.drawGroup = function(groupName, skipHeader)
    if not skipHeader then
        ImGui.PushStyleColor(ImGuiCol.Header, 0.10, 0.42, 0.66, 1.0)
        ImGui.PushStyleColor(ImGuiCol.HeaderHovered, 0.14, 0.50, 0.76, 1.0)
        ImGui.PushStyleColor(ImGuiCol.HeaderActive, 0.08, 0.36, 0.58, 1.0)
        local open = ImGui.CollapsingHeader(groupName, ImGuiTreeNodeFlags.DefaultOpen)
        ImGui.PopStyleColor(3)
        if not open then return end
    end

    local stockVals = currentStock()
    local width = ImGui.GetWindowContentRegionWidth()
    local labelW = width * 0.5
    local gap = 8
    local padX, padY = 10, 4
    local textW = ImGui.CalcTextSize("Reset")
    local resetW = textW + padX * 2
    local sliderW = math.max(40, width * 0.5 - gap - resetW)
    if activeTuneReadOnly then ImGui.BeginDisabled() end

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
                    if groupName == "INDIVIDUAL GEARS" then
                        resetEasyGearBaseline(true)
                    end
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

    if activeTuneReadOnly then ImGui.EndDisabled() end
end

UVT.UI.drawFrictionMapGroup = function()
    ImGui.PushStyleColor(ImGuiCol.Header, 0.10, 0.42, 0.66, 1.0)
    ImGui.PushStyleColor(ImGuiCol.HeaderHovered, 0.14, 0.50, 0.76, 1.0)
    ImGui.PushStyleColor(ImGuiCol.HeaderActive, 0.08, 0.36, 0.58, 1.0)
    local open = ImGui.CollapsingHeader("FRICTION MAP", ImGuiTreeNodeFlags.DefaultOpen)
    ImGui.PopStyleColor(3)
    if not open then return end

    local current = edit.wheels_friction_map
    if type(current) ~= "string" or current == "" then
        ImGui.TextDisabled("No wheel friction map is available on this vehicle.")
        return
    end

    local changed = isChanged("wheels_friction_map")
    local unsaved = isUnsaved("wheels_friction_map")
    local label = (unsaved and "! " or "") .. (changed and "* " or "") ..
        "Wheel Friction Map"
    if unsaved then
        ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.67, 0.15, 1.0)
    elseif changed then
        ImGui.PushStyleColor(ImGuiCol.Text, 0.25, 1.0, 0.55, 1.0)
    end
    ImGui.Text(label)
    if unsaved or changed then ImGui.PopStyleColor() end

    if activeTuneReadOnly then ImGui.BeginDisabled() end
    ImGui.SetNextItemWidth(480)
    if ImGui.BeginCombo("##wheels_friction_map", current, ImGuiComboFlags.HeightLargest) then
        local currentListed = false
        for _, option in ipairs(UVT.frictionMaps or {}) do
            if option.id == current then currentListed = true end
        end
        if not currentListed then
            ImGui.Selectable("> " .. current, false)
            if #(UVT.frictionMaps or {}) > 0 then ImGui.Separator() end
        end

        local lastFamily = nil
        for _, option in ipairs(UVT.frictionMaps or {}) do
            if option.family ~= lastFamily then
                if lastFamily ~= nil then ImGui.Separator() end
                ImGui.TextDisabled(option.family)
                lastFamily = option.family
            end
            local selectedMap = option.id == current
            local optionLabel = (selectedMap and "> " or "") .. option.id
            if ImGui.Selectable(optionLabel, false) and not selectedMap then
                edit.wheels_friction_map = option.id
                applyCurrent("Auto-applied friction map")
            end
        end
        ImGui.EndCombo()
    end
    ImGui.SameLine()
    local stockMap = currentStock().wheels_friction_map
    if stockMap == nil then ImGui.BeginDisabled() end
    if ImGui.Button("Reset##wheels_friction_map", 100, 0) then
        resetParam("wheels_friction_map")
    end
    if stockMap == nil then ImGui.EndDisabled() end
    if activeTuneReadOnly then ImGui.EndDisabled() end

    ImGui.TextDisabled("Complete vanilla wheel-friction preset. Car and bike maps can be cross-tested.")
    ImGui.TextDisabled("Drive models may be shared; respawn or exit and re-enter to load changed physics.")
end

UVT.UI.drawEngineAndGearingGroup = function()
    ImGui.PushStyleColor(ImGuiCol.Header, 0.10, 0.42, 0.66, 1.0)
    ImGui.PushStyleColor(ImGuiCol.HeaderHovered, 0.14, 0.50, 0.76, 1.0)
    ImGui.PushStyleColor(ImGuiCol.HeaderActive, 0.08, 0.36, 0.58, 1.0)
    local open = ImGui.CollapsingHeader("ENGINE & GEARING", ImGuiTreeNodeFlags.DefaultOpen)
    ImGui.PopStyleColor(3)
    if not open then return end

    ImGui.TextDisabled("ENGINE")
    UVT.UI.drawGroup("ENGINE & GEARING", true)
    ImGui.Spacing()
    ImGui.Separator()
    ImGui.TextDisabled("GEARING")
    UVT.UI.drawGearingGroup()
end

UVT.UI.pushWindowStyle = function()
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

UVT.UI.popWindowStyle = function()
    ImGui.PopStyleVar(2)
    ImGui.PopStyleColor(12)
end

UVT.UI.drawTunePanel = function()
    ImGui.TextDisabled("TUNE")

    ImGui.SameLine()
    if activeTuneReadOnly then
        ImGui.PushStyleColor(ImGuiCol.Text, 0.55, 0.75, 1.0, 1.0)
        ImGui.Text("[READ ONLY - Use Save As New to make changes]")
        ImGui.PopStyleColor()
    elseif activeTuneDirty() then
        ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.67, 0.15, 1.0)
        ImGui.Text("[UNSAVED CHANGES]")
        ImGui.PopStyleColor()
    else
        ImGui.PushStyleColor(ImGuiCol.Text, 0.25, 1.0, 0.55, 1.0)
        ImGui.Text("[SAVED]")
        ImGui.PopStyleColor()
    end

    ImGui.SetNextItemWidth(ImGui.GetWindowContentRegionWidth())
    local activeTune = findTune(activeTuneId)
    local tuneLabel = activeTune and activeTune.label or activeTuneId
    if activeTuneReadOnly then tuneLabel = tuneLabel .. " [READ ONLY]" end
    if ImGui.BeginCombo("##active_tune", tuneLabel, ImGuiComboFlags.HeightLargest) then
        for _, tune in ipairs(tuneFiles) do
            local isActive = tune.id:lower() == activeTuneId:lower()
            local label = (isActive and "> " or "") .. tune.label ..
                (tune.readOnly and " [READ ONLY]" or "")
            if ImGui.Selectable(label, false) and not isActive then
                loadTune(tune.id, false)
            end
        end
        ImGui.EndCombo()
    end

    if ImGui.Button("Save As New", 150, 0) then
        ImGui.OpenPopup("Save tune as###save_as_confirmation")
    end
    ImGui.SameLine()

    if activeTuneReadOnly then ImGui.BeginDisabled() end
    if ImGui.Button("Save", 100, 0) then
        local ok, err = persistActiveTune()
        if not ok then configStatus = tostring(err) end
    end
    if activeTuneReadOnly then ImGui.EndDisabled() end
    ImGui.SameLine()
    local wasDirty = activeTuneDirty()
    if not wasDirty then ImGui.BeginDisabled() end
    if wasDirty then
        ImGui.PushStyleColor(ImGuiCol.Button, 0.62, 0.38, 0.06, 1.0)
        ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.82, 0.52, 0.10, 1.0)
        ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.48, 0.28, 0.04, 1.0)
    end
    if ImGui.Button("Discard Changes", 160, 0) then discardActiveChanges() end
    if wasDirty then ImGui.PopStyleColor(3) end
    if not wasDirty then ImGui.EndDisabled() end
    local canDeleteTune = not activeTuneReadOnly and activeTuneId:lower() ~= MODDED_DEFAULT_TUNE
    if not canDeleteTune then ImGui.BeginDisabled() end
    ImGui.SameLine()
    if canDeleteTune then
        ImGui.PushStyleColor(ImGuiCol.Button, 0.62, 0.10, 0.10, 1.0)
        ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.82, 0.16, 0.16, 1.0)
        ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.48, 0.06, 0.06, 1.0)
    end
    if ImGui.Button("Delete", 100, 0) then
        pendingDeleteTuneId = activeTuneId
        ImGui.OpenPopup("Delete saved tune?###delete_tune_confirmation")
    end
    if canDeleteTune then ImGui.PopStyleColor(3) end
    if not canDeleteTune then ImGui.EndDisabled() end

    ImGui.SameLine()
    if ImGui.Button("Copy To Vehicle", 180, 0) then
        if not copyTuneState.validTarget(copyTuneState.targetIndex) then
            copyTuneState.targetIndex = copyTuneState.firstTarget()
        end
        ImGui.OpenPopup("Copy tune to vehicle###copy_tune_confirmation")
    end

    ImGui.SameLine()
    if activeTuneReadOnly then ImGui.BeginDisabled() end
    local autoValue, autoChanged = ImGui.Checkbox("Auto-save", autoSave)
    if activeTuneReadOnly then ImGui.EndDisabled() end
    if autoChanged then
        autoSave = autoValue
        metadata.autoSaveExplicit = true
        if autoSave and activeTuneDirty() and not activeTuneReadOnly then
            local ok, err = persistActiveTune()
            if not ok then configStatus = tostring(err) end
        else
            persistMetadata()
            configStatus = autoSave and "Auto-save enabled" or "Auto-save disabled"
        end
    end

    if ImGui.BeginPopup("Save tune as###save_as_confirmation") then
        ImGui.Text("Save this tune as:")
        ImGui.SetNextItemWidth(300)
        saveAsName = ImGui.InputText("##save_as_name", saveAsName, 96)
        ImGui.Separator()
        if ImGui.Button("Confirm", 100, 0) then
            if saveAsTune(saveAsName) then ImGui.CloseCurrentPopup() end
        end 
        ImGui.SameLine()
        if ImGui.Button("Cancel", 100, 0) then
            ImGui.CloseCurrentPopup()
        end
        ImGui.EndPopup()
    end

    if ImGui.BeginPopup("Copy tune to vehicle###copy_tune_confirmation") then
        ImGui.Text("Copy the current tune to:")
        ImGui.SetNextItemWidth(520)
        local targetVeh = copyTuneState.validTarget(copyTuneState.targetIndex) and
            VEHICLES[copyTuneState.targetIndex] or nil
        local targetPreview = targetVeh and
            (targetVeh.name .. " [" .. targetVeh.class .. "] - " .. targetVeh.id) or
            "Select another vehicle"
        if ImGui.BeginCombo("##copy_tune_target", targetPreview,
            ImGuiComboFlags.HeightLargest) then
            local lastClass = nil
            for index, veh in ipairs(VEHICLES) do
                if index ~= selected and not veh.hidden then
                    if veh.class ~= lastClass then
                        if lastClass ~= nil then ImGui.Separator() end
                        ImGui.TextDisabled(veh.class)
                        lastClass = veh.class
                    end
                    local isTarget = index == copyTuneState.targetIndex
                    local label = (isTarget and "> " or "") .. veh.name ..
                        " - " .. veh.id
                    if ImGui.Selectable(label, false) then
                        copyTuneState.targetIndex = index
                    end
                end
            end
            ImGui.EndCombo()
        end

        ImGui.Text("New tune name:")
        ImGui.SetNextItemWidth(520)
        copyTuneState.name = ImGui.InputText("##copy_tune_name", copyTuneState.name, 96)
        ImGui.TextDisabled("The copied tune will be created but not automatically activated.")
        ImGui.Separator()
        local canCopy = copyTuneState.validTarget(copyTuneState.targetIndex)
        if not canCopy then ImGui.BeginDisabled() end
        if ImGui.Button("Copy", 100, 0) then
            if copyTuneState.copyToVehicle(copyTuneState.targetIndex, copyTuneState.name) then
                ImGui.CloseCurrentPopup()
            end
        end
        if not canCopy then ImGui.EndDisabled() end
        ImGui.SameLine()
        if ImGui.Button("Cancel", 100, 0) then
            ImGui.CloseCurrentPopup()
        end
        ImGui.EndPopup()
    end

    if ImGui.BeginPopup("Delete saved tune?###delete_tune_confirmation") then
        ImGui.Text("Permanently delete this tune?")
        ImGui.Text(tostring(pendingDeleteTuneId))
        if activeTuneDirty() then
            ImGui.Text("Unsaved changes will also be discarded.")
        end
        ImGui.Separator()
        if ImGui.Button("Confirm", 100, 0) then
            if pendingDeleteTuneId == activeTuneId then deleteActiveTune() end
            pendingDeleteTuneId = nil
            ImGui.CloseCurrentPopup()
        end
        ImGui.SameLine()
        if ImGui.Button("Cancel", 100, 0) then
            pendingDeleteTuneId = nil
            ImGui.CloseCurrentPopup()
        end
        ImGui.EndPopup()
    end

    -- ImGui.Text("Parameters differing from Vanilla: " .. tostring(countEditedParameters()))
    -- ImGui.TextWrapped(configStatus)

    ImGui.Spacing()
    ImGui.Spacing()
    ImGui.Spacing()
    ImGui.Spacing()

    ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.78, 0.20, 1.0)
    ImGui.TextWrapped("Exit and re-enter or respawn the vehicle to apply changes.")
    ImGui.PopStyleColor()

    ImGui.SameLine()
    if pendingRespawn then ImGui.BeginDisabled() end
    if ImGui.Button("Respawn Last Vehicle", 200, 0) then
        recycleLastVehicle()
    end
    if pendingRespawn then ImGui.EndDisabled() end
    ImGui.SameLine()
    if pendingRespawn then ImGui.BeginDisabled() end
    if ImGui.Button("Spawn Selected Vehicle", 200, 0) then
        spawnSelectedVehicle()
    end
    if pendingRespawn then ImGui.EndDisabled() end

    ImGui.Spacing()
    ImGui.Spacing()
    ImGui.Spacing()
    ImGui.Spacing()

    ImGui.PushStyleColor(ImGuiCol.Text, 0.25, 1.0, 0.55, 1.0)
    ImGui.Text("* green = differs from Vanilla")
    ImGui.PopStyleColor()
    ImGui.SameLine(270)
    ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.67, 0.15, 1.0)
    ImGui.Text("! amber = not saved to this tune")
    ImGui.PopStyleColor()
end

UVT.UI.drawAccelerationTimer = function()
    if not ACCELERATION_TIMER_ENABLED then return end

    ImGui.Separator()
    ImGui.TextDisabled("ACCELERATION STOPWATCH")
    ImGui.SameLine()
    ImGui.Text(accelerationTimer.status)

    local finalCheckpoint = ACCELERATION_CHECKPOINTS_KPH[#ACCELERATION_CHECKPOINTS_KPH]
    local canStart = not accelerationTimer.active and
        accelerationTimer.times[finalCheckpoint] == nil
    if not canStart then ImGui.BeginDisabled() end
    if ImGui.Button("Start##acceleration_timer", 100, 0) then
        startAccelerationTimer()
    end
    if not canStart then ImGui.EndDisabled() end

    ImGui.SameLine()
    if not accelerationTimer.active then ImGui.BeginDisabled() end
    if ImGui.Button("Stop##acceleration_timer", 100, 0) then
        stopAccelerationTimer()
    end
    if not accelerationTimer.active then ImGui.EndDisabled() end

    ImGui.SameLine()
    if ImGui.Button("Reset##acceleration_timer", 100, 0) then
        resetAccelerationTimer()
    end

    local speedMps = accelerationTimer.speedMps or 0
    ImGui.SameLine()
    ImGui.Text(string.format(
        "%.2f m/s  |  %.1f km/h  |  %.1f mph  |  %.3f s",
        speedMps,
        speedMps * 3.6,
        speedMps * 2.2369362921,
        accelerationTimer.elapsed or 0
    ))

    local topSpeedMps = accelerationTimer.topSpeedMps or 0
    ImGui.Text(string.format(
        "Top speed this run: %.2f m/s  |  %.1f km/h  |  %.1f mph",
        topSpeedMps,
        topSpeedMps * 3.6,
        topSpeedMps * 2.2369362921
    ))

    if ImGui.BeginTable("##acceleration_results", 4, 0) then
        ImGui.TableSetupColumn("km/h")
        ImGui.TableSetupColumn("mph")
        ImGui.TableSetupColumn("m/s")
        ImGui.TableSetupColumn("time")
        ImGui.TableHeadersRow()
        for _, checkpoint in ipairs(ACCELERATION_CHECKPOINTS_KPH) do
            ImGui.TableNextRow()
            ImGui.TableSetColumnIndex(0)
            ImGui.Text(string.format("%d", checkpoint))
            ImGui.TableSetColumnIndex(1)
            ImGui.Text(string.format("%.1f", checkpoint / 1.609344))
            ImGui.TableSetColumnIndex(2)
            ImGui.Text(string.format("%.2f", checkpoint / 3.6))
            ImGui.TableSetColumnIndex(3)
            local checkpointTime = accelerationTimer.times[checkpoint]
            ImGui.Text(checkpointTime and string.format("%.3f s", checkpointTime) or "--")
        end
        ImGui.EndTable()
    end
end

UVT.UI.drawAccelerationStopwatchWindow = function()
    if not ACCELERATION_TIMER_ENABLED or not easyGearing.stopwatchOpen then return end

    ImGui.SetNextWindowSize(640, 320, ImGuiCond.FirstUseEver)
    if ImGui.Begin("Acceleration Stopwatch") then
        if ImGui.Button("Close Window", 120, 0) then
            easyGearing.stopwatchOpen = false
        end
        UVT.UI.drawAccelerationTimer()
    end
    ImGui.End()
end

UVT.UI.drawVehiclePanel = function()
    local veh = currentVeh()
    local preview = veh and (veh.name .. " [" .. veh.class .. "]") or "Select vehicle"

    ImGui.TextDisabled("VEHICLE TO EDIT")
    ImGui.SetNextItemWidth(ImGui.GetWindowContentRegionWidth() - 180)
    if ImGui.BeginCombo("##vehicle", preview, ImGuiComboFlags.HeightLargest) then
        local lastClass = nil
        for i, v in ipairs(VEHICLES) do
            if not v.hidden then
                if v.class ~= lastClass then
                    ImGui.Separator()
                    ImGui.TextDisabled(v.class)
                    lastClass = v.class
                end
                local isActive = i == selected
                local label = (isActive and "> " or "") .. v.name .. " [" .. v.class .. "]"
                if ImGui.Selectable(label, false) and not isActive then selectVehicle(i) end
            end
        end
        ImGui.EndCombo()
    end

    ImGui.SameLine()
    if ImGui.Button("Use Current Vehicle", 180, 0) then selectMounted() end

    -- if veh and activeTuneId == VANILLA_TUNE then
    --     ImGui.Text("This vehicle currently uses the live Vanilla baseline.")
    -- elseif veh then
    --     ImGui.Text("Active tune applies only to " .. veh.name .. ".")
    -- end
    -- ImGui.TextWrapped(statusMessage)
end

UVT.UI.draw = function()
    ImGui.SetNextWindowSize(720, 820, ImGuiCond.FirstUseEver)
    UVT.UI.pushWindowStyle()
    local ok, err = pcall(function()
    if ImGui.Begin("Ultimate Vehicle Tuning") then
        if not tdbReady then
            ImGui.TextWrapped("Waiting for TweakDB... reload CET mods after the session has started.")
        else
            ImGui.Separator()
            UVT.UI.drawVehiclePanel()
            ImGui.Separator()
            UVT.UI.drawTunePanel()

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
                    if group == "ENGINE & GEARING" then
                        UVT.UI.drawEngineAndGearingGroup()
                    elseif group == "FRICTION MAP" then
                        UVT.UI.drawFrictionMapGroup()
                    else
                        UVT.UI.drawGroup(group)
                    end
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
    if ok then
        local stopwatchOk, stopwatchErr = pcall(UVT.UI.drawAccelerationStopwatchWindow)
        if not stopwatchOk then
            ok = false
            err = stopwatchErr
        end
    end
    UVT.UI.popWindowStyle()
    if not ok then error(err) end
end

registerForEvent("onInit", function()
    resetGearDebug()
    discoverOfficialVehicles()
    UVT.discoverFrictionMaps()

    local loadedMetadata = loadJSON(METADATA_FILE)
    if type(loadedMetadata) == "table" then
        metadata = loadedMetadata
    end
    removeLegacyGenericTrafficMetadata()
    local baseDocument = loadJSON(BASE_CONFIG_FILE)
    local cleanSlate = initializeTuneStorage(baseDocument)
    addCustomTuneVehiclesToRoster()
    sortVehicleRosterByClass()
    captureSessionStock()
    prepareGenericTrafficDefaults()
    applySelectedTunes()
    loadVehicleTune(selected, vehicleMetadata(VEHICLES[selected].id).activeTune, true, false)
    gameSessionActive = isGameSessionReady()

    tdbReady = true
    if gameSessionActive then selectMounted(true, true) end
    if cleanSlate then
        configStatus = "Created per-vehicle Modded default tunes from config_base.json."
    end

    local vehicleObserverOk, vehicleObserverErr = pcall(function()
        Observe("VehicleObject", "OnGameAttached", function(vehicle)
            local recordName = vehicleRecordName(vehicle)
            if not recordName then return end

            local _, listed = exactVehicleInRoster(recordName)
            if not listed and isLikelyTrafficVehicleRecord(recordName) then
                local _, trafficVehicle = registerGenericTrafficVehicle(recordName)
                if trafficVehicle and ensureGenericTrafficDefault(trafficVehicle, false) then
                    -- print("[UltimateVehicleTuning] Registered generic traffic default for " .. recordName)
                end
            end
            applyPersistedTuneBeforeVehicleAttach(recordName)
        end)
    end)
    if not vehicleObserverOk then
        print("[UltimateVehicleTuning] Could not register vehicle attach observer: " ..
            tostring(vehicleObserverErr))
    end

    Observe("LoadingScreenProgressBarController", "SetProgress", function(_, progress)
        if type(progress) ~= "number" then progress = _ end
        if type(progress) ~= "number" or not tdbReady then return end

        if progress < 1.0 then
            if not loadingTunesApplied then
                loadingTunesApplied = true
                applySelectedTunes()
                print("[UltimateVehicleTuning] Applied selected tunes during game loading.")
            end
            if not loadingMountedTuneApplied and mountedRecordName() then
                loadingMountedTuneApplied = selectMounted(true, true)
                if loadingMountedTuneApplied then
                    print("[UltimateVehicleTuning] Applied mounted vehicle tune during game loading.")
                end
            end
        else
            if loadingTunesApplied and not loadingMountedTuneApplied and mountedRecordName() then
                loadingMountedTuneApplied = selectMounted(true, true)
            end
            loadingTunesApplied = false
            loadingMountedTuneApplied = false
        end
    end)

    print("[UltimateVehicleTuning] CET UI ready. Open the overlay to tune vehicles.")
end)

registerForEvent("onShutdown", function()
    if tdbReady and next(stock) then restoreSessionStock() end
end)

registerForEvent("onOverlayOpen", function()
    showOverlay = true
    if tdbReady then selectMounted(true) end
end)
registerForEvent("onOverlayClose", function() showOverlay = false end)

registerForEvent("onUpdate", function(deltaTime)
    local sessionReady = isGameSessionReady()
    if sessionReady and not gameSessionActive and tdbReady then
        gameSessionActive = true
        applySelectedTunes()
        selectMounted(true, true)
        print("[UltimateVehicleTuning] Reapplied selected tunes after game session start.")
    elseif not sessionReady then
        gameSessionActive = false
    end

    local mounted = mountedRecordName()
    if mounted then lastMountedRecordName = mounted end
    if ACCELERATION_TIMER_ENABLED and
        mounted ~= accelerationTimer.observedMountedVehicleId then
        if accelerationTimer.active and accelerationTimer.started then
            saveAccelerationResult(mounted and "vehicle changed" or "vehicle exited")
        end
        resetAccelerationTimer()
        accelerationTimer.observedMountedVehicleId = mounted
        accelerationTimer.status = mounted and "Ready - vehicle changed" or "Ready"
    end
    updatePendingRespawn(deltaTime)
    updateAccelerationTimer(deltaTime)
end)

registerForEvent("onDraw", function()
    if not showOverlay then return end
    local ok, err = pcall(UVT.UI.draw)
    if not ok then
        lastError = tostring(err)
        print("[VPC] UI error: " .. lastError)
    end
end)
