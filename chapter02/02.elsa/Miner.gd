extends Agent

class_name Miner

var goldCarried:int = 0
var moneyInBank:int = 0
var thirstLevel:int = 0
var fatigueLevel:int = 0
var location = Location.HOME

# enums
enum Location { HOME, GOLDMINE, BANK, SALOON }

func _init(name:String).(name, "EnterMineAndDigForNugget") -> void:
    pass
    
func get_class() -> String: return "Miner"
    
func update() -> void:
    thirstLevel += 1
    fatigueLevel += 1
    .update()

func changeLocation(newLocation) -> void:
    say("  (location) %s -> %s " % [Location.keys()[location], Location.keys()[newLocation]])
    location = newLocation
    
func increaseGold(amount:int) -> void:
    goldCarried += amount
    
func increaseFatigue(amount:int) -> void:
    fatigueLevel += amount
    
func hasPocketsFull() -> bool:
    return goldCarried >= 5
    
func isThirsty() -> bool:
    return thirstLevel >= 7
