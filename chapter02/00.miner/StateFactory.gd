extends Reference

class_name StateFactory

var states = {}
var stateScriptDir = get_script().get_path().get_base_dir() + "states/"
var stateScriptExt = ".gd"

func get(stateName:String) -> State:
    if !states.has(stateName):
        var stateClass = load(stateScriptDir + stateName + stateScriptExt)
        assert(stateClass != null)
        states[stateName] = stateClass.new()
    
    return states[stateName]
