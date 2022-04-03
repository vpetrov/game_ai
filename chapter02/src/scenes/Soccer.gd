extends Node2D

var speed := 400 # N
var moveRight := Vector2(1, 0)
var moveLeft := Vector2(-1, 0)
var moveUp := Vector2(0, -1)
var moveDown := Vector2(0, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

func _physics_process(delta:float) -> void:
    handleInput(delta)
        
func handleInput(delta:float) -> void:
    if Input.is_action_pressed("move_right"):
        $PlayerBlue.applyForce(moveRight * speed)
    if Input.is_action_pressed("move_left"):
        $PlayerBlue.applyForce(moveLeft * speed)
    if Input.is_action_pressed("move_up"):
        $PlayerBlue.applyForce(moveUp * speed)
    if Input.is_action_pressed("move_down"):
        $PlayerBlue.applyForce(moveDown * speed)
    
        
