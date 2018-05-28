let Math = artifacts.require("./Utils/Math.sol")
let EventFactory = artifacts.require("./Events/EventFactory.sol")
let EtherToken = artifacts.require("./Tokens/EtherToken.sol")
let CentralizedOracleFactory = artifacts.require("./Oracles/CentralizedOracleFactory.sol")
let OutcomeToken = artifacts.require("./Tokens/OutcomeToken.sol")


module.exports = function (deployer) {
    deployer.deploy(Math)
    deployer.link(Math, [EventFactory, OutcomeToken, EtherToken])

    deployer.deploy(CentralizedOracleFactory)

    deployer.link(Math, EtherToken)
    deployer.deploy(EtherToken) 

    deployer.link(Math, OutcomeToken)
    deployer.deploy(OutcomeToken)

    deployer.deploy(EventFactory)

}
