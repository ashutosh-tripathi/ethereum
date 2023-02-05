const Token=artifacts.require("QwakCoin");

const { assert } = require('chai');
var chai=require('chai');
const BN=web3.utils.BN;
const chaiBN=require('chai-bn')(BN);
chai.use(chaiBN);
var chaiAsPromised=require('chai-as-promised');
chai.use(chaiAsPromised);
const expect=chai.expect;

contract("Token Test",async(accounts)=>{

    beforeEach(async()=>{
        this.myToken=await Token.new(1000);
    })

    const [deployer, recipient,anotheraccount]=accounts;
    it("all tokens should be in my account",async()=>{
        let instance=this.myToken;
        // let instance=await Token.deployed();
        let totalSupply=await instance.totalSupply();
        let balance = await instance.balanceOf(accounts[0]);
        // console.log("totalSupply",totalSupply,"balance",balance);
        // console.log("valueOf",totalSupply.valueOf(),"balance",balance.valueOf());

        // assert.equal(balance.valueOf(), totalSupply.valueOf(),"balance not same");
        expect(balance).to.be.a.bignumber.equal(totalSupply);
    });

    it("is possible to send token to another account",async()=>{
        let instance=this.myToken;
        let initialBalance=await instance.balanceOf(deployer);
        console.log("initialBalance",initialBalance);
        await instance.transfer(recipient,10);
        console.log("recipient balance",await instance.balanceOf(recipient));
        expect(await instance.balanceOf(deployer)).to.be.a.bignumber.equal(initialBalance.sub(new BN(10)));
        expect(await instance.balanceOf(recipient)).to.be.a.bignumber.equal(new BN(10));
    });

    it("should not send more than balance", async()=>{
        let instance=this.myToken;
        let initialBalance=await instance.balanceOf(deployer);
        let totalSupply=await instance.totalSupply();
console.log("initialBalance",initialBalance);
console.log("totalSupply",totalSupply);
        expect( instance.transfer(recipient,initialBalance.add(new BN(10)))).to.eventually.be.rejected;
        console.log("recipient blanace",await instance.balanceOf(recipient));
        expect(await instance.balanceOf(deployer)).to.be.a.bignumber.equal(initialBalance);
    });
})