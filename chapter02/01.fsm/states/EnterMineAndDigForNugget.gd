extends State

func enter(owner:BaseGameObject) -> void:
    var miner = owner as Miner
    if miner.location != Miner.Location.GOLDMINE:
        miner.say("Walkin' to the gold mine")
    miner.changeLocation(Miner.Location.GOLDMINE)

func execute(owner:BaseGameObject) -> void:
    var miner = owner as Miner
    miner.increaseGold(1)
    miner.increaseFatigue(1)
    miner.say("Pickin' up a nugget")
    
    if miner.hasPocketsFull():
        miner.fsm.changeState("VisitBankAndDepositGold")
        return
        
    if miner.isThirsty():
        miner.fsm.changeState("QuenchThirst")
        return
    
func exit(owner:BaseGameObject) -> void:
    var miner = owner as Miner
    miner.say("Ah'm leavin' the gold mine with mah pockets full o' sweet gold")
    
func get_class() -> String: return "EnterMineAndDigForNugget"
