const quill=artifacts.require('Quillacious');


module.exports = function(deployer, network,accounts){
    console.log("network"+network);
    console.log("accounts"+accounts);
    deployer.deploy(quill);
}