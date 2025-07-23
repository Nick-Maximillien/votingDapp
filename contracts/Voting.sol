// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Voting {
    // Declare a structure to hold candidate details
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Map to store candidates
    mapping(uint => Candidate) public candidates;
    // Keep track of the number of candidates
    uint public candidatesCount;

    // Declare an event for voting
    event votedEvent(uint indexed _candidateId);

    // Mapping to store whether a person has voted
    mapping(address => bool) public voters;

    // Constructor to initialize candidates
    constructor() {
        addCandidate("Alice");
        addCandidate("Bob");
    }

    // Function to add a candidate
    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // Function to vote for a candidate
    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "You have already voted");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate");

        // Mark this address as having voted
        voters[msg.sender] = true;

        // Increase the vote count for the candidate
        candidates[_candidateId].voteCount++;

        // Emit the vote event
        emit votedEvent(_candidateId);
    }
    
    // Function to get the number of votes for a candidate
    function getVotes(uint _candidateId) public view returns (uint) {
        return candidates[_candidateId].voteCount;
    }
}
