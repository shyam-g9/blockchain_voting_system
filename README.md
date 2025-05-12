
# 🗳️ Blockchain-Based Voting System (Solidity + Remix IDE)

This project is a **decentralized voting system** built using **Solidity** and tested on **Remix IDE**. It allows transparent, secure, and tamper-proof elections on the Ethereum blockchain. The contract ensures one vote per participant and declares the winner only after the voting phase has ended.

## 🚀 Features

* 🛡️ **Admin-controlled voting** (start and end voting sessions)
* 👤 **One vote per wallet address**
* 📊 **Real-time vote count tracking**
* 🏆 **Automatic winner calculation**
* 🔒 Immutable and transparent voting process

## 🛠️ Technologies Used

* [Solidity ^0.8.20](https://docs.soliditylang.org/)
* [Remix IDE](https://remix.ethereum.org/)
* [MetaMask](https://metamask.io/) for interacting with testnets

## 📋 How It Works

1. **Admin deploys** the contract with a list of candidate names.
2. **Voting is started** by the admin.
3. **Each address votes once** for their preferred candidate.
4. **Voting ends** via the admin.
5. **Winner is revealed** based on the highest number of votes.

## 🧪 Testing Instructions

* Open **Remix IDE** and paste the contract code in a new file (`Voting.sol`).
* Compile and deploy the contract with candidate names (e.g., `["Alice", "Bob"]`).
* Use `startVoting()` to begin and `vote(index)` from different accounts.
* End the voting with `endVoting()` and fetch results using `getWinner()`.



