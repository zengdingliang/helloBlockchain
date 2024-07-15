// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "contracts/SimpleStorage.sol";

//
contract ExtraStorage is SimpleStorage {

    //virtual 标识函数是否可继承
    //override 标识函数是重写的函数
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber2 = _favoriteNumber + 5;
        // retrieve();
    }

}