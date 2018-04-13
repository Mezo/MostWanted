/*
*
*  ExileClient_MostWanted_Dialog_addBounty.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_playerlist","_pricelist","_victimNetID","_value","_price","_respectdivisor","_reason","_playermoney"];
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_playerlist = (_display displayCtrl 1500);
_pricelist = (_display displayCtrl 2101);
_victimNetID = (lbData [1500, (lbCurSel 1500)]);
_value = (lbData [2101, (lbCurSel 2101)]);
_value = _value splitString ":";
_price = (_value select 0);
if !(_price isEqualTo "") then
{
    _respectdivisor = (_value select 1);
};
_reason = "N/A";
_playermoney = player getVariable ["ExileMoney", 0];
try
{
    if (_victimNetID isEqualTo "") then
    {
        throw "Please Select A Target Player";
    };
    if (_price isEqualTo "") then
    {
        throw "Please Select The Worth Of The Bounty";
    };
    if !(parseNumber(_price) isEqualType 0) then
    {
        throw "Please Select The Worth Of The Bounty";
    };
    if (_respectdivisor isEqualTo "") then
    {
        throw "Split String Fucked Up";
    };
    if (parseNumber(_price) > _playermoney) then
    {
        throw "You Can't Afford That Bounty";
    };
    ctrlEnable [2400,false];
    ["addBounty",[_victimNetID,_reason,_price,_respectdivisor]] call ExileClient_system_network_send;
    call ExileClient_MostWanted_Dialog_showActiveBounties;
}
catch
{
    ["ErrorTitleAndText", ["Most Wanted", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
