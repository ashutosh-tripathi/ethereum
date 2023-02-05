//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract ExampleStructMApping{

    uint public _amount;
    struct  Transaction{
        uint amount;
        uint timestamp;
    }
     constructor() payable {
          _amount=msg.value;
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }


    struct  Balance{
        uint totalBalance;
        uint numDeposits;
        mapping(uint=>Transaction) deposits;
        uint numWithdrawals;
        mapping(uint=>Transaction) withdrawals;
    }
    mapping(address=>Balance)  public addressMapping;

    function depositBalance( uint amount) public{
    
        addressMapping[msg.sender].totalBalance+=amount;
        addressMapping[msg.sender].numDeposits++;
        Transaction memory depositTransaction=Transaction(amount,block.timestamp);
        addressMapping[msg.sender].deposits[addressMapping[msg.sender].numDeposits]=depositTransaction;
    }
    function withdraBalance(uint amount) public{
        addressMapping[msg.sender].totalBalance-=amount;
        addressMapping[msg.sender].numWithdrawals+=1;
        Transaction memory withdrawTransaction = Transaction(amount, block.timestamp);
        addressMapping[msg.sender].withdrawals[addressMapping[msg.sender].numWithdrawals]=withdrawTransaction;

    }

    function getAddressBalance() public view returns(uint){
        return addressMapping[msg.sender].totalBalance;
    }


    function getDepositBalance() public view returns(Transaction memory) {
        return  addressMapping[msg.sender].withdrawals[addressMapping[msg.sender].numWithdrawals];
    } 




}
