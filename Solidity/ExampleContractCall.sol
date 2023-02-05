//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract contractOne{

    event depositfunctioncalled(string);
    mapping(address=> uint) public balances;

    function deposit() public payable{
        emit depositfunctioncalled("dposit functionCalled");
        balances[msg.sender]+=msg.value;
    }


    receive() external payable{
         emit depositfunctioncalled("receive functionCalled");
        balances[msg.sender]+=msg.value;
    }


}

contract contractTwo{


function depositinOne(address _contractOne) public{
    // contractOne cont1= contractOne(_contractOne);
    // bytes memory functionbytes=abi.encodeWithSignature("deposit()");
    (bool result,)=_contractOne.call{value:100,gas:100000000}("");

    require(result,"result not found");
}

receive() external payable{

}

}
