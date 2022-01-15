# Same.sol 

// Proof of concept of basic utility checking same lengths of an arbitrary number of
//   arrays of type "T", T[] where T is of length 32 bytes. Future efforts
//   will hopefully expand this to arbitrary data type.

// goal is to make this a library. currently the main function relies on calldata
//   so I need to figure out the proper way to support calldata with a library.
