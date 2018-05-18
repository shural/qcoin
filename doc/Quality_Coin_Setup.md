    Set up the Private Chain for Quality block	
        1. Download the Geth client from https://geth.ethereum.org/downloads/ 
	
	2. Launch the Ethereum private change
		a. Create the account (chin1 below is the folder to store my node info)
		./geth --datadir ./chain1 --nodiscover console
		
		> personal.newAccount("1234")  
		"0xc9228294cc6bc3e3fcdba0f5d393d68f920c7789"  
		
		> personal.newAccount("1234")  
		"0x5f0880e6c3507f609548732151a99f6ddc71cb95"  
		
		>  eth.getBalance
		The balance of the above 2 accounts are all 0 now.
	
	3. Create the Genesis Block as below
	{
   	    "alloc": {
                "0x730791c2eecd7d123fbca8c058f4102cabec945f": {
                "balance": "99999000000000000000000"
                } 
            },
            "config":{
                "chainId":10,
                "homesteadBlock":0,
                "eip155Block":0,
                "eip158Block":0
            },
            "nonce":"0x0000000000000042",
            "mixhash":"0x0000000000000000000000000000000000000000000000000000000000000000",
            "difficulty": "0x2000",
            "alloc": {},
            "coinbase":"0x0000000000000000000000000000000000000000",
            "timestamp": "0x00",
            "parentHash":"0x0000000000000000000000000000000000000000000000000000000000000000",
            "extraData": "",
            "gasLimit":"0xffffffff"
        }	

	Then initialize the private chain with the Gennesis Block
	./geth removedb --datadir chain1
	./geth --datadir chain1 init genesis.json 
	
	4. Copy the Genesis Block and node info (chain1 in this case) to all nodes for initialization
	./geth removedb --datadir chain1
	./geth --datadir chain1 init genesis.json 
	
	5. Construct the Private Chain
	On all nodes, execute 
	./geth --datadir chain1 --networkid 10 console
	> admin.nodeInfo.enode
	It will show you the node info including public key(address) + Geth port number (30303 by default)
		
	Replace the portion of [::] with the ip address, we can get the full address for the node.
	
	Create the static-nodes.json in ./chain1/geth including the full node info of other nodes:
	
	Restart the geth w/ the below commands:
	./geth --datadir chain1 --networkid 72 --ipcdisable --rpc --rpcapi 'web3,eth,net' --rpccorsdomain '*' --rpcport 8200 console
	
	Then we can see the nodes has been activated 
	
	
	If other nodes still not added, please add the nodes manually 
	
	
	6. Start mining on Private chain
	./geth --datadir chain1 --networkid 72 --ipcdisable --rpc --rpcapi 'web3,eth,net' --rpccorsdomain '*' --rpcport 8200 console
	
	Start the mining w/ miner.start(1)
	
	Mining can be stopped w/ miner.stop()

     Deploy the smart contract for quality block
        1. Install truffle w/ 
	    sudo yum install npm.x86_64
	    sudo npm install -g truffle
	
	2. Create the Truffle project
	    mkdir SimpleStorage
	    cd SimpleStorage
            truffle init

	3. Modify the migration scripts in migration/2_deploy_contracts.js
	

	4. Modify SimpleStorage/truffle.js(project configuration file)
	

	Please be noticed to change the port to the number you used to launch geth

	5. Start geth w/ RPC port opened
	./geth --datadir ./data/00 --networkid 314590 --ipcdisable --port 61910 --rpc --rpcapi 'web3,eth,net' --rpccorsdomain '*' --rpcport 8545 console

	6. Unlock the account (for 20 minutes)
	
        7. Use truffle migrate to deploy the smart contract in command line for simple storage
        truffle migrate
