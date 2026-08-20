<p align="center">
  <img src=".github/assets/topimage.png" alt="MFCE top logo">
</p>

# Mario Forever: Community Edition

[![Godot][godot-img]][godot-link]
[![License][license-img]](LICENSE)
[![Discord][discord-img]][discord-link]

A community remake of [Mario Forever][mf-wiki] by Buziol Games, rebuilt in [Godot 4][godot-link] on [Thunder Engine](https://github.com/Thunder-Engine-Dev/thunder-engine).

Free, non-commercial fan project by [Meteo Dream](https://github.com/meteo-dream). Not affiliated with Nintendo or Buziol Games.

## Features

- Full story campaign across Worlds 1 to 8, based on the original Mario Forever
- All extra content from the original Mario Forever up to v6.0 (Hardcore, Human Laboratory, Lost Map, Funny Tanks, World of Stupidity, etc.)
- Expert Mode and custom extra worlds (Syzxchulun worlds, Mario Forever Flash, World U, Human Lab 2, Squario, and more)
- Custom character skins, including a built-in skin editor
- Tweaks menu for authenticity and challenge options (checkpoints, coyote time, soundtrack variants, harder story level design, progress continues, and many others)
- Keyboard and gamepad support
- Windows and Linux builds

## Interim builds

Windows and Linux interim builds are compiled by the GitHub Actions workflow on each commit and you can download them [here](https://nx.wtf/s/2GqcQ). These are not stable releases.

## Running from source

This project targets a [patched build of **Godot 4.7.1-rc2**](https://nx.wtf/s/aVtZ?path=Software%2FGodot-TE) with rendering fixes. You will run into problems if you use other Godot versions, including official builds. You can [compile that fork yourself](https://github.com/Thunder-Engine-Dev/godot-te/tree/4.7) if needed.

Thunder Engine is included as a git submodule. Clone recursively:

```bash
git clone --recursive https://github.com/meteo-dream/mf-community-edition.git
cd mf-community-edition
```

If you already cloned without submodules:

```bash
git submodule update --init --recursive
```

Open `project.godot` in Godot, wait for the import to finish, then reload the project (Project -> Reload Current Project). Reload is needed for the GDExtensions to load properly.

Saves, settings and logs go to `MeteoDream/Mario Forever Community Edition`. Where that folder sits depends on the OS; see [Godot docs](https://docs.godotengine.org/en/4.7/tutorials/io/data_paths.html#accessing-persistent-user-data-user).
Change the path in Project Settings if needed.

### Exporting to Windows and Linux

Windows and Linux x86-64 exports are supported. Download the [templates](https://nx.wtf/s/aVtZ?path=Software%2FGodot-TE) and point the Export Manager at them.
Pick the Windows or Linux preset and click Export Project.

### Exporting to Other Platforms

If you want to port the game to other platforms or architectures, compile a matching release template from [this Godot fork](https://github.com/Thunder-Engine-Dev/godot-te/tree/4.7). Stock templates should not be used with MFCE or any Thunder Engine game.

You will also need to compile [the music library](https://github.com/Thunder-Engine-Dev/godot-openmpt) for the desired architecture and add it to [openmpt.gdextension](addons/godot-openmpt/openmpt.gdextension).

`libleaderboards` is a closed-source library for the Mario Minix leaderboards. Don't use it with a modified project. The game runs fine without it.

You can also bundle the [MFCE skin editor](https://github.com/meteo-dream/MFCE-skin-creator/) (Godot 4.7-stable, MIT) and Heavenice's [revamped Mario skin](https://github.com/meteo-dream/bundled-mfce-skins).

## Customizing the engine

Don't edit `engine/` in place; it's a submodule, and those changes vanish when it updates. To customize something from the engine, copy or extend the scene or script out of `engine/` and override it in this project. If there's a problem in the engine, open a pull request on [Thunder Engine](https://github.com/Thunder-Engine-Dev/thunder-engine).

## Community

- Discord: [https://discord.gg/VwgV6GmwXv](https://discord.gg/VwgV6GmwXv)
- Forum (English): [https://marioforever.space](https://marioforever.space)
- Forum (Chinese): [https://marioforever.net](https://marioforever.net)
- Download MF games: [https://download.marioforever.net/mf-games.html](https://download.marioforever.net/mf-games.html)
- Thunder Engine docs: [engine/README.md](engine/README.md)

## Credits

- **Mario Forever** - original game by Buziol Games
- **Thunder Engine** - [Thunder Engine contributors](https://github.com/Thunder-Engine-Dev/thunder-engine)
- **Community Edition** - Meteo Dream and contributors
- **Godot Engine** - [godotengine.org](https://godotengine.org)

See the in-game credits for the full list.

## Disclaimer

Mario, Luigi, and other Nintendo characters, graphics, and music are owned by Nintendo. Mario Forever is a fangame by Buziol Games. This project is free fan work, not made for profit. Commercial use is not allowed.

## License

Source code for Community Edition is licensed under the [BSD 3-Clause License](LICENSE). Copyright (c) 2024-2026, Meteo Dream and Contributors.

The [engine/](engine/) submodule is licensed separately under the [BSD 2-Clause License](engine/LICENSE). Nintendo and Buziol assets remain the property of their respective owners.

[godot-img]: https://img.shields.io/badge/Godot-4.7-478cbf?logo=godot-engine&logoColor=white
[godot-link]: https://godotengine.org
[license-img]: https://img.shields.io/badge/license-BSD--3--Clause-green.svg
[discord-img-]: https://img.shields.io/badge/Discord-5865F2?logo=discord&logoColor=white
[discord-img]: https://img.shields.io/discord/818109948490809344?logo=discord&logoColor=white&color=5865F2
[discord-link]: https://discord.gg/VwgV6GmwXv
[mf-wiki]: https://en.wiki.marioforever.net/wiki/Mario_Forever
[workflow-img]: https://img.shields.io/github/actions/workflow/status/meteo-dream/mf-community-edition/workflows%2Fgodot-ci.yml
