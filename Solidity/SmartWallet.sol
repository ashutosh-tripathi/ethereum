//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract SmartWallet{
     uint public balance;

     function getBalance() public view returns(uint){
         return address(this).balance;
     }

     function deposit() public payable{
         balance=msg.value;

     }
     function creditsmartcontract() payable public {
       payable(address(this)).transfer(msg.value);

     }
     function creditAddress(address payable _address) public payable{
         _address.transfer(msg.value);
     } 
     function creditSender() public payable{
         payable(msg.sender).transfer(1 ether);
     }






}
