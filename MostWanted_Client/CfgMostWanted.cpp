class CfgMostWanted
{
    class Database
    {
        class Cleanup
        {
            /*
                Lifetime of the "Friends" security array will stay populated in DAYS

                NOTE:
                The friends list is a security feature designed to keep players from assigning bounties to friends and
                claiming bounties on friends.

                The sooner the array gets reset, the more often players are able to claim bounties or place bounties on their friends
            */

            friendsLifetime = 14;
        };

        class Immunity
        {
            /*
                How long a player has immunity from a bounty in DAYTS
                While a player has immunity, they won't be able to have a bounty set on them
            */
            interval = 3;
        };
    };
    class BountyValues
    {
        /*
            The Bounty values that will be displayed in the dropdown
            Left value: Poptabs
            Right Value: Percentage of Respect Loss
        */
        Values[]=
        {
            { "10000",  "1"  },
            { "20000",  "2"  },
            { "30000",  "3"  },
            { "40000",  "4"  },
            { "50000",  "5"  },
            { "60000",  "6"  },
            { "70000",  "7"  },
            { "80000",  "8"  },
            { "90000",  "9"  },
            { "100000", "10" },
            { "150000", "15" },
            { "200000", "20" }
        };
    };
};
