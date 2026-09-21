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


UNINSTALL

  Delete the VehiclePhysicsConfig folder from CET mods.
  No game files are modified -- everything reverts to stock instantly.


HOW TO USE

  1. Start the game and open the CET overlay
  2. Find "Ultimate Vehicle Tuning"
  3. Select a vehicle (or click Use current vehicle while driving).
  4. Select an editable tune, or use Save As to clone Vanilla or Modded default.
  5. Adjust a slider or checkbox. Its value applies when editing finishes.
     With Auto-save enabled it is also written to that vehicle's active tune.
  6. Exit and get back into the vehicle to load changed physics. Recycle Last
     Vehicle is an optional shortcut after exiting and may fail during quests
     or in restricted areas.

  Values that differ from vanilla are marked * and highlighted green. Unsaved
  values are additionally marked ! and highlighted amber. Expand "Apply log"
  to confirm TweakDB writes with [OK] or [MISS].

  Every tune belongs to one vehicle. Loading, saving, resetting, or editing a
  tune never changes another vehicle.

  Each vehicle's selected tune and the global Auto-save setting are remembered
  in metadata.json.


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


TUNES

  Tune files are stored under:
    tunes/<vehicle-record-id>/<tune-name>.json

  Every vehicle has its own tune dropdown. Vanilla is captured from the live
  TweakDB before this mod applies any tune and exists in memory for the current
  session only. Modded default is the read-only tune generated from that
  vehicle's entry in config_base.json.

  Use Save As to clone either read-only starting point into an editable tune.
  Editable saved tunes can be removed with Delete saved tune; a confirmation
  prompt is shown before the file is permanently deleted. Vanilla and Modded
  default cannot be deleted.
  With Auto-save disabled, changes still apply live but remain in memory until
  Save is clicked. Vehicle or tune switching is blocked while changes are
  unsaved; use Save or Discard first.

  On CET reload/shutdown, the mod restores its captured live baseline before
  the Lua state is discarded. This keeps the next initialization from treating
  an already-applied tune as Vanilla. Mounted custom vehicles are captured and
  added to the selector when first encountered.

  Legacy config.json, stock.json, and stock_runtime.json are not used by the
  vehicle-specific tune system.


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
  - Per-vehicle tunes and metadata stay inside this mod's base directory
  - Slider UI runs inside CET ImGui; Vanilla values are session-only live captures
