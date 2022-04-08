extends State

class_name DoHousework

var workMessages = [
    "Moppin' the floor",
    "Makin' the bed"
   ]

func get_class() -> String: return "DoHousework"

func enter(owner:BaseGameObject) -> void:
    pass
    
func execute(owner:BaseGameObject) -> void:
    var wife := owner as Wife
    
    var r = rand_range(0, workMessages.size())
    wife.say(workMessages[r])
    
    
func exit(owner:BaseGameObject) -> void:
    pass
    
