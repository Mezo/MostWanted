/*
*
*  ExileClient_MostWanted_network_targetKilledResponse.sqf
*  © 2016 Mezo, Shix, and WolfkillArcadia
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_victimName","_uid"];
MostWanted_MasterBountyList = _this select 0;
_victimName = _this select 1;
_uid = _this select 2;
MostWanted_SuccessfulKill = nil;
MostWanted_BountyName = nil;
if (_uid isEqualTo (getPlayerUID player)) then
{
    ExileBountyCompletedContracts = _this select 3;
    MostWanted_SuccessfulKill = "";
    MostWanted_SuccessfulKill = _this select 4;
    [["MostWanted","SuccessfulKill"],15,"",15,"",true,true,false,true] call BIS_fnc_advHint;
}
else
{
    MostWanted_BountyName = "";
    MostWanted_BountyName = _victimName;
    [["MostWanted","BountyClaimed"],15,"",15,"",true,true,false,true] call BIS_fnc_advHint;
};
true
