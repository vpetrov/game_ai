extends Node2D

var miner:Miner = null

var accumulator:float = 0;
const minerUpdateRate:float = 2.0 #seconds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    miner = Miner.new()
    
func _process(delta: float) -> void:
    accumulator += delta
    
    if accumulator >= minerUpdateRate:
        accumulator -= minerUpdateRate
        miner.update()
