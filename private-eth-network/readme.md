To initialize--> geth init --datadir networkdata genesis.json 
To start with discovery of other network running on same chaindata-->   geth --datadir networkdata
To start without discovery-->  geth --datadir networkdata --nodiscover
To attach to the running geth node js ie. console-->  geth attach ipc:/home/ashutosh/Downloads/ethereum/private-eth-network/networkdata/geth.ipc
To start account with mining and account:-
           geth --datadir networkdata --nodiscover --unlock 0 --mine 1

In console:
  eth.accounts         --[List all accounts]
  miner                --[List miner details]
  miner.setEtherbase(eth.accounts[0]// or any other account) -- sets miner ether details
  miner.start(args:thread count)                      -- to start miner