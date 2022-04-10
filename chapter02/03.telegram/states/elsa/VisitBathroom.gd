extends State

class_name VisitBathroom

func get_class() -> String: return "VisitBathroom"

func enter(owner:BaseGameObject) -> void:
    var wife := owner as Wife
    
    wife.say("Walkin' to the can. Need to powda mah pretty li'l nose")
    
func execute(owner:BaseGameObject) -> void:
    var wife := owner as Wife
    
    wife.say("Ahhhhhh! Sweet relief!")
    
    wife.fsm.revertToPreviousState()
    
    
func exit(owner:BaseGameObject) -> void:
    var wife := owner as Wife
    wife.say("Leavin' the john")

