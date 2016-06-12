/*
*
*  fn_preInit.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_code"];
{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileServer_MostWanted_bounty_network_acceptContract', 'MostWanted_Server\code\ExileServer_MostWanted_bounty_network_acceptContract.sqf'],
    ['ExileServer_MostWanted_bounty_network_addBounty', 'MostWanted_Server\code\ExileServer_MostWanted_bounty_network_addBounty.sqf'],
    ['ExileServer_MostWanted_bounty_network_claimContractRequest', 'MostWanted_Server\code\ExileServer_MostWanted_bounty_network_claimContractRequest.sqf'],
    ['ExileServer_MostWanted_bounty_network_terminateContract', 'MostWanted_Server\code\ExileServer_MostWanted_bounty_network_terminateContract.sqf'],
    ['ExileServer_MostWanted_bounty_targetKilled', 'MostWanted_Server\code\ExileServer_MostWanted_bounty_targetKilled.sqf'],
    ['ExileServer_MostWanted_friends_network_handlePartyInvite', 'MostWanted_Server\code\ExileServer_MostWanted_friends_network_handlePartyInvite.sqf'],
    ['ExileServer_MostWanted_initalize', 'MostWanted_Server\code\ExileServer_MostWanted_initalize.sqf'],
    ['ExileServer_MostWanted_network_masterListRequest', 'MostWanted_Server\code\ExileServer_MostWanted_network_masterListRequest.sqf'],
    ['ExileServer_MostWanted_system_resetFriends', 'MostWanted_Server\code\ExileServer_MostWanted_system_resetFriends.sqf'],
    ['ExileServer_MostWanted_util_log', 'MostWanted_Server\code\ExileServer_MostWanted_util_log.sqf'],
    ['ExileServer_MostWanted_friends_network_friendsUpdateRequest','MostWanted_Server\code\ExileServer_MostWanted_friends_network_friendsUpdateRequest.sqf']
];
"Most Wanted Pre-Init finished" call ExileServer_MostWanted_util_log;
