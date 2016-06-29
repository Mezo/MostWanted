/*
*
*  ExileClient_MostWanted_Dialog_UpdatePlayerStats.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_display","_text","_money"];
disableSerialization;
_display = uiNamespace getVariable ["MostWantedDialog",displayNull];
_text = _display displayCtrl 2501;
_money = player getVariable ["ExileMoney",0];
_text ctrlSetStructuredText parseText format["<t align='right' valign='middle' size='0.8'>POPTABS: %1 | RESPECT: %2</t>",_money,ExileClientPlayerScore];
