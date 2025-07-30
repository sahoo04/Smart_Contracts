// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HelloWorld
 * @dev A simple smart contract for Day 1 of daily Solidity practice
 * @author Your Name
 */
contract HelloWorld {
    // State variable to store a message
    string public message;
    
    // Event to emit when message is updated
    event MessageUpdated(string newMessage, address updatedBy);
    
    // Constructor sets initial message
    constructor() {
        message = "Hello, World! This is Day 1 of my Solidity journey.";
    }
    
    /**
     * @dev Function to get the current message
     * @return Current message string
     */
    function getMessage() public view returns (string memory) {
        return message;
    }
    
    /**
     * @dev Function to update the message
     * @param _newMessage New message to set
     */
    function updateMessage(string memory _newMessage) public {
        message = _newMessage;
        emit MessageUpdated(_newMessage, msg.sender);
    }
    
    /**
     * @dev Function to get contract info
     * @return Contract name and current block timestamp
     */
    function getContractInfo() public view returns (string memory, uint256) {
        return ("HelloWorld - Day 1", block.timestamp);
    }
}
