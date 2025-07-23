const { ethers } = require("hardhat");
const { formatEther } = ethers; // ✅ Safely extract formatEther

async function main() {
  const [deployer] = await ethers.getSigners();

  const balance = await deployer.getBalance();

  console.log("📤 Deploying ArdhiChain with account:", deployer.address);
  console.log("💰 Deployer balance:", formatEther(balance), "ETH");

  const ArdhiChain = await ethers.getContractFactory("ArdhiChain", deployer);
  const contract = await ArdhiChain.deploy();
  await contract.deployed();

  console.log(`✅ ArdhiChain deployed to: ${contract.address}`);
}

main().catch((error) => {
  console.error("❌ Deployment failed:", error);
  process.exitCode = 1;
});
