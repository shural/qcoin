pragma solidity ^0.4.15;
import "../Events/CategoricalEvent.sol";

/// @title Event factory contract - Allows creation of categorical and scalar events
contract EventFactory {

    /*
     *  Events
     */
    event CategoricalEventCreation(address indexed creator, CategoricalEvent categoricalEvent, Token collateralToken, Oracle oracle, uint8 outcomeCount);

    /*
     *  Public functions
     */
    /// @dev Creates a new categorical event and adds it to the event mapping
    /// @param collateralToken Tokens used as collateral in exchange for outcome tokens
    /// @param oracle Oracle contract used to resolve the event
    /// @param outcomeCount Number of event outcomes
    /// @return Event contract
    function createCategoricalEvent(
        Token collateralToken,
        Oracle oracle,
        uint8 outcomeCount
    )
        public
        returns (CategoricalEvent eventContract)
    {
        // Create event
        eventContract = new CategoricalEvent(
            collateralToken,
            oracle,
            outcomeCount
        );
        CategoricalEventCreation(msg.sender, eventContract, collateralToken, oracle, outcomeCount);
    }

}
