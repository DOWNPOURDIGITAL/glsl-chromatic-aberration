vec4 ca( in sampler2D image, in vec2 uv, in vec2 resolution, in vec2 direction ) {
	vec4 col = vec4( 0.0 );
	vec2 off = vec2( 1.3333333333333333 ) * direction;

	col.ra = texture2D( image, uv ).ra;
	col.g = texture2D( image, uv - ( off / resolution ) ).g;
	col.b = texture2D( image, uv - 2. * ( off / resolution ) ).b;

	return col;
}

#pragma glslify: export(ca)
