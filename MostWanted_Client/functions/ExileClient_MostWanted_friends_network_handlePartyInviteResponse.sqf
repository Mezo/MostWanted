/*
*
*  ExileClient_MostWanted_friends_network_handlePartyInviteResponse.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_clientFriends","_partyID"];
_clientFriends = player getVariable ["ExileBountyFriends",[]];
_partyID = ExileClientPartyID;
["friendsUpdateRequest",[_clientFriends, _partyID]] call ExileClient_system_network_send;
