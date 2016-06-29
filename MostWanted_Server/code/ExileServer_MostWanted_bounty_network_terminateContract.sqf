/*
*
*  ExileServer_MostWanted_bounty_network_terminateContract.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_sessionID","_package","_playerObject","_contract"];
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
    if (count(_contract) isEqualTo 0) then
    {
        throw "You currently have no contract";
    };
    format["Players contract: %1",_contract]call ExileServer_MostWanted_util_log;
    _playerObject setVariable ["ExileBountyContract",[],true];
    format["Players contract now: %1",_playerObject getVariable ["ExileBountyContract",""]]call ExileServer_MostWanted_util_log;
    format["updateContract:%1:%2",[],getPlayerUID _playerObject] call ExileServer_system_database_query_fireAndForget;
    [_sessionID,"terminateContractResponse", [1]] call ExileServer_system_network_send_to;
}
catch
{
    [_sessionID, "toastRequest", ["ErrorTitleAndText", ["Most Wanted", _exception]]] call ExileServer_system_network_send_to;
    _exception call ExileServer_MostWanted_util_log;
};
true
