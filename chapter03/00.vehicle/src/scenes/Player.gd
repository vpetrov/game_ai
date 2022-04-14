extends Node2D

var mass := 1.0 # kg
var velocity := Vector2(0, 0) # m/s
var acceleration := Vector2(0,0) # m/s^2

var friction := 30.0
var imageHeading := Vector2(1,0)
var heading := imageHeading;

func _ready() -> void:
    pass 

func _process(delta: float) -> void:
    #var angleRad := acos(heading.dot(imageHeading))
    var angleRad := atan2(heading.y, heading.x)
    #if heading.y < 0:
    #    angleRad = -angleRad
    $Image.rotation = angleRad
    #update()

func _physics_process(delta: float) -> void:
    applyFriction();
    if acceleration.length() < 0.01:
        return
    velocity = acceleration * delta;
    position += velocity * delta;
    
    heading = velocity.normalized()
    velocity = Vector2(0, 0)

# force in N
func applyForce(force:Vector2) -> void:
    acceleration += force / mass;

func applyFriction() -> void:
    var frictionForce := -acceleration / friction;
    applyForce(frictionForce)

func _draw() -> void:
    pass
    draw_line(Vector2(0,0), acceleration / 100, Color.red, 5);
    #draw_line(Vector2(0,0), heading * 100, Color.black, 3);
