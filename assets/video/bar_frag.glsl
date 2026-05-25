precision mediump float;
varying vec2 vTextureCoord;
uniform sampler2D sTexture;

void main() {
    vec4 color = texture2D(sTexture, vTextureCoord);
    gl_FragColor = vec4(color.rgb, 0.8f);
}