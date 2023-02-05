//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract ExampleFunctions{

    uint public myint;
    function setMyInt() public view returns(uint){
        return myint;
    }
    function setMyInt(uint8 a, uint8 b) public pure returns(uint8){
        return a+b;
    }
    function setMyInt(uint a) public returns(uint){

        myint+=a;
        return myint;
    }

}
