/*
*
*  ExileServer_MostWanted_friends_network_handlePartyInvite.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_package","_groupNetId","_group","_groupUnits"];
_package = _this select 1;
_groupNetId = _package select 0;
_group = (groupFromNetId _groupNetId);
_groupUnits = units _group;
{
    [_x, "handlePartyInviteResponse",[""]] call ExileServer_system_network_send_to;
} foreach _groupUnits;
