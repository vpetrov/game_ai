extends Reference

class_name BaseGameObject

func say(s:String) -> void:
    print("%s#%s: %s" % [self.get_class(), self.get_instance_id(), s])

func is_class(name) -> bool: 
    return name == self.get_class()
