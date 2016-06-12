/*
*
*  ExileClient_MostWanted_network_newBountyNotification.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
MostWanted_MasterBountyList = _this select 0;
MostWanted_BountyAmount = "";
MostWanted_BountyAmount = _this select 1;
[["MostWanted","NewBounty"],15,"",15,"",true,true,false,true] call BIS_fnc_advHint;
