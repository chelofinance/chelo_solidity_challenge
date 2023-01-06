// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IBankSolved.sol";

//TODO for a plus, allow this contract to be upgradeable
/// @title A test for solidity engineers
/// @author Rafael Contreras
/// @notice The Bank contract keeps track of the deposits and withdrawals for a
/// single user. The bank takes a 0.3% fee on every withdrawal.
/// @dev The Bank contract is.. well good enough? :). Your task is to improve it!
contract Bank is IBank {
    // The contract address for DAI
    address public constant DAI_ADDRESS = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    // The address where bank fees should be sent
    //TODO Allow the address can be changed only by the role FEES_ADDRESS_DIR
    address public constant BANK_FEE_ADDRESS = 0xcD0Bf0039d0F09CF93f9a05fB57C2328F6D525A3;

    uint256 balance = 0;

    // The bank should take a fee of 0.3% on every withdrawal. For example, if a
    // user is withdrawing 1000 DAI, the bank should receive 3 DAI. If a user is
    // withdrawing 100 DAI, the bank should receive .3 DAI. The same should hold
    // true for USDC as well.
    // The bankFee is set using setBankFee();
    uint256 public bankFee = 0;

    // You should change this value to USDC_ADDRESS if you want to set the bank
    // to use USDC.
    address public constant ERC20_ADDRESS = DAI_ADDRESS;

    function bankFeeAddress() external view returns (address) {
        return BANK_FEE_ADDRESS;
    }

    //TODO implement general deposit for many users
    //TODO implement whitelist where only some addresses can deposit. The role that can whitelist is WHITELISTER_ROLE
    /// @notice Process a deposit to the bank
    /// @param amount The amount that a user wants to deposit
    /// @return balance The current account balance
    function deposit(uint256 amount) public returns (uint256) {
        // Initialize the ERC20 for USDC or DAI
        IERC20 erc20 = IERC20(ERC20_ADDRESS);

        // Transfer funds from the user to the bank
        erc20.transferFrom(msg.sender, address(this), amount);

        // Increase the balance by the deposit amount and return the balance
        balance += amount;
        return balance;
    }

    //TODO implement general withdraw for many users
    /// @notice Process a withdrawal from the bank
    /// @param amount The amount that a user wants to withdraw. The bank takes a
    /// 0.3% fee on every withdrawal
    /// @return balance The current account balance
    function withdraw(uint256 amount) public returns (uint256) {
        // Initialize the ERC20 for USDC or DAI
        IERC20 erc20 = IERC20(ERC20_ADDRESS);

        // Calculate the fee that is owed to the bank
        (uint256 amountToUser, uint256 amountToBank) = calculateBankFee(amount);

        erc20.transfer(msg.sender, amountToUser);
        // Decrease the balance by the amount sent to the user
        balance -= amountToUser;

        erc20.transfer(BANK_FEE_ADDRESS, amountToBank);
        // Decrease the balance by the amount sent to the bank
        balance -= amountToBank;

        return balance;
    }

    /// @notice Calculate the fee that should go to the bank
    /// @param amount The amount that a fee should be deducted from
    /// @return A tuple of (amountToUser, amountToBank)
    function calculateBankFee(uint256 amount) public view returns (uint256, uint256) {
        // TODO: Implement the 0.3% fee to the bank here
        uint256 amountToBank = amount * bankFee;
        uint256 amountToUser = amount - amountToBank;
        return (amountToUser, amountToBank);
    }

    //TODO allow only the role BANK_FEE_ROLE to change the bank fee
    /// @notice Set the fee that the bank takes
    /// @param fee The fee that bankFee should be set to
    /// @return bankFee The new value of the bank fee
    function setBankFee(uint256 fee) public returns (uint256) {
        bankFee = fee;
        return bankFee;
    }

    /// @notice Get the user's bank balance
    /// @return balance The balance of the user
    function getBalanceFoBankUser() public view returns (uint256) {
        return balance;
    }

    //TODO allow only the role FEE_RECEIVER_ROLE to change the bank fee receiver
    /// @notice Set the fee that the bank takes
    /// @param feeReceiver new fee receiver
    function setBankFeeReceiver(address feeReceiver) external returns (address) {
        return address(0);
    }

    //TODO allow only the role WHITELISTER_ROLE to whitelist depositors
    function whitelistDepositor(address depositor) external {}
}
