extends Node2D

var speed := 400 # N
var moveRight := Vector2(1, 0)
var moveLeft := Vector2(-1, 0)
var moveUp := Vector2(0, -1)
var moveDown := Vector2(0, 1)

var start_time 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $PlayerYellow.setTargetPx(Vector2(1250, 450))
    $PlayerRed.setTargetPx($PlayerBlue.position)
    $PlayerRed.setSteeringBehavior(SteeringBehavior.FLEE)
    $PlayerRed.setActivationRadiusPx(130)
    #$PlayerRed.setTargetPx(Vector2(672, 416))
    #$PlayerRed.setActivationRadiusPx(100)
    start_time = OS.get_ticks_msec()
    
func _process(delta: float) -> void:
    var speed = float($PlayerRed.position.x) / ((OS.get_ticks_msec() - start_time)/ 1000.0)
    $PlayerSpeed.text = "%fpx/s" % speed
    $PlayerRed.setTargetPx($PlayerBlue.position)

func _physics_process(delta:float) -> void:
    handleInput(delta)
    #$PlayerRed.setTargetPx($PlayerBlue.position)
        
func handleInput(delta:float) -> void:
    if Input.is_action_pressed("move_right"):
        $PlayerBlue.applyForce(moveRight * speed)
    if Input.is_action_pressed("move_left"):
        $PlayerBlue.applyForce(moveLeft * speed)
    if Input.is_action_pressed("move_up"):
        $PlayerBlue.applyForce(moveUp * speed)
    if Input.is_action_pressed("move_down"):
        $PlayerBlue.applyForce(moveDown * speed)
    
        
