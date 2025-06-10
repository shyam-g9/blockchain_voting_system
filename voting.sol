// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    address public admin;

    struct Candidate {
        string name;
        uint voteCount;
    }

    struct Voter {
        bool hasVoted;
        uint voteIndex;
    }

    mapping(address => Voter) public voters;
    Candidate[] public candidates;

    bool public votingStarted;
    bool public votingEnded;

    constructor(string[] memory candidateNames) {
        admin = msg.sender;
        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate(candidateNames[i], 0));
        }
        votingStarted = false;
        votingEnded = false;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action.");
        _;
    }

    modifier votingActive() {
        require(votingStarted && !votingEnded, "Voting is not active.");
        _;
    }

    function startVoting() public onlyAdmin {
        votingStarted = true;
        votingEnded = false;
    }

    function endVoting() public onlyAdmin {
        votingEnded = true;
    }


    function vote(uint candidateIndex) public votingActive {
        require(!voters[msg.sender].hasVoted, "You have already voted.");
        require(candidateIndex < candidates.length, "Invalid candidate index.");

        voters[msg.sender] = Voter(true, candidateIndex);
        candidates[candidateIndex].voteCount++;
    }

    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }


    function getWinner() public view returns (string memory winnerName, uint winnerVoteCount) {
        require(votingEnded, "Voting has not ended yet.");

        uint winningVoteCount = 0;
        uint winnerIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winningVoteCount) {
                winningVoteCount = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        winnerName = candidates[winnerIndex].name;
        winnerVoteCount = candidates[winnerIndex].voteCount;
    }
}
