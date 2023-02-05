//SPDX-License-Identifier: temp

pragma solidity ^0.8.15;

contract ExampleBoolean{

    bool public myFirstBoolean=true;

    function setMyBool(bool _setBool) public  {
        myFirstBoolean=_setBool;
    }
}
