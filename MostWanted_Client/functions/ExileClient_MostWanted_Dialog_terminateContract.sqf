/*
*
*  ExileClient_MostWanted_Dialog_terminateContract.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_list","_cursel","_uid"];
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_list = (_display displayCtrl 1504);
_cursel = (lbCurSel _list);
_uid = lbData [1504, _cursel];
try
{
    if (_uid isEqualTo "") then
    {
        throw "Select A Contract To End";
    };
    ctrlEnable [2408,false];
    ["terminateContract",[_uid]] call ExileClient_system_network_send;
}
catch
{
    ["ErrorTitleAndText", ["Most Wanted", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
