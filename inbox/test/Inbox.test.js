const assert = require('assert');
const ganache = require('ganache-cli');
const { interfaces } = require('mocha');
const Web3 = require('web3');
const web3 = new Web3(ganache.provider()); //web3 is an instance, a portal to all things in etehreum world, will change depend on the network
const {interface, bytecode} = require('../compile');

//make access to web3 and use it to retrieve a list of accounts as part of the local ganache network
//web3 library to access unlocked accounts (freely send/receive ether)

let accounts;
let inbox;

beforeEach(async () => {
    //get a list of all accounts
    accounts = await web3.eth.getAccounts();

        
    //use one of those accounts to deploy the contract
    //to deploy we need access to the contract's bytecode that has been produced by compile.js 
    
    inbox = await new web3.eth.Contract(JSON.parse(interface)) //Contract is a constructor function 
        .deploy({data:bytecode, arguments:['A Rebeca é linda!']}) //starts to create an object transaction
        .send({from:accounts[0], gas:'1000000'})

});

describe('Inbox', () =>{
    it('deploys a contract', () => {
        assert.ok(inbox.options.address);
    });

    it('has a default message', async() => {
        const message = await inbox.methods.message().call(); 
        //reference the contract (inbox - an instance of the contract that exists on the blockchain)
        //our contract has a property (methods) that is an object that contains all of the  public functions that exist in our contract
        
        assert.equal(message, 'A Rebeca é linda!');


    });

    it('can change the message', async() => {
        await inbox.methods.setMessage('A Rebeca é linda e brava').send({from: accounts[0]});
        const message = await inbox.methods.message().call();
        assert.equal(message, 'A Rebeca é linda e brava')

        //whenever we send a transaction to a function we get back a hash 
        
    });

});