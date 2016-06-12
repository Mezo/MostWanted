/*
*
*  ExileServer_MostWanted_initalize.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_bountyArray"];
MostWanted_MasterBountyList = [];
_bountyArray = "getAllBounties" call ExileServer_system_database_query_selectFull;
{
    if ((count (_x select 2)) > 0) then
    {
        MostWanted_MasterBountyList pushBack [_x select 0,_x select 1,((_x select 2) select 0),str((_x select 2) select 1),((_x select 2) select 2),((_x select 2) select 3)];
    };
}
forEach _bountyArray;
MostWanted_MasterBountyList = [MostWanted_MasterBountyList, [], {_x select 2}, "ASCEND", {true}] call BIS_fnc_sortBy;
"Master Bounty List has been compiled!" call ExileServer_MostWanted_util_log;
call ExileServer_MostWanted_system_resetFriends;
true
