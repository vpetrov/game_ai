extends Node2D

var bob:Miner = null
var elsa:Wife = null

var accumulator:float = 0;
const agentUpdateRate:float = 1.0 #seconds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    bob = Miner.new("bob")
    elsa = Wife.new("elsa")
    
func _process(delta: float) -> void:
    accumulator += delta
    
    if accumulator >= agentUpdateRate:
        accumulator -= agentUpdateRate
        bob.update()
        elsa.update()
