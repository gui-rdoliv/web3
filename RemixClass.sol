// SPDX-License-Identifier: MIT
pragma solidity 0.8.7; 

//definindo uma string dentro do contrato que vai ter read access public depois de fazer o deploy
// o valor da string será armazenado na blockchain

contract HelloWorld {
    string public myString = "Hello World"; 
}

//Data types - values and references 
// value means data stored a value 
// references do not stored a value instead a reference to where the data is stored

contract ValueTypes{
    bool public b = true;
    uint public u = 123; //uint = uint256 0 to 2**256 -1
    int public c = 321; // int = int256 -2**255 to 2**255 -1
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0x7876dF5e605b5f2283c7867DB4e0780Ff61881D5;
}

//function will be external that means when we deployed the contract we will be able to call this function
// pure means read only does not write anything on the blockchain

contract FunctionIntro{
    function add(uint x, uint y) external pure returns (uint){
        return x + y;

    }

    function sub(uint x, uint y) external pure returns (uint){
        return x - y;
    }
}

contract LocalVariables {
    uint public n;
    bool public m;
    address public myAddress;

    function foo() external {
        uint x = 123;
        bool f = false;
        x += 456;
        f = true;

        n = 543;
        m = true;
        myAddress = address(1);
    }
}

//view is like pure read only functions
//can read data from state and global variables

//return some values stored inside the global variables 

//global variables are msg.sender, block.timestamp and block.number 


contract GlobalVariables{
    function globalVars() external view returns (address, uint, uint){
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number; 
        return(sender, timestamp,blockNum);
    }
}
contract ViewAndPureFunctions{
    uint public num;

    function viewFunc() external view returns (uint){
        return num;
    }

    function pureFunc() external pure returns(uint){
        return 1;
    }

    function addToNum(uint x) external view returns(uint){
        return num + x;
    }
     function add(uint x, uint y) external pure returns(uint){
        return y + x;
    }
}

contract Counter {
    //state variable
    uint public count;
    
    //function that will write 
    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }

}

contract Ownable {
    //state variable
    address public owner;

    constructor(){
        owner = msg.sender;
    } 
     //only the owner can send
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _; //if not owner let the rest of the code execute 
    }

    function setOwner (address _newOner) external onlyOwner {
        require(_newOner != address(0), "invalid address");
        owner = _newOner;
    }

    function onlyOwnerCanCallThisFunc(uint) external onlyOwner {
    //code
    }

    function anyOneCanCall(uint) external {
    //code 
    }

}

//Solidity is a statically typed language
//which means that the type of each variable (state and local) needs to be specified

// Block and Transaction Properties

//    blockhash(uint blockNumber) returns (bytes32): hash of the given block - only works for 256 most recent, excluding current, blocks
//    block.coinbase (address payable): current block miner’s address
//    block.difficulty (uint): current block difficulty
//    block.gaslimit (uint): current block gaslimit
//    block.number (uint): current block number
//    block.timestamp (uint): current block timestamp as seconds since unix epoch
//    gasleft() returns (uint256): remaining gas
//    msg.data (bytes calldata): complete calldata
//    msg.sender (address payable): sender of the message (current call)
//    msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)
//    msg.value (uint): number of wei sent with the message
//    tx.gasprice (uint): gas price of the transaction
//    tx.origin (address payable): sender of the transaction (full call chain)
