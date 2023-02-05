//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract ExampleEvents{

    uint balance;
    mapping(address => uint) public balances;
    event transferFund(address from, address to, uint amount);

    constructor() payable{
        balances[msg.sender]=msg.value;
    }

    function transfer(address _from, address payable to, uint amount) public 
    {
        require(balances[_from]>amount, "not enough funds");
        to.transfer(amount);
        emit transferFund(msg.sender, to, amount);


    }
     



}
