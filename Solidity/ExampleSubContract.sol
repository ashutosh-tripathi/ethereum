//SPDX-License-Identifier:temp

pragma solidity ^0.8.15;

contract Wallet{

 paymentReceived public payment ;

    function createPayment() public payable{
           payment=new paymentReceived(msg.value,msg.sender);
    }


}

contract paymentReceived{


    uint public amountRec;
    address public from;

    constructor(uint _amt, address _from)
    {
        from=_from;
        amountRec=_amt;
    }
}


contract Wallet2{
     
     struct paymentrec{
         uint amount;
         address from;
     }

     paymentrec public payment;

    function updatestructValue() public payable
    {
        payment.amount=msg.value;
        payment.from=msg.sender;
    }

    function fetchstructvalue() public view returns(address, uint){
        return (payment.from,payment.amount);
    }







}
