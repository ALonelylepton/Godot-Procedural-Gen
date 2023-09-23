extends TileMap

var structure = FastNoiseLite.new()
var width = 32
var height = 32

@onready var player = get_parent().get_child(1)

func _ready():
	structure.seed = randi()
	


func _process(delta):
	generate_castles(player.position)
	

func generate_castles(position):
	var tile_pos = local_to_map(position)
	var castles_x = [0]
	var castles_y = [0]
	var distance = 0
	for x in range(width):
		for y in range(height):
			var struct = structure.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)*10
			
			if struct >1 and distance > 5:
				set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y), 1, Vector2(0, 0))
				castles_x.append_array([x])
				castles_y.append_array([y])
				print(distance)
			distance = sqrt((x-castles_x[-1])**2 + (y-castles_y[-1])**2)
				
