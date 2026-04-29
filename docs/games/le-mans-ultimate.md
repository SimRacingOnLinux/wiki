---
title: Le Mans Ultimate
---

# Le Mans Ultimate

Le Mans Ultimate is an endurance racing simulator developed by Studio 397, based on the rFactor 2 engine.

## Compatibility

| Method | Status | Notes |
|--------|--------|-------|
| Steam (Native) | Not available | - |
| Steam (Proton) | Playable | Use custom proton, details [below](#proton-version) |

## Setup

### Proton version

Due to missing d2d1 implementation in Wine it is required to use JacKeTUs' 
Proton GE fork [https://github.com/JacKeTUs/proton-ge-custom](https://github.com/JacKeTUs/proton-ge-custom).

### VR

For VR support it is required to use srounce's fork of which re-uses JacKeTUs'
fork with some additional fixes for VR [https://github.com/srounce/proton-ge-custom](https://github.com/srounce/proton-ge-custom).

## Known issues

### Black screen after v1.3.2.0 update

Some users have reported being presented with a black screen after starting 
LMU. The fix for this is to modify the Settings.JSON file (under `<LMU-dir>/UserData/player/Settings.JSON`)
so that the value of `"WebUI bind"` is set to `"127.0.0.1"`.

```diff
- "WebUI bind": "localhost",
+ "WebUI bind": "127.0.0.1",
```
