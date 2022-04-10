extends BaseGameObject

# A game object with an FSM and a name
class_name Agent

var name:String
var fsm:StateMachine = null

func _init(name:String, initialState:String) -> void:
    self.name = name
    fsm = StateMachine.new(self, name, initialState)

func get_class() -> String: return "Agent"

func update() -> void:
    fsm.update()

func onMessage(sender:BaseGameObject, telegram:Telegram) -> bool:
    return fsm.onMessage(self, sender, telegram)
