extends BaseGameObject

class_name Miner

var currentState:State = null
var goldCarried:int = 0
var moneyInBank:int = 0
var thirstLevel:int = 0
var fatigueLevel:int = 0
var location = Location.HOME
var stateFactory:StateFactory = StateFactory.new()

# enums
enum Location { HOME, GOLDMINE, BANK }

func _init() -> void:
    pass
    
func get_class() -> String: return "Miner"
    
func update() -> void:
    thirstLevel += 1
    if currentState != null:
        currentState.execute(self)
    else:
        changeState("EnterMineAndDigForNugget")
    pass
    
func changeState(stateName:String) -> void:
    var newState := stateFactory.get(stateName)
    assert(newState != null)
    
    # exit previous state
    if currentState != null:
        currentState.exit(self)
        
    # set new state
    currentState = newState
    
    # enter new state (also current state at this point)
    if currentState != null:
        currentState.enter(self)

func changeLocation(newLocation) -> void:
    say("  (location) %s -> %s " % [Location.keys()[location], Location.keys()[newLocation]])
    location = newLocation
    pass
    
func increaseGold(amount:int) -> void:
    goldCarried += amount
    
func increaseFatigue(amount:int) -> void:
    fatigueLevel += amount
    
func hasPocketsFull() -> bool:
    return false # TODO
    
func isThirsty() -> bool:
    return false # TODO
