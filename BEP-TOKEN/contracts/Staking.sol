//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract staking{

    constructor(){
        stakeholders.push();
    }

    struct stake{
        address user;
        uint amount;
        uint since;
    }

    struct stakeholder{
        address user;
        stake[] address_stakes;
    }

    stakeholder[] internal stakeholders;

    mapping(address=>uint) internal stakes;
    event staked(address indexed user, uint amount,uint index,uint timestamp);


    function _addStakeHolder(address staker) internal returns(uint){
        
        stakeholders.push();

        uint userIn=stakeholders.length - 1;
        stakeholders[userIn].user = staker;
        stakes[staker]=userIn;
        return userIn;

    }

    function _stake(uint amount) internal{
        require(amount>0,"value must be greater than 0");
        uint index = stakes[msg.sender];
    }

}