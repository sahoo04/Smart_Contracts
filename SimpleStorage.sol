// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SimpleStorage
 * @dev A storage smart contract for Day 3 of daily Solidity practice
 * @author Your Name
 */
contract SimpleStorage {
    // State variables
    address public owner;
    uint256 public totalEntries;
    
    // Array to store numbers
    uint256[] public numbers;
    
    // Array to store names
    string[] public names;
    
    // Mapping to store key-value pairs (name -> age)
    mapping(string => uint256) public nameToAge;
    
    // Mapping to store user addresses to their favorite numbers
    mapping(address => uint256) public addressToFavoriteNumber;
    
    // Mapping to check if a name exists
    mapping(string => bool) public nameExists;
    
    // Events
    event NumberAdded(uint256 number, uint256 index);
    event NameAdded(string name, uint256 index);
    event AgeSet(string name, uint256 age);
    event FavoriteNumberSet(address user, uint256 number);
    event DataCleared(address clearedBy);
    
    // Constructor
    constructor() {
        owner = msg.sender;
        totalEntries = 0;
    }
    
    /**
     * @dev Add a number to the numbers array
     * @param _number Number to add
     */
    function addNumber(uint256 _number) public {
        numbers.push(_number);
        totalEntries++;
        emit NumberAdded(_number, numbers.length - 1);
    }
    
    /**
     * @dev Add a name to the names array
     * @param _name Name to add
     */
    function addName(string memory _name) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(!nameExists[_name], "Name already exists");
        
        names.push(_name);
        nameExists[_name] = true;
        totalEntries++;
        emit NameAdded(_name, names.length - 1);
    }
    
    /**
     * @dev Set age for a specific name
     * @param _name Name to set age for
     * @param _age Age to set
     */
    function setAge(string memory _name, uint256 _age) public {
        require(nameExists[_name], "Name does not exist");
        require(_age > 0 && _age <= 150, "Age must be between 1 and 150");
        
        nameToAge[_name] = _age;
        emit AgeSet(_name, _age);
    }
    
    /**
     * @dev Set favorite number for the caller
     * @param _number Favorite number to set
     */
    function setMyFavoriteNumber(uint256 _number) public {
        addressToFavoriteNumber[msg.sender] = _number;
        emit FavoriteNumberSet(msg.sender, _number);
    }
    
    /**
     * @dev Get a number by index
     * @param _index Index of the number
     * @return Number at the given index
     */
    function getNumber(uint256 _index) public view returns (uint256) {
        require(_index < numbers.length, "Index out of bounds");
        return numbers[_index];
    }
    
    /**
     * @dev Get a name by index
     * @param _index Index of the name
     * @return Name at the given index
     */
    function getName(uint256 _index) public view returns (string memory) {
        require(_index < names.length, "Index out of bounds");
        return names[_index];
    }
    
    /**
     * @dev Get age by name
     * @param _name Name to get age for
     * @return Age of the person
     */
    function getAge(string memory _name) public view returns (uint256) {
        require(nameExists[_name], "Name does not exist");
        return nameToAge[_name];
    }
    
    /**
     * @dev Get favorite number of a specific address
     * @param _address Address to check
     * @return Favorite number of the address
     */
    function getFavoriteNumber(address _address) public view returns (uint256) {
        return addressToFavoriteNumber[_address];
    }
    
    /**
     * @dev Get total count of numbers
     * @return Length of numbers array
     */
    function getNumbersCount() public view returns (uint256) {
        return numbers.length;
    }
    
    /**
     * @dev Get total count of names
     * @return Length of names array
     */
    function getNamesCount() public view returns (uint256) {
        return names.length;
    }
    
    /**
     * @dev Get all numbers (be careful with large arrays)
     * @return Array of all numbers
     */
    function getAllNumbers() public view returns (uint256[] memory) {
        return numbers;
    }
    
    /**
     * @dev Clear all data (owner only)
     */
    function clearAllData() public {
        require(msg.sender == owner, "Only owner can clear data");
        
        // Clear arrays
        delete numbers;
        delete names;
        
        // Reset counter
        totalEntries = 0;
        
        emit DataCleared(msg.sender);
    }
    
    /**
     * @dev Get contract info
     * @return Contract name, total entries, numbers count, names count
     */
    function getContractInfo() public view returns (string memory, uint256, uint256, uint256) {
        return ("SimpleStorage - Day 3", totalEntries, numbers.length, names.length);
    }
}
