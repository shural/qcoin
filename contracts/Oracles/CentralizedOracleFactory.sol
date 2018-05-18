pragma solidity ^0.4.15;
import "../Oracles/CentralizedOracle.sol";


/// @title Centralized oracle factory contract - Allows to create centralized oracle contracts
/// @author Stefan George - <stefan@gnosis.pm>
contract CentralizedOracleFactory {

    /*
     *  Events
     */
    event CentralizedOracleCreation(address indexed creator, CentralizedOracle centralizedOracle);

    /*
     *  Public functions
     */
    /// @dev Creates a new centralized oracle contract
    /// @return Oracle contract
    function createCentralizedOracle()
        public
        returns (CentralizedOracle centralizedOracle)
    {
        centralizedOracle = new CentralizedOracle(msg.sender);
        CentralizedOracleCreation(msg.sender, centralizedOracle);
    }
}
