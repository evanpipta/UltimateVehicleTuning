-- CP2077 Vehicle Physics Config // indigo-nx
-- Self-contained CET UI. Reads live TweakDB values, no external exe required.

local VEHICLES = {
    { id = "Vehicle.v_sport1_rayfield_caliburn",          name = "Rayfield Caliburn",            class = "Hypercar" },
    { id = "Vehicle.v_sport1_rayfield_aerondight",        name = "Rayfield Aerondight",          class = "Hypercar" },
    { id = "Vehicle.v_sport1_herrera_riptide",            name = "Herrera Riptide",              class = "Hypercar" },
    { id = "Vehicle.v_sport1_quadra_sport_r7",            name = "Quadra Sport R-7",             class = "Hypercar" },
    { id = "Vehicle.v_sport2_quadra_type66_avenger",      name = "Quadra Type-66 Avenger",       class = "Sport" },
    { id = "Vehicle.v_sport1_quadra_turbo_r_v_tech",      name = "Quadra Turbo-R V-Tech",        class = "Sport" },
    { id = "Vehicle.v_sport2_quadra_type66",              name = "Quadra Type-66",               class = "Sport" },
    { id = "Vehicle.v_sport2_quadra_type66_nomad",        name = "Quadra Type-66 Javelina",      class = "Sport" },
    { id = "Vehicle.v_sport2_quadra_type66_02",           name = "Quadra Type-66 Cthulhu",       class = "Sport" },
    { id = "Vehicle.v_sport2_mizutani_shion_mz2",         name = "Mizutani Shion MZ2",           class = "Sport" },
    { id = "Vehicle.v_sport2_mizutani_shion",             name = "Mizutani Shion",               class = "Sport" },
    { id = "Vehicle.v_sport2_mizutani_shion_nomad",       name = "Mizutani Shion Coyote",        class = "Sport" },
    { id = "Vehicle.v_sport2_porsche_911turbo",           name = "Porsche 911 Turbo",            class = "Sport" },
    { id = "Vehicle.v_sport1_herrera_outlaw_player",         name = "Herrera Outlaw",           class = "Sport" },
    { id = "Vehicle.v_sport1_yaiba_semimaru_player",      name = "Yaiba ARV-Q340 Semimaru",      class = "Sport" },
    { id = "Vehicle.v_standard3_thorton_mackinaw_mtl1",   name = "Thorton Mackinaw MTL1",        class = "Truck", alias = "Vehicle.v_standard3_thorton_mackinaw" },
    { id = "Vehicle.v_standard3_thorton_mackinaw_02",     name = "Thorton Mackinaw Beast",       class = "Truck" },
    { id = "Vehicle.v_standard25_thorton_colby_pickup",   name = "Thorton Colby CX410 Butte",    class = "Truck" },
    { id = "Vehicle.v_utility4_kaukaz_bratsk",            name = "Kaukaz Bratsk U4020",          class = "Truck" },
    { id = "Vehicle.v_standard3_militech_hellhound",      name = "Militech Hellhound",           class = "Truck" },
    { id = "Vehicle.v_standard3_villefort_alvarado",      name = "Villefort Alvarado",           class = "Luxury" },
    { id = "Vehicle.v_sport2_villefort_deleon",           name = "Villefort DeLeon",             class = "Luxury" },
    { id = "Vehicle.v_standard3_chevalier_emperor",       name = "Chevillon Emperor Ragnar",     class = "Luxury" },
    { id = "Vehicle.v_standard2_chevalier_thrax",         name = "Chevillon Thrax Jefferson",    class = "Luxury" },
    { id = "Vehicle.v_standard2_archer_quartz",           name = "Archer Quartz EC-T2",          class = "Economy" },
    { id = "Vehicle.v_standard2_archer_quartz_nomad",     name = "Archer Quartz Bandit",         class = "Economy" },
    { id = "Vehicle.v_standard2_archer_hella",            name = "Archer Hella EC-D I360",       class = "Economy" },
    { id = "Vehicle.v_standard2_thorton_colby",           name = "Thorton Colby C240T",          class = "Economy" },
    { id = "Vehicle.v_standard2_thorton_galena",          name = "Thorton Galena G240",          class = "Economy" },
    { id = "Vehicle.v_standard2_thorton_galena_nomad",    name = "Thorton Galena Rattler",       class = "Economy" },
    { id = "Vehicle.v_standard25_thorton_merrimac",       name = "Thorton Merrimac",             class = "Economy" },
    { id = "Vehicle.v_standard2_villefort_cortes",        name = "Villefort Cortes Valor",       class = "Economy" },
    { id = "Vehicle.v_standard25_villefort_columbus",     name = "Villefort Columbus V340-F",    class = "Economy" },
    { id = "Vehicle.v_standard2_makigai_maimai",          name = "Makigai MaiMai P126",          class = "Economy" },
    { id = "Vehicle.v_standard3_makigai_tanishi",         name = "Makigai Tanishi",              class = "Economy" },
    { id = "Vehicle.v_standard25_mahir_supron",           name = "Mahir Supron FS3",             class = "Economy" },
    { id = "Vehicle.v_standard2_mizutani_hozuki",         name = "Mizutani Hozuki",              class = "Economy" },

    -- Player/garage motorcycle records from the game 2.31 TweakDB.
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

local PARAMS = {
    { key = "total_mass",         group = "MASS & DYNAMICS",    label = "Total Mass",       fmt = "%.0f kg",  absMin = 200,   absMax = 8000 },
    { key = "chassis_mass",       group = "MASS & DYNAMICS",    label = "Chassis Mass",     fmt = "%.0f kg",  absMin = 200,   absMax = 8000 },
    { key = "air_resistance",     group = "MASS & DYNAMICS",    label = "Air Resistance",   fmt = "%.2f",     absMin = 0.05,  absMax = 12 },
    { key = "max_torque",         group = "ENGINE",             label = "Max Torque",       fmt = "%.0f Nm",  absMin = 20,    absMax = 2500 },
    { key = "resistance_torque",  group = "ENGINE",             label = "Resistance",       fmt = "%.0f Nm",  absMin = 0,     absMax = 800 },
    { key = "max_rpm",            group = "ENGINE",             label = "Max RPM",          fmt = "%.0f",     absMin = 2000,  absMax = 16000 },
    { key = "susp_front_spring",  group = "SUSPENSION // FRONT", label = "Spring Rate",     fmt = "%.1f",     absMin = 1,     absMax = 80 },
    { key = "susp_front_damp",    group = "SUSPENSION // FRONT", label = "Damping",         fmt = "%.0f",     absMin = 100,   absMax = 15000 },
    { key = "susp_front_rebound", group = "SUSPENSION // FRONT", label = "Rebound",         fmt = "%.0f",     absMin = 100,   absMax = 15000 },
    { key = "susp_front_antiroll",group = "SUSPENSION // FRONT", label = "Anti-Roll",       fmt = "%.1f",     absMin = 0,     absMax = 300 },
    { key = "susp_rear_spring",   group = "SUSPENSION // REAR",  label = "Spring Rate",     fmt = "%.1f",     absMin = 1,     absMax = 80 },
    { key = "susp_rear_damp",     group = "SUSPENSION // REAR",  label = "Damping",         fmt = "%.0f",     absMin = 100,   absMax = 15000 },
    { key = "susp_rear_rebound",  group = "SUSPENSION // REAR",  label = "Rebound",         fmt = "%.0f",     absMin = 100,   absMax = 15000 },
    { key = "susp_rear_antiroll", group = "SUSPENSION // REAR",  label = "Anti-Roll",       fmt = "%.1f",     absMin = 0,     absMax = 300 },
    { key = "tire_front_lat",     group = "TIRES",              label = "Front Lateral",    fmt = "%.2f",     absMin = 0.05,  absMax = 3 },
    { key = "tire_front_long",    group = "TIRES",              label = "Front Longit.",    fmt = "%.2f",     absMin = 0.05,  absMax = 3 },
    { key = "tire_rear_lat",      group = "TIRES",              label = "Rear Lateral",     fmt = "%.2f",     absMin = 0.05,  absMax = 3 },
    { key = "tire_rear_long",     group = "TIRES",              label = "Rear Longit.",     fmt = "%.2f",     absMin = 0.05,  absMax = 3 },
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
    { key = "brake_front",        group = "BRAKING",            label = "Front Brake",      fmt = "%.0f Nm",  absMin = 50,    absMax = 4000 },
    { key = "brake_rear",         group = "BRAKING",            label = "Rear Brake",       fmt = "%.0f Nm",  absMin = 50,    absMax = 4000 },
    { key = "brake_handbrake",    group = "BRAKING",            label = "Handbrake",        fmt = "%.0f Nm",  absMin = 50,    absMax = 5000 },
}

local GROUPS = {
    "MASS & DYNAMICS",
    "ENGINE",
    "SUSPENSION // FRONT",
    "SUSPENSION // REAR",
    "TIRES",
    "STEERING",
    "SPEED-SENSITIVE STEERING",
    "BRAKING",
}

local PRESET_ORDER = { "Stock", "Realistic", "Sport", "Drift", "Track", "OffRoad" }

-- Multipliers applied to captured stock values. Stock is a straight restore.
local PRESETS = {
    Realistic = {
        total_mass = 1.05, chassis_mass = 1.05,
        max_torque = 0.90, resistance_torque = 1.20,
        tire_front_lat = 0.80, tire_front_long = 0.80,
        tire_rear_lat = 0.80, tire_rear_long = 0.80,
        steer_turn_add = 0.85, steer_turn_sub = 0.85,
        brake_front = 0.90, brake_rear = 0.90, brake_handbrake = 0.90,
    },
    Sport = {
        total_mass = 0.95, chassis_mass = 0.95,
        max_torque = 1.10,
        susp_front_spring = 1.20, susp_rear_spring = 1.10,
        susp_front_damp = 1.10, susp_rear_damp = 1.10,
        tire_front_lat = 1.10, tire_front_long = 1.10,
        tire_rear_lat = 1.10, tire_rear_long = 1.10,
        steer_turn_add = 1.15, steer_turn_sub = 1.15,
        brake_front = 1.15, brake_rear = 1.15, brake_handbrake = 1.10,
    },
    Drift = {
        susp_front_spring = 1.20, susp_front_antiroll = 1.15,
        tire_front_lat = 1.05,
        tire_rear_lat = 0.55, tire_rear_long = 0.85,
        steer_turn_add = 1.30, steer_turn_sub = 1.20,
        brake_handbrake = 1.40, brake_rear = 0.70,
    },
    Track = {
        total_mass = 0.90, chassis_mass = 0.90, air_resistance = 0.80,
        max_torque = 1.15,
        susp_front_spring = 1.40, susp_rear_spring = 1.40,
        susp_front_damp = 1.30, susp_rear_damp = 1.30,
        susp_front_rebound = 1.25, susp_rear_rebound = 1.25,
        susp_front_antiroll = 1.35, susp_rear_antiroll = 1.35,
        tire_front_lat = 1.20, tire_front_long = 1.20,
        tire_rear_lat = 1.20, tire_rear_long = 1.20,
        steer_turn_add = 1.15, steer_turn_sub = 1.15,
        brake_front = 1.20, brake_rear = 1.20, brake_handbrake = 1.10,
    },
    OffRoad = {
        total_mass = 1.10, chassis_mass = 1.10,
        susp_front_spring = 0.70, susp_rear_spring = 0.70,
        susp_front_damp = 0.75, susp_rear_damp = 0.75,
        susp_front_rebound = 0.75, susp_rear_rebound = 0.75,
        susp_front_antiroll = 0.60, susp_rear_antiroll = 0.60,
        tire_front_lat = 1.05, tire_front_long = 1.05,
        tire_rear_lat = 1.05, tire_rear_long = 1.05,
        steer_turn_add = 0.90, steer_turn_sub = 0.90,
    },
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
}
local ENG = {
    max_torque = "engineMaxTorque", resistance_torque = "resistanceTorque",
    max_rpm = "maxRPM",
}
local FRONT = {
    susp_front_spring = "springStiffness", susp_front_damp = "springDamping",
    susp_front_rebound = "springReboundDamping", susp_front_antiroll = "swaybarStiffness",
    tire_front_lat = "frictionMulLateral", tire_front_long = "frictionMulLongitudinal",
    brake_front = "maxBrakingTorque",
}
local REAR = {
    susp_rear_spring = "springStiffness", susp_rear_damp = "springDamping",
    susp_rear_rebound = "springReboundDamping", susp_rear_antiroll = "swaybarStiffness",
    tire_rear_lat = "frictionMulLateral", tire_rear_long = "frictionMulLongitudinal",
    brake_rear = "maxBrakingTorque",
}

local showOverlay = false
local selected = 1
local edit = {}
local stock = {}
local saved = {}
local lastPreset = {}
local autoApply = false
local vehicleCount = 0
local lastError = ""
local appliedList = {}
local statusMessage = "Open this window in the CET overlay to tune vehicles."
local tdbReady = false
local pendingRespawn = nil
local lastMountedRecordName = nil

local STOCK_FILE = "stock.json"
local CONFIG_FILE = "config.json"

local function copyTbl(src)
    local dst = {}
    if not src then return dst end
    for k, v in pairs(src) do
        dst[k] = v
    end
    return dst
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

local function saveJSON(path, data)
    pcall(function()
        local f = io.open(path, "w")
        if not f then return end
        f:write(json.encode(data))
        f:close()
    end)
end

local function persistConfig()
    saveJSON(CONFIG_FILE, {
        selectedId = VEHICLES[selected] and VEHICLES[selected].id or nil,
        autoApply = autoApply,
        vehicles = saved,
        lastPreset = lastPreset,
    })
end

local function persistStock()
    saveJSON(STOCK_FILE, stock)
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
    if veh.alias then table.insert(ids, veh.alias) end
    table.insert(ids, veh.id .. "_player")
    if veh.alias then table.insert(ids, veh.alias .. "_player") end
    return ids
end

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
        }

        local engRec = rec:VehEngineData()
        if engRec then chain.engId = engRec:GetID() end

        local wsRec = dmRec:WheelSetup()
        if wsRec then
            local fOk, fp = pcall(function() return wsRec:FrontPreset() end)
            if fOk and fp then chain.frontId = fp:GetID() end

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

local function readVehicle(vehId)
    local chain, err = resolveChain(vehId)
    if not chain then return nil, err end
    local params = {}
    readMap(chain.dmId, DM, params)
    if chain.engId then readMap(chain.engId, ENG, params) end
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

        if chain.engId then
            table.insert(appliedList, "ENG: " .. TDBID.ToStringDEBUG(chain.engId))
            applyMap(chain.engId, ENG, params)
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

local function selectVehicle(index)
    if index < 1 or index > #VEHICLES then return end
    selected = index
    local veh = VEHICLES[selected]
    if saved[veh.id] then
        local params = copyTbl(stock[veh.id] or {})
        for key, value in pairs(saved[veh.id]) do
            params[key] = value
        end
        loadEditorFrom(params)
    elseif stock[veh.id] then
        loadEditorFrom(stock[veh.id])
    else
        local _, params = firstReadableId(veh)
        if params then
            stock[veh.id] = copyTbl(params)
            persistStock()
            loadEditorFrom(params)
        else
            edit = {}
            lastError = "Could not read TweakDB record for " .. veh.name
        end
    end
end

local function applyCurrent(reason)
    local veh = currentVeh()
    if not veh then return end
    appliedList = {}
    lastError = ""
    local ok, err = applyToVariants(veh, edit)
    if ok then
        saved[veh.id] = copyTbl(edit)
        vehicleCount = 0
        for _ in pairs(saved) do vehicleCount = vehicleCount + 1 end
        persistConfig()
        statusMessage = (reason or "Applied") .. " " .. veh.name .. ". Resummon the vehicle to feel the change."
        print("[VPC] Applied " .. veh.name)
    else
        lastError = tostring(err or "Apply failed")
        statusMessage = "Apply failed for " .. veh.name
        print("[VPC] ERROR applying " .. veh.name .. ": " .. lastError)
    end
end

local function applyPreset(name)
    local base = currentStock()
    if not next(base) then
        lastError = "No stock values captured yet for this vehicle."
        return
    end
    if name == "Stock" then
        loadEditorFrom(base)
    else
        local mul = PRESETS[name] or {}
        local nextParams = copyTbl(base)
        for k, factor in pairs(mul) do
            if nextParams[k] ~= nil then
                nextParams[k] = nextParams[k] * factor
            end
        end
        loadEditorFrom(nextParams)
    end
    local veh = currentVeh()
    if veh then lastPreset[veh.id] = name end
    if autoApply then
        applyCurrent(name .. " preset")
    else
        statusMessage = name .. " preset loaded. Click APPLY TO GAME."
    end
end

local function applyToAll()
    local veh = currentVeh()
    local base = currentStock()
    if not veh or not next(base) then return end

    local ratios = {}
    local directValues = {}
    for _, def in ipairs(PARAMS) do
        local s = base[def.key]
        local e = edit[def.key]
        if type(s) == "number" and type(e) == "number" and math.abs(s) > 0.0001 then
            ratios[def.key] = e / s
        elseif type(s) == "boolean" and type(e) == "boolean" then
            directValues[def.key] = e
        end
    end

    appliedList = {}
    local count = 0
    for _, other in ipairs(VEHICLES) do
        local otherStock = stock[other.id]
        if otherStock and next(otherStock) then
            local params = copyTbl(otherStock)
            for k, r in pairs(ratios) do
                if params[k] ~= nil then params[k] = params[k] * r end
            end
            for k, value in pairs(directValues) do
                if params[k] ~= nil then params[k] = value end
            end
            local ok = applyToVariants(other, params)
            if ok then
                saved[other.id] = params
                count = count + 1
            end
        end
    end
    vehicleCount = count
    persistConfig()
    statusMessage = "Applied current ratios to " .. count .. " vehicles. Resummon to feel changes."
end

local function captureMissingStock()
    for _, veh in ipairs(VEHICLES) do
        local _, liveParams = firstReadableId(veh)
        if liveParams then
            if not stock[veh.id] then stock[veh.id] = {} end
            -- Preserve previously captured vanilla values, but backfill fields
            -- introduced by newer versions of this UI.
            for key, value in pairs(liveParams) do
                if stock[veh.id][key] == nil then
                    stock[veh.id][key] = value
                end
            end
        end
    end
    persistStock()
end

local function applySaved()
    appliedList = {}
    local count = 0
    local errors = 0
    for _, veh in ipairs(VEHICLES) do
        local params = saved[veh.id]
        if params then
            local ok, err = applyToVariants(veh, params)
            if ok then
                count = count + 1
            else
                errors = errors + 1
                lastError = tostring(err)
            end
        end
    end
    vehicleCount = count
    if count > 0 then
        statusMessage = "Restored " .. count .. " saved vehicle tune(s)."
        print("[VPC] Restored " .. count .. " vehicles, " .. errors .. " errors")
    end
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
        persistConfig()
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

local function resetParam(key)
    local s = currentStock()[key]
    if s == nil then return end
    edit[key] = s
    local veh = currentVeh()
    if veh then lastPreset[veh.id] = nil end
    if autoApply then
        applyCurrent("Reset " .. key)
    else
        statusMessage = "Reset to vanilla. Click APPLY TO GAME to write it."
    end
end

local function resetAllToVanilla()
    local veh = currentVeh()
    local base = currentStock()
    if not veh or not next(base) then
        lastError = "No stock values captured yet for this vehicle."
        return
    end
    loadEditorFrom(base)
    appliedList = {}
    lastError = ""
    local ok, err = applyToVariants(veh, edit)
    if ok then
        saved[veh.id] = nil
        lastPreset[veh.id] = "Stock"
        vehicleCount = 0
        for _ in pairs(saved) do vehicleCount = vehicleCount + 1 end
        persistConfig()
        statusMessage = "Reset " .. veh.name .. " to vanilla. Resummon the vehicle."
        print("[VPC] Reset " .. veh.name .. " to vanilla")
    else
        lastError = tostring(err or "Reset failed")
        statusMessage = "Reset failed for " .. veh.name
    end
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

    for _, def in ipairs(PARAMS) do
        if def.group == groupName then
            if edit[def.key] == nil then
                ImGui.TextDisabled(def.label .. "  (not on this vehicle)")
            else
                local changed = isChanged(def.key)
                local label = (changed and "* " or "") .. def.label
                if changed then
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
                if ImGui.IsItemDeactivatedAfterEdit() and autoApply then
                    applyCurrent("Auto-applied")
                end
                if changed then ImGui.PopStyleColor(2) end

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

local function drawUI()
    ImGui.SetNextWindowSize(720, 820, ImGuiCond.FirstUseEver)
    pushWindowStyle()
    local ok, err = pcall(function()
    if ImGui.Begin("Vehicle Physics Config // indigo-nx") then
        if not tdbReady then
            ImGui.TextWrapped("Waiting for TweakDB... reload CET mods after the session has started.")
        else
            local veh = currentVeh()
            local preview = veh and (veh.name .. " [" .. veh.class .. "]") or "Select vehicle"

            ImGui.Text("VEHICLE")
            ImGui.SameLine()
            ImGui.SetNextItemWidth(ImGui.GetWindowContentRegionWidth() - 80)
            if ImGui.BeginCombo("##vehicle", preview) then
                local lastClass = nil
                for i, v in ipairs(VEHICLES) do
                    if v.class ~= lastClass then
                        ImGui.Separator()
                        ImGui.TextDisabled(v.class)
                        lastClass = v.class
                    end
                    local label = v.name .. " [" .. v.class .. "]"
                    if ImGui.Selectable(label, i == selected) then
                        selectVehicle(i)
                        persistConfig()
                    end
                end
                ImGui.EndCombo()
            end

            if ImGui.Button("Use current vehicle") then
                selectMounted()
            end
            ImGui.SameLine()
            if ImGui.Button("Reload live values") then
                local id, params = firstReadableId(veh)
                if params then
                    loadEditorFrom(params)
                    statusMessage = "Loaded live TweakDB values for " .. veh.name
                else
                    lastError = "Could not read live values for " .. veh.name
                end
            end
            ImGui.SameLine()
            ImGui.PushStyleColor(ImGuiCol.Button, 0.32, 0.16, 0.10, 1.0)
            ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.48, 0.22, 0.12, 1.0)
            ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.22, 0.10, 0.06, 1.0)
            if ImGui.Button("Reset all to vanilla") then
                resetAllToVanilla()
            end
            ImGui.PopStyleColor(3)

            ImGui.Separator()
            ImGui.Text("PRESETS")
            local availX = ImGui.GetContentRegionAvail()
            local btnW = (availX - 20) / #PRESET_ORDER
            local activePreset = veh and lastPreset[veh.id] or nil
            for i, name in ipairs(PRESET_ORDER) do
                if i > 1 then ImGui.SameLine() end
                if activePreset == name then
                    ImGui.PushStyleColor(ImGuiCol.Button, 0.08, 0.45, 0.22, 1.0)
                    ImGui.PushStyleColor(ImGuiCol.Text, 0.85, 1.0, 0.90, 1.0)
                else
                    ImGui.PushStyleColor(ImGuiCol.Button, 0.07, 0.16, 0.12, 1.0)
                    ImGui.PushStyleColor(ImGuiCol.Text, 0.30, 1.00, 0.55, 1.0)
                end
                if ImGui.Button(name, btnW, 24) then
                    applyPreset(name)
                end
                ImGui.PopStyleColor(2)
            end

            ImGui.Spacing()
            ImGui.PushStyleColor(ImGuiCol.Button, 0.08, 0.55, 0.22, 1.0)
            ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.12, 0.70, 0.30, 1.0)
            ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.06, 0.42, 0.18, 1.0)
            ImGui.PushStyleColor(ImGuiCol.Text, 0.90, 1.0, 0.92, 1.0)
            if ImGui.Button("APPLY TO GAME", availX, 32) then
                applyCurrent("Applied")
            end
            ImGui.PopStyleColor(4)

            ImGui.Spacing()
            if pendingRespawn then ImGui.BeginDisabled() end
            ImGui.PushStyleColor(ImGuiCol.Button, 0.34, 0.16, 0.06, 1.0)
            ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 0.52, 0.24, 0.08, 1.0)
            ImGui.PushStyleColor(ImGuiCol.ButtonActive, 0.25, 0.10, 0.04, 1.0)
            if ImGui.Button("RECYCLE LAST VEHICLE (EXIT FIRST) [EXPERIMENTAL]", availX, 28) then
                recycleLastVehicle()
            end
            ImGui.PopStyleColor(3)
            if pendingRespawn then ImGui.EndDisabled() end

            local autoPressed
            autoApply, autoPressed = ImGui.Checkbox("Auto apply when a slider is released", autoApply)
            if autoPressed then persistConfig() end
            ImGui.SameLine()
            if ImGui.Button("Apply ratios to all") then
                applyToAll()
            end

            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.78, 0.20, 1.0)
            ImGui.TextWrapped("Apply, exit the vehicle, then recycle. The last vehicle you occupied is remembered for this session.")
            ImGui.PopStyleColor()

            if saved[veh.id] then
                ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.53, 1.0)
                ImGui.Text("STATUS: SAVED TUNE FOR THIS VEHICLE")
            else
                ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.67, 0.0, 1.0)
                ImGui.Text("STATUS: STOCK / NOT YET APPLIED")
            end
            ImGui.PopStyleColor()
            ImGui.Text("Saved vehicles: " .. tostring(vehicleCount))
            ImGui.TextWrapped(statusMessage)

            if lastError ~= "" then
                ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.25, 0.15, 1.0)
                ImGui.TextWrapped(lastError)
                ImGui.PopStyleColor()
            end

            ImGui.Separator()
            for _, group in ipairs(GROUPS) do
                drawGroup(group)
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
    local stockData = loadJSON(STOCK_FILE)
    if type(stockData) == "table" then stock = stockData end

    local cfg = loadJSON(CONFIG_FILE)
    if type(cfg) == "table" then
        if type(cfg.vehicles) == "table" then saved = cfg.vehicles end
        if type(cfg.lastPreset) == "table" then lastPreset = cfg.lastPreset end
        if cfg.autoApply ~= nil then autoApply = cfg.autoApply and true or false end
        if cfg.selectedId then
            for i, veh in ipairs(VEHICLES) do
                if veh.id == cfg.selectedId then
                    selected = i
                    break
                end
            end
        end
    end

    captureMissingStock()
    applySaved()
    selectVehicle(selected)
    tdbReady = true
    print("[VehiclePhysicsConfig] CET UI ready. Open the overlay to tune vehicles.")
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
