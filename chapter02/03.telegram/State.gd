extends Reference

class_name State

func execute(_owner:BaseGameObject) -> void:
    pass
    
func enter(_owner:BaseGameObject) -> void:
    pass
    
func exit(_owner:BaseGameObject) -> void:
    pass

func onMessage(_owner:BaseGameObject, _sender:BaseGameObject, _telegram:Telegram) -> bool:
    return false
