// contracts/LiquidityLocker.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address from, address to, uint256 val) external returns (bool);
}

contract LiquidityLocker {
    struct Lock {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => Lock) public locks;

    function lock(address token, uint256 amount, uint256 time) external {
        IERC20(token).transferFrom(msg.sender, address(this), amount);
        locks[msg.sender] = Lock(amount, block.timestamp + time);
    }
}
