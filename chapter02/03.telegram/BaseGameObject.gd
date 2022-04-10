extends Reference

class_name BaseGameObject

var id := get_instance_id()

func say(s:String) -> void:
    print("%s#%s: %s" % [self.get_class(), self.get_instance_id(), s])

func is_class(name) -> bool: 
    return name == self.get_class()

func onMessage(sender:BaseGameObject, telegram:Telegram) -> bool:
    return false

func tell(sender:BaseGameObject, message:int, delay:int = 0, extras:Object = null) -> void:
    MessageDispatcher.dispatch(delay, sender.id, self.id, message, extras)
