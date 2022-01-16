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
    bool[] memory d = new bool[](5);
    d[0] = true;
    d[3] = true;
    bytes memory e = new bytes(5);
    e[0] = 0x01;
    e[0] = 0x05;
    this.checkSameLength(abi.encode(a, b, c, d, e));
  }
}
