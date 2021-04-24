# qb-hud
Advanced Hud for QB-Core Framework :heart: :shield: :pizza: :milk_glass: 

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)

## Screenshots
![Default](https://imgur.com/Yn93lfF.png)
![Vehicle](https://imgur.com/MdtgGbL.png)

## Features
- Circle minimap while driving
- Health, armor, hunger, thirst, stress and stamina display
- Integrated stress system and side effects
- /cash and /bank commands to show your balances

## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure qb-core
ensure qb-hud
```

## Configuration
```
Config = {}
Config.Money = {}
Config.Money.ShowConstant = true -- true: Shows money all the time / false: Shows money only while transactions
Config.MinimumStress = 50 -- Minimum stress for side effects
Config.MinimumSpeed = 250 -- Minimum speed required to gain stress
```
