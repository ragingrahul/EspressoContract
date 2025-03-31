// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {EspressoPlace} from "../src/EspressoPlace.sol";

contract EspressoPlaceScript is Script {
    function setUp() public {}

    function run() public {
        address mailboxAddress = 0x78bB21dB3D51feE2f2820A0F1cf07442F9b09843;

        vm.startBroadcast();
        EspressoPlace place = new EspressoPlace(mailboxAddress);
        console.log("EspressoPlace deployed at", address(place));
        console.log("Mailbox address set to", mailboxAddress);
        vm.stopBroadcast();
    }
}
