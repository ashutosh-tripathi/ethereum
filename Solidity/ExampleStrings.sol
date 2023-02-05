//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract strings{


    string public firstString="HelloWorld";
    bytes public byteString="HelloWorld";
     string public previousString=firstString;
    function setFirstString(string memory _tempString) public{
        previousString=firstString;
        firstString=_tempString;  
    }
    function unsetFirstString() public{
        firstString=previousString;
    }

    function compareString(string memory _tempString) public view returns(bool){
        return keccak256(abi.encodePacked(firstString))== keccak256(abi.encodePacked(_tempString));
        
    }
    function compareBytes(bytes memory _tempBytes) public view returns(bool){
        return keccak256(byteString)==keccak256(_tempBytes);
    }
}
