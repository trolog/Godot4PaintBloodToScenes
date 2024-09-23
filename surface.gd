extends Sprite2D

#Images
var surface_image : Image = Image.new()
var blood_image : Image = Image.new()

#What we use to convert images to textures
var surface_texture : ImageTexture = ImageTexture.new()

var blood_size : Vector2

func _ready() -> void:
	#great transparent image
	surface_image = Image.create(2000,2000,false,Image.FORMAT_RGBA8)
	surface_image.fill(Color(0,0,0,0))
	
	#Load our blood image, make sure formats match
	blood_image.load("res://Sprites/blood.png")
	blood_image.convert(Image.FORMAT_RGBA8)
	blood_size = blood_image.get_size()
	
func draw_blood(draw_pos : Vector2):
	#stamp the blood on to surface
	surface_image.blit_rect(blood_image,Rect2i(Vector2(0,0),blood_size),draw_pos)
	
func _physics_process(delta: float) -> void:
	texture = ImageTexture.create_from_image(surface_image)
	
func SaveBloodTexture():
	surface_image.save_png("res://BloodTexture.png")
	
func LoadBloodTexture():
	surface_image = Image.load_from_file("res://BloodTexture.png")
	texture = ImageTexture.create_from_image(surface_image)
	
func ClearTexture():
	surface_image.fill(Color(0,0,0,0))
