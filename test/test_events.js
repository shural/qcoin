const utils = require('./utils')

const CategoricalEvent = artifacts.require("./Events/CategoricalEvent.sol")
const EventFactory = artifacts.require("./Events/EventFactory.sol")
const OutcomeToken = artifacts.require('./Tokens/OutcomeToken.sol')
const EtherToken = artifacts.require("./Tokens/EtherToken.sol")
const CentralizedOracleFactory = artifacts.require("./Oracles/CentralizedOracleFactory.sol")
const CentralizedOracle = artifacts.require("./Oracles/CentralizedOracle.sol")

const contracts = [CategoricalEvent, EventFactory, OutcomeToken, EtherToken, CentralizedOracle, CentralizedOracleFactory]

contract('Event', function (accounts) {
    let centralizedOracleFactory
    let eventFactory
    let etherToken
    let oracle, event

    before(utils.createGasStatCollectorBeforeHook(contracts))
    after(utils.createGasStatCollectorAfterHook(contracts))

    beforeEach(async () => {
        centralizedOracleFactory = await CentralizedOracleFactory.deployed()
        eventFactory = await EventFactory.deployed()
        etherToken = await EtherToken.deployed()

        // create event
        oracle = utils.getParamFromTxEvent(
            await centralizedOracleFactory.createCentralizedOracle(),
            'centralizedOracle', CentralizedOracle
        )
        event = utils.getParamFromTxEvent(
            await eventFactory.createCategoricalEvent(etherToken.address, oracle.address, 2),
            'categoricalEvent', CategoricalEvent
        )
    })

    it('should buy, set and redeem outcomes for categorical event', async () => {
        // Buy outcome for betFor
        const buyer = 1
        const collateralTokenCount = 2
        const betFor = 1

        // Deposit the Ether token for collateral
        await etherToken.deposit(accounts[buyer], collateralTokenCount)

        let balance = (await etherToken.balanceOf.call(accounts[buyer]));
        console.log("after deposit, now the collateral for the above account becomes", balance.valueOf())
        assert.equal(balance.valueOf(), collateralTokenCount)

        // Delegate the event to use the colleteral
        await etherToken.approve(event.address, collateralTokenCount, { from: accounts[buyer] })
        
        // Bet for outcome #betFor
        console.log("Bet for outcome for %d", betFor)         
        await event.buySpecificOutcome(collateralTokenCount, betFor, accounts[buyer])
        //await event.buyAllOutcomes(collateralTokenCount, { from: accounts[buyer] })
        
        //await etherToken.transferFrom(accounts[buyer], event.address, 2) 
        console.log("\nNow collateralToken moves to event account ")
        assert.equal((await etherToken.balanceOf.call(event.address)).valueOf(), collateralTokenCount)
        assert.equal((await etherToken.balanceOf.call(accounts[buyer])).valueOf(), 0)
        console.log((await etherToken.balanceOf.call(event.address)).valueOf())
        console.log((await etherToken.balanceOf.call(accounts[buyer])).valueOf())

        console.log("\nCheck for outcome one by one")
        const outcomeToken1 = OutcomeToken.at(await event.outcomeTokens.call(0))
        const outcomeToken2 = OutcomeToken.at(await event.outcomeTokens.call(1))
        assert.equal((await outcomeToken1.balanceOf.call(accounts[buyer])).valueOf(), 0)
        assert.equal((await outcomeToken2.balanceOf.call(accounts[buyer])).valueOf(), collateralTokenCount)
        console.log((await outcomeToken1.balanceOf.call(accounts[buyer])).valueOf())
        console.log((await outcomeToken2.balanceOf.call(accounts[buyer])).valueOf())

        //Set outcome in oracle contract
        console.log("\nSet outcome in oracle contract")
        await oracle.setOutcome(1)
        assert.equal((await oracle.getOutcome.call()).valueOf(), 1)
        assert.equal((await oracle.isOutcomeSet.call()).valueOf(), true)
        console.log("outcome set in Oracle %d\n", (await oracle.getOutcome.call()).valueOf())

        //Set outcome in event
        console.log("Set outcome in event")
        await event.setOutcome()
        assert.equal((await event.outcome.call()).valueOf(), 1)
        assert.equal((await event.isOutcomeSet.call()).valueOf(),true)
        console.log("outcome set in event: %d\n", (await event.outcome.call()).valueOf())

        //Redeem winnings for buyer account
        console.log("Redeem winnings for buyer account")
        await event.redeemWinnings({ from: accounts[buyer] })
        console.log("buyer's account now becomes %d\n", (await etherToken.balanceOf.call(accounts[buyer])).valueOf()) 
        assert.equal((await etherToken.balanceOf.call(accounts[buyer])).valueOf(), collateralTokenCount)
    })
})
