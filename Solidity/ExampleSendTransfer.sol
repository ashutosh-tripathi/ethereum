//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract WithdrawSend{
    receive() external payable{}

    event sendError(bool);
    function fundTransfer(address payable _to) public  payable{
        _to.transfer(10);
    }
    function fundSend(address payable _to ) public  payable{
      bool result=  _to.send(10);
        require(result,"fund send failed");
    }

     function getBalance() public view returns(uint){
        return address(this).balance;
    }
}


contract receiveNoAction{

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    receive () external payable{

    }

}
contract receiverAction{
    uint balanceReceived;
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    receive() external payable{
        balanceReceived+=msg.value;
    }
}
