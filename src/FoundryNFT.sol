// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "forge-std/Test.sol";

contract FoundryNFT is ERC721 {
    uint256 public totalSupply = 1;
    address payable public  owner;

    constructor() ERC721("FoundryNFT", "XFNFT") {
        owner = payable(msg.sender);
    }

    function mint() external payable {
        // you can add a price check here if you like
        totalSupply++;
        _mint(msg.sender, totalSupply);
    }

    function mytransfer() public  {
        approve(msg.sender, totalSupply);
        (bool ok, )=   address(msg.sender).call{value: totalSupply}("");
        console.log('ok', ok);
    }

    receive() external payable {}
}
