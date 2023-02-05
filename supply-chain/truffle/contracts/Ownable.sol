//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Ownable{
    address owner;

    constructor(){
        owner=msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"only owner can call this function");
        _;
    }
}
