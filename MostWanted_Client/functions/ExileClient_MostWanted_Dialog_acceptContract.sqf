/*
*
*  ExileClient_MostWanted_Dialog_acceptContract.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_list","_contract","_target"];
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_list = (_display displayCtrl 1501);
_contract = (lbCurSel 1501);
_target = lbData [1501, _contract];
try
{
    if (_target isEqualTo "") then
    {
        throw "Select A Contract To Accept";
    };
    ["acceptContract",[_target]] call ExileClient_system_network_send;
}
catch
{
    ["ErrorTitleAndText", ["Most Wanted", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
