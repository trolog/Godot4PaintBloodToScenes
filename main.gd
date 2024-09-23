extends Node2D

@export var Blood : PackedScene
@export var BloodParticlesCount : int = 50

func _physics_process(delta: float) -> void:
	#create blood
	if Input.is_action_just_pressed("mb_left"):
		for i in range(BloodParticlesCount):
			var blood_instance : Area2D = Blood.instantiate()
			blood_instance.global_position = get_global_mouse_position()
			add_child(blood_instance)
			
	if Input.is_action_just_pressed("save"):
		Surface.SaveBloodTexture()
		
	if Input.is_action_just_pressed("load"):
		Surface.LoadBloodTexture()
		
	if Input.is_action_just_pressed("ui_accept"):
		Surface.ClearTexture()
