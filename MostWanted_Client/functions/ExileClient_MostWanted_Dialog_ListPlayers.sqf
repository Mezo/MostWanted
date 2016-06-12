/*
*
*  ExileClient_MostWanted_Dialog_ListPlayers.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_targetbox","_friends","_player","_uid","_immunity","_isTarget","_netid","_entry","_data"];
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_targetbox = (_display displayCtrl 1500);
_friends = player getVariable ["ExileBountyFriends",[]];
lbClear _targetbox;
{
    _player = _x;
    _uid = (getPlayerUID _player);
    if !(_uid == (getPlayerUID player)) then
    {
        if !((getPlayerUID _player) in _friends) then
        {
            _immunity = _x getVariable ["ExileBountyImmunity",false];
            if !(_immunity) then
            {
                _isTarget = [MostWanted_MasterBountyList, _uid] call ExileClient_util_find;
                if (_isTarget isEqualTo -1) then
                {
                    _netid = (netid _player);
                    _entry = _targetbox lbadd (name _player);
                    _data = _targetbox lbSetData [_entry, _netid];
                };
            };
        };
    };
} foreach allPlayers;
