Vehicle Physics Config v1.3
by indigo-nx
CET UI restored locally — no desktop exe required.

In-game CET overlay for tuning vehicle physics in Cyberpunk 2077.
Pick a vehicle, drag sliders, apply to the game, resummon your ride.


REQUIREMENTS

  - Cyberpunk 2077 2.0+ (Phantom Liberty vehicles included)
  - Cyber Engine Tweaks (https://www.nexusmods.com/cyberpunk2077/mods/107)


INSTALLATION

  CET Mod (from Nexus):

    Vortex:
      Install with Vortex as usual — it will place the CET mod automatically.

    Manual:
      Extract the archive into your Cyberpunk 2077 game folder.
      The CET mod lands in: bin/x64/plugins/cyber_engine_tweaks/mods/VehiclePhysicsConfig/

    Verification:
      Launch the game, open the CET overlay (default: ~ or F1, depending on your bind).
      You should see a window titled "Vehicle Physics Config // indigo-nx"
      with a vehicle dropdown, presets, and sliders.
      If it doesn't appear, make sure VehiclePhysicsConfig/init.lua is inside:
        <game>/bin/x64/plugins/cyber_engine_tweaks/mods/

  No desktop configurator:

    The original Nexus package expected a separate Windows .exe to write slider
    values into init.lua. That tool is not required. The CET overlay now contains
    the full slider UI and reads live TweakDB values from the game.


UNINSTALL

  Delete the VehiclePhysicsConfig folder from CET mods.
  No game files are modified -- everything reverts to stock instantly.


HOW TO USE

  1. Start the game and open the CET overlay
  2. Find "Vehicle Physics Config // indigo-nx"
  3. Select a vehicle (or click Use current vehicle while driving)
  4. Choose a preset or adjust individual sliders
  5. Click APPLY TO GAME (or enable Auto apply)
  6. Spawned vehicles cache their physics. Either resummon normally, or exit
     the vehicle and click RECYCLE LAST VEHICLE (EXPERIMENTAL). The mod remembers
     the last vehicle occupied during this session, requests its despawn, waits
     briefly, then requests a fresh nearby spawn. It may fail during quests or
     in restricted areas.

  Changed values highlight green. Expand "Apply log" to confirm every
  TweakDB write with [OK] or [MISS].

  Tunes are saved to config.json in this mod folder and restored on the
  next launch. Stock values are captured once to stock.json.


PARAMETERS

  35 parameters across eight categories:

  Mass & Dynamics     Total mass, chassis mass, air resistance
  Engine              Max torque, resistance torque, max RPM
  Suspension Front    Spring rate, damping, rebound, anti-roll
  Suspension Rear     Spring rate, damping, rebound, anti-roll
  Tires               Lateral & longitudinal friction (front/rear independently)
  Steering            Turn speed +/-, steering assist
  Speed-Sensitive     Enable scaling, maximum angle, speed thresholds,
                      mid/high-speed angle and turn-rate multipliers,
                      input progression and slow-input change speed
  Braking             Front brake, rear brake, handbrake

  Speed thresholds are shown in metres per second (10 m/s = 36 km/h).
  The speed-sensitive steering controls start at each vehicle's exact vanilla
  values, including its vanilla mid/high-speed steering ratios.
  All values start at each vehicle's captured stock defaults.
  Presets apply multipliers to stock values -- always reversible.


PRESETS

  Stock       Reset to game defaults
  Realistic   Heavier, less grip, more braking required
  Sport       Stiffer, more grip, sharper turn-in
  Drift       Loose rear, increased steering, handbrake bias
  Track       Lightweight, stiff, maximum grip, aggressive braking
  Offroad     Soft suspension, low anti-roll, balanced grip


SUPPORTED VEHICLES (51)

  Hypercar:
    Rayfield Caliburn, Rayfield Aerondight,
    Herrera Riptide, Quadra Sport R-7

  Sport:
    Quadra Type-66 Avenger, Quadra Turbo-R V-Tech,
    Quadra Type-66, Quadra Type-66 Javelina, Quadra Type-66 Cthulhu,
    Mizutani Shion MZ2, Mizutani Shion, Mizutani Shion Coyote,
    Porsche 911 Turbo, Herrera Outlaw GTS,
    Yaiba ARV-Q340 Semimaru

  Truck:
    Thorton Mackinaw MTL1, Thorton Mackinaw Beast,
    Thorton Colby CX410 Butte, Kaukaz Bratsk U4020,
    Militech Hellhound

  Luxury:
    Villefort Alvarado, Villefort DeLeon,
    Chevillon Emperor Ragnar, Chevillon Thrax Jefferson

  Economy:
    Archer Quartz EC-T2, Archer Quartz Bandit, Archer Hella EC-D I360,
    Thorton Colby C240T, Thorton Galena G240, Thorton Galena Rattler,
    Thorton Merrimac, Villefort Cortes Valor, Villefort Columbus V340-F,
    Makigai MaiMai P126, Makigai Tanishi, Mahir Supron FS3,
    Mizutani Hozuki

  Bike:
    Brennan Apollo, Scorpion's Apollo, Brennan Apollo 650-S,
    ARCH Nazare, Jackie's ARCH, Jackie's ARCH (Tuned),
    ARCH Nazare Itsumade, ARCH Nazare Racer, ARCH Nazare Kobold,
    ARCH Nazare Malina-Mobile, Yaiba Kusanagi CT-3X,
    Yaiba Kusanagi Peacekeeper, Yaiba Kusanagi Akashita,
    Yaiba ASM-R250 Muramasa


PROFILES

  Save/Load profiles to keep multiple tuning setups.
  Apply To All copies your current vehicle's tuning ratios across all vehicles.


COMPATIBILITY

  Other vehicle mods that modify the same TweakDB flats (e.g. True Grip) will
  conflict -- whichever loads last wins. For best results, disable other vehicle
  handling mods while using this.


TECHNICAL

  - Modifies TweakDB values in memory at runtime (SetFlat + Update)
  - No game file replacement, no archive patching, no save risk
  - Single Lua file, no external dependencies beyond CET
  - Uses confirmed post-2.0 TweakDB property names
  - Vehicle TweakDB IDs verified against Red Modding Wiki
  - Slider UI runs inside CET ImGui; stock values are read from live TweakDB


AUTHOR

  indigo-nx
