// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "./Ownable.sol";
import "./Staking.sol";
contract BEPToken is Ownable,staking{
    


  /**
  * @notice Our Tokens required variables that are needed to operate everything
  */
  uint public _totalSupply;
  uint8 public _decimals;
  string public _symbol;
  string public _name;

function getName() external view returns(string memory){
    return _name;
}
function getDecimals() external view returns(uint){
    return _decimals;
}
function getSymbol() external view returns(string memory){
    return _symbol;
}
function getTotalSupply() external view returns(uint){
    return _totalSupply;
}

function getOwner() external view returns(address){
    return _owner;
}
  /**
  * @notice _balances is a mapping that contains a address as KEY 
  * and the balance of the address as the value
  */
  mapping (address => uint256) private _balances;

  /**
  * @notice Events are created below.
  * Transfer event is a event that notify the blockchain that a transfer of assets has taken place
  *
  */
  event Transfer(address indexed from, address indexed to, uint256 value);

  /**
  * @notice constructor will be triggered when we create the Smart contract
  * _name = name of the token
  * _short_symbol = Short Symbol name for the token
  * token_decimals = The decimal precision of the Token, defaults 18
  * _totalSupply is how much Tokens there are totally 
  */
  address _owner;
  constructor(string memory token_name, string memory short_symbol, uint8 token_decimals, uint256 token_totalSupply){
      _name = token_name;
      _symbol = short_symbol;
      _decimals = token_decimals;
      _totalSupply = token_totalSupply;
      _owner=msg.sender;

      // Add all the tokens created to the creator of the token
      _balances[msg.sender] = _totalSupply;

      // Emit an Transfer event to notify the blockchain that an Transfer has occured
      emit Transfer(address(0), msg.sender, _totalSupply);
  }

  function balanceOf(address account) external view returns(uint){
    return _balances[account];
  }
    event minted(address, uint, uint);
    event burned(address, uint, uint);

    function mint(address account, uint amount) external{
        require(account!=address(0), "address cant be 0");
        require(msg.sender==_owner, "only owner can mint");

        _totalSupply=_totalSupply-amount;
        _balances[account]=_balances[account]+amount;
        _balances[msg.sender]=_totalSupply;
        emit minted(account,amount,_totalSupply);
    }

    function burn(address account, uint amount) external{
        require(account!=address(0), "address cant be 0");
        require(msg.sender==_owner, "only owner can mint");

        _totalSupply=_totalSupply+amount;
        _balances[account]=_balances[account]-amount;
         _balances[msg.sender]=_totalSupply;
        emit burned(account,amount,_totalSupply);
    }

    function transfer(address recipient, uint amount) external returns(bool) {
        _transfer(msg.sender,recipient,amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint amount) internal{
        require(sender != address(0),"sender can not be 0");
        require(recipient != address(0),"recipient can not be 0");
        require(_balances[sender]> amount, "not enough amount to transfer");

        _balances[sender]=_balances[sender]-amount;
        _balances[recipient]=_balances[recipient]+amount;
        emit Transfer(sender,recipient,amount);
    }



}
