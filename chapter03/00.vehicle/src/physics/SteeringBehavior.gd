extends Reference

class_name SteeringBehavior

enum { SEEK, FLEE, ARRIVE, PURSUIT }

var movingEntity:MovingEntity

# some behaviors require a target moving entity
var targetEntity:MovingEntity
var targetMeters:Vector2 = Vector2(0,0)

var activationRadiusMeters := -1.0
var behavior:int = SEEK

func _init(movingEntity:MovingEntity) -> void:
    self.movingEntity = movingEntity
    
func setTargetEntity(targetEntity:MovingEntity) -> void:
    self.targetEntity = targetEntity
    self.targetMeters = targetEntity.positionMeters
    
func setTargetPositionMeters(targetPositionMeters:Vector2) -> void:
    self.targetEntity = null
    self.targetMeters = targetPositionMeters

# works with position
func seek(customPositionMeters:Vector2 = Vector2(0,0), useCustomPosition:bool = false) -> Vector2:
    var targetPositionMeters:Vector2 = targetMeters
    if useCustomPosition:
        targetPositionMeters = customPositionMeters
        
    var vectorToTarget:Vector2 = targetPositionMeters - movingEntity.positionMeters
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
    
    return desiredVelocityMetersPerSec

# works with positions
func flee() -> Vector2:
    return -seek()

# works with positions
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

    return desiredVelocityMetersPerSec

# requires a moving entity
func pursuit() -> Vector2:
    assert(targetEntity != null)
    var vectorToTarget:Vector2 = targetEntity.positionMeters - movingEntity.positionMeters
    # check if we're outside the activation radius
    if activationRadiusMeters > 0.0 && vectorToTarget.length_squared() > activationRadiusMeters * activationRadiusMeters:
        return Vector2(0,0)
        
    var relativeHeading := movingEntity.heading.dot(targetEntity.heading)
    if vectorToTarget.dot(movingEntity.heading) > 0 && relativeHeading < -0.95:
        return seek()
        
    var lookAheadTime = vectorToTarget.length() / (movingEntity.maxSpeedMetersPerSec + targetEntity.velocityMetersPerSec.length())
    
    var futurePositionMeters = targetEntity.positionMeters + targetEntity.velocityMetersPerSec * lookAheadTime
    
    return seek(futurePositionMeters, true)

func calculateDesiredVelocityMetersPerSec() -> Vector2:
    var result := Vector2(0,0)
    match behavior:
        SEEK: result = seek()
        FLEE: result = flee()
        ARRIVE: result = arrive()
        PURSUIT: result = pursuit()
        
    return result
    
