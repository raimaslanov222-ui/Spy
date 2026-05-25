precision mediump float;

uniform vec2 uResolution;
varying float vTime;

uniform float uLightness;
uniform vec2 uPosition;
uniform vec2 uScale;

uniform vec3 uColor1;
uniform vec3 uColor2;
uniform vec3 uColor3;
uniform vec3 uColor4;
uniform vec3 uBgColor;
uniform float uComplex;
uniform float uMorph;

vec3 rgb2vec3(float r, float g, float b){
    return vec3(r/255., g/255., b/255.);
}

vec3 drawSpin(vec3 uColor1, vec3 uColor2, vec3 uColor3, vec3 uColor4, vec3 uBgColor, float a, float r, float count, float time, float morph){
    vec3 color = uColor1;
    float shape = abs(morph * sin(a * (count * .5) + (time + 0.4))) *
    sin(a * count - (time + 0.2));
    vec3 alpha1 = shape * uColor3;
    float shape2 = abs(0.2 * sin(a * (count * .5) + (time + 0.5))) *
    cos(a * count * 2. - (time + 0.5));
    shape += shape2;
    vec3 alpha2 = shape2 * uColor4;
    color = mix(color, uColor2, r);
    color *= 1.5;
    float alpha = (1. - smoothstep(shape, shape + 0.8, r)) + (1. - smoothstep(shape, shape + 1.5, r)) * 0.2;
    alpha = clamp(alpha, 0., 1.0);
    alpha -= 0.1;
    color = mix(uBgColor, color, alpha);
    return color;
}
void main() {
    vec2 normalize = gl_FragCoord.xy/uResolution.xy;
    normalize = vec2(normalize.x-0.5, normalize.y - 0.5);
    normalize -= uPosition;
    normalize /= uScale;


    float a = atan(normalize.y, normalize.x);
    float r = length(normalize);
    float count = uComplex;
    float time = vTime;
    vec3 spin = drawSpin(uColor1, uColor2, uColor3, uColor4, uBgColor, a, r, count, time, abs(1. - uMorph));
    if (uLightness >= 0.) {
        spin = mix(spin, vec3(1., 1., 1.), uLightness);
    } else {
        spin = mix(spin, vec3(0., 0., 0.), -uLightness);
    }
    gl_FragColor = vec4(spin, 1.);
}