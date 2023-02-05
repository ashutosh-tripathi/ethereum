//SPDX-License-Identifier: temp

pragma solidity ^0.8.15;

 contract BlockchainMessenger{

     string public message="FirstMessage";
     address public messageSender;
     uint  public count;
     constructor(){
         messageSender=msg.sender;
     }

     function updateMessage(string memory _message) public{
         if(messageSender==msg.sender){
             message=_message;
             count++;
         }
     }
 }
