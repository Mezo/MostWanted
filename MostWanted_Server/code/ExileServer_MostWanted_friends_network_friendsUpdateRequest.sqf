/*
*
*  ExileServer_MostWanted_friends_network_friendsUpdateRequest.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_sessionID","_package","_clientfriends","_groupNetId","_PlayerObj","_group","_groupUnits","_newFriends","_playerUIDs","_unit","_uid"];
_sessionID = _this select 0;
_package = _this select 1;
_clientfriends = _package select 0;
_groupNetId = _package select 1;
_PlayerObj = _sessionID call ExileServer_system_session_getPlayerObject;
_group = (groupFromNetId _groupNetId);
_groupUnits = units _group;
_newFriends = _clientFriends;
_playerUIDs = [];
{
    _unit = _x;
    _uid = getPlayerUID _unit;
    _playerUIDs pushBackUnique _uid;
    {
        _newFriends pushBackUnique _x;
    } foreach _playerUIDs;
} foreach _groupUnits;
_PlayerObj setVariable ["ExileBountyFriends",_newFriends,true];
format["updateFriends:%1:%2",_newFriends,(getPlayerUID _PlayerObj)] call ExileServer_system_database_query_fireAndForget;
_newFriends = nil;
