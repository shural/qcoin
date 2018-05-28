pragma solidity ^0.4.15;
import "../Tokens/StandardToken.sol";


/// @title Token contract - Token exchanging Ether 1:1
contract EtherToken is StandardToken {
    using Math for *;

    /*
     *  Events
     */
    //event Deposit(address indexed sender, uint value);
    //event Withdrawal(address indexed receiver, uint value);

    /*
     *  Constants
     */
    string public constant name = "Ether Token";
    string public constant symbol = "ETH";
    uint8 public constant decimals = 18;

    /*
     *  Public functions
     */
    /// @dev Buys tokens with Ether, exchanging them 1:1
    function deposit(address sender, uint value )
        public
        payable
    {
        //var curBalance = balances[sender];
        //balances[sender] = curBalance + value;
        balances[sender] += value;         
        totalTokens += value;
        Deposit(sender, value);
    }

    /// @dev Sells tokens in exchange for Ether, exchanging them 1:1
    /// @param value Number of tokens to sell
    function withdraw(uint value)
        public
    {
        // Balance covers value
        balances[msg.sender] = balances[msg.sender] - value;
        totalTokens = totalTokens - value;
        msg.sender.transfer(value);
        Withdrawal(msg.sender, value);
    }
}
