extends Reference

class_name Telegram

var dispatchTime := 0
var senderId := -1
var receiverId := -1
var message := -1
var extra:Object = null

func _init(senderId:int, receiverId:int, message:int, extra:Object) -> void:
    self.senderId = senderId
    self.receiverId = receiverId
    self.message = message
    self.extra = extra
