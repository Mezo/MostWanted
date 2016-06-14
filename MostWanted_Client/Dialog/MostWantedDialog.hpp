class MostWantedDialog
{
	idd = 4004;
	onLoad = "uiNamespace setVariable ['MostWantedDialog', _this select 0]; call ExileClient_MostWanted_Dialog_load; true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;";
	onUnload = "uiNamespace setVariable ['MostWantedDialog', displayNull]; false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;";
	class Controls
	{
		class MWDialogBackgroundRight: MwRscText
		{
			idc = 1002;

			x = 0.323759 * safezoneW + safezoneX;
			y = 0.28374 * safezoneH + safezoneY;
			w = 0.352567 * safezoneW;
			h = 0.451387 * safezoneH;
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};

		class MWDialogCaptionRight: MwRscText
		{
			idc = 1003;

			text = "MOST WANTED"; //--- ToDo: Localize;
			x = 0.323759 * safezoneW + safezoneX;
			y = 0.26306 * safezoneH + safezoneY;
			w = 0.352567 * safezoneW;
			h = 0.0188079 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};

		class MWPlayerListBox: MwRscListBox
		{
			idc = 1500;

			x = 0.329844 * safezoneW + safezoneX;
			y = 0.33852 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.385 * safezoneH;
		};

		class MWBountyDropdown: MwRscCombo
		{
			idc = 2101;

			x = 0.574972 * safezoneW + safezoneX;
			y = 0.35898 * safezoneH + safezoneY;
			w = 0.096956 * safezoneW;
			h = 0.0188079 * safezoneH;
		};

		class MWBountyLabel: MwRscText
		{
			idc = 1005;

			text = "Bounty:"; //--- ToDo: Localize;
			x = 0.574972 * safezoneW + safezoneX;
			y = 0.34006 * safezoneH + safezoneY;
			w = 0.096956 * safezoneW;
			h = 0.0188079 * safezoneH;
		};

		class MWAddBountyButton: MwRscButtonMenu
		{
			idc = 2400;
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			class HitZone
			{
				left = 0;
				top = 0;
				right = 0;
				bottom = 0;
			};
			onButtonClick = "call ExileClient_MostWanted_Dialog_addBounty;";
			text = "ADD BOUNTY"; //--- ToDo: Localize;
			x = 0.574972 * safezoneW + safezoneX;
			y = 0.3966 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MWPlayerLabel: MwRscText
		{
			idc = 1009;

			text = "Player:"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.0188079 * safezoneH;
		};

		class MWViewBountyBtn: MwRscButtonMenu
		{
			idc = 2401;
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			class HitZone
			{
				left = 0;
				top = 0;
				right = 0;
				bottom = 0;
			};
			onButtonClick = "call ExileClient_MostWanted_Dialog_ShowBountiesTab";
			text = "VIEW BOUNTIES"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MWSetBountyBtn: MwRscButtonMenu
		{
			idc = 2402;
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			class HitZone
			{
				left = 0;
				top = 0;
				right = 0;
				bottom = 0;
			};
			onButtonClick = "call ExileClient_MostWanted_Dialog_ShowSetBountyTab";
			text = "SET BOUNTY"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MWOpenContractsBtn: MwRscButtonMenu
		{
			idc = 2403;
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			class HitZone
			{
				left = 0;
				top = 0;
				right = 0;
				bottom = 0;
			};
			onButtonClick = "call ExileClient_MostWanted_Dialog_ShowContractsTab";
			text = "CONTRACTS"; //--- ToDo: Localize;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MWBountyListBox: RscExileItemListBox
		{
			idc = 1501;

			x = 0.329844 * safezoneW + safezoneX;
			y = 0.33852 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.385 * safezoneH;
		};

		class MWAcceptBountyButton: MwRscButtonMenu
		{
			idc = 2404;
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			class HitZone
			{
				left = 0;
				top = 0;
				right = 0;
				bottom = 0;
			};
			onButtonClick = "call ExileClient_MostWanted_Dialog_acceptContract;";
			text = "ACCEPT CONTRACT"; //--- ToDo: Localize;
			x = 0.574972 * safezoneW + safezoneX;
			y = 0.33852 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MWBountiesLabel: MwRscText
		{
			idc = 1007;

			text = "Bounties:"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.052 * safezoneW;
			h = 0.0188079 * safezoneH;
		};

		class MWCompletedContractsLabel: MwRscText
		{
			idc = 1008;

			text = "Completed Contracts:"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MWClaimContractsBtn: MwRscButtonMenu
		{
			idc = 2407;
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "call ExileClient_MostWanted_Dialog_claimContract;";
			class HitZone
			{
				left = 0;
				top = 0;
				right = 0;
				bottom = 0;
			};
			text = "CLAIM CONTRACT"; //--- ToDo: Localize;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MWCompletedContractsList: RscExileItemListBox
		{
			idc = 1503;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.242 * safezoneH;
		};

		class MWRscText_1003: MwRscText
		{
			idc = 1006;

			text = "Active Contracts:"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.595 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MWActiveContractsList: RscExileItemListBox
		{
			idc = 1504;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.099 * safezoneH;
		};

		class MWRscButtonMenu_2400: MwRscButtonMenu
		{
			idc = 2408;
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			onButtonClick = "call ExileClient_MostWanted_Dialog_terminateContract;";
			class HitZone
			{
				left = 0;
				top = 0;
				right = 0;
				bottom = 0;
			};
			text = "CANCEL CONTRACT"; //--- ToDo: Localize;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.6188 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class MWMoneyRespectText: MwRscStructuredText
		{
			idc = 2501;
			text = "0"; //--- ToDo: Localize;
			x = 0.531969 * safezoneW + safezoneX;
			y = 0.2642 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.0198 * safezoneH;
		};
	};
};
