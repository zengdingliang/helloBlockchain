// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "contracts/SimpleStorage.sol";


contract StorageFactory {

    SimpleStorage public simple;
    SimpleStorage[] public simples;
    function createSimpleStorageContract() public {
        simple = new SimpleStorage();
        simples.push(simple);
    }

    function sfStore(uint256 _simStorageIndex,uint _sotreNum) public {
        simples[_simStorageIndex].store(_sotreNum);
    }

    function sfRetrieve(uint256 _index) public view returns (uint256){
        return simples[_index].retrieve();
    }

}