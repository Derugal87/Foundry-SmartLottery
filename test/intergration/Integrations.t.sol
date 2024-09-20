// unit
// integrations
// forked
// staging <- run tests on a mainnet or testnet

// fuzzing
// stateful fuzz
// stateless fuzz
// formal verification

// SPDX-Licence-Identifier: MIT

pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {Raffle} from "src/Raffle.sol";
import {CreateSubscription, FundSubscription, AddConsumer} from "script/Interactions.s.sol";
import {DeployRaffle} from "script/DeployRaffle.s.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";

contract IntegrationsTest is Test {
    Raffle raffle;
    HelperConfig helperConfig;

    address USER = makeAddr("user");
    uint256 constant STARTING_BALANCE = 10 ether;

    function setUp() external {
        DeployRaffle deploy = new DeployRaffle();
        (raffle, helperConfig) = deploy.deployContract();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testSubscribtionSuccess() public {
        CreateSubscription createSubscription = new CreateSubscription();
        (uint256 id,) = createSubscription.createSubscriptionUsingConfig();
        assert(id > 0);
    }

    // function testFundSubscriptionSuccess() public {
    //     // CreateSubscription createSubscription = new CreateSubscription();
    //     // (uint256 subscriptionId,) = createSubscription.createSubscriptionUsingConfig();
    //     // console.log("Subscription ID: ", subscriptionId);
    //     // helperConfig.getConfig().subscriptionId = subscriptionId;
    //     FundSubscription fundSubscription = new FundSubscription();
    //     // address vrfCoordinator = helperConfig.getConfig().vrfCoordinator;
    //     // uint256 subscriptionId = helperConfig.getConfig().subscriptionId;
    //     // address account = helperConfig.getConfig().account;
    //     // address linkToken = helperConfig.getConfig().link;
    //     // console.log("Subscription ID1: ", subscriptionId);
    //     console.log("Subscription ID2: ", helperConfig.getConfig().subscriptionId);
    //     fundSubscription.fundSubscriptionUsingConfig();
    //     assert(USER.balance != STARTING_BALANCE);
    // }
}
