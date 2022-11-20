extends Actor


onready var stomp_detector = $StompDetector

export var score := 100


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func _on_StompDetector_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_detector.global_position.y:
		return
	die()


func die() -> void:
	queue_free()
	PlayerData.score += score
