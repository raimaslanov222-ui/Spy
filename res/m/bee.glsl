attribute vec3 aPos;
varying float vTime;
varying vec2 vTexCoord;
uniform float uTime;
uniform float uSpeed;
uniform float uTimeOffset;
uniform mat4 uProjectionMatrix;
uniform mat4 uModelViewMatrix;

void main() {
    float time = (uTime * 0.001 * uSpeed + uTimeOffset) * 0.8;
    vTime = mod(time, 6.2832);

    // Convert vertex position to texture coordinates
    // aPos ranges from -1 to 1, convert to 0 to 1 for texture coordinates
    vTexCoord = (aPos.xy + 1.0) * 0.5;
    // Flip Y coordinate to match Metal's coordinate system
    vTexCoord.y = 1.0 - vTexCoord.y;

    gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(aPos, 1.0);
}