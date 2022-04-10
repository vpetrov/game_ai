extends State

class_name EatStew

func get_class() -> String: return "EatStew"

func enter(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    miner.say("Smells reaaaal goood, %s" % miner.wife.name)
    
func execute(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    
    miner.say("Tastes real good too!")
    miner.fsm.revertToPreviousState()
    
func exit(owner:BaseGameObject) -> void:
    var miner := owner as Miner
    miner.say("Thank ya li'l lady. Ah better get back to whatever ah wuz doin'")
    
