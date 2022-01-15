//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.8;

import "./Same.sol";

contract TestSame is Same {
  function test() external view {
    uint256[] memory a = new uint256[](5);
    a[0] = 69;
    a[1] = 42;
    a[2] = 314;
    uint256[] memory b = new uint256[](5);
    b[3] = 55;
    b[4] = 44;
    address[] memory c = new address[](5);
    this.checkSameLength(abi.encode(a, b, c));
  }
}
