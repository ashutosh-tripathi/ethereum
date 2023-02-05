//SPDX-License-Identifier: temp
pragma solidity ^0.8.15;

contract ExamplePayable{

    string public mystring="Hello world";

    function updateString(string memory _newString) public payable {

        if(msg.value==1 ether){
        mystring=_newString;
        }
        else 
        {
           payable(msg.sender).transfer(msg.value);
        }
    }


}
