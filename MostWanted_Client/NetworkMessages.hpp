class masterListRequest
{
    module = "MostWanted";
    parameters[] = {"STRING"};
};
class masterListResponse
{
    module = "MostWanted";
    parameters[] = {"ARRAY"};
};
class addBounty
{
    module = "MostWanted_bounty";
    parameters[] = {"STRING","STRING","STRING","STRING"};
};
class addBountyResponse
{
    module = "MostWanted";
    parameters[] = {"STRING","STRING"};
};
class newBountyNotification
{
    module = "MostWanted";
    parameters[] = {"ARRAY","STRING"};
};
class targetKilledResponse
{
    module = "MostWanted";
    parameters[] = {"ARRAY","STRING","STRING","ARRAY","STRING"};
};
class acceptContract
{
    module = "MostWanted_bounty";
    parameters[] = {"STRING"};
};
class terminateContract
{
    module = "MostWanted_bounty";
    parameters[] = {"STRING"};
};
class terminateContractResponse
{
    module = "MostWanted";
    parameters[] = {"SCALAR"};
};
class updateCompletedContracts
{
    module = "MostWanted";
    parameters[] = {"ARRAY"};
};
class claimContractRequest
{
    module = "MostWanted_bounty";
    parameters[] = {"STRING","SCALAR"};
};
class claimContractResponse
{
    module = "MostWanted";
    parameters[] = {"ARRAY","STRING","STRING","STRING"};
};
class handlePartyInvite
{
    module = "MostWanted_friends";
    parameters[] = {"STRING"};
};
class handlePartyInviteResponse
{
    module = "MostWanted_friends";
    parameters[] = {"STRING"};
};
class friendsUpdateRequest
{
    module = "MostWanted_friends";
    parameters[] = {"ARRAY","STRING"};
};
