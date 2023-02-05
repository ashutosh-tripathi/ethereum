Node :
-> npm intit -y;
->  npm install  <package name>  -g(for gloal)
-> node <file-name>

Truffle:
-> truffle init
-> truffle console --network ganache
-> edit truffle-config.json for all connections
-> to connect to any hdwallet provider use infura id, mnemonic phrase
-> truffle compile [to compile smart contract]
-> truffle migrate [to deploy smart contract on any network]
-> truffle test [to test]
-> truffle development [to open ganache like truffle environment]
-> npm run start [to start react app]
-> to install hdwallet-provider[goerli, ropsten,rinkeby]: npm install --save @truffle/hdwallet-provider   
   - copy your api infura key.
   - Secret key phrase
   - Make changes to truffle-config.js
   - Use truffle networks goerli[ ganache]  based on network configuration