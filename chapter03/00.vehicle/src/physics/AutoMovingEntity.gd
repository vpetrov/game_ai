extends MovingEntity

class_name AutoMovingEntity

const epsilon := 0.00001
var steeringBehavior:SteeringBehavior = null

func _init() -> void:
    steeringBehavior = SteeringBehavior.new(self)
    
func setTargetMeters(targetMeters:Vector2) -> void:
    steeringBehavior.targetMeters = targetMeters
    
func setActivationRadiusMeters(radiusMeters:float) -> void:
    steeringBehavior.activationRadiusMeters = radiusMeters

func update(delta:float) -> void:
    var desiredVelocityMetersPerSec := steeringBehavior.calculateDesiredVelocityMetersPerSec()
    assert ( mass >= epsilon || mass <= epsilon)
    var forceN = desiredVelocityMetersPerSec * mass
    #var accelerationMeters = steeringForceMetersPerSec / mass
    velocityMetersPerSec = forceN * delta
    
    velocityMetersPerSec = truncate(velocityMetersPerSec, maxSpeedMetersPerSec)
    positionMeters += velocityMetersPerSec * delta
    
    if velocityMetersPerSec.length_squared() > epsilon:
        heading = velocityMetersPerSec.normalized()
        side = Vector2(heading.y, -heading.x)
    
func truncate(v:Vector2, maxLength:float) -> Vector2:
    if v.length_squared() <= maxLength * maxLength:
        return v
        
    return v.normalized() * maxLength
