// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {EspressoPlaceSender} from "../src/EspressoPlaceSender.sol";

contract EspressoPlaceSenderScript is Script {
    function setUp() public {}

    function run() public {
        address recipientAddress = 0xC1a1EB934a1f24375c89E23A97caFdA5Fb402a95;
        address mailboxAddress = 0x57E69113e4D72d0861DB5027C22bFaF1C8a9c22A;

        vm.startBroadcast();
        EspressoPlaceSender sender = new EspressoPlaceSender(
            recipientAddress,
            mailboxAddress
        );
        console.log("EspressoPlaceSender deployed at", address(sender));
        console.log("Recipient address set to", recipientAddress);
        console.log("Mailbox address set to", mailboxAddress);
        vm.stopBroadcast();
    }
}
