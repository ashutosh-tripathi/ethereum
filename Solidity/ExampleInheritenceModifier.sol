//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

import "./Ownable.sol";


contract ExampleInheritenceModifier is Owner{

        mapping(address=>uint) public tokenBalance;

        uint tokenPrice=1 ether;

        constructor(){
            tokenBalance[owner]=100;
        }


        function createNewToken() public onlyOwner{
            tokenBalance[owner]++;
        }
        function  burnNewToken() public onlyOwner{
            tokenBalance[owner]--;
        }


        function purchaseToken() public payable {
            require((tokenBalance[owner]*tokenPrice)>msg.value, "not enough balance");
                tokenBalance[owner]-=msg.value/tokenPrice;
                tokenBalance[msg.sender]+=msg.value/tokenPrice;


        }


        function sendToken( address _to, uint amount) public{
            require(tokenBalance[msg.sender]>amount, "not enough balance");
            tokenBalance[msg.sender]-=amount;
            tokenBalance[_to]+=amount;
        }











}
