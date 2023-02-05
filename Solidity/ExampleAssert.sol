//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract ExampleAssert{

    uint public balance;

    constructor() payable
    {
        balance=msg.value;
    }


    mapping(address=>uint8) public  balanceRec;

    function depositMoney() public payable{
        assert(msg.value==uint8(msg.value));
        balanceRec[msg.sender]+=uint8(msg.value);

    }




}
