extends State

class_name QuenchThirst

func get_class() -> String: return "QuenchThirst"

func enter(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    miner.say("Boy, ah sure is thusty! Walkin to the saloon")
    miner.changeLocation(Miner.Location.SALOON)
    
func execute(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    
    if miner.thirstLevel > 1:
        miner.say("That's mighty fine sippin' liquor")
        miner.thirstLevel = 0
    else:
        miner.fsm.revertToPreviousState()
    
func exit(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    miner.say("Leavin' the saloon, feelin' good!")
    
