// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract FoundryNFT is ERC721 {
    uint256 public totalSupply = 0;
    address public owner;

    constructor() ERC721("FoundryNFT", "XFNFT") {
        owner = msg.sender;
    }

    function mint() external payable {
        // you can add a price check here if you like
        totalSupply++;
        _mint(msg.sender, totalSupply);
    }

}
