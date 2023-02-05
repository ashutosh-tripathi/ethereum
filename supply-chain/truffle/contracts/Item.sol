//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import  './ItemManager.sol';
contract Item{

    uint public priceInWei;
    uint public index;
    ItemManager public  parentContract;
    uint public pricePaid;
    constructor(ItemManager itmeManager, uint _index, uint _priceInWei)
    {
        index=_index;
        priceInWei=_priceInWei;
        parentContract=itmeManager;
    }
    receive() external payable{
        require(pricePaid==0, "item is not already paid");
        require(priceInWei==msg.value,"only full payment allowed");
        pricePaid=msg.value;
        (bool success, )=address(parentContract).call{value:msg.value}(abi.encodeWithSignature("triggerPayment(uint256)",index));
        require(success, "the transaction wasn't successful");
    //    payable(address(parentContract)).transfer(msg.value);
    }
    fallback() external payable{

    }

}