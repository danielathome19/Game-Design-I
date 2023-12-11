shader_type canvas_item;

uniform float intensity;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);  // Sprite
	vec4 red = vec4(1.0, 0.0, 0.0, 1.0);  // in RGBa
	COLOR.rgb = mix(tex_color.rgb, red.rgb, intensity);
	COLOR.a = tex_color.a;
}
