/*
*
*  ExileServer_MostWanted_bounty_targetKilled.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_victim","_killer","_victimBounty","_killerContract","_reward","_clientUID","_forEachIndex","_clientObject","_contract","_completedContracts"];
_victim = _this select 0;
_killer = _this select 1;
try
{
    if (isNull _killer) then
    {
        throw "Arma? You okay?";
    };
    _victimBounty = _victim getVariable ["ExileBounty",[]];
    _killerContract = _killer getVariable ["ExileBountyContract",[]];
    if !((_killerContract select 1) isEqualTo (getPlayerUID _victim)) then
    {
        throw "How? You don't have access to be rewarded for this bounty!";
    };
    if (_victimBounty isEqualTo []) then
    {
        throw "Victim doesn't have a bounty!";
    };
    _reward = -1;
    _clientUID = "";
    {
        if ((_x select 1) isEqualTo (getPlayerUID _victim)) then
        {
            _reward = _x select 3;
            _clientUID = _x select 5;
            MostWanted_MasterBountyList deleteAt _forEachIndex;
        };
    }
    forEach MostWanted_MasterBountyList;
    if (_reward isEqualTo -1) then
    {
        throw "Bounty was not found. Reward is equal to zero!";
    };
    _victim setVariable ["ExileBounty",[]];
    format ["setBounty:%1:%2",[],getPlayerUID _victim] call ExileServer_system_database_query_fireAndForget;
    format ["setImmunityTime:%1",getPlayerUID _victim]call ExileServer_system_database_query_fireAndForget;
    _clientObject = objNull;
    {
        _contract = _x getVariable ["ExileBountyContract",[]];
        if !(_contract isEqualTo []) then
        {
            if ((_contract select 1) isEqualTo (getPlayerUID _victim)) then
            {
                _x setVariable ["ExileBountyContract",[],true];
            };
        };
        if ((getPlayerUID _x) isEqualTo _clientUID) then
        {
            _clientObject = _x;
        };
    }
    forEach allPlayers;
    format ["nullContract:%2%1%2",(getPlayerUID _victim),"%"] call ExileServer_system_database_query_fireAndForget;
    _completedContracts = _killer getVariable ["ExileBountyCompletedContracts",[]];
    _completedContracts pushBack [name _victim,getPlayerUID _victim, str(_reward)];
    _killer setVariable ["ExileBountyCompletedContracts",_completedContracts];
    format["updateCompletedContracts:%1:%2",_completedContracts,getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
    if !(isNull _clientObject) then
    {
        _clientObject setVariable ["ExileBountyLock",false,true];
    };
    format ["updateBountyLock:%1:%2",0,getPlayerUID _clientObject] call ExileServer_system_database_query_fireAndForget;
    ["targetKilledResponse",[MostWanted_MasterBountyList,name _victim,getPlayerUID _killer,_completedContracts,str(_reward)]] call ExileServer_system_network_send_broadcast;
}
catch
{
    [_sessionID, "toastRequest", ["ErrorTitleAndText", ["Most Wanted", _exception]]] call ExileServer_system_network_send_to;
    _exception call ExileServer_MostWanted_util_log;
};
true
