// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@ganache/console.log/console.sol";

contract Quillacious is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Quillacious", "QWL") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://vaccum.s3.ap-south-1.amazonaws.com/";
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        pure
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        // return super.tokenURI(tokenId);
        return string(abi.encodePacked(_baseURI(),"quill_",(tokenId+1),'.json'));
    }


    function buyToken() public payable{
        uint256 tokenId = _tokenIdCounter.current();
        console.log("got here",tokenId,msg.value);
        require(msg.value==tokenId*0.001 ether,"wrong amount of funds");
        _tokenIdCounter.increment();
        _safeMint(msg.sender,tokenId);
    }
}