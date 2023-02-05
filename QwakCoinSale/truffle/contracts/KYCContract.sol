//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "@openzeppelin/contracts/access/Ownable.sol";

contract KYCContract is Ownable{
    mapping(address=> bool) allowed;

   
    function setKYCCompleted(address temp)  public onlyOwner{
        allowed[temp]=true;
    }

    function setKYCRevoked(address temp)  public onlyOwner{
        allowed[temp]=false;

    }
    function getKYCStatus(address temp)  public view  returns(bool) {
        return allowed[temp];
    }

    function getOwner () public view returns(address){
        return super.owner();
    }




}