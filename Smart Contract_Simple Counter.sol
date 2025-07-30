// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SimpleCounter
 * @dev A counter smart contract for Day 2 of daily Solidity practice
 * @author Your Name
 */
contract SimpleCounter {
    // State variable to store the counter value
    uint256 public counter;
    
    // State variable to track the owner
    address public owner;
    
    // Events to emit on counter operations
    event CounterIncremented(uint256 newValue, address incrementedBy);
    event CounterDecremented(uint256 newValue, address decrementedBy);
    event CounterReset(address resetBy);
    
    // Constructor sets initial counter value and owner
    constructor(uint256 _initialValue) {
        counter = _initialValue;
        owner = msg.sender;
    }
    
    /**
     * @dev Function to increment counter by 1
     */
    function increment() public {
        counter++;
        emit CounterIncremented(counter, msg.sender);
    }
    
    /**
     * @dev Function to decrement counter by 1
     * @notice Counter cannot go below 0
     */
    function decrement() public {
        require(counter > 0, "Counter cannot go below zero");
        counter--;
        emit CounterDecremented(counter, msg.sender);
    }
    
    /**
     * @dev Function to increment counter by a specific amount
     * @param _amount Amount to increment by
     */
    function incrementBy(uint256 _amount) public {
        counter += _amount;
        emit CounterIncremented(counter, msg.sender);
    }
    
    /**
     * @dev Function to get current counter value
     * @return Current counter value
     */
    function getCurrentValue() public view returns (uint256) {
        return counter;
    }
    
    /**
     * @dev Function to reset counter to zero (only owner)
     */
    function resetCounter() public {
        require(msg.sender == owner, "Only owner can reset counter");
        counter = 0;
        emit CounterReset(msg.sender);
    }
    
    /**
     * @dev Function to check if counter is even or odd
     * @return true if even, false if odd
     */
    function isEven() public view returns (bool) {
        return counter % 2 == 0;
    }
    
    /**
     * @dev Function to get contract info
     * @return Contract name, current value, and owner
     */
    function getContractInfo() public view returns (string memory, uint256, address) {
        return ("SimpleCounter - Day 2", counter, owner);
    }
}
