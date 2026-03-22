# AlternatePerspective

An Alternate Start mod which delays the vanilla game's intro sequence at the players discretion.  
Instead of beginning the game as the infamous prisoner, the player spawn in a small dream realm which allows to choose an alternate starting option (including the vanilla intro sequence). This gives the player time to setup their mod setup, let scripts initialize and pre-equip them with whichever starting gear they desire to setup their adventure. Once the player is ready, they can choose an alternating starting sequence using a custom UI and leave the dream realm. The primary motivator behind this setup is to be much faster than the vanilla intro and any alternate start-scenarios and offer a more stable game start.

To begin the main quest line, the player can visit an explorable version of Helgen and sleep in Helgen's Inn, a special cutscene will trigger which allows to experience the vanilla intro sequence from the perspective of a civilian. Once Helgen is destroyed, the game leans back into the vanilla main quest, leaving any content outside of Helgen largely unaffected.

* Alternate Starting scenarios use a custom made user interface, the source code for which can be viewed [here](https://github.com/KrisV-777/AlternatePerspective-MessengerMenu).  
* The alternate starting options are expandable by using `.json` config files. Further information on this can be found in the [wiki](https://github.com/KrisV-777/Alternate-Perspective/wiki).
* Nexus Mods download mirror can be found [here](https://www.nexusmods.com/skyrimspecialedition/mods/50307).

# Requirements
## User
* [Fuz Ro D-oh - Silent Voice](https://www.nexusmods.com/skyrimspecialedition/mods/15109)
* [SKSE](https://skse.silverlock.org/)
* [JContainers SE](https://www.nexusmods.com/skyrimspecialedition/mods/16495)

## Developer
* [Creation Kit](https://store.steampowered.com/app/1946180/Skyrim_Special_Edition_Creation_Kit/)
  * (For your own sanity, [Creation Kit Platform Extended](https://www.nexusmods.com/skyrimspecialedition/mods/71371))
* [PowerShell](https://github.com/PowerShell/PowerShell/releases/latest)
* [Spriggit CLI](https://github.com/Mutagen-Modding/Spriggit)
* [SKSE](https://skse.silverlock.org/)
* [JContainers SE](https://www.nexusmods.com/skyrimspecialedition/mods/16495)

### Getting Started
```
git clone https://github.com/KrisV-777/Alternate-Perspective.git
cd Alternate-Perspective
./bootstrap.bat
```
