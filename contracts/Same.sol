//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.8;

// Proof of concept of basic utility checking same lengths of an arbitrary number of
//   arrays of type "T", T[] where T is of length 32 bytes. Future efforts
//   will hopefully expand this to arbitrary data type.

// goal is to make this a library (TODO). currently the main function relies on calldata
//   so I need to figure out the proper way to support calldata with a library.

abstract contract Same {

  uint public constant WORDLENGTH = 32;

  function checkSameLength(bytes calldata b) external {
    (uint firstCountOffset) = abi.decode(b[0:WORDLENGTH], (uint));
    (uint firstCount) = abi.decode(b[firstCountOffset:firstCountOffset+WORDLENGTH], (uint));
    uint otherCountOffset;
    uint otherCount;
    for (uint i=1; i*WORDLENGTH<firstCountOffset; i++) {
      (otherCountOffset) = abi.decode(b[i*WORDLENGTH:(i+1)*WORDLENGTH], (uint)); 
      (otherCount) = abi.decode(b[otherCountOffset:otherCountOffset+WORDLENGTH], (uint));
      require(otherCount == firstCount, "wrong count");
    }
  }

}

