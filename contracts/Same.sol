//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.8;

// Proof of concept of basic utility checking same lengths of an arbitrary number of
//   arrays of type "T", T[] where T is of length 32 bytes. Future efforts
//   will hopefully expand this to arbitrary data type.

// goal is to make this a library (TODO). currently the main function relies on calldata
//   so I need to figure out the proper way to support calldata with a library.

// TODO check gas expenditure etc

abstract contract Same {

  uint public constant WORDLENGTH = 32;

  function checkSameLength(bytes calldata b) external pure {
    (uint firstLengthOffset) = abi.decode(b[0:WORDLENGTH], (uint));
    (uint firstLength) = abi.decode(b[firstLengthOffset:firstLengthOffset+WORDLENGTH], (uint));
    uint otherLengthOffset;
    uint otherLength;
    for (uint i=1; i*WORDLENGTH<firstLengthOffset; i++) {
      (otherLengthOffset) = abi.decode(b[i*WORDLENGTH:(i+1)*WORDLENGTH], (uint)); 
      (otherLength) = abi.decode(b[otherLengthOffset:otherLengthOffset+WORDLENGTH], (uint));
      require(otherLength == firstLength, "Same: wrong length.");
    }
  }

}

