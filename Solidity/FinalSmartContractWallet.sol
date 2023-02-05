//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract ReceiveFund{
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function deposit() public payable{
        // payable(address(this)).transfer(msg.value);
    }

}









contract FinalSmartContractWallet{

    address payable public owner;

    constructor(){
        owner=payable(msg.sender);
    }
    mapping (address=> uint) public allowance;
    mapping (address=> bool) public  allowedToSend;

    mapping (address=>bool) public guardians;
    address payable public _nextOwner;
    uint8 constant maxApproval=3;
    uint8 guardianResetCount;
    mapping(address=> mapping(address=>bool)) public addressVoteMapping;

    function setGuardian(address _guardian, bool value) public{
        require(msg.sender==owner,"only owner can set guardian");
        guardians[_guardian]=value;
    }


    function proposeNewOwner(address payable _newOwner) public{
        require(guardians[msg.sender]==true,"msg sender should be gaurdian");
        require(addressVoteMapping[_newOwner][msg.sender]==false,"sender has already voted");
        if(_newOwner!=_nextOwner)
        {
            _nextOwner=_newOwner;
            guardianResetCount=0;
        }
      
        guardianResetCount++;

        if(guardianResetCount==maxApproval){
            owner=_nextOwner;
            _nextOwner=payable(address(0));
            guardianResetCount=0;
        }
    }

    function setAllowance(address _to, uint amount) public payable{
        require(msg.sender==owner,"only owner can set allowance");
        allowance[_to]=amount;
        if(amount>0)
        {
            allowedToSend[_to]=true;
        }
    }


    function getBalance()public view returns(uint){
        return owner.balance;
    }

    function transferFunds(address payable _to, uint amount,bytes memory payload) public payable returns(bytes memory){
        // require(msg.sender==owner, "You are not the owner!!");
        if(msg.sender!=owner)
            {
                require(allowedToSend[msg.sender],"sender is not allowd to send fund");
                require(allowance[msg.sender]>=amount, "you are trying to send more than the allowance");
                allowance[msg.sender]-=amount;
            }
            (bool success, bytes memory result)=_to.call{value:amount}(payload);
            require(success,"transfer failed");
            return result;
    }

    receive() external payable{
        owner.transfer(msg.value);
    }



}
