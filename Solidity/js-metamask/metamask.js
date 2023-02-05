async function enableMetamask(){

  if(window.ethereum!=null){
  
  try{
   var accounts= await window.ethereum.request({
   method:'eth_requestAccounts' 
   });
   console.log("accounts"+accounts);
   document.getElementById("id1").innerHTML=accounts;
   
   let web3=new Web3(window.ethereum);
   
   document.getElementById("id2").innerHTML= await web3.eth.getAccounts();
   
  }
  catch(error)
  {
  console.log("found exception "+error)
  }
  
  
  //document.getElementById("id1").innerHTML="ethereum found"
  }
  else
  {
  document.getElementById("id1").innerHTML="ethereum not found"
  }
}
let abi=[
	{
		"inputs": [],
		"stateMutability": "payable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "address",
				"name": "from",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "address",
				"name": "to",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "transferFund",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "balances",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_from",
				"type": "address"
			},
			{
				"internalType": "address payable",
				"name": "to",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "transfer",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];

async function listenToEvents(){
var web3=new Web3(window.ethereum);

var address=document.getElementById("address").value;
console.log("address "+address);

var contract=new web3.eth.Contract(abi,address);
console.log("contract"+contract);
/* contract.events.transferFund().on("data",(event)=>{
console.log(JSON.stringify(event));
document.getElementById("id3").innerHTML=JSON.stringify(event)+"<br />==========<br />"+document.getElementById("id3").innerHTML;
}); */

contract.getPastEvents("transferFund", {fromBlock:0}).then((event)=>{
console.log(JSON.stringify(event));
document.getElementById("id3").innerHTML=JSON.stringify(event)+"<br />==========<br />"+document.getElementById("id3").innerHTML;
});


}

