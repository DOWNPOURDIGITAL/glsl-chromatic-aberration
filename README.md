# glsl-chromatic-aberration

[glslify](https://github.com/glslify/glslify) module for fast approximation of chromatic aberration as a post processing (fullscreen) effect.

The function shifts each RGB channel separately in the given direction.

Combine with a [directional blur](https://github.com/Jam3/glsl-fast-gaussian-blur) pass for more convincing results.

## Installation
[glslify](https://github.com/glslify/glslify) is required for importing.

```
yarn add glsl-chromatic-aberration
```
```
npm i glsl-chromatic-aberration --save
```

## Usage
```glsl
vec4 ca( sampler2D image, vec2 uv, vec2 resolution, vec2 direction )
```
The function shifts each RGB channel of **`image`** separately in the given **`direction`** and returns the color for the pixel at **`uv`**.

## Example
```glsl
#pragma glslify: ca = require('glsl-chromatic-aberration')

uniform vec2 iResolution;
uniform sampler2D iChannel0;

void main() {
  vec2 uv = gl_FragCoord.xy / iResolution;
  vec2 direction = ( uv - .5 ) * 10.0;
  
  gl_FragColor = ca( iChannel0, uv, iResolution.xy, direction );
}	
```
