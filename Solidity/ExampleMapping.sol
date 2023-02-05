//SPDX-License-Identifier:temp
pragma solidity ^0.8.15;

contract ExampleMapping{

    mapping(uint=>bool) public testMapping;
    mapping(address=> bool) public addressMapping;
    mapping(uint => mapping(uint=>bool)) public uintuintmapping;

    function  updateValue(uint _num) public 
    {
        testMapping[_num]=true;
    }
    function getValue(uint _num) public view returns(bool)
    {
        return testMapping[_num];
    }
    function updateAddressToTrue(address _testaddress) public{
        addressMapping[_testaddress]=true;
    }

    function updateuintuintMap(uint a, uint b, bool value) public
    {
        uintuintmapping[a][b]=value;
    }
}
