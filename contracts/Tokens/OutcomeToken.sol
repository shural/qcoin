pragma solidity ^0.4.15;
import "../Tokens/StandardToken.sol";

/// @title Outcome token contract - Issuing and revoking outcome tokens
contract OutcomeToken is StandardToken {
    using Math for *;

    /*
     *  Events
     */
    event Issuance(address indexed owner, uint amount);
    event Revocation(address indexed owner, uint amount);

    /*
     *  Storage
     */
    address public eventContract;

    /*
     *  Modifiers
     */
    modifier isEventContract () {
        // Only event contract is allowed to proceed
        require(msg.sender == eventContract);
        _;
    }

    /*
     *  Public functions
     */
    /// @dev Constructor sets events contract address
    function OutcomeToken()
        public
    {
        eventContract = msg.sender;
    }
    
    /// @dev Events contract issues new tokens for address. Returns success
    /// @param _for Address of receiver
    /// @param outcomeTokenCount Number of tokens to issue
    function issue(address _for, uint outcomeTokenCount)
        public
        isEventContract
    {
        uint outcomeTokenVar = balances[_for]; 
        balances[_for] = outcomeTokenVar + outcomeTokenCount;
        
        uint totalTokenVar = totalTokens;
        totalTokens = totalTokenVar + outcomeTokenCount;
        Issuance(_for, outcomeTokenCount);
    }

    /// @dev Events contract revokes tokens for address. Returns success
    /// @param _for Address of token holder
    /// @param outcomeTokenCount Number of tokens to revoke
    function revoke(address _for, uint outcomeTokenCount)
        public
        isEventContract
    {
        balances[_for] -= outcomeTokenCount;
        totalTokens -= outcomeTokenCount;
        Revocation(_for, outcomeTokenCount);
    }
}
