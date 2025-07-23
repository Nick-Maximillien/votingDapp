require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC_URL || "",
      accounts: process.env.DEPLOYER_PRIVATE_KEY ? [process.env.DEPLOYER_PRIVATE_KEY] : [],
    },
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [`0xeb7e9005c1cf41e827d5fa9cbbf5c7f7ad4872c7356a0fc273c3e4fe2ab9d8c2`], // keep local keys if needed
    },
    localhost: {
      url: "http://127.0.0.1:8545",
      accounts: [`0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80`],
    },
  },
};
