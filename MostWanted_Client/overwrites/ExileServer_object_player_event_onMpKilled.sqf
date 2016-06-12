/**
 * ExileServer_object_player_event_onMpKilled
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_victim","_killer","_victimPosition","_addDeathStat","_addKillStat","_normalkill","_killerRespectPoints","_fragAttributes","_player","_grpvictim","_grpkiller","_log","_lastVictims","_victimUID","_vehicleRole","_vehicle","_lastKillAt","_killStack","_distance","_distanceBonus","_flagNextToKiller","_homieBonus","_flagNextToVictim","_raidBonus","_overallRespectChange","_newKillerScore","_killMessage","_newKillerFrags","_newVictimDeaths"];
if (!isServer || hasInterface) exitWith {};
_victim = _this select 0;
_killer = _this select 1;
if( isNull _victim ) exitWith {};
_victim setVariable ["ExileDiedAt", time];
if !(isPlayer _victim) exitWith {};
_victimPosition = getPos _victim;
format["insertPlayerHistory:%1:%2:%3:%4:%5", getPlayerUID _victim, name _victim, _victimPosition select 0, _victimPosition select 1, _victimPosition select 2] call ExileServer_system_database_query_fireAndForget;
format["deletePlayer:%1", _victim getVariable ["ExileDatabaseId", -1]] call ExileServer_system_database_query_fireAndForget;
_victim setVariable ["ExileIsDead", true];
_victim setVariable ["ExileName", name _victim, true];
_victim call ExileServer_object_flies_spawn;

_addDeathStat = true;
_addKillStat = true;
_normalkill = true;
_killerRespectPoints = [];
_fragAttributes = [];
if (_victim isEqualTo _killer) then
{
	["systemChatRequest", [format["%1 commited suicide!", (name _victim)]]] call ExileServer_object_player_event_killFeed;
}
else
{
	if (vehicle _victim isEqualTo _killer) then
	{
		["systemChatRequest", [format["%1 crashed to death!", (name _victim)]]] call ExileServer_object_player_event_killfeed;
	}
	else
	{
		if (isNull _killer) then
		{
			["systemChatRequest", [format["%1 died for an unknown reason!", (name _victim)]]] call ExileServer_object_player_event_killfeed;
		}
		else
		{
			_player = objNull;
			if (isPlayer _killer) then
			{
				if ((typeOf _killer) isEqualTo "Exile_Unit_Player") then
				{
					_player = _killer;
				}
				else
				{
					_uid = getPlayerUID _killer;
					{
						if ((getPlayerUID _x) isEqualTo _uid) exitWith
						{
							_player = _x;
						};
					}
					forEach allPlayers;
				};
			}
			else
			{
				if (isUAVConnected _killer) then
				{
					_player = (UAVControl _killer) select 0;
				};
			};
			if !(isNull _player) then
			{
				_killer = _player;
				// Most-Wanted

		        _bounty = _victim getVariable ["ExileBounty",[]];
				diag_log format["Victim's bounty: %1",_bounty];
		        if (count(_bounty) > 0) then
		        {
		            _contract = _killer getVariable ["ExileBountyContract",[]];
					_friends = _killer getVariable ["ExileBountyFriends",[]];
					diag_log format["Killer's bounty contract:%1",_contract];
					if !(_contract in _friends) then
					{
		            	if ((_contract select 1) isEqualTo (getPlayerUID _victim)) then
		            	{
							diag_log "Killer has a contract";
	                		[_victim,_killer] call ExileServer_MostWanted_bounty_targetKilled;
						};
		        	};
				};

		        // Most-Wanted
				if (_victim getVariable ["ExileIsBambi", false]) then
				{
					_addKillStat = false;
					_addDeathStat = false;
					_fragAttributes pushBack "Bambi Slayer";
					_killerRespectPoints pushBack ["BAMBI SLAYER", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "bambi"))];
				}
				else
				{
					_grpvictim = _victim getVariable ["ExileGroup",(group _victim)];
					_grpkiller = _killer getVariable ["ExileGroup",(group _killer)];
					if((_grpvictim isEqualTo _grpkiller)&&!(ExileGraveyardGroup isEqualTo _grpkiller))then
					{
						_log = format["%2 was team-killed by %1!", (name _killer), (name _victim)];
						["systemChatRequest", [_log]] call ExileServer_object_player_event_killfeed;
						_fragAttributes pushBack "Teamkill";
						_killerRespectPoints pushBack ["TEAMKILL", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "friendlyFire"))];
						_normalkill = false;
					}
					else
					{
						_lastVictims = _killer getVariable ["ExileLastVictims", ["0", "1", "2"]];
						_victimUID = _victim getVariable ["ExileOwnerUID", getPlayerUID _victim];
						if (_victimUID in _lastVictims) then
						{
							_log = format["%1 keeps killing %2!", (name _killer), (name _victim)];
							["systemChatRequest", [_log]] call ExileServer_object_player_event_killfeed;
							_fragAttributes pushBack "Domination";
							_killerRespectPoints pushBack ["DOMINATION BONUS", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "domination"))];
						}
						else
						{
							_lastVictims deleteAt 0;
							_lastVictims pushBack _victimUID;
							_killer setVariable ["ExileLastVictims", _lastVictims];
							if ((vehicle _killer) isEqualTo _killer) then
							{
								if ((currentWeapon _killer) isEqualTo "Exile_Melee_Axe") then
								{
									_fragAttributes pushBack "Humiliation";
									_killerRespectPoints pushBack ["HUMILIATION", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "humiliation"))];
								}
								else
								{
									_killerRespectPoints pushBack ["ENEMY FRAGGED", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "standard"))];
								};
							}
							else
							{
								_vehicleRole = assignedVehicleRole _killer;
								switch (toLower (_vehicleRole select 0)) do
								{
									case "driver":
									{
										_vehicle = vehicle _killer;
										switch (true) do
										{
											case (_vehicle isKindOf "ParachuteBase"):
											{
												_fragAttributes pushBack "Chute > Chopper";
												_killerRespectPoints pushBack ["CHUTE > CHOPPER", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "chuteGreaterChopper"))];
											};
											case (_vehicle isKindOf "Air"):
											{
												_fragAttributes pushBack "Big Bird";
												_killerRespectPoints pushBack ["BIG BIRD", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "bigBird"))];
											};
											default
											{
												_fragAttributes pushBack "Road Kill";
												_killerRespectPoints pushBack ["ROAD KILL", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "roadKill"))];
											};
										};
									};
									case "turret":
									{
										if ((currentWeapon _killer) isKindOf "StaticWeapon") then
										{
											_fragAttributes pushBack "Let it Rain";
											_killerRespectPoints pushBack ["LET IT RAIN", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "letItRain"))];
										}
										else
										{
											_fragAttributes pushBack "Mad Passenger";
											_killerRespectPoints pushBack ["MAD PASSENGER", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "passenger"))];
										};
									};
									default
									{
										_fragAttributes pushBack "Mad Passenger";
										_killerRespectPoints pushBack ["MAD PASSENGER", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "passenger"))];
									};
								};
							};
						};
					};
				};
				if (_addKillStat) then
				{
					if(_normalkill)then
					{
						_lastKillAt = _killer getVariable ["ExileLastKillAt", 0];
						_killStack = _killer getVariable ["ExileKillStack", 0];
						_killStack = _killStack + 1;
						if (isNil "ExileServerHadFirstBlood") then
						{
							ExileServerHadFirstBlood = true;
							_fragAttributes pushBack "First Blood";
							_killerRespectPoints pushBack ["FIRST BLOOD", getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "firstBlood")];
						}
						else
						{
							if (time - _lastKillAt < (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "killStreakTimeout"))) then
							{
								_fragAttributes pushBack (format ["%1x Kill Streak", _killStack]);
								_killerRespectPoints pushBack [(format ["%1x KILL STREAK", _killStack]), _killStack * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "killStreak"))];
							}
							else
							{
								_killStack = 1;
							};
						};
						_killer setVariable ["ExileKillStack", _killStack];
						_killer setVariable ["ExileLastKillAt", time];
					};
					_distance = floor(_victim distance _killer);
					_fragAttributes pushBack (format ["%1m Distance", _distance]);
					_distanceBonus = (floor ((_distance min 3000) / 100)) * getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "per100mDistance");
					if (_distanceBonus > 0) then
					{
						_killerRespectPoints pushBack [(format ["%1m RANGE BONUS", _distance]), _distanceBonus];
					};
					_flagNextToKiller = _killer call ExileClient_util_world_getTerritoryAtPosition;
					if !(isNull _flagNextToKiller) then
					{
						if ((getPlayerUID _killer) in (_flagNextToKiller getVariable ["ExileTerritoryBuildRights", []])) then
						{
							_homieBonus = getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "homie");
							if (_homieBonus > 0) then
							{
								_fragAttributes pushBack "Homie";
								_killerRespectPoints pushBack ["HOMIE BONUS", _homieBonus];
							};
						};
					};
					_flagNextToVictim = _victim call ExileClient_util_world_getTerritoryAtPosition;
					if !(isNull _flagNextToVictim) then
					{
						if ((getPlayerUID _victim) in (_flagNextToVictim getVariable ["ExileTerritoryBuildRights", []])) then
						{
							_raidBonus = getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "raid");
							if (_raidBonus > 0) then
							{
								_fragAttributes pushBack "Raid";
								_killerRespectPoints pushBack ["RAID BONUS", _raidBonus];
							};
						};
					};
				};
				_overallRespectChange = 0;
				{
					_overallRespectChange = _overallRespectChange + (_x select 1);
				}
				forEach _killerRespectPoints;
				_newKillerScore = _killer getVariable ["ExileScore", 0];
				_newKillerScore = _newKillerScore + _overallRespectChange;
				_killer setVariable ["ExileScore", _newKillerScore];
				format["setAccountScore:%1:%2", _newKillerScore,getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
				if(_normalkill)then
				{
					_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];
					if !(count _fragAttributes isEqualTo 0) then
					{
						_killMessage = _killMessage + " (" + (_fragAttributes joinString ", ") + ")";
					};
					["systemChatRequest", [_killMessage]] call ExileServer_object_player_event_killfeed;
					if (_addKillStat isEqualTo true) then
					{
						_newKillerFrags = _killer getVariable ["ExileKills", 0];
						_newKillerFrags = _newKillerFrags + 1;
						_killer setVariable ["ExileKills", _newKillerFrags];
						format["addAccountKill:%1", getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
					};
				};
				[_killer, "showFragRequest", [_killerRespectPoints]] call ExileServer_system_network_send_to;
				_killer call ExileServer_object_player_sendStatsUpdate;
			}
			else
			{
				["systemChatRequest", [format["%1 was killed by an NPC! (%2m Distance)", (name _victim), floor(_victim distance _killer)]]] call ExileServer_object_player_event_killfeed;
			};
		};
	};
};
if (_addDeathStat isEqualTo true) then
{
	_newVictimDeaths = _victim getVariable ["ExileDeaths", 0];
	_newVictimDeaths = _newVictimDeaths + 1;
	_victim setVariable ["ExileDeaths", _newVictimDeaths];
	format["addAccountDeath:%1", getPlayerUID _victim] call ExileServer_system_database_query_fireAndForget;
	_victim call ExileServer_object_player_sendStatsUpdate;
};
[_victim] joinSilent ExileGraveyardGroup;
true
