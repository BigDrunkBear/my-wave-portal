// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address owner;

    struct Waves {
        address addressWave;
        uint amountWaves;
    }

    Waves[] public listWaves;

    constructor() {
        owner = msg.sender;
        console.log("Yo yo, I am a contract and I am smart");
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function wave() public {
        bool check = true;
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        for (uint i = 0; i < listWaves.length; i++) {
            if (listWaves[i].addressWave == msg.sender) {
                listWaves[i].amountWaves += 1;
                check = false;
            }
        }
        if (check) {
            listWaves.push(Waves(msg.sender, 1));
        }
    }
 
    function getWavesUser() public view {
        for (uint i = 0; i < listWaves.length; i++) {
            console.log("%s waved %d", listWaves[i].addressWave, listWaves[i].amountWaves);
        }
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}