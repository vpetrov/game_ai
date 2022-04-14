extends BaseGameEntity

class_name MovingEntity

var velocityMetersPerSec:Vector2 = Vector2(0,0)
var heading:Vector2 = Vector2(0,0)
var side:Vector2 = Vector2(0,0)

var mass:float = 100.0
var maxSpeedMetersPerSec:float = 0.0
var maxForce:float = 0.0
var maxTurnRate:float = 0.0

var positionMeters := Vector2(0,0)
