// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {FoundryNFT} from "../src/FoundryNFT.sol";

contract FoundryNFTTest is Test {
    FoundryNFT public sut;

    function setUp() public {
        sut = new FoundryNFT();
    }

    function test_TokenNameIsFoundryNFT() public {
        string memory name = sut.name();
        assertEq('FoundryNFT', name);
    }

    function test_totalSupplyIsInremented() public {
        assertEq(sut.totalSupply(), 0);
        sut.mint();
        assertEq(sut.totalSupply(), 1);
        assertEq(sut.balanceOf(sut.owner()), 1);
    }

    function test_symbol() public {
        assertEq(sut.symbol(), 'XFNFT');
    }
}
