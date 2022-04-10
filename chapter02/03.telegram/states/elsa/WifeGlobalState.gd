extends State

class_name WifeGlobalState

var randMax = 100
var chance = 20 # out of 100

func get_class() -> String: return "WifeGlobalState"

func execute(owner:BaseGameObject) -> void:
    var wife := owner as Wife
    
    var r = rand_range(0, randMax)
    if r < chance:
        wife.fsm.changeState("VisitBathroom")

func onMessage(owner:BaseGameObject, sender:BaseGameObject, telegram:Telegram) -> bool:
    var wife := owner as Wife
    assert(wife != null)
    
    var miner := sender as Miner
    assert(miner != null)
    
    match telegram.message:
        Messages.HI_HONEY_IM_HOME: 
            wife.say("Hi honey, let me make you some of mah fine country stew")
            wife.fsm.changeState("CookStew")
            
    return true
