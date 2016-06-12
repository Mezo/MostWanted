class CfgPatches {
    class MostWanted_Server {
        requiredVersion = 0.1;
        requiredAddons[] = {
            "exile_server"
        };
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class MostWanted_Server {
        class main {
            file="MostWanted_Server\bootstrap";
            class preInit
            {
                preInit = 1;
            };
            class postInit
            {
                postInit = 1;
            };
        };
    };
};
