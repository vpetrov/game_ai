extends Reference

class_name SteeringBehavior

var movingEntity:MovingEntity
var targetMeters:Vector2 = Vector2(0,0)

func _init(movingEntity:MovingEntity) -> void:
    self.movingEntity = movingEntity

func seek() -> Vector2:
    var targetDirectionMeters = (targetMeters - movingEntity.positionMeters).normalized()
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

func calculateDesiredVelocityMetersPerSec() -> Vector2:
    return seek()
