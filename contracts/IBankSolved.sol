// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

interface IBank {
    /// @notice returns bank fee address
    function bankFeeAddress() external view returns (address);

    /// @notice returns bank fee
    function bankFee() external view returns (uint256);

    /// @notice Process a deposit to the bank
    function deposit(uint256 amount) external returns (uint256);

    /// @notice Process a withdrawal from the bank
    function withdraw(uint256 amount) external returns (uint256);

    /// @notice Calculate the fee that should go to the bank
    function calculateBankFee(uint256 amount) external view returns (uint256, uint256);

    /// @notice Set the fee that the bank takes
    function setBankFee(uint256 fee) external returns (uint256);

    /// @notice Set the fee that the bank takes
    function setBankFeeReceiver(address feeReceiver) external returns (address);

    /// @notice whitelists users to deposit
    function whitelistDepositor(address depositor) external;
}
