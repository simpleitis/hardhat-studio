// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

pragma solidity ^0.8.7;

contract BasicNft is ERC721 {
  uint256 private s_tokenCounter;
  string public constant TOKEN_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

  event DogMinted(uint256 indexed tokenId);

  constructor() ERC721("Dogie", "DOG") {
    s_tokenCounter = 0;
  }

  function mintNft() public {
      _safeMint(msg.sender, s_tokenCounter);
      emit DogMinted(s_tokenCounter);
      s_tokenCounter = s_tokenCounter + 1;
  }

  // we are commenting out 'tokenId' because we just need it as a placeholder
  // we are overriding this function, ie we are saying we dont need to existing defination and we are going to use the below definition
  function tokenURI(
      uint256 /*tokenId*/
  ) public view override returns (string memory) {
      return TOKEN_URI;
  }

  function getTokenCounter() public view returns (uint256) {
      return s_tokenCounter;
  }
}