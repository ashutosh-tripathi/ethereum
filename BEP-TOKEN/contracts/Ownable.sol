//SPDX-License-Identifier:MIT
pragma solidity ^0.8.15;

contract Ownable{
    address private _owner;

    modifier onlyOwner(){
        require(_owner == msg.sender,"Ownable: only owner can call this method");
        _;
    }

    function owner() public view returns(address){
        return _owner;
    }
}