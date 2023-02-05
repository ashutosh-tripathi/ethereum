require("@nomicfoundation/hardhat-toolbox");
const fs =require("fs");

/** @type import('hardhat/config').HardhatUserConfig */

let mnemonic=fs.readFileSync(".secret").toString();
let infuraProjectId=fs.readFileSync(".infura").toString();
module.exports = {
  networks:{
    goerli:{
      url:"https://goerli.infura.io/v3/"+infuraProjectId,
      accounts:{
        mnemonic,
        path:"m/44'/60'/0'/0",
        initialIndex:0,
        count:10
      }
    }
  },
  solidity: "0.8.17",
};
