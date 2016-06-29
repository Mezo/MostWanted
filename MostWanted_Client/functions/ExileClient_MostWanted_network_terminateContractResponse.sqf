/*
*
*  ExileClient_MostWanted_network_terminateContractResponse.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_response","_display"];
_response = _this select 0;
if (_response isEqualTo 1) then
{
    ["SuccessTitleAndText", ["Most Wanted", "You have successfully terminated your contract"]] call ExileClient_gui_toaster_addTemplateToast;

    _display = uiNameSpace getVariable ["MostWantedDialog",displayNull];
    if !(isNull _display) then
    {
        ctrlEnable [2408,true];
        call ExileClient_MostWanted_Dialog_showActiveContracts;
    };
};
true
