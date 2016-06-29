# Most Wanted: An Exile Bounty Mod

### Features
* Exile security
* Made with Exile's UI in mind
* Bounty contracts require players to pick and choose targets that they go after. Anyone is free game, but only one person can claim the bounty.
* Completed contracts allow players to hold onto contracts before cashing them out.
* Friend's list keeps players from setting bounties on their friends.
* Immunity protects players from bounties being set on them after they have been killed by a contracted killer.

### Installation
#### extDB
1. Copy `MostWanted-SQL.sql` into your favorite mySQL viewer's query window and run it.
2. Confirm you have a `bounties` table.

#### Server
1. PBO `MostWanted_Server` and place in `@ExileServer\addons` folder.
2. Copy the contents of `MostWanted-extDB.ini` into your `@ExileServer\extDB\sql_custom_v2\exile.ini` file at the bottom.

#### Client
1. Copy `MostWanted_Client` folder into the root of your `exile.MAPNAME` mission folder.
2. In your `init.sqf` or `initPlayerLocal.sqf`, add `[] execVM "MostWanted_Client\MostWanted_Init.sqf";`
3. In your `description.ext`, add

            #include "MostWanted_Client\Dialog\MostWantedDefines.hpp"
            #include "MostWanted_Client\Dialog\MostWantedDialog.hpp"
4. In your `config.cpp`, add at the top, `#include "MostWanted_Client\CfgMostWanted.cpp"`
5. `Notifications.hpp` and `NetworkMessages.hpp` both will depend on your set up.

    If you **ALREADY** have `class CfgHints` or `class CfgNetworkMessages` **ANYWHERE** in your `description.ext` or `config.cpp` in your exile.MAPNAME folder:

    Add `#include "MostWanted_Client\NetworkMessages.hpp` in `class CfgNetworkMessages`

    Add `#include "MostWanted_Client\Notifications.hpp` in `class CfgHints` so it looks kind of like what is below.

    If you don't have `class CfgHints` or `class CfgNetworkMessages`, in your `config.cpp`, add this at the top. 

        class CfgHints
        {
            #include "MostWanted_Client\Notifications.hpp"
        };

        class CfgNetworkMessages
        {
            #include "MostWanted_Client\NetworkMessages.hpp"
        };
6. In `config.cpp`, inside the `class CfgInteractionMenus` add:

        class Bounties
        {
            targetType = 2;
            target = "Exile_Trader_Office";

            class Actions
            {
                class MostWanted: ExileAbstractAction
                {
                    title = "Most Wanted";
                    condition = "true";
                    action = "createDialog 'MostWantedDialog';";
                };
            };
        };
7. In `config.cpp`, inside the `class CfgExileCustomCode` add:

        ExileClient_gui_xm8_showPartySlides = "MostWanted_Client\overwrites\ExileClient_gui_xm8_showPartySlides.sqf";
        ExileServer_object_player_createBambi = "MostWanted_Client\overwrites\ExileServer_object_player_createBambi.sqf";
        ExileServer_object_player_database_load = "MostWanted_Client\overwrites\ExileServer_object_player_database_load.sqf";
        ExileServer_object_player_event_onMpKilled = "MostWanted_Client\overwrites\ExileServer_object_player_event_onMpKilled.sqf";
        ExileServer_system_network_event_onPlayerConnected = "MostWanted_Client\overwrites\ExileServer_system_network_event_onPlayerConnected.sqf";

    1. If you already have overwrites for these files, make sure to merge them.

8. You are done! Head on down to configuration.

### Configuration
Most Wanted has a few configuration options, they are inside `MostWanted_Client\CfgMostWanted.hpp`, please review these as they control the functionality.


### Update to version 1.5 for Exile 0.9.8
1. PBO MostWanted_Server and replace the one in your `@ExileServer\addons\` folder with it. 
2. In your mission folder:
	1. Replace EVERY file in the `MostWanted_Client\functions\` folder with the ones from the same folder on the github. 
	2. Update the overwrites in `MostWanted_Client\overwrites\` folder with the ones from the same folder on the github.
2. Remove overwrite line for ExileServer_system_network_dispatchIncomingMessage.sqf in config.cpp (Exile has this by default now) 
	1. After this, you can delete this file from your mission folder. 

### SERVER OWNERS, PLEASE READ
A note on exploiting. A lot of time and effort went into making sure exploiting was difficult and a pain in the ass to do with this script. If you find an exploit or notice players finding exploits, **DO NOT POST THEM ON THE EXILE FORUMS OR IN THE TOPIC COMMENTS**.

To properly report these:

1. Private message [Taylor Swift](http://www.exilemod.com/profile/472-taylor-swift/) or [WolfkillArcadia](http://www.exilemod.com/profile/12063-wolfkillarcadia/)
2. Include, in detail, how to replicate the exploit, providing step by step instructions.
3. We will look into the proper way, if any, to keep it from happening. ArmA will be ArmA in some cases.
