//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;
contract ExampleAddress{

    address public myaddress;

    function setAddress(address _myaddress) public{
        myaddress=_myaddress;
    }
    function getBalance() public view returns(uint)
    {
        return myaddress.balance;
    }
    function setAddress() public{
        myaddress=msg.sender;
    }

}
