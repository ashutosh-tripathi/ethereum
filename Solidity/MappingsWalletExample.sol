//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;


contract MappingsWalletExample{

    mapping(address => uint) public balanceRecord;

    function depositMoney() public payable{
        balanceRecord[msg.sender]+=msg.value;
    }
    
    function withdrawAmount() public{
        uint money=balanceRecord[msg.sender];
        balanceRecord[msg.sender]=0;
        payable(msg.sender).transfer(money);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }




}

