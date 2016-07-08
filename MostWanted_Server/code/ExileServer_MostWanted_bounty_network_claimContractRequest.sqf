/*
*
*  ExileServer_MostWanted_bounty_network_claimContractRequest.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_sessionID","_package","_playerObject","_contractUID","_contractIndex","_completedContracts","_index","_bountyName","_bountyAmount","_playersMoney","_newMoney"];
_sessionID = _this select 0;
_package = _this select 1;
try
{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
    {
        throw "Players's object is null!";
    };
    if !(alive _playerObject) then
    {
        throw "HA, nope. :)";
    };
    _contractUID = _package select 0;
    _contractIndex = _package select 1;
    if (_contractUID isEqualTo "") then
    {
        throw "Contract's UID is blank";
    };
    _completedContracts = _playerObject getVariable ["ExileBountyCompletedContracts",""];
    if (_completedContracts isEqualTo "" || _completedContracts isEqualTo []) then
    {
        throw "Player's completed contract is blank";
    };
    _index = -1;
    {
        if ((_x select 1) isEqualTo (_contractUID)) then
        {
            if (_contractIndex isEqualTo _forEachIndex) then
            {
                _index = _forEachIndex;
            };
        };
    } forEach _completedContracts;
    if (_index isEqualTo -1) then
    {
        throw "Contract not found!";
    };
    _bountyName = (_completedContracts select _index) select 0;
    _bountyAmount = parseNumber((_completedContracts select _index) select 2);
    _playersMoney = _playerObject getVariable ["ExileMoney",0];
    _newMoney = _playersMoney + _bountyAmount;
    _playerObject setVariable ["ExileMoney",_newMoney,true];
    format["setPlayerMoney:%1:%2",_newMoney,_playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
    _completedContracts deleteAt _index;
    _playerObject setVariable ["ExileBountyCompletedContracts",_completedContracts];
    format ["updateCompletedContracts:%1:%2",_completedContracts,getPlayerUID _playerObject] call ExileServer_system_database_query_fireAndForget;
    [
    	_sessionID,
    	"claimContractResponse",
    	[
    		(_playerObject getVariable ["ExileBountyCompletedContracts",""]),
            _bountyName,
            str(_bountyAmount)
        ]
    ]
    call ExileServer_system_network_send_to;
}
catch
{
    [_sessionID, "toastRequest", ["ErrorTitleAndText", ["Most Wanted", _exception]]] call ExileServer_system_network_send_to;
    _exception call ExileServer_MostWanted_util_log;
};
