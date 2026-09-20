Ultimate Vehicle Tuning v1.3
CET UI restored locally — no desktop exe required.

In-game CET overlay for tuning vehicle physics in Cyberpunk 2077.
Pick a vehicle, adjust a control, then resummon or recycle your ride.


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
      You should see a window titled "Ultimate Vehicle Tuning"
      with a vehicle dropdown and per-vehicle physics controls.
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
  2. Find "Ultimate Vehicle Tuning"
  3. Select an editable config, or use Save As to clone a read-only baseline.
  4. Select a vehicle (or click Use current vehicle while driving).
  5. Adjust a slider or checkbox. Its value applies when editing finishes.
     With Auto-save enabled it is also written to the active config immediately.
  6. Exit and get back into the vehicle to load changed physics. Recycle Last
     Vehicle is an optional shortcut after exiting and may fail during quests
     or in restricted areas.

  Values that differ from vanilla are marked * and highlighted green. Unsaved
  values are additionally marked ! and highlighted amber. Expand "Apply log"
  to confirm TweakDB writes with [OK] or [MISS].

  The Speed-Sensitive Steering panel includes a button that copies that
  section's exact absolute values to every vehicle.
  Existing tunes in all other sections are preserved.

  The last selected config and Auto-save setting are remembered in metadata.json.


PARAMETERS

  The per-vehicle editor includes mass and drag; center of mass and three-axis
  inertia; steering and speed-sensitive steering; slip-angle, slip-ratio, wheel
  load and contact behavior; front/rear basic and advanced suspension; brakes;
  engine response and individual gears; drivetrain/brake roles; wheel geometry;
  rotation/drift limiting; dynamic rear grip; handbrake, traction, acceleration,
  downforce and in-air helpers; burnout/launch behavior; bike dynamics; pitch,
  yaw and roll air control; water/buoyancy behavior; and front/rear flat-tire
  simulation.

  Speed thresholds are shown in metres per second (10 m/s = 36 km/h).
  Every slider has a fixed absolute range shared by all vehicles. Values start
  at each vehicle's captured vanilla defaults. The Reset button beside an
  individual control restores and immediately applies that control's vanilla
  value.

  Wheel Contact Model and the sections below it are hidden by default. Use the
  Show advanced checkbox between the basic and advanced sections to display them.


SUPPORTED VEHICLES

  The complete official player-vehicle roster is read from the installed
  game's Vehicle.vehicle_list.list at runtime, including expansion and game
  update vehicles. A valid mounted custom vehicle can also be selected with
  Use current vehicle.


PROFILES

  The config dropdown discovers valid config*.json files in this mod folder.
  config.json is the default editable preset. Use Save As to create another
  editable preset without changing the source preset.

  Vanilla (stock.json) and config_base.json are read-only starting points.
  Select either one to preview/apply it, then use Save As before editing.

  With Auto-save disabled, changes still apply live but remain in memory until
  Save is clicked. Preset switching is blocked while changes are unsaved; use
  Save or Discard first.

  stock.json is never modified. Values for newly added official or mod vehicles
  are captured into stock_runtime.json and used as their read-only reset
  baseline. Mounted custom vehicles are added to the selector automatically.


COMPATIBILITY

  Other vehicle mods that modify the same TweakDB flats (e.g. True Grip) will
  conflict -- whichever loads last wins. For best results, disable other vehicle
  handling mods while using this.


TECHNICAL

  - Modifies TweakDB values in memory at runtime (SetFlat + Update)
  - No game file replacement, no archive patching, no save risk
  - Single Lua file, no external dependencies beyond CET
  - Uses confirmed post-2.0 TweakDB property names
  - Official vehicle TweakDB IDs come from the installed game's player list
  - Presets and metadata stay inside this mod's base directory
  - Slider UI runs inside CET ImGui; stock values are read from live TweakDB
