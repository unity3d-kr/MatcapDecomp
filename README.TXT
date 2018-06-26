Rendering Shader of "MatCap Decomposition for Dynamic Appearance Manipulation".

This archive contains the following set of files:
- A GLSL fragment shader code (MatCapRender.glsl) for rendering with our representation;
- A small collection of MatCaps (MatCapData folder), each converted to our representation.

Files in the MatCapData folder are named as follows:
- X_input.jpg: initial MatCap X
- X_low_front.jpg: front paraboloid map of the low-frequency component
- X_low_back.jpg: back paraboloid map of the low-frequency component
- X_high_front.jpg: front paraboloid map of the high-frequency component
- X_high_back.jpg: back paraboloid map of the high-frequency component
- X_params.txt: estimated material filter parameters (variance - base color) per component

The MatCapData may be used in conjunction with the fragment shader to reproduce some of our results.
Parabolid textures are passed to the shaders to their corresponding sampler2D parameters.
  - "X_[low/high]_[front/back]"   goes to   "in[Low/High]Freq[Front/Back]"
Parameters in the X_params file need to be setup in the shader as [Low/High]FreqVariance and [Low/High]FreqBaseColor

Other parameters are available in the shaders.
[Low/High]Freq[Theta0/M1/Alpha1] are used to simulate silhouette effects, as explained in figure 2 (left) of the paper.
Since we do not estimate these from input MatCaps, they must be set by hand by the user.
By choosing a value of Theta0 = pi/2, you get no silhouette effect at all, which should be the default.
Then M1 controls the "hardness" of the silhouette effect (M1=0 is smooth), and alpha1 controls its magnitude.
Note that if alpha1 < luminance(baseColor), the color is darkened at silhouettes (see line 117).

Finally, the rotLight[Theta/Phi] parameters are a cheap and simple way to control the rotation of the MatCap.
One could replace it by a more fancy rotation, re-writting the rotate() function (line 70) if needed.

Most importantly, input normals should be provided in screenSpace, as with classic MatCaps.

Note however that some manipulations such as reflection painting or material roughness changes (see the supplementary video) require multi-pass rendering, which we do not include here.
