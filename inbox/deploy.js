const HDWalletProvider = require('@truffle/hdwallet-provider');
const Web3 = require('web3');
const {interface, bytecode} = require('./compile');
const provider = new HDWalletProvider(
  'dumb shallow true torch visit hand dose notice chicken evolve crystal cigar',
  'https://rinkeby.infura.io/v3/cf37711cd71541e78e2cd6fcececfeaa'
);
const web3 = new Web3(provider);

const deploy = async() => {
    const accounts = await web3.eth.getAccounts();

    console.log('Attempting to deploy from account', accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({data: bytecode, arguments:['Estou com fome']})
        .send({gas:'1000000', from:accounts[0]});

        console.log('Contract deploy to', result.options.address);
        provider.engine.stop();
};
deploy();

