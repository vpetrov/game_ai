extends Reference

class_name StateMachine

var owner:BaseGameObject = null
var currentState:State = null
var previousState:State = null
var globalState:State = null
var stateFactory:StateFactory = null
var initialStateName:String = ""
var globalStateName:String = ""

func _init(owner:BaseGameObject, stateFolder:String, initialStateName:String, globalStateName:String = "") -> void:
    self.owner = owner
    self.stateFactory = StateFactory.new(stateFolder)
    self.initialStateName = initialStateName
    self.globalStateName = globalStateName
    
func update() -> void:
    if globalState != null:
        globalState.execute(owner)
    elif !globalStateName.empty():
        globalState = stateFactory.get(globalStateName)
        assert(globalState)
        globalState.execute(owner)
        
    if currentState != null:
        currentState.execute(owner)
    else:
        changeState(initialStateName)
        
func changeState(stateName:String) -> void:
    var newState := stateFactory.get(stateName)
    changeStateTo(newState)

func changeStateTo(newState:State) -> void:
    assert(newState != null)
    previousState = currentState
    if currentState != null:
        currentState.exit(owner)
    
    currentState = newState
    currentState.enter(owner)
    
func revertToPreviousState() -> void:
    if previousState != null:
        changeStateTo(previousState)
    
func isInState(stateName:String) -> bool:
    return currentState != null && currentState.get_class() == stateName
    
func onMessage(owner:BaseGameObject, sender:BaseGameObject, telegram:Telegram) -> bool:
    if currentState != null && currentState.onMessage(owner, sender, telegram):
        return true

    if globalState != null && globalState.onMessage(owner, sender, telegram):
        return true
        
    return false
