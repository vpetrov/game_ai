extends Agent

class_name Wife

func _init(name:String).(name, "DoHousework") -> void:
    fsm.globalStateName = "WifeGlobalState"
    pass
    
func get_class() -> String: return "Wife"

func update() -> void:
    .update()
