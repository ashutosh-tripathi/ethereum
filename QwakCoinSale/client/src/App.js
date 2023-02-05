import React,{Component} from 'react';
import './App.css';
import Web3 from 'web3';



class App  extends Component {
  componentDidMount() {
    this.loadBlochchainData();
  }
  constructor(props)
  {
    super(props);
    this.state={account:'',loaded:false,kycAddress:'0x123...',kycStatus:false};
    this.qwakContract=null;
    this.kycContract=null;
    this.crowdSaleContract=null;
    this.web3interface=null;
    this.accounts=null;
  }

  async loadBlochchainData(){
    // https://goerli.infura.io/v3/${infuraId}
    const web3=await new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:8545'));
  
    // const web3=await new Web3(new Web3.providers.HttpProvider('https://goerli.infura.io/v3/80b96aa50c584ab49db0ad2b72e089ef'));

    //  const web3 = new Web3(Web3.givenProvider);
   this.web3interface=web3;
    // const accounts=await web3.eth.getAccounts();
    // await window.ethereum.enable();
    console.log("web3",web3);
    web3.eth.getAccounts().then(console.log);
    // const accounts2 = await web3.eth.send('eth_requestAccounts');
    // console.log("accounts",accounts2);
    const accounts=await web3.eth.getAccounts();
    this.accounts=accounts;
    console.log("accounts: ", accounts);
    this.setState({account:accounts[0]});

    let kycCon=require('./contracts/KYCContract.json');
    let  networkId=await web3.eth.net.getId();
    let  deployedNetwork=kycCon.networks[networkId];
     this.kycContract=await new web3.eth.Contract(kycCon.abi,deployedNetwork && deployedNetwork.address  );



    let qwakcoin=require('./contracts/QwakCoin.json');
      networkId=await web3.eth.net.getId();
      deployedNetwork=qwakcoin.networks[networkId];
 
     this.qwakContract= await new web3.eth.Contract(qwakcoin.abi,deployedNetwork && deployedNetwork.address);

    // this.setState({qwakcoin:qwakContract});
    let crowdSale=require('./contracts/CrowdSaleToken.json');
     networkId=await web3.eth.net.getId();
     deployedNetwork=crowdSale.networks[networkId];
    this.crowdSaleContract=await new web3.eth.Contract(crowdSale.abi,deployedNetwork && deployedNetwork.address  );


    // let balance =  await this.qwakContract.methods.balanceOf(this.crowdSaleContract._address).call();
    let balance =  await this.qwakContract.methods.balanceOf(this.crowdSaleContract._address).call();

    this.setState({balance:balance});
    this.state.loaded=true;
  }
  
  handleInputChange=(event) => {
    const target = event.target;
    const value =target.type==="checkbox"? target.checked : target.value;
    const name=target.name;
    this.setState({
      [name]:value
     });
  }
  submitKYC=async()=>{

    // console.log("is address",this.state.kycAddress,"   ",await this.web3interface.utils.isAddress(this.state.kycAddress));
    console.log("address",this.state.kycAddress,"   ",this.state.account);
    if(await this.web3interface.utils.isAddress(this.state.kycAddress))
    {
      console.log("owner is ",await this.kycContract.methods.getOwner().call());
     var result= await this.kycContract.methods.setKYCCompleted(this.state.kycAddress).send({from:this.accounts[0]});
     console.log("call result",result);
    }
  }
  fetchKYC=async()=>{
    console.log("is address"+this.web3interface.utils.isAddress(this.state.kycAddress));
    if(this.web3interface.utils.isAddress(this.state.kycAddress))
    {
    let status=  await this.kycContract.methods.getKYCStatus(this.state.kycAddress).call({from:this.state.account});
    console.log("status", status);
    this.setState({kycStatus:status});
    }
  }

  render(){
    if(this.state.loaded){
  return (
    <div className="container">
     <h1>Qwak Coin </h1> <br/>
     <h3>Owner :  {this.state.account}</h3>
     <h3>Qwak coin deployed at:{this.qwakContract._address}</h3>

     <h3>Crowd Sale deployed at:{this.crowdSaleContract._address}</h3>
     <h3>KYC contract deployed at:{this.kycContract._address}</h3>
     <h3>Balance of Qwakcoin:{  this.state.balance}</h3>
     KYC Contract :<input type ="text" name="kycAddress" value={this.state.kycAddress} onChange={this.handleInputChange}/>
     <button type="submit" onClick={this.submitKYC}>Submit KYC</button>
     <button type="submit" onClick={this.fetchKYC}>Fetch KYC</button>
     <h3>KYC Status: {this.state.kycStatus.toString()}</h3>
    </div>
  );
    }
  }
}

export default App;
