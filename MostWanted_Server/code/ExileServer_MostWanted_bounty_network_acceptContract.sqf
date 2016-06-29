/*
*
*  ExileServer_MostWanted_bounty_network_acceptContract.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_sessionID","_package","_playerObject","_contract","_newContract","_found","_infoArray"];
_sessionID = _this select 0;
_package = _this select 1;
try
{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
    {
        throw "Wakey wakey ArmA";
    };
    _contract = _playerObject getVariable ["ExileBountyContract",""];
    if (_contract isEqualTo "") then
    {
        throw "Arma fucked up again!";
    };
    if (count(_contract) > 0) then
    {
        throw "You cannot have more than one contract!";
    };
    _newContract = _package select 0;
    _found = false;
    _infoArray = [];
    {
        if ((_x select 1) isEqualTo _newContract) then
        {
            if ((_x select 5) isEqualTo (getPlayerUID _playerObject)) then
            {
                throw "You cannot accept a contract for your own bounty!";
            };
            _infoArray = [(_x select 0),(_x select 1),(_x select 3)];
            _found = true;
        };
    }
    forEach MostWanted_MasterBountyList;
    if !(_found) then
    {
        throw "Bounty doesn't exist, cannot accept contract!";
    };
    if (_infoArray isEqualTo []) then
    {
        throw "Information about the bounty was lost! Blame ArmA";
    };
    _playerObject setVariable ["ExileBountyContract",_infoArray,true];
    format["updateContract:%1:%2",_infoArray,getPlayerUID _playerObject] call ExileServer_system_database_query_fireAndForget;
    [_sessionID, "toastRequest", ["SuccessTitleAndText", ["Most Wanted", "You have successfully accepted a contract"]]] call ExileServer_system_network_send_to;
}
catch
{
    [_sessionID, "toastRequest", ["ErrorTitleAndText", ["Most Wanted", _exception]]] call ExileServer_system_network_send_to;
    _exception call ExileServer_MostWanted_util_log;
};
true
