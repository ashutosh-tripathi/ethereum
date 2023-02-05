//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;


contract ExampleExceptionRequire{

    mapping(address=>uint) public  balance;
    function depositBalance() public payable{
        balance[msg.sender]+=msg.value;
    }

    function withdrawBalance(address payable _to, uint value) public{
        require(balance[msg.sender]>=value,"Not enough funds!!");
            balance[msg.sender]-=value;
            _to.transfer(value);
        
    }


}
