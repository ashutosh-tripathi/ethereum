const Token=artifacts.require("QwakCoin");
const TokenSale=artifacts.require("CrowdSaleToken");
const kyccontract=artifacts.require("KYCContract");

const { assert } = require('chai');
var chai=require('chai');
const BN=web3.utils.BN;
const chaiBN=require('chai-bn')(BN);
chai.use(chaiBN);
var chaiAsPromised=require('chai-as-promised');
chai.use(chaiAsPromised);
const expect=chai.expect;

contract("Token Test",async(accounts)=>{

    const [deployer, recipient,anotheraccount]=accounts;

    it("should check balance of deployer account is 0", async()=>{
        let instance=await Token.deployed();
        expect(await instance.balanceOf(deployer)).to.be.a.bignumber.equal(new BN(0));
    });
    it("should check all tokens are in token sale account", async()=>{
        let instance=await Token.deployed();
        let instanceSale=await TokenSale.deployed();
        
        expect(await instance.balanceOf(instanceSale.address)).to.be.a.bignumber.equal(await instance.totalSupply());
    })
    it("should allow to transfer tokens", async()=>{
        let instance=await Token.deployed();
        let instanceSale=await TokenSale.deployed();
        // await instance.transferFrom(instanceSale.address,recipient,10);
        // await instanceSale.transfer(recipient,10);
        let balance=await instance.balanceOf(deployer);
        console.log("initial ",balance);
        // expect( await instanceSale.sendTransaction({from: deployer, value: 1})).to.be.fulfilled;
        let kycinstance=await kyccontract.deployed();


        console.log("owner is ",await kycinstance.getOwner());
        console.log("deployer is ",deployer);
       await kycinstance.setKYCCompleted(deployer,{from: deployer});
       console.log("after kyc")
       await  instanceSale.sendTransaction({from: deployer, value: 1});
        balance=await instance.balanceOf(deployer);
        console.log("after ",balance);


        expect(await instance.balanceOf(deployer)).to.be.a.bignumber.equal(new BN(1));
    })
})