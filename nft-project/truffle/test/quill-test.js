const quill=artifacts.require('Quillacious');
const truffleAssert= require('truffle-assertions');

contract("quill",(accounts)=>{
    it("should check nft credited to an account",async()=>{
        const quillIn = await quill.deployed();
        let txResult=  await quillIn.safeMint(accounts[0],'quill_1.json');

        console.log("txResult"+txResult.from+"  "+txResult.Transfer);
          truffleAssert.eventEmitted(txResult,"Transfer",{from:'0x0000000000000000000000000000000000000000', to:accounts[0]});
        console.log(await quillIn.ownerOf(0));
        assert.equal(await quillIn.ownerOf(0),accounts[0],"given accounts are not equal");


    })
})