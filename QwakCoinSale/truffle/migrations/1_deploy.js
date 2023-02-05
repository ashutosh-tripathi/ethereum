var  token=artifacts.require("QwakCoin.sol");
var tokenSale=artifacts.require('CrowdSaleToken.sol');
var kyccontract=artifacts.require('KYCContract.sol');
require("dotenv").config({path:"../.env"});
const BN=web3.utils.BN;

module.exports=async function(deployer){
    await deployer.deploy(kyccontract);
    let kyc=await kyccontract.deployed();
    let accounts=await web3.eth.getAccounts();
    console.log("accounts===============================================================>",accounts);
    let token1 = await deployer.deploy(token,new BN(process.env.INITIAL_SUPPLY));
    await deployer.deploy(tokenSale,1,accounts[0],token.address,kyc.address);

    let instance= await token.deployed();
    await instance.transfer(tokenSale.address,await instance.totalSupply());
    console.log("final balance", await instance.balanceOf(tokenSale.address));
}