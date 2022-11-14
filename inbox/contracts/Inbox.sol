pragma solidity ^0.4.17; //specifies the version of solidity that our code is written

contract Inbox{ //contract is a key word almost identical to whenever we define a class in java
    string public message; //define a storage variable (message), type: string

    function Inbox(string initialMessage) public{ //constructor function
        message = initialMessage;
    }

    function setMessage(string newMessage) public{ //function call after it has been deployed
        message = newMessage;
    }

}