//SPDX-License-Identifier: temp

pragma solidity 0.8.15;

contract ExamplUint{

    uint public firstuint=10;
    uint8 public firstuint8=254;
    function setFirstUint(uint _newuint) public
    {
        firstuint=_newuint;
    }

    function setFirstUint8(uint8 _newuint8) public
    {
        unchecked{
        firstuint8=_newuint8;
        }
    }

    function incrementUint8() public{
        unchecked{
        firstuint8++;
        }
    }

}
