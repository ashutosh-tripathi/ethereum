(async () => {
    try{
        console.log("going to deploy smart contract");
        const quill=await hre.ethers.getContractFactory("Quillacious");
        const quillId=await quill.deploy();
        await quillId.deployed();
        console.log("deployed contract at",quillId.address);
    }catch(e){
        console.error(e);
        process.exitCode=1;
    }



})