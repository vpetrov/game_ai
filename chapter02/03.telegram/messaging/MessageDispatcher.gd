extends Node

var messageQueue = []

func update() -> void:
    dispatchDelayedMessages()

func dispatch(delayMs:int, senderId:int, receiverId:int, message:int, info:Object = null) -> void:
    var telegram = Telegram.new(senderId, receiverId, message, info)    
    if delayMs <= 0:
        discharge(telegram)
    else:
        var currentTime:int = OS.get_ticks_msec()
        telegram.dispatchTime = currentTime + delayMs
        enqueueTelegram(telegram)
        
# rich man's priority queue (rich enough to afford state of the art machines to compensate for the
# extra work)
func enqueueTelegram(telegram:Telegram) -> void:
    messageQueue.append(telegram)
    messageQueue.sort_custom(self, "telegram_sort")
    
func telegram_sort(a:Telegram, b:Telegram) -> bool:
    return a.dispatchTime < b.dispatchTime
    
func dispatchDelayedMessages() -> void:
    var currentTime := OS.get_ticks_msec()
    
    while !messageQueue.empty() && messageQueue.front().dispatchTime <= currentTime:
        var telegram = messageQueue.pop_front() as Telegram
        discharge(telegram)
    
func discharge(telegram:Telegram) -> void:
    assert(telegram != null)
    
    var receiver := instance_from_id(telegram.receiverId)
    assert(receiver != null)
    assert(receiver.has_method("onMessage"))
    
    var sender := instance_from_id(telegram.senderId)
    assert(sender != null)
    
    receiver.onMessage(sender, telegram)
