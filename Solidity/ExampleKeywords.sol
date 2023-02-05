//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;


contract ExampleKeywords{



        modifier between1and2eth(){
         require(msg.value>=1 ether && msg.value <=2 ether,"value is not between 1 and 2 eth");
         _;
        }


        function between1and2ether(uint value)public pure{
            require(value * 1 ether>=1 ether && value *1 ether<=2 ether,"value is not between 1 and 2 eth");


        }

        uint public startInTime;
        uint public endTime;
        constructor(uint day) {
            startInTime=block.timestamp+day*1 days;
            endTime=startInTime+7  days;
        }




}
