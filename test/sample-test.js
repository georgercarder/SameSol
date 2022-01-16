const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TestSame", function () {
  it("Calls basic test function", async function () {
    const SameLength = await ethers.getContractFactory("TestSame");
    const sameLength = await SameLength.deploy();
    await sameLength.deployed();

    await sameLength.test();

  });
});
