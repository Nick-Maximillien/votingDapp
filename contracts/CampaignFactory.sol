// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Crowdfunding {
    struct Campaign {
        address payable creator;
        uint goalAmount;
        uint currentAmount;
        uint endTime;
        bool isActive;
    }

    mapping(uint => Campaign) public campaigns;
    uint public campaignCount;

    event CampaignCreated(uint campaignId, address creator, uint goalAmount, uint endTime);
    event DonationReceived(uint campaignId, address donor, uint amount);
    event CampaignCompleted(uint campaignId);

    function createCampaign(uint goalAmount, uint duration) external {
        require(goalAmount > 0, "Goal amount must be greater than 0");
        require(duration > 0, "Duration must be greater than 0");

        uint campaignId = campaignCount++;
        uint endTime = block.timestamp + duration;

        campaigns[campaignId] = Campaign({
            creator: payable(msg.sender),
            goalAmount: goalAmount,
            currentAmount: 0,
            endTime: endTime,
            isActive: true
        });

        emit CampaignCreated(campaignId, msg.sender, goalAmount, endTime);
    }

    function donate(uint campaignId) external payable {
        require(campaigns[campaignId].isActive, "Campaign is not active");
        require(block.timestamp < campaigns[campaignId].endTime, "Campaign has ended");
        require(msg.value > 0, "Donation must be greater than 0");

        campaigns[campaignId].currentAmount += msg.value;

        emit DonationReceived(campaignId, msg.sender, msg.value);
    }

    function completeCampaign(uint campaignId) external {
        require(msg.sender == campaigns[campaignId].creator, "Only the creator can complete the campaign");
        require(block.timestamp >= campaigns[campaignId].endTime, "Campaign has not ended yet");
        require(campaigns[campaignId].isActive, "Campaign already completed");

        campaigns[campaignId].isActive = false;

        if (campaigns[campaignId].currentAmount >= campaigns[campaignId].goalAmount) {
            campaigns[campaignId].creator.transfer(campaigns[campaignId].currentAmount);
        }

        emit CampaignCompleted(campaignId);
    }
}
