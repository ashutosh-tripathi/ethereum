//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;


contract ExamplSelfDestruct{

    address owner;

    constructor(){
        owner=msg.sender;
    }

    receive() external payable{

    }
    function getBalance()public view returns(uint){
        return address(this).balance;
    }
    function selfDes() public{
        assert(msg.sender==owner);
        selfdestruct(payable(msg.sender));
    }





}
