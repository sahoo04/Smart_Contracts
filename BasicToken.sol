// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title BasicToken
 * @dev A simplified ERC-20-like token contract for Day 4 of daily Solidity practice
 *      This contract includes basic token functionality: minting, transferring, and approval allowances.
 *      Note: This is not a full ERC-20 implementation but highlights core concepts.
 */
contract BasicToken {
    string public name = "Day4Token";
    string public symbol = "D4T";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Balances for each account
    mapping(address => uint256) private balances;

    // Allowances: owner => spender => amount
    mapping(address => mapping(address => uint256)) private allowances;

    // Owner of the contract (who can mint tokens)
    address public owner;

    // Events as per ERC-20 standard
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Modifier to restrict actions to owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Mint new tokens to an address (owner only)
     * @param _to Address to receive the tokens
     * @param _amount Number of tokens to mint (in smallest units)
     */
    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_to != address(0), "Cannot mint to zero address");
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    /**
     * @dev Get the balance of a specific address
     * @param _account Address to query
     * @return Balance of the address
     */
    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    /**
     * @dev Transfer tokens from caller to another address
     * @param _to Recipient address
     * @param _amount Amount of tokens to transfer
     * @return success Boolean indicating successful transfer
     */
    function transfer(address _to, uint256 _amount) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    /**
     * @dev Approve another address to spend tokens on your behalf
     * @param _spender Spender address
     * @param _amount Amount of tokens they can spend
     * @return success Boolean indicating approval success
     */
    function approve(address _spender, uint256 _amount) public returns (bool success) {
        require(_spender != address(0), "Approve to zero address not allowed");

        allowances[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);

        return true;
    }

    /**
     * @dev Check allowance granted to a spender by an owner
     * @param _owner Owner address
     * @param _spender Spender address
     * @return Remaining allowance amount
     */
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowances[_owner][_spender];
    }

    /**
     * @dev Transfer tokens on behalf of another address (must have allowance)
     * @param _from Address to transfer tokens from
     * @param _to Recipient address
     * @param _amount Amount of tokens to transfer
     * @return success Boolean indicating transfer success
     */
    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balances[_from] >= _amount, "Insufficient balance");
        require(allowances[_from][msg.sender] >= _amount, "Allowance exceeded");

        balances[_from] -= _amount;
        balances[_to] += _amount;
        allowances[_from][msg.sender] -= _amount;

        emit Transfer(_from, _to, _amount);
        return true;
    }

    /**
     * @dev Get contract info
     * @return Token name, symbol, total supply, owner address
     */
    function getContractInfo() public view returns (string memory, string memory, uint256, address) {
        return (name, symbol, totalSupply, owner);
    }
}
