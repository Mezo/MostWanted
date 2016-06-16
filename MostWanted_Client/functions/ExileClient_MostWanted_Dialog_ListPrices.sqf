/*
*
*  ExileClient_MostWanted_Dialog_ListPrices.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_pricelist","_values","_index","_price","_respect","_lbentry","_data"];
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_pricelist = (_display displayCtrl 2101);
_values = getArray(missionConfigFile >> "CfgMostWanted" >> "BountyValues" >> "Values");
lbClear _pricelist;
{
    _index = _x;
    _price = (_index select 0);
    _respect = (_index select 1);
    _lbentry = _pricelist lbAdd format["%1 | %2%3",_price,_respect,"%"];
    _data = _pricelist lbSetData [_lbentry, (format["%1:%2",_price,_respect])];
} foreach _values;
lbSetCurSel [2101, 0];
