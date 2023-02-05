//SPDX-License-Identifier:temp

pragma solidity ^0.8.15;

contract SendWithdrawMoney{


    uint public balanceReceived;

    function depositBalance() public payable{
        balanceReceived=msg.value;
    //    payable(address(this)).transfer(msg.value);

    }
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawAll() public payable{

         address _to=msg.sender;
        payable(_to).transfer(getContractBalance());
    }
    function withdrawAmount(uint amount) public payable{

         address _to=msg.sender;
        payable(_to).transfer(amount);

    }
    function withdrawToAddress(address payable _to) public payable{
        _to.transfer(msg.value);
    }
}
