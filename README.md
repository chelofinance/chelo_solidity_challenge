# Welcome to Chelo Challenge!

Hi! if you are reading this it means you applied for a position as solidity dev at Chelo!. This challenge consist of a single contract **Bank.sol**, you must modify/add features to this contract to measure your solidity skill level. Once you have finished with it, you must submit your changes in a private repository to [Rcontre360](https://github.com/Rcontre360)

# Rules

You can modify and work in any of the present files except for contracts/IBankSolved.sol, that contract contains the interface of functions you must implement. You are free to add your own test suites for the features (for extra points of course :) ). Also you are free to use/download/import any libraries that you think will make the development process easier. We recommend using the [openzeppelin](https://openzeppelin.com/) libraries.

In general this whole challenge is a composite challenge, each feature gives you some points, ones more than others. You can implement any of them, and then we'll evaluate your performance given the time you took to finish them.

## Bank.sol

These are the features/fixes we want you to implement in Bank.sol:

1 - Allow the contract to use many depositors/withdrawer addresses.
2 - Create a 3% fee for each withdraw in the bank.
3 - Allow addresses with the role FEES_ADDRESS_DIR to change the receiver of the bank fees.
4 - Implement a whitelist process where only whitelisted addresses can deposit. The whitelister must have the WHITELISTER_ROLE to whitelist other addresses
5 - Implement a general withdraw function for any user (with the 3% fee)
6 - Allow only the role BANK_FEE_ROLE to change the bank fee.
7 - Allow only the role FEE_RECEIVER_ROLE to change the bank fee receiver
8 - Make this contract upgradeable (extra points :))`
