// SPDX-License-Identifier: MIT
pragma solidity <0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/token/ERC721/IERC721Metadata.sol";

contract NFTAudius is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    constructor()
    ERC721("NFT from Audius files v0.2","NFTAudiusv0.2") {
        _setBaseURI("https://my-json-server.typicode.com/giacomogagliano/TRIAL-AUDIUS-NFT/v0.2");
    }
    
    function mintNft(address receiver) external onlyOwner returns (uint256) {
        _tokenIds.increment();

        uint256 newNftTokenId = _tokenIds.current();
        _mint(receiver, newNftTokenId);

        return newNftTokenId;
    }
}