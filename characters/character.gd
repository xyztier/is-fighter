class_name Character extends CharacterBody2D


@export_group("Display")
@export var character_name: String = ""
@export var character_sprite: Texture = null
@export_group("Stats")
@export var health: float = 100.0
@export var damage: float = 5.0
@export var movement_speed: float = 2.0
@export var attack_speed: float = 1.0
@export_group("Other parameters")
@export var jump_velocity: float = 400.0


enum State {
	IDLE,
	MOVING,
	JUMPED,
	FALLING,
	CROUCHING,
	BASIC_ATTACK,
	SKILL_ONE_ATTACK,
	SKILL_TWO_ATTACK,
	SKILL_THREE_ATTACK,
	ULT_ATTACK
}

var current_state: State = State.IDLE

var can_jump: bool = true


@onready var sprite: Sprite2D = $Sprite


func _ready() -> void:
	sprite.texture = character_sprite


func _physics_process(_delta: float) -> void:
	# Some vars idk
	var direction := Input.get_axis("move_left", "move_right")
	var moving := direction != 0.0
	var jumped := Input.is_action_just_pressed("jump") and can_jump
	var crouching := Input.is_action_pressed("crouch")

	# Process state
	match current_state:
		State.IDLE: pass
		State.MOVING: _process_moving(direction)
		State.JUMPED: _process_jumped()
		State.FALLING: _process_falling()
		State.BASIC_ATTACK: _process_basic_attack()
		State.SKILL_ONE_ATTACK: _process_skill_one()
		State.SKILL_TWO_ATTACK: _process_skill_two()
		State.SKILL_THREE_ATTACK: _process_skill_three()
		State.ULT_ATTACK: _process_ultimate()

	# Transition state
	if Input.is_action_just_pressed("ultimate"):
		current_state = State.ULT_ATTACK
	elif Input.is_action_just_pressed("skill_three"):
		current_state = State.SKILL_THREE_ATTACK
	elif Input.is_action_just_pressed("skill_two"):
		current_state = State.SKILL_TWO_ATTACK
	elif Input.is_action_just_pressed("skill_one"):
		current_state = State.SKILL_ONE_ATTACK
	elif jumped:
		current_state = State.JUMPED
	elif crouching:
		current_state = State.CROUCHING
	elif moving:
		current_state = State.MOVING
	else:
		current_state = State.IDLE

	move_and_slide()


func _process_moving(dir: float) -> void:
	pass


func _process_jumped() -> void:
	pass


func _process_falling() -> void:
	pass


func _process_basic_attack() -> void:
	pass


func _process_skill_one() -> void:
	pass


func _process_skill_two() -> void:
	pass


func _process_skill_three() -> void:
	pass


func _process_ultimate() -> void:
	pass
