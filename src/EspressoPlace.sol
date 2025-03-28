// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./helpers/Struct.sol";

contract EspressoPlace {
    string[200][100] public canvas;

    event Placed(address user, uint256 x, uint256 y, string color);

    function place(PlaceStruct calldata _place) public {
        _internalPlace(_place);
    }
    function _internalPlace(PlaceStruct memory _place) internal {
        canvas[_place.x][_place.y] = _place.color;
        emit Placed(_place.placer, _place.x, _place.y, _place.color);
    }
    function getCanvas(uint8 x) public view returns (string[200] memory) {
        return canvas[x];
    }
}
