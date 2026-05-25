precision highp float;
uniform vec2 uResolution;
varying float vTime;
varying vec2 vTexCoord;
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

#define PI 3.14159265359

vec2 rotate(vec2 p,float a){float c=cos(a),s=sin(a);return vec2(c*p.x-s*p.y,s*p.x+c*p.y);}
float hash21(vec2 p){return fract(sin(dot(p,vec2(12.9898,78.233)))*43758.5453123);}
float valueNoise(vec2 st){vec2 i=floor(st),f=fract(st);float a=hash21(i),b=hash21(i+vec2(1,0)),c=hash21(i+vec2(0,1)),d=hash21(i+vec2(1,1));vec2 u=f*f*(3.-2.*f);return mix(mix(a,b,u.x),mix(c,d,u.x),u.y);}
float noise(vec2 n,vec2 s){return valueNoise(n+s);}
vec2 getPosition(float i,float t){float a=i*.37,b=.6+fract(i/3.)*.9,c=.8+fract((i+1.)/4.);return .5+.5*vec2(sin(t*b+a),cos(t*c+a*1.5));}
vec3 getMeshColor(int i){if(i==0)return vec3(.518,.749,.965);if(i==1)return vec3(.525,.706,.996);if(i==2)return vec3(.525,.855,.996);if(i==3)return vec3(.839,.859,1);if(i==4)return vec3(.525,.706,.996);if(i==5)return vec3(.659,.922,1);return vec3(1);}

void main(){
    float aspectRatio=uResolution.x/uResolution.y;
    vec2 vPos=(vTexCoord-.5)*2.;vPos.x*=aspectRatio;
    vec2 shape_uv=vec2(vPos.x/uScale.x-uPosition.x,vPos.y/uScale.y+uPosition.y)*.5+.5;
    vec2 grainUV=vPos;float grainUVRot=.139626;float cosRot=cos(grainUVRot),sinRot=sin(grainUVRot);
    vec2 rotatedGrainUV=vec2(cosRot*grainUV.x+sinRot*grainUV.y,-sinRot*grainUV.x+cosRot*grainUV.y)*1.064+vec2(.4,-.52);
    float grain=noise(rotatedGrainUV,vec2(0));float mixerGrain=0.;
    float t=.6*(vTime*10.+41.5);
    float radius=smoothstep(0.,1.,length(shape_uv-.5)),center=1.-radius;
    for(int i=1;i<=2;i++){float fi=float(i);shape_uv.x+=.32*center/fi*sin(t+fi*.4*smoothstep(0.,1.,shape_uv.y))*cos(.2*t+fi*2.4*smoothstep(0.,1.,shape_uv.y));shape_uv.y+=.32*center/fi*cos(t+fi*2.*smoothstep(0.,1.,shape_uv.x));}
    vec2 uvRotated=rotate(shape_uv-vec2(.5),-1.89*radius)+vec2(.5);
    vec3 color=vec3(0);float opacity=0.,totalWeight=0.;
    for(int i=0;i<6;i++){vec2 pos=getPosition(float(i),t)+mixerGrain;vec3 meshColor=getMeshColor(i);float dist=pow(length(uvRotated-pos),3.5),weight=1./(dist+1e-3);color+=meshColor*weight;opacity+=weight;totalWeight+=weight;}
    color/=max(1e-4,totalWeight);opacity/=max(1e-4,totalWeight);
    if(uLightness>0.)color=mix(color,vec3(1),uLightness);else if(uLightness<0.)color=mix(color,vec3(0),-uLightness);
    gl_FragColor=vec4(color,opacity);
}
