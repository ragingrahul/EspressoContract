// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {PlaceStruct} from "./helpers/Struct.sol";
import {IInterchainGasPaymaster} from "./interfaces/IInterchainGasPaymaster.sol";
import {IMailbox} from "./interfaces/IMailbox.sol";
import {ByteHasher} from "./helpers/ByteHasher.sol";

contract EspressoPlaceSender {
    uint32 constant EspressoPlace = 4406;
    bytes32 public espressoPlaceRecipient;
    address public mailboxAddress;

    constructor(address _espressoPlaceRecipient, address _mailbox) {
        espressoPlaceRecipient = bytes32(
            uint256(uint160(_espressoPlaceRecipient))
        );
        mailboxAddress = _mailbox;
    }

    function structToBytes(
        PlaceStruct calldata _place
    ) public pure returns (bytes memory) {
        bytes memory data = abi.encode(_place);
        return data;
    }

    function sendAndPayForMessage(PlaceStruct calldata _place) public {
        bytes memory encodedData = structToBytes(_place);
        IMailbox mailbox = IMailbox(mailboxAddress);
        uint256 fee = mailbox.quoteDispatch(
            EspressoPlace,
            espressoPlaceRecipient,
            encodedData
        );
        mailbox.dispatch{value: fee}(
            EspressoPlace,
            espressoPlaceRecipient,
            encodedData
        );
    }
}
