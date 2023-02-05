            
           
            async function setAccount(){
                import Web3 from 'web3';
                // let Web3 = require('web3');
                let web3=new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:8545'));
                let accounts= await web3.eth.getAccounts();
                console.log("accounts",accounts);
            document.getElementById("accounts").innerHTML=accounts;
            }
            setAccount()