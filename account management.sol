// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
You are tasked with creating a Solidity smart contract for an account payment system. 
Each account is identified by an Ethereum address and has a unique ID. 
The contract owner has the authority to add funds, deduct funds, and check balances for accounts. 
Implement the contract as described below:

In this question, you'll create a Solidity contract that manages account balances. 
The contract owner can add funds, deduct funds, and check balances for accounts. 
The `exists` field in the `Account` struct indicates whether an account's information has been added.


*/



contract AccountPaymentSystem {
    address public owner;
    
    struct Account {
        uint id;
        uint balance;
        bool exists;
    }
    
    mapping(address => Account) private accounts;

    
    modifier onlyOwner() {
        // Implement the modifier to allow only the contract owner to proceed.
        // HINT: You can use 'require' to check if the sender is the owner.
        require(owner == msg.sender, "not owner");
        _;
    }
    
    constructor() {
        // Initialize the contract owner.
        // HINT: You can use 'msg.sender' to set the owner.

        owner = msg.sender;
    }
    
    function addAccount(address _accountAddress, uint _accountId) public onlyOwner {
        // Add a new account with the given address and ID.
        // Set the initial balance to 0 and 'exists' to true.
    
        Account storage newAccount = accounts[_accountAddress];
        require(accounts[_accountAddress].exists, "Account already exist");


        newAccount.id = _accountId;
        newAccount.balance = 0;
        newAccount.exists = true;
    }
    
    function depositFunds(address _accountAddress, uint _amount) public  onlyOwner {
        // Deposit the given amount of funds to the account's balance.
        // Ensure the account exists before updating the balance.
        require(accounts[_accountAddress].exists, "no Account  ");
    
        accounts[_accountAddress].balance += _amount;


    }
    
    function deductFunds(address _accountAddress, uint _amount) public onlyOwner {
        // Deduct the given amount of funds from the account's balance.
        // Ensure the account exists and has enough balance for the deduction.
        require(accounts[_accountAddress].exists, " no account");
        require(accounts[_accountAddress].balance >= _amount);
        accounts[_accountAddress].balance -= _amount;
    }
    
    function getBalance(address _accountAddress) public view returns (uint) {
        // Retrieve the balance of the account with the given address.
        // Return 0 if the account does not exist.
        Account storage newAccount = accounts[_accountAddress];
        require(accounts[_accountAddress].exists, " account doest not exist");
        return(newAccount.balance);
        


         



    }
}

