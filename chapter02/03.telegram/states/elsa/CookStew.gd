extends State

class_name CookStew

func get_class() -> String: return "CookStew"

func enter(owner:BaseGameObject) -> void:
    var wife := owner as Wife
    
    if !wife.cooking:
        wife.cooking = true
        wife.say("Puttin' the stew in the oven")
        wife.tell(wife, Messages.STEW_READY, 1000)
    
func execute(owner:BaseGameObject) -> void:
    var wife := owner as Wife
    wife.say("Fussin' over food...")

func exit(owner:BaseGameObject) -> void:
    var wife := owner as Wife
    wife.say("Puttin' the stew on the table")

func onMessage(owner:BaseGameObject, sender:BaseGameObject, telegram:Telegram) -> bool:
    var wife := owner as Wife
    assert(wife != null)
    
    match telegram.message:
        Messages.STEW_READY: 
            wife.say("Stew's ready! Let's eat")
            wife.husband.tell(wife, Messages.STEW_READY)
            wife.fsm.changeState("DoHousework")
            
    return true
