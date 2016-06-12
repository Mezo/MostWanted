/*
*
*  ExileClient_MostWanted_Dialog_load.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_bountyLB"];
call ExileClient_MostWanted_Dialog_HideSetBountiesTab;
call ExileClient_MostWanted_Dialog_HideContractsTab;
call ExileClient_MostWanted_Dialog_ShowBountiesTab;
call ExileClient_MostWanted_Dialog_ListPlayers;
call ExileClient_MostWanted_Dialog_ListPrices;
call ExileClient_MostWanted_Dialog_showActiveBounties;
call ExileClient_MostWanted_Dialog_showActiveContracts;
call ExileClient_MostWanted_Dialog_UpdatePlayerStats;
disableSerialization;
_display = uiNameSpace getVariable ["MostWantedDialog", displayNull];
_bountyLB = (_display displayCtrl 1501);
_bountyLB ctrlRemoveAllEventHandlers "LBSelChanged";
_bountyLB ctrlSetEventHandler ["LBSelChanged", "call ExileClient_MostWanted_Dialog_onLBChange;"];
ctrlEnable [2402,false];
