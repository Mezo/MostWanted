/**
 * ExileClient_gui_xm8_showPartySlides
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

if (ExileClientPartyID isEqualTo -1) then
{
	if (ExileClientPendingPartyInvitionGroup isEqualTo objNull) then
	{
		["hostParty", 0] call ExileClient_gui_xm8_slide;
	}
	else
	{
		[format ["Join %1?", groupID ExileClientPendingPartyInvitionGroup], "Join", "Don't join"] call ExileClient_gui_xm8_showConfirm;
		waitUntil { !(isNil "ExileClientXM8ConfirmResult") };
		if (ExileClientXM8ConfirmResult) then
		{
			[player] joinSilent ExileClientPendingPartyInvitionGroup;
			setGroupIconsVisible [true, true];
			ExileClientPartyID = netId ExileClientPendingPartyInvitionGroup;
			uiSleep 0.2;
			["party", 0] call ExileClient_gui_xm8_slide;
            ["handlePartyInvite",[ExileClientPartyID]] call ExileClient_system_network_send;
		}
		else
		{
		};
		ExileClientPendingPartyInvitionGroup = objNull;
	};
}
else
{
	["party", 0] call ExileClient_gui_xm8_slide;
};
