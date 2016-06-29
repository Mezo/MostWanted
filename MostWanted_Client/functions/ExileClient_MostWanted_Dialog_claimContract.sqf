/*
*
*  ExileClient_MostWanted_Dialog_claimContract.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_data","_dataArray"];
_data = lbData[1503,(lbCurSel 1503)];
_dataArray = _data splitString ",";
if (_data isEqualTo "") exitWith {["ErrorTitleAndText", ["Most Wanted", "Select a contract to claim"]] call ExileClient_gui_toaster_addTemplateToast;};
["claimContractRequest",[_dataArray select 1,parseNumber(_dataArray select 0)]] call ExileClient_system_network_send;
ctrlEnable [2407,false];
