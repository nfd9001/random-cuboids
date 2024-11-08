extends Node3D

# the starting point here was LLM-generated;
# don't use this as a guide for good practice or style

var model_paths = []
var model_container = null
var light = null

func _ready():
	model_container = $ModelContainer
	light  = $Light
	
	randomize_model()

func randomize_model():
	var children = model_container.get_children()
	for child in children:
		child.visible = false
		
	var model = children[randi() % children.size()]
	model.visible = true
	var mesh = model.get_children()[0] #assume one mesh per provided .glb
	
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(randf(), randf(), randf())
	mesh.set_surface_override_material(0, material)
	
	model.rotation_degrees = Vector3(randf() * 360, randf() * 360, randf() * 360)
	
	# Randomize light direction
	# light.rotation_degrees = Vector3(randf() * 360, randf() * 360, randf() * 360)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		randomize_model()
