extends Reference

class_name SteeringBehavior

var movingEntity:MovingEntity
var targetMeters:Vector2 = Vector2(0,0)
var activationRadiusMeters := -1.0

func _init(movingEntity:MovingEntity) -> void:
    self.movingEntity = movingEntity

func seek() -> Vector2:
    var vectorToTarget:Vector2 = targetMeters - movingEntity.positionMeters
    # check if we're outside the activation radius
    if activationRadiusMeters > 0.0 && vectorToTarget.length_squared() > activationRadiusMeters * activationRadiusMeters:
        return Vector2(0,0)
    
    # otherwise react
    var targetDirectionMeters = vectorToTarget.normalized()
    var currentDirectionMeters = movingEntity.heading
    
    var changeInDirection:Vector2 = targetDirectionMeters - currentDirectionMeters
    var desiredVelocityMetersPerSec:Vector2
    if changeInDirection.length_squared() <= 0.01:
        desiredVelocityMetersPerSec = targetDirectionMeters * movingEntity.maxSpeedMetersPerSec
    else:
        desiredVelocityMetersPerSec = changeInDirection * movingEntity.maxSpeedMetersPerSec
    
    #var desiredVelocityMetersPerSec = directionMeters * movingEntity.maxSpeedMetersPerSec
    #return desiredVelocityMetersPerSec - movingEntity.velocityMetersPerSec
    return desiredVelocityMetersPerSec

func flee() -> Vector2:
    return -seek()
    
func arrive() -> Vector2:
    var vectorToTarget:Vector2 = targetMeters - movingEntity.positionMeters
    # check if we're outside the activation radius
    if activationRadiusMeters > 0.0 && vectorToTarget.length_squared() > activationRadiusMeters * activationRadiusMeters:
        return Vector2(0,0)
    
    # otherwise react
    var targetDirectionMeters = vectorToTarget.normalized()
    var currentDirectionMeters = movingEntity.heading
    
    # quadratic deceleration
    var speed = sqrt(vectorToTarget.length())
    speed = min(speed, movingEntity.maxSpeedMetersPerSec)
    
    var changeInDirection:Vector2 = targetDirectionMeters - currentDirectionMeters
    var desiredVelocityMetersPerSec:Vector2
    if changeInDirection.length_squared() <= 0.01:
        desiredVelocityMetersPerSec = targetDirectionMeters * speed
    else:
        desiredVelocityMetersPerSec = changeInDirection * speed
    
    #var desiredVelocityMetersPerSec = directionMeters * movingEntity.maxSpeedMetersPerSec
    #return desiredVelocityMetersPerSec - movingEntity.velocityMetersPerSec
    return desiredVelocityMetersPerSec


func calculateDesiredVelocityMetersPerSec() -> Vector2:
    return arrive()
