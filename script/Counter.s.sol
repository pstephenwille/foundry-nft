// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FoundryNFT} from "../src/FoundryNFT.sol";

contract CounterScript is Script {
    FoundryNFT public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new FoundryNFT();

        vm.stopBroadcast();
    }
}
