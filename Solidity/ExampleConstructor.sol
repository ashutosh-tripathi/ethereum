//SPDX-License-Identifier: temp
pragma solidity ^0.8.15;

contract ExampleConstructor{


    address public myaddress;

    // constructor (address someaddress){
    //     myaddress=someaddress;
    // }
    constructor(){
        myaddress=msg.sender;
    }
    function  getMyAddress() public view returns(address){
        return myaddress;
    }

    function getMyBalance() public view returns(uint){
        return myaddress.balance;
    }
}
