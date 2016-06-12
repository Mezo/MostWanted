/*
*
*  ExileClient_MostWanted_Dialog_showActiveContracts.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_list","_completedList","_contract","_target","_targetuid","_price","_entry","_pricelb","_targetCC","_targetuidCC","_priceCC","_completedpricelb","_text"];
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_list = (_display displayCtrl 1504);
lbClear 1504;
_completedList = (_display displayCtrl 1503);
lbClear 1503;
_contract = player getVariable ["ExileBountyContract",[]];
ctrlEnable [2407,true];
ctrlEnable [2408,true];
if !(_contract isEqualTo []) then
{
    _target = (_contract select 0);
    _targetuid = (_contract select 1);
    _price = (_contract select 2);
    _entry = _list lbAdd (format["%1",_target,_price]);
    _pricelb = _list lbSetTextRight [_entry, format["%1",_price]];
    _list lbSetPictureRight [_entry, "exile_assets\texture\ui\poptab_trader_ca.paa"];
    _list lbSetData [_entry, _targetuid];
};
if !(ExileBountyCompletedContracts isEqualTo []) then
{
    {
        _targetCC = (_x select 0);
        _targetuidCC = (_x select 1);
        _priceCC = (_x select 2);
        _entry = _completedList lbAdd (format["%1",_targetCC]);
        _completedpricelb = _completedList lbSetTextRight [_entry, format["%1",_priceCC]];
        _completedList lbSetPictureRight [_entry, "exile_assets\texture\ui\poptab_trader_ca.paa"];
        _text = format["%1,%2",_entry,_targetuidCC];
        _completedList lbSetData [_entry, _text];
    } forEach ExileBountyCompletedContracts;
};
