/*
*
*  ExileClient_MostWanted_Dialog_onLBChange.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_bountyLB","_curSel","_data","_contract","_friends"];
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_bountyLB = _display displayCtrl 1501;
_curSel = lbCurSel 1501;
_data = _bountyLB lbData _curSel;
try
{
    _contract = player getVariable ["ExileBountyContract",[]];
    if !(_contract isEqualTo []) then
    {
        throw "HAVE CONTRACT";
    };
    if (_data isEqualTo (getPlayerUID player)) then
    {
        throw "SELF";
    };
    _friends = player getVariable ["ExileBountyFriends",""];
    if !((_friends find _data) isEqualTo -1) then
    {
        throw "RECENT FRIEND";
    };
    ctrlEnable [2404,true];
}
catch
{
    ctrlEnable [2404,false];
};
