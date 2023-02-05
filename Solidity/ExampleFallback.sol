//SPDX-License-Identifier:temp
 pragma solidity ^0.8.15;

 contract ExampleFallback{

     uint public counter;
     string public functionCalled;

    constructor() payable{
        counter=msg.value;
    }

    function setMyUint(uint temp1) public{
        counter=temp1;
    }
   

     fallback() external payable{
         functionCalled="fallback";
         counter=msg.value;
         
     }
     receive() external payable{
         functionCalled="receive";
         counter=msg.value;
     }


 }
