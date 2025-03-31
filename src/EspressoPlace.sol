// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./helpers/Struct.sol";
import {ByteHasher} from "./helpers/ByteHasher.sol";
import {IMessageRecipient} from "./interfaces/IMessageRecipient.sol";

contract EspressoPlace {
    string[200][100] public canvas;
    address public mailbox;

    constructor(address _mailbox) {
        mailbox = _mailbox;
    }

    event Placed(address user, uint256 x, uint256 y, string color);
    event Received(uint32 origin, address sender, bytes body);

    modifier onlyMailbox() {
        require(msg.sender == mailbox, "Only mailbox can call this function");
        _;
    }

    function place(PlaceStruct calldata _place) public {
        _internalPlace(_place);
    }

    function handleMessage(
        address recipient,
        uint32 origin,
        bytes32 sender,
        bytes calldata body
    ) public onlyMailbox {
        IMessageRecipient(recipient).handle(origin, sender, body);
    }

    function _internalPlace(PlaceStruct memory _place) internal {
        canvas[_place.x][_place.y] = _place.color;
        emit Placed(_place.placer, _place.x, _place.y, _place.color);
    }
    function getCanvas(uint8 x) public view returns (string[200] memory) {
        return canvas[x];
    }
}
