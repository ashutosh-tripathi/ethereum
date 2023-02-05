//SPDX-License-Identifier:MIT
pragma solidity ^0.8.15;

import './CrowdSale.sol';
import './KYCContract.sol';
contract CrowdSaleToken is Crowdsale {
    KYCContract kycContract;
    constructor(
        uint256 rate,    // rate in TKNbits
        address payable wallet,
        IERC20 token,
        KYCContract _kyc
    )
        Crowdsale(rate, wallet, token)
        public
    {
        kycContract=_kyc;
    }


     function _preValidatePurchase(address beneficiary, uint256 weiAmount)  internal  override view {
        super._preValidatePurchase(beneficiary,weiAmount);
        require(kycContract.getKYCStatus(msg.sender),"KYC should be completed"); 
   }
}

