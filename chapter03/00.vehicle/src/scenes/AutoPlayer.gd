extends Node2D

class_name AutoPlayer

var movingEntity:AutoMovingEntity = null

# 32 px = 2.88m (field size = 120 yards, 38 tilemap stripes => 2.88m/stripe, stripe = 32px)
# => 11.11px = 1m
var oneMeterInPixels:float = 11.11
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    movingEntity = AutoMovingEntity.new()
    movingEntity.maxSpeedMetersPerSec = 6.0
    
func _physics_process(delta: float) -> void: 
    movingEntity.update(delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    self.position = physicsToPixelVector(movingEntity.positionMeters)
    var angleRad := atan2(movingEntity.heading.y, movingEntity.heading.x)
    $Sprite.rotation = angleRad

func setTargetPx(targetPx:Vector2) -> void:
    var targetMeters = pixelToPhysicsVector(targetPx)
    movingEntity.setTargetMeters(targetMeters)

func physicsToPixelVector(physicsVector:Vector2) -> Vector2:
    return physicsVector * oneMeterInPixels
    
func pixelToPhysicsVector(pixelVector:Vector2) -> Vector2:
    return pixelVector / oneMeterInPixels
