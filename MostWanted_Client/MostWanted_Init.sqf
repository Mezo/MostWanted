/*
*
*  MostWanted_Init.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
if (!hasInterface || isServer) exitWith {};
private["_code"];
{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileClient_MostWanted_Dialog_acceptContract', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_acceptContract.sqf'],
    ['ExileClient_MostWanted_Dialog_addBounty', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_addBounty.sqf'],
    ['ExileClient_MostWanted_Dialog_claimContract', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_claimContract.sqf'],
    ['ExileClient_MostWanted_Dialog_HideBountiesTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_HideBountiesTab.sqf'],
    ['ExileClient_MostWanted_Dialog_HideContractsTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_HideContractsTab.sqf'],
    ['ExileClient_MostWanted_Dialog_HideSetBountiesTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_HideSetBountiesTab.sqf'],
    ['ExileClient_MostWanted_Dialog_ListPlayers', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ListPlayers.sqf'],
    ['ExileClient_MostWanted_Dialog_ListPrices', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ListPrices.sqf'],
    ['ExileClient_MostWanted_Dialog_load', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_load.sqf'],
    ['ExileClient_MostWanted_Dialog_onLBChange', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_onLBChange.sqf'],
    ['ExileClient_MostWanted_Dialog_showActiveBounties', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_showActiveBounties.sqf'],
    ['ExileClient_MostWanted_Dialog_showActiveContracts', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_showActiveContracts.sqf'],
    ['ExileClient_MostWanted_Dialog_ShowBountiesTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ShowBountiesTab.sqf'],
    ['ExileClient_MostWanted_Dialog_ShowContractsTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ShowContractsTab.sqf'],
    ['ExileClient_MostWanted_Dialog_ShowSetBountyTab', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_ShowSetBountyTab.sqf'],
    ['ExileClient_MostWanted_Dialog_terminateContract', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_terminateContract.sqf'],
    ['ExileClient_MostWanted_Dialog_UpdatePlayerStats', 'MostWanted_Client\functions\ExileClient_MostWanted_Dialog_UpdatePlayerStats.sqf'],
    ['ExileClient_MostWanted_network_addBountyResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_addBountyResponse.sqf'],
    ['ExileClient_MostWanted_network_claimContractResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_claimContractResponse.sqf'],
    ['ExileClient_MostWanted_network_masterListResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_masterListResponse.sqf'],
    ['ExileClient_MostWanted_network_newBountyNotification', 'MostWanted_Client\functions\ExileClient_MostWanted_network_newBountyNotification.sqf'],
    ['ExileClient_MostWanted_network_targetKilledResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_targetKilledResponse.sqf'],
    ['ExileClient_MostWanted_network_terminateContractResponse', 'MostWanted_Client\functions\ExileClient_MostWanted_network_terminateContractResponse.sqf'],
    ['ExileClient_MostWanted_network_updateCompletedContracts', 'MostWanted_Client\functions\ExileClient_MostWanted_network_updateCompletedContracts.sqf'],
    ['ExileClient_MostWanted_util_log', 'MostWanted_Client\functions\ExileClient_MostWanted_util_log.sqf'],
    ['ExileClient_MostWanted_friends_network_handlePartyInviteResponse','MostWanted_Client\functions\ExileClient_MostWanted_friends_network_handlePartyInviteResponse.sqf']
];
"Most Wanted Pre-Init finished" call ExileClient_MostWanted_util_log;
waitUntil {ExileClientSessionId != ""};
["masterListRequest",[""]] call ExileClient_system_network_send;
"Requested master list" call ExileClient_MostWanted_util_log;
