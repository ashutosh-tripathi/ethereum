//SPDX-License-Identifier:MIT
pragma solidity ^0.8.15;

abstract contract ERC20{
    function transfer(address _to, uint256 _value) public virtual returns (bool success);
    function decimals() public view virtual returns (uint8);
}

contract ERC20Sale{
    uint tokenPriceInWei=1 ether;
    ERC20 public token;
    address public  tokenOwner;
    constructor(address _token){
        tokenOwner=msg.sender;
        token=ERC20(_token);
    }

    event transmitMessage(string);
    function purchaseCoffee() public payable{
        require(msg.value>=tokenPriceInWei,"not enough tokens");
        uint tokensToTransfer=msg.value/tokenPriceInWei;
        emit transmitMessage(string(abi.encode(tokensToTransfer)));
        uint remainder=msg.value-(tokensToTransfer*tokenPriceInWei);
        emit transmitMessage(string(abi.encode(remainder)));
        token.transfer(msg.sender,remainder);
        payable(msg.sender).transfer(tokensToTransfer);


    }

}
