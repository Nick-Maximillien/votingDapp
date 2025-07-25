# 🗳️ Ballot Smart Contract

This is a simple, secure, and transparent voting smart contract written in **Solidity**. It enables decentralized decision-making through vote casting, delegation, and proposal tracking. Designed for educational or prototype use, the contract allows a chairperson to grant voting rights and users to participate via direct or delegated voting.

## 🧱 Contract Overview

- 🧑‍⚖️ **Chairperson** assigns voting rights
- 🧑‍🤝‍🧑 **Voters** can vote or delegate to another
- 📊 **Proposals** receive weighted votes
- 🏆 Automatically determines the winning proposal

## 📜 Smart Contract

- Language: Solidity `^0.7.0`
- License: MIT
- Contract: `Ballot.sol`

## 🚀 How It Works

1. **Deployment**  
   Pass an array of proposal names to the constructor.

2. **Voting Rights**  
   Only the chairperson can give voting rights via `giveRightToVote`.

3. **Delegation**  
   Voters can delegate their vote to another address. Loop detection prevents delegation cycles.

4. **Voting**  
   Eligible voters can call `vote(proposalIndex)`.

5. **Results**  
   - `winningProposal()` returns the index of the proposal with most votes  
   - `winnerName()` returns the name of the winning proposal

## 🔧 Sample Hardhat Usage

```bash
# Clone the repo
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

# Install dependencies
npm install

# Compile the contract
npx hardhat compile

# Run tests (if any)
npx hardhat test

contracts/
  Ballot.sol        # Main contract
scripts/
  deploy.js         # Deployment script (optional)
test/
  ballot.test.js    # Tests (optional)
hardhat.config.js   # Hardhat configuration

MIT © 2025 Nicholas Muthoki
