/*
*
*  ExileClient_MostWanted_Dialog_ShowBountiesTab.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_hide"];
call ExileClient_MostWanted_Dialog_HideContractsTab;
call ExileClient_MostWanted_Dialog_HideContractsTab;
call ExileClient_MostWanted_Dialog_HideSetBountiesTab;
call ExileClient_MostWanted_Dialog_showActiveBounties;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
{
    _hide = (_display displayCtrl _x);
    _hide ctrlShow true;
    ctrlEnable [_x, true];
} forEach [1501,2404,1007];
