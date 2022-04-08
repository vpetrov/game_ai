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
