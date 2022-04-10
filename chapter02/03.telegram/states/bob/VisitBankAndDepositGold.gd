extends State

class_name VisitBankAndDepositGold

func enter(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    miner.say("Goin' to the bank. Yes siree")
    miner.changeLocation(Miner.Location.BANK)
    
func execute(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    miner.moneyInBank += miner.goldCarried
    miner.goldCarried = 0
    miner.say("Depositin' gold. Total savings now: %d" % miner.moneyInBank)
    
    if miner.fatigueLevel > 10:
        miner.fsm.changeState("GoHomeAndSleepTillRested")
    else:
        miner.fsm.revertToPreviousState()
    
func exit(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    
    miner.say("Leavin' the bank")
    
func get_class() -> String: return "VisitBankAndDepositGold"
