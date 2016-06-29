/*
*
*  ExileClient_MostWanted_network_claimContractResponse.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_completedContracts","_bountyName","_bountyAmount","_display"];
_completedContracts = _this select 0;
_bountyName = _this select 1;
_bountyAmount = _this select 2;
ExileBountyCompletedContracts = _completedContracts;
["SuccessTitleAndText", ["Claimed Bounty!", format["%1 worth %2 poptabs",_bountyName,parseNumber(_bountyAmount)]]] call ExileClient_gui_toaster_addTemplateToast;
_display = uiNameSpace getVariable ["MostWantedDialog",displayNull];
if !(isNull _display) then
{
    ctrlEnable [2407,true];
    call ExileClient_MostWanted_Dialog_UpdatePlayerStats;
    call ExileClient_MostWanted_Dialog_showActiveContracts;
};
