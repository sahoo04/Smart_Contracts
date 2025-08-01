// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SimpleVoting
 * @dev A basic voting contract for Day 5 of daily Solidity practice
 */
contract SimpleVoting {
    address public owner;
    bool public votingActive;

    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // Array of candidates
    Candidate[] public candidates;

    // Mapping to check if an address has voted
    mapping(address => bool) public hasVoted;

    // Events
    event CandidateAdded(string name, uint256 candidateId);
    event VoteCast(address voter, uint256 candidateId);
    event VotingStarted();
    event VotingEnded();

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    modifier whenVotingActive() {
        require(votingActive, "Voting is not active");
        _;
    }

    constructor() {
        owner = msg.sender;
        votingActive = false;
    }

    /**
     * @dev Add a candidate (owner only, before voting starts)
     * @param _name Candidate's name
     */
    function addCandidate(string memory _name) public onlyOwner {
        require(!votingActive, "Cannot add candidates during voting");
        require(bytes(_name).length > 0, "Candidate name cannot be empty");
        candidates.push(Candidate(_name, 0));
        emit CandidateAdded(_name, candidates.length - 1);
    }

    /**
     * @dev Start the voting process (owner only)
     */
    function startVoting() public onlyOwner {
        require(!votingActive, "Voting already active");
        votingActive = true;
        emit VotingStarted();
    }

    /**
     * @dev End the voting process (owner only)
     */
    function endVoting() public onlyOwner {
        require(votingActive, "Voting not active");
        votingActive = false;
        emit VotingEnded();
    }

    /**
     * @dev Cast a vote for a candidate
     * @param _candidateId Candidate index
     */
    function vote(uint256 _candidateId) public whenVotingActive {
        require(!hasVoted[msg.sender], "You have already voted");
        require(_candidateId < candidates.length, "Invalid candidate ID");

        candidates[_candidateId].voteCount++;
        hasVoted[msg.sender] = true;
        emit VoteCast(msg.sender, _candidateId);
    }

    /**
     * @dev Get total number of candidates
     * @return Number of candidates
     */
    function getCandidatesCount() public view returns (uint256) {
        return candidates.length;
    }

    /**
     * @dev Get candidate details by index
     * @param _candidateId Candidate index
     * @return name and vote count of the candidate
     */
    function getCandidate(uint256 _candidateId) public view returns (string memory, uint256) {
        require(_candidateId < candidates.length, "Invalid candidate ID");
        Candidate memory candidate = candidates[_candidateId];
        return (candidate.name, candidate.voteCount);
    }

    /**
     * @dev Get contract info
     * @return Contract name, voting status, total candidates
     */
    function getContractInfo() public view returns (string memory, bool, uint256) {
        return ("SimpleVoting - Day 5", votingActive, candidates.length);
    }
}
