const token = artifacts.require("BEPToken");


contract("token", async (accounts)=>{

   
    it("should check for total supply",async ()=>{
        const contract =await token.deployed();
        assert.equal(await contract.getTotalSupply(),100000,"total supply not same");
    });


    it("minting", async()=>{
        const contract=await token.deployed();
        let totalSupply=await contract.getTotalSupply();
        assert.equal(await contract.balanceOf(accounts[1]),0, "Initial balance of account should be 0");
        await contract.mint(accounts[1],100);
        assert.equal(await contract.balanceOf(accounts[1]),100, "Transfer balance of account should be 100");
        console.log(await contract.balanceOf(await contract.getOwner()));
        assert.equal(await contract.balanceOf(await contract.getOwner()),99900, "Transfer balance of owner should be less by  100");

try{
    await contract.mint('0x0000000000000000000000000000000000000000',100);
}
catch(error){

    assert.equal(error.reason,"address cant be 0", "minting to 0 not caught");
}

    });

    it("burning", async()=>{
        const contract1=await token.deployed();
        let totalSupply=await contract1.getTotalSupply();
        // assert.equal(await contract.balanceOf(accounts[1]),0, "Initial balance of account should be 0");
        // await contract1.mint(accounts[1],100);
        // console.log("balance 1",await contract1.balanceOf(accounts[1]));
        // assert.equal(await contract1.balanceOf(accounts[1]),100, "Transfer balance of account should be 100");
        // console.log("balance 1",await contract1.balanceOf(await contract1.getOwner()));
        // assert.equal(await contract1.balanceOf(await contract1.getOwner()),99900, "Transfer balance of owner should be less by  100");

        await contract1.burn(accounts[1],100);
        console.log("balanceOf",await contract1.balanceOf(accounts[1]));
        assert.equal(await contract1.balanceOf(accounts[1]),0, "Initial balance of account should be 0");

        console.log("balanceOf",await contract1.balanceOf(await contract1.getOwner()));
        assert.equal(await contract1.balanceOf(await contract1.getOwner()),100000, "Transfer balance of owner should be less by  100");

try{
    await contract1.burn('0x0000000000000000000000000000000000000000',100);
}
catch(error){
    // console.log(error);
    assert.equal(error.reason,"address cant be 0", "minting to 0 not caught");
}

    });

})