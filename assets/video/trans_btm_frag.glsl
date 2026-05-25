precision mediump float;
varying vec2 vTextureCoord;

void main() {
    gl_FragColor = vec4(1.0f, 1.0f, 1.0f, 0.55f /(1.0f + exp(7.0f * (vTextureCoord.y - 0.5f))) + 0.465f);
}