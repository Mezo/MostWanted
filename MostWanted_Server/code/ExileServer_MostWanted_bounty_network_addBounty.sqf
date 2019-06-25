/*
*
*  ExileServer_MostWanted_bounty_network_addBounty.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_sessionID","_package","_victimNetID","_reason","_moneyAmount","_respectPercentage","_newBounty","_victimObject","_clientObject","_victimImmunity","_victimsBounty","_bountyLock","_clientMoney","_clientRespect","_respectChange","_newClientMoney","_newClientRespect"];
_sessionID = _this select 0;
_package = _this select 1;
_victimNetID = _package select 0;
_reason = _package select 1;
_moneyAmount = parseNumber(_package select 2);
_respectPercentage = parseNumber(_package select 3);
_newBounty = [];
try
{
    _victimObject = objectFromNetID _victimNetID;
    _clientObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _victimObject) then
    {
        throw "player's object is null!";
    };
    if (isNull _clientObject) then
    {
        throw "Player's object is null!";
    };
    if !(alive _victimObject) then
    {
        throw "Victim just died! Please try again later";
    };
    if !(alive _clientObject) then
    {
        throw "Player is dead, but is still trying to apply bounties!";
    };
    _victimImmunity = _victimObject getVariable ["ExileBountyImmunity",false];
    if (_victimImmunity) then
    {
        throw "Victim has immunity!";
    };
    _victimsBounty = _victimObject getVariable ["ExileBounty",[]];
    if !(_victimsBounty isEqualTo []) then
    {
        throw "Player already has a bounty on them!";
    };
    _bountyLock = _clientObject getVariable ["ExileBountyLock",true];
    if (_bountyLock isEqualTo true) then
    {
        throw "You already have a bounty set on someone!";
    };
    if !(_moneyAmount isEqualType 0) then
    {
        throw "Please Select A Bounty Price";
    };
    if !(_moneyAmount) then
    {
        throw "Please Select A Bounty Price";
    };
    if !(_respectPercentage) then
    {
        throw "Please Select A Bounty Price";
    };
    if (_moneyAmount < 0) then
    {
        throw "Requested amount cannot be less than zero!";
    };
    _clientMoney = _clientObject getVariable ["ExileMoney",0];
    _clientRespect = _clientObject getVariable ["ExileScore",0];
    if (_moneyAmount > _clientMoney) then
    {
        throw "You don't have enough money!";
    };
    _respectChange = round(_clientRespect * (_respectPercentage / 100));
    _newClientMoney = _clientMoney - _moneyAmount;
    if (_respectChange < 0) then
    {
        _newClientRespect = _clientRespect + _respectChange;
    }
    else
    {
        _newClientRespect = _clientRespect - _respectChange;
    };
    _clientObject setVariable ["ExileMoney", _newClientMoney,true];
    _clientObject setVariable ["ExileScore",_newClientRespect];
    format["setPlayerMoney:%1:%2", _newClientMoney, _clientObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
    format["setAccountScore:%1:%2", _newClientRespect, (getPlayerUID _clientObject)] call ExileServer_system_database_query_fireAndForget;
    _moneyAmount = _moneyAmount - (_moneyAmount * 0.1);
    _newBounty = [_reason,_moneyAmount,name _clientObject,getPlayerUID _clientObject];
    format ["setBounty:%1:%2",_newBounty,getPlayerUID _victimObject] call ExileServer_system_database_query_fireAndForget;
    _victimObject setVariable ["ExileBounty",_newBounty];
    _clientObject setVariable ["ExileBountyLock",true,true];
    format ["updateBountyLock:%1:%2",1,getPlayerUID _clientObject] call ExileServer_system_database_query_fireAndForget;
    MostWanted_MasterBountyList pushBack [name _victimObject,getPlayerUID _victimObject,_reason,_moneyAmount,name _clientObject,getPlayerUID _clientObject];
    MostWanted_MasterBountyList = [MostWanted_MasterBountyList, [], {_x select 2}, "ASCEND", {true}] call BIS_fnc_sortBy;
    [_sessionID,"addBountyResponse",[str(_newClientMoney),str(_newClientRespect)]] call ExileServer_system_network_send_to;
    ["newBountyNotification",[MostWanted_MasterBountyList,str(_moneyAmount)]] call ExileServer_system_network_send_broadcast;
}
catch
{
    _exception call ExileServer_MostWanted_util_log;
    [_sessionID, "toastRequest", ["ErrorTitleAndText", ["Most Wanted", _exception]]] call ExileServer_system_network_send_to;
};
true
