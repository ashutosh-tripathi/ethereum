//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract Owner{
    address public owner;

    constructor(){
        owner=msg.sender;
    }

        modifier onlyOwner(){
            require(msg.sender==owner, "you need to be owner");
            _;
        }

}
