//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import  './Ownable.sol';
import  './Item.sol';

contract ItemManager is Ownable{
    enum ItemState{Created,Paid,Delivered}

    struct item_struct{
        Item item;
        string  identifier;
        uint price;
        ItemState state;
    }

    uint itemIndex;
    mapping(uint=>item_struct) public items;
    event stepInSettlement(uint index, uint state, address _itemAddress);
    
    function createItem(string memory identifier, uint price) public onlyOwner{
        Item item =new Item(this,itemIndex,price);
        items[itemIndex].item=item;
        items[itemIndex].identifier=identifier;
        items[itemIndex].price=price;
        items[itemIndex].state=ItemState.Created;
        emit stepInSettlement(itemIndex,uint(ItemState.Created),address(item));
        itemIndex++;
        
    }

    function triggerPayment(uint _itemIndex) public payable onlyOwner{
        require(items[_itemIndex].price<=msg.value,"Pay fully");
        require(items[_itemIndex].state==ItemState.Created,"item moved along in stage");
        items[_itemIndex].state=ItemState.Paid;
        emit stepInSettlement(_itemIndex,uint(ItemState.Paid), address(items[_itemIndex].item));


    }

    function triggerDelivery(uint _itemIndex) public onlyOwner{
     require(items[_itemIndex].state==ItemState.Paid,"item moved along in stage");
     items[_itemIndex].state=ItemState.Delivered;
     emit stepInSettlement(_itemIndex,uint(ItemState.Delivered),address(items[_itemIndex].item));
    }

}