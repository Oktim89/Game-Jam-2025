extends Camera2D

var player: Node2D  # Reference to the player
var tween  # Use create_tween() instead of a manually added Tween
var cameras: Array  # Array to store all Camera2D nodes
var active_camera: Camera2D  # Current active camera

func _ready():
  # Get reference to the player
  player = get_parent().find_child("Player", true, false)  # Adjust name if necessary
  
  # Create a Tween using create_tween()
  tween = create_tween()
  
  # Gather all Camera2D nodes in the scene
  cameras = get_tree().get_nodes_in_group("Cameras")  # Ensure all cameras are in a "Cameras" group
  active_camera = self
  make_current()  # Start with this camera

func transition_to_camera(new_camera: Camera2D):
  active_camera = new_camera

  # Kill any ongoing tweens before starting a new transition
  tween.kill()

  # Smoothly interpolate to the new camera position
  tween = create_tween()
  tween.tween_property(
	self, "global_position", new_camera.global_position, 0.75
  ).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

  # Delay setting the new camera as current to avoid snapping
  await get_tree().create_timer(0.75).timeout
  new_camera.make_current()
