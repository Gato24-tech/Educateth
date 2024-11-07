// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Juani is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor(address initialOwner) ERC721("Juani", "JULI") Ownable(initialOwner) {
        tokenCounter = 0;
    }

    function createNFT() public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, "https://gateway.lighthouse.storage/ipfs/bafkreibaycx3u53snbwsjddadyjnaltugbhftncf25lch762nxq3m7euka");
        tokenCounter += 1;
        return newTokenId;
    }
}