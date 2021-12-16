// SPDX-License-Identifier: MIT
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

pragma solidity ^0.8.10;

contract FlipCoin is Ownable {

    using SafeMath for uint256;

    uint public contractBalance;

    event BetPlaced(address indexed user, uint indexed bet, bool indexed win, uint side);
    event Funded(address owner, uint funding);

    // Function to simulate Coin Flip 50/50 Randomness
    function flip(uint side) public payable returns (bool) {
        require(address(this).balance >= msg.value.mul(2), "The Contract has not enough Funds");
        require(side == 0 || side == 1, "Incorrect Side, needs to be 0 or 1");
        bool win;
        if (block.timestamp % 2 == side) {
            contractBalance -= msg.value;
            payable(msg.sender).transfer(msg.value * 2);
            win = true;
        }
        else {
            contractBalance += msg.value;
            win = false;
        }
        emit BetPlaced(msg.sender, msg.value, win, side);
        return win;
    }

    // Function to Withdraw Funds
    function withdrawAll() public onlyOwner returns (uint){
        payable(msg.sender).transfer(address(this).balance);
        assert(address(this).balance == 0);
        return address(this).balance;
    }

    // Function to get the Balance of the Contract
    function getBalance() public view returns (uint) {
        return contractBalance;
    }

    // Fund the Contract
    function fundContract() public payable onlyOwner {
        require(msg.value != 0);
        contractBalance = contractBalance.add(msg.value);
        emit Funded(msg.sender, msg.value);
        assert(contractBalance == address(this).balance);
    }
}