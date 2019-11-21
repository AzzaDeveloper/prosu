# prosu!
*v0.0.31*

prosu! is [osu!](https://osu.ppy.sh), but written in [Processing](https://processing.org/).

Should you have any questions regarding this project, feel free to hit me up through my discord: **Azza#7631**

## How to install and build

Clone the repo to anywhere you like.

Run `[path-to-processing]/processing-java.exe --sketch=[path-to-downloaded-folder] --run`.

No releases yet due to how buggy this is.

All lines of code in here is carefully commented so even the newest programmer can understand whats going on.

Configure your settings in `c_config.pde`

The current version **DOES NOT** work with sliders and should be fixed soon. Maps with sliders will load, just no sliders will appear.

This is a side project written for fun and should work with all operating systems.

## File naming explanation
- `c_` - **Control**. Used for controlling the game (states, directories...)
- `f_` - **Functions**.
- `O_` - **Objects**.
- `s_` - **Screen**. What the screen displays.
## This project uses:
- [Minim](http://code.compartmental.net/minim/) for handling sound.
- [Visual Studio Code](https://code.visualstudio.com/) as the main IDE.
- [Monokai Pro](https://monokai.pro/) for color theme.
- [Rafis HDDT Skin (modified)](https://skins.osuck.net/index.php?newsid=166) for the default skin.

---
# Changelog
**v0.0.33**
- Fixed crash after finishing second song
- Added cursor

**v0.0.32**
- Fixed memory leak
- Song now ends properly

**v0.0.31**
- Optimized song selection.
- Optimized code and made easier to read :D
- Added license.

**v0.0.3**
- Song selection screen! Now support multiple songs folder in, well, the Songs folder.
- Now you can load your favourite songs. That's it. Sliders are next.

**v0.0.2**
- Combo numbers!
- Window title now properly represent playing beatmap.
- Now splitted into multiple files for easier code reading.