// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {FoundryNFT} from "../src/FoundryNFT.sol";

contract FoundryNFTTest is Test {
    FoundryNFT public sut;
    event Transfer(address from, address to, uint tokenId);

    function setUp() public {
        sut = new FoundryNFT();
        vm.deal(sut.owner(), 3 ether);
        address(sut.owner()).call{value: 3 ether}('');
    }

    function xtest_TokenNameIsFoundryNFT() public {
        string memory name = sut.name();
        assertEq('FoundryNFT', name);
    }

    function xtest_totalSupplyIsInremented() public {
        assertEq(sut.totalSupply(), 0);
        sut.mint();
        assertEq(sut.totalSupply(), 1);
        assertEq(sut.balanceOf(sut.owner()), 1);
    }

    function xtest_symbol() public {
        assertEq(sut.symbol(), 'XFNFT');
    }

    function xtest_mint() public {
        address badAddr = address(0xBad);
        vm.expectEmit();
        emit Transfer(address(this), sut.owner(), 2);
//        vm.deal(sut.owner(), 10 ether);

//        sut.mint();
//        sut.mint();
        sut.mint();
        vm.prank(badAddr);
        sut.mytransfer();
        console.log(sut.balanceOf(badAddr));
    }

    function test_test() public {
        sut.mytransfer();
        console.log('1', sut.balanceOf(sut.owner()));
        console.log(address(sut.owner()).balance);
    }
    receive() external payable {}
}
