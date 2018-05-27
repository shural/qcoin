pragma solidity ^0.4.15;
import "../Oracles/Oracle.sol";

/// @title Centralized oracle contract - Allows the contract owner to set an outcome
contract CentralizedOracle is Oracle {

    /*
     *  Events
     */
    event OwnerReplacement(address indexed newOwner);
    event OutcomeAssignment(int outcome);

    /*
     *  Storage
     */
    address public owner;
    bool public isSet;
    int public outcome;

    /*
     *  Modifiers
     */
    modifier isOwner () {
        // Only owner is allowed to proceed
        require(msg.sender == owner);
        _;
    }

    /*
     *  Public functions
     */
    /// @dev Constructor sets owner address
    function CentralizedOracle(address _owner)
        public
    {
        // Description hash cannot be null
        owner = _owner;
    }

    /// @dev Replaces owner
    /// @param newOwner New owner
    function replaceOwner(address newOwner)
        public
        isOwner
    {
        // Result is not set yet
        require(!isSet);
        owner = newOwner;
        OwnerReplacement(newOwner);
    }

    /// @dev Sets event outcome
    /// @param _outcome Event outcome
    function setOutcome(int _outcome)
        public
        isOwner
    {
        // Result is not set yet
        require(!isSet);
        isSet = true;
        outcome = _outcome;
        OutcomeAssignment(_outcome);
    }

    /// @dev Returns if winning outcome is set
    /// @return Is outcome set?
    function isOutcomeSet()
        public
        constant
        returns (bool)
    {
        return isSet;
    }

    /// @dev Returns outcome
    /// @return Outcome
    function getOutcome()
        public
        constant
        returns (int)
    {
        return outcome;
    }
}
