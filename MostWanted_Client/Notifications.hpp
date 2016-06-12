class MostWanted
{
	displayName = "MostWanted";

	class NewBounty
	{
		displayName = "New Bounty";
		description = "%3INMATES!%4%1A perspective client has set a bounty on a fellow inmate.%1The client is offering <t color='#ff0000'>%11</t> poptabs for their head.%1Your local Office Trader has the details and the contract if you choose to accept it.";
		image = "";
		noImage = true;
		tip = "";
		arguments[] = {
            "MostWanted_BountyAmount"
        };
	};
    class SuccessfulKill
	{
		displayName = "Kill Confirmed";
		description = "%3Ouch! That looked like that hurt.%4%1You have successfully completed your bounty contract.%1Talk to your local Office Trader to collect your bounty of <t color='#ff0000'>%11</t>.";
		image = "";
		noImage = true;
		tip = "";
		arguments[] = {
            "MostWanted_SuccessfulKill"
        };
	};
    class BountyClaimed
	{
		displayName = "Bounty Claimed";
		description = "%3Bounty Claimed!%4%1One very lucky inmate has claimed the bounty on <t color='#ff0000'>%11</t>.%1Contracts on this inmate have been cleared!%1Please visit your local Office Trader to get another contract.";
		image = "";
		noImage = true;
		tip = "";
		arguments[] = {
            "MostWanted_BountyName"
        };
	};
};
