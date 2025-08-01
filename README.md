# Daily Solidity Smart Contracts

A repository documenting my daily Solidity smart contract development journey. This project aims to build and deploy one smart contract every day to improve Solidity skills and explore different blockchain development concepts.

## 🎯 Goal
Create unique smart contracts, each focusing on different aspects of Solidity development, from basic concepts to advanced patterns.


## 📚 Daily Contracts

### Day 1 - Hello World Contract
- **File**: `contracts/day01/HelloWorld.sol`
- **Concepts**: Basic contract structure, state variables, events, constructor
- **Features**: 
  - Store and retrieve messages
  - Emit events on updates
  - Get contract information
- **Functions**:
  - `getMessage()` - Get current message
  - `updateMessage(string)` - Update the stored message
  - `getContractInfo()` - Get contract details

### Day 2 - Simple Counter Contract
- **File**: `contracts/day02/SimpleCounter.sol`
- **Concepts**: Arithmetic operations, require statements, access control, constructor parameters
- **Features**: 
  - Increment/decrement counter
  - Increment by specific amounts
  - Owner-only reset functionality
  - Even/odd checker
  - Underflow protection
- **Functions**:
  - `increment()` - Increases counter by 1
  - `decrement()` - Decreases counter by 1 (with underflow protection)
  - `incrementBy(uint256)` - Increases counter by specified amount
  - `resetCounter()` - Resets to 0 (owner only)
  - `isEven()` - Checks if counter is even
  - `getCurrentValue()` - Get current counter value

### Day 3 - Simple Storage Contract
- **File**: `contracts/day03/SimpleStorage.sol`
- **Concepts**: Dynamic arrays, mappings, string validation, array operations, data relationships
- **Features**: 
  - Store numbers and names in arrays
  - Map names to ages
  - Map addresses to favorite numbers
  - Data validation and existence checking
  - Owner-only data clearing
- **Functions**:
  - `addNumber(uint256)` - Add number to array
  - `addName(string)` - Add name to array (with duplicate check)
  - `setAge(string, uint256)` - Set age for a name
  - `setMyFavoriteNumber(uint256)` - Set caller's favorite number
  - `getNumber(uint256)` - Get number by index
  - `getName(uint256)` - Get name by index
  - `getAge(string)` - Get age by name
  - `getAllNumbers()` - Get all stored numbers
  - `clearAllData()` - Clear all data (owner only)

  ## Day 4 - Basic Token Contract
- **Contract**: BasicToken.sol
- **Concepts**: Token basics, balances, transfers, approvals, allowances, access control
- **Features**: 
  - Mint tokens (owner only)
  - Transfer tokens
  - Approve and transferFrom for delegated transfers
  - Token metadata: name, symbol, decimals
  - Events for Transfer and Approval

### Functions:
- `mint(address, uint256)` - Mint tokens (owner-only)
- `balanceOf(address)` - Get token balance
- `transfer(address, uint256)` - Transfer tokens to an address
- `approve(address, uint256)` - Approve spender
- `allowance(address, address)` - Check allowance
- `transferFrom(address, address, uint256)` - Transfer tokens on behalf

## Day 5 - Simple Voting Contract
- **Contract**: SimpleVoting.sol
- **Concepts**: Structs, mappings, arrays, access control, user interaction
- **Features**: 
  - Add candidates (owner only, before voting starts)
  - Start and end voting (owner only)
  - Users can vote once during active voting
  - Track vote counts for candidates
  - Prevent double voting with mapping

### Functions:
- `addCandidate(string)` - Add a candidate before voting starts (owner only)
- `startVoting()` - Enable voting (owner only)
- `endVoting()` - Disable voting (owner only)
- `vote(uint256)` - Cast a vote for a candidate
- `getCandidatesCount()` - Get total candidates
- `getCandidate(uint256)` - Get candidate info


## 🛠️ How to Use

### Prerequisites
- Node.js and npm installed
- Hardhat or Remix IDE for compilation and deployment
- MetaMask or similar wallet for interaction

### Deployment
1. Choose any Ethereum testnet (Goerli, Sepolia, etc.)
2. Compile the contracts using Solidity ^0.8.19
3. Deploy using your preferred method (Remix, Hardhat, etc.)
4. Interact with the deployed contracts using the provided functions

### Testing
Each contract includes various functions that can be tested:
- Deploy the contract
- Call the public functions
- Verify events are emitted correctly
- Test access control mechanisms

## 📈 Learning Progress

- ✅ **Day 1**: Basic contract structure and events
- ✅ **Day 2**: Arithmetic operations and access control
- ✅ **Day 3**: Data structures (arrays and mappings)
- ✅ **Day 4**: Basic Token contract
- ✅ **Day 5**: Simple Voting
- ⏳ **Future**: Advanced patterns, DeFi concepts, NFTs, and more

## 🔗 Concepts Covered So Far

### Foundational Concepts
- Contract structure and pragma directives
- State variables and visibility modifiers
- Constructor functions
- Events and event emission
- Function visibility and modifiers

### Data Types & Operations
- Basic data types (uint256, string, address, bool)
- Arithmetic operations and overflow protection
- String manipulation and validation
- Array operations (dynamic arrays)
- Mappings for key-value storage

### Access Control & Security
- Owner-only functions
- Require statements for validation
- Input validation and bounds checking
- Underflow/overflow protection

### Best Practices
- Proper error messages
- Event logging for transparency
- Gas-efficient code patterns
- Clear function documentation

## 🎯 Upcoming Topics

- **Week 1**: Basic contracts and data structures
- **Week 2**: Token contracts and ERC standards
- **Week 3**: Access control and modifiers
- **Week 4**: Advanced patterns and libraries

## 💡 Contributing

This is a personal learning journey, but feel free to:
- Suggest improvements to existing contracts
- Recommend topics for future days
- Share optimizations or best practices

## 📄 License

MIT License - Feel free to learn from and adapt these contracts for your own learning journey.

---

**Start Date**: 30 july 2025  
**Current Day**: 3  
**Total Contracts**: 3  
**Next Contract**: Day 4 - Basic Token Contract

Happy Coding! 🚀
