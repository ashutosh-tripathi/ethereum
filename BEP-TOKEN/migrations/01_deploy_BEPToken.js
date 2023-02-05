const token = artifacts.require("BEPToken");

module.exports =  function(deployer, network, accounts){
     deployer.deploy(token, 'Quillacious', 'QWL',18,100000);
     const deployed=await token.deployed();

}