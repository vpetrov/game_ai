extends State

class_name GoHomeAndSleepTillRested

func get_class() -> String: return "GoHomeAndSleepTillRested"

func enter(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    miner.say("Walkin' home")
    miner.changeLocation(Miner.Location.HOME)
    
func execute(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    
    if miner.fatigueLevel > 1:
        miner.say("ZZZ...")
        miner.fatigueLevel -= 3
        if miner.fatigueLevel < 0:
            miner.fatigueLevel = 0
    else:
        miner.fsm.changeState("EnterMineAndDigForNugget")
    
func exit(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    miner.say("What a God-darn fantastic nap! Time to find more gold!")
