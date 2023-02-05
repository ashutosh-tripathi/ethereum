// SPDX-License-Identifier:temp101
pragma solidity ^0.8.15;

contract MyFirstContract{

    string  public firstString="HelloWorld";

    function changeString(string memory _tempString) public{
        firstString=_tempString;
    }
    

}
