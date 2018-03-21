# qcoin
Cryptocurrency for project Apogeios. Value of the currency system grows as the quality of certain media IP based SW stack grows even better, the ecosystem grows stronger and the inhabitants of Apogeios internalizes more sense of quality.

2AM, 3/18 Shanghai time, woke up. Thanks to dearest Budha. All of a sudden, the ideas just swamped in from nowhere.

There are two major challenges to lead Apogeios inhabitants through the transformation.
1. Awareness of quality and what exactly quality means for a genearl SW stack and a good SW ecosystem. In most cases, the inhabitants skip necessary pondering of quality not because they do not care or they are ignorant. Instead, they do not know exactly what quality means and what possible measurements for quality improvements.
2. Encouragement of extra efforts (always in risk of delaying of workload at hand) for better quality. Everyone rushes for getting things done faster for shorter term targets while the flaws usually fire back sooner and later and will incur more work days to fix them.

The transformation does not nececessily have to be any connections to blockchain based cryptocurrency which can be overkill, but the popularity of blockchain and all hypos built around it could give a nudge to the transformation. And beyond that blockchain based cryptocurrency does bring foundamental benefits to resolve the challenges. It offers a quantiative metrics of quality improvement efforts which can be recognized in a specific concensus algorithm. The concensus algorithm plays a most wanted vision - quality recognition is better to be decentralized and self-organized regardless a potentially practical application in Apogeios that we need a hybrid approach in the beginning.

Crytocurrency encourages risk taking of extra efforts for better quality. Not just the number increase in personal balance account is a psychological reward but also the potential possibility of cashing out through standard on the Earth reward system. Benefits or penalities of anomymity nature of cryptocurrency in this application is arguable but should not be a big concern either way. On the other hand, it opens an opporutnity to encourage those who endorses final schedule and work assignments to allow more risk taking because the protocol can be designed to reduce their balance otherwise.

Besides quality improvement efforts would be rewarded as a balance increase, unintentional consequences of compromising quality from undisciplined operation could result in balance deduction. How much the system should apply this would require a thoughtful consideration. Apparently it should not hurt the positive encouragement especially in the early phase when the system rolls out. 

The decentralized ledger plays as a place to store all quality efforts. It helps every inhabitants to view what's going on in the society. There are various types of activities aiming at quality improvement. These activities happens everywhere in the stack. The underlying blockchain mandates a broadcast of these activities because if you do not do, the activities would not be appreciated, be rectified and stored in the chain. This is soemthing like ISFS and it's actually the Modal, so it makes it easy to develop a Viewer to zoom in/out the evovlement of Apogeios quality.

Another subtle benefit reside in the essence of any currency. Currency is all about trust. In Apogeios application, the trust is a common sense (consensus) of SW quality. More inhabitants understand (trust) quality and want to spend more energy in quality efforts, bigger value the currency system will hold. In other words, this is essentially the direct mapping from total value of the cryptocurrency economy to the sense of quality in Apogeios society.

# Activities
Major types of activities/efforts ... Literally all engineering activities and associated decisions have more or less impact on quality. Pointers to these activities and decisions need to be put on the blockchain.

* design review
* code review/inspection
* Dev ULT
* 

# Consensus protocol
There are a few considerations in this design of consensus protocol (in other words, rules to enforce in the crypto economy).

1. PoS or PoW. PoW is certainly out of question. PoS, on the other hand, requires thoughful consideration to ensure economic incentives and penalites are effective.

2. Miners. Who, how, how many incentives and penalties? This is where art and science mixed together.

   Clearly miners, in the case of PoS, validators vote on the next block. Natural enough, the validator who has the biggest size of deposit get the biggest weight. Validators are rewarded for their service to the chain. The inhabitant(s) initiating the quality efforts would be joining the validator group by default. 
   
   Fun part here is about the bet. Using code review as one example, if the validators bet on the effort (as promosing for better quality) and put it in a block, they will get incentives later when the code change eventually pass tests; otherwise they get penalized losing some of their stakes (to those who bet otherwise as one option). This is almost like a smart contract of post mortem. It does not require to duplicate the existing code review efforts - those are still off chain data, however it fills in the gap in the past that nobody would look back at why a code review fails gating some easy failures.
   
   In the same code review case, it is arguable that penalizing validators for failing regression tests would demotivate validators to look at the quality metrics that could not be measured by tests. Actually this is not a zero sum game. The protocol can be designed to support both. For example, if the initiator's first submission of code/design change fails automatic tool check on quality, corresponding balance could be decreased. If later on the approved design proved to be not good enough, all validators who bet on the efforts would get penalized.

3. Finality is in gernal not a concern of this cyptocurrency design. The individual or group of inhabitant to conduct the efforts can choose to be anonymous or not. All quality efforts take days or weeks or months to complete. Final ownership will be claimed only when the efforts are completed, and that's when finality is supposed to achieve. However, odd is after a period of time the completed quality efforts is proved to be of not that useful (does not worth that much rewards) or in the worst case an incorrect one. It's probably not a good choice to reverse the finality already made before, because that would essentially mean a hard fork from where the finality is written in the chain. There are various options to handle the situation. One can be automatically add a transaction to transfer the balance of those inhabitants to VOID - like a write-off. Another one can be requiring more stake or reducing the weight in the next round of concensus.

4. Attacks are out of question. This is a game afterall.

5. Confidentiality. Like regular cryptocurrency, the address of each inhabitant is a hashed public key created from a private key only the inhabitant knows. A blockchain viewer can only list account balance but does not know which inhabitant actually owns the account. This is probably mostly wanted because it could lead to discouragement when everyone sees everyone else's account - this is an unecessary competition.

# Challenges

1. Interoperability with existing tools/process. In the best case, the cryptocurrency system should just run in the background and be transparent as much as possible. Considering there are already many systems running in daily life of every inhabitant, adding one more would not entirely build a momentum (of course someone could argue that the marginal cost is very low so it does not matter).

   It's a hetergeneous environment consisting of various system each inhabitant lives and interacts everyday. Name a few, JIRA, HSD, VS, Git, Gerrit, Code collabrator, Sharepoint, Eclipse... REST is a common API making it easier for various system to communicate. However not all these systems provide REST API or extensibility for smart contract like programs running to trigger consensus protocol. This means it leaves no other options but the inhabitant has to trigger the process explicitly.

   Moreover, to make it more complex, one quality improvement typically involves multiple actions and interacts with multiple systems. It's arguable each action/interaction could stand alone. Flexiblity must be allowed in the design to pack multiple actions/interactions into a mega one for concensus. 

2. Psychological safety

   This is an interesting experiment to pratice some rigid logic/science in management art. Psychological safety could be a major concern for all inhabitants. Inhabitants could easily connect the amount of cryptocurrency in their balance account to their performance on the Earth. On the other hand, if inhabitants take this easy as a game w/o concerns of real on the Earth penalities and rewards, it makes it easy for the quality sense interlization.
   
   There is argument about a direct mapping from on-chain identity to off-chain real identity on Earth is more effective for promoting sense of quality. The thinking claims authorities on Earth can better recognize those who have more balance and discipline those who have less. This essentially discourages the innate motivation of being better.

3. Inflation. In genearl, we want to see the total value of the crptocurrency system increase linearly to the population of inhabitants. It does not have to be similar to the knowledge explosion people see on the Earth, because at least internal quality efforts would be getting harder and harder, and contribution from internalization would be approaching to zero. However the growth of ecosystem could be explosive, which offset the other two contributors.

4. Wire money. Inhabitants get incentives from doing extra/better work about quality, and receive pelnaties for doing counter things. Wiring moneny among them, on the other hand, does not carry explicit meaning. Could it be just something like a master coaching an apprentice passing knowledge and now in this case it's the cryptocurrency?

5. Explicit/implicit impact

   There are various types of activities/efforts affecting the quality. Some are explicit - impacts are obvious, and these impacts are mostly negative. For example, a code review only cares about coding standard, or a code change breaks complexity check, or a check-in includes multiple indepedent features or bug fixes. These activities may or may not incur incentives or pelnaties depending on how aggresive the system is designed. It is very aggressive if the system automatically write-off some balance as long as the code change fails complexity check no matter the change has been raised for code review - this clearly will requires the inhabitant to check by himself/herself before submitting, and to some extent indicates the inhabitant has more sense of quality. It is very conservative if the system does not even penalize a check-in including multiple fixes as long as it does not incur any regression.

   The challenge gets bigger when the activity's impact on quality is implicit. This can be the most likely case in the beginning because that's where the society starts to ramp up on quality. There are only few inhabitants called as quality guru who knows more about quality than most others. They infuence others and increases the probability of a success bet on block. However they may not get involved as validator in all cases so in the case of absence the remaining validators actually put on bet blindly until later the impact emerges. It's also possible that guru might not be able to articulate quality impact as others for some cases. In both situations, a mechanism is required to adjust the amount of incentives/penalities for simliar cases in the future. This is probably an automatic system suggestion about the amount based on historical data.
   
6. Economy healthy metrics

   Parameters of consensus protocol might change if the cryto economy does not run as expected. It requires more research on healthy metrics of an economic system. And even if the metrics are known and there are tools to evaluate the metrics, the correlation to consensus protocol parameters is hard to identify. A BP like approach might be too costly.
   
# Implementation considerations

1. Apparently this must be a private blockchain as all quality efforts recorded in the chain are confined in the context of Apogeios.

2. It appears that Ethereum is the platform of choice.

3. The implementation must be OS agonostic.

4. Notification. Each inhabitant should receive a daily report of his/her balance. A NPC like agent can be implemented to scan through the full blockchain and accumulate efforts related to certain (anonymous) inhabitant and send over the balance. However because the real identity of the inhabitant is encrypted, the NPC agent can only post all balances in a public billboard.

5. Must note that the intention is not to move the properties onto the blockchain. Instead, each "transcation" in the chain includes a pointer linking to the corresponding physical records in whichever systems.
