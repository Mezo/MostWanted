/*
*
*  ExileClient_MostWanted_Dialog_showActiveBounties.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_list","_bounty","_victimName","_victimUid","_reason","_price","_hunterName","_hunterUID","_entry","_pricelb","_data"];
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_list = (_display displayCtrl 1501);
lbclear _list;
{
    _bounty = _x;
    _victimName = (_bounty select 0);
    _victimUid = (_bounty select 1);
    _reason = (_bounty select 2);
    _price = (_bounty select 3);
    _hunterName = (_bounty select 4);
    _hunterUID = (_bounty select 5);
    _entry = _list lbAdd (format["TARGET: (%1)  |  WANTED BY: (%2)",toUpper(_victimName),toUpper(_hunterName)]);
    _pricelb = _list lbSetTextRight [_entry, format["%1",_price]];
    _list lbSetPictureRight [_entry, "exile_assets\texture\ui\poptab_trader_ca.paa"];
    _data = _list lbSetData [_entry, _victimUid];
} foreach MostWanted_MasterBountyList;
