shader_type canvas_item;

uniform float wave_amplitude : hint_range(0.0, 50.0) = 10.0;
uniform float wave_frequency : hint_range(0.0, 10.0) = 5.0;
uniform float wave_speed : hint_range(0.0, 10.0) = 2.0;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float wave = sin(TIME * wave_speed + UV.y *wave_frequency)* wave_amplitude;
	vec2 distorted_uv = UV + vec2(wave/ 100.0, 0.0);
	COLOR = texture (TEXTURE,distorted_uv);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
