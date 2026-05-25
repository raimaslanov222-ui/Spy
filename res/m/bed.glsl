attribute vec3 aPos;
varying float vTime;
uniform float uTime;
uniform float uSpeed;
uniform float uTimeOffset;
uniform mat4 uProjectionMatrix;
uniform mat4 uModelViewMatrix;

void main() {
    float time = (uTime * 0.001 * uSpeed + uTimeOffset) * 0.8;
    vTime = mod(time, 6.2832);
    gl_Position = uProjectionMatrix * uModelViewMatrix  * vec4(aPos, 1.);
}