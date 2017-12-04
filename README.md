# raw-bindings-sdl2-gpu

## Overview

Low level (raw) Common Lisp bindings to the [SDL2_gpu](https://github.com/grimfang4/sdl-gpu) library.

## Dependencies

Lisp:

* [cffi](https://common-lisp.net/project/cffi/)
* [cffi-libffi](https://common-lisp.net/project/cffi/) (optional, see below)
* [defpackage-plus](https://github.com/rpav/defpackage-plus)
* [raw-bindings-sdl2](https://github.com/Zulu-Inuoe/raw-bindings-sdl2)

Runtime:

* [libffi](https://sourceware.org/libffi/) runtime library (optional, see below)
* [SDL2](https://www.libsdl.org/) version 2.0.6 runtime libraries
* [SDL2_gpu](https://github.com/grimfang4/sdl-gpu) runtime library.

Certain SDL2_gpu functions require foreign-structures-by-value. This is provided by the cffi-libffi system, which in term depends on the libffi native runtime library.

If cffi-libffi is available when loading, these functions will be available, otherwise they will not be defined.

These functions are enumerated here:

* GPU_GetCompiledVersion
* GPU_GetLinkedVersion
* GPU_InitRendererByID
* GPU_PopErrorCode
* GPU_MakeRendererID
* GPU_GetRendererID
* GPU_RegisterRenderer
* GPU_SetCurrentRenderer
* GPU_GetRenderer
* GPU_GetBlendModeFromPreset
* GPU_MakeRect
* GPU_MakeColor
* GPU_SetViewport
* GPU_GetDefaultCamera
* GPU_GetCamera
* GPU_SetCamera
* GPU_GetPixel
* GPU_SetClipRect
* GPU_SetClip
* GPU_IntersectRect
* GPU_IntersectClipRect
* GPU_SetTargetColor
* GPU_SetColor
* GPU_ClearColor
* GPU_Pixel
* GPU_Line
* GPU_Arc
* GPU_ArcFilled
* GPU_Circle
* GPU_CircleFilled
* GPU_Ellipse
* GPU_EllipseFilled
* GPU_Sector
* GPU_SectorFilled
* GPU_Tri
* GPU_TriFilled
* GPU_Rectangle
* GPU_Rectangle2
* GPU_RectangleFilled
* GPU_RectangleFilled2
* GPU_RectangleRound
* GPU_RectangleRound2
* GPU_RectangleRoundFilled
* GPU_RectangleRoundFilled2
* GPU_Polygon
* GPU_PolygonFilled
* GPU_MakeAttributeFormat
* GPU_MakeAttribute
* GPU_LoadShaderBlock
* GPU_SetShaderBlock
* GPU_GetShaderBlock
* GPU_SetAttributeSource

## Notes

This is a low level library meant to have minimal fluff.

In that vein, keep the following in mind:

* No returned pointers are set up for [finalization](https://common-lisp.net/project/trivial-garbage/).
    * If you decide to implement such a scheme keep in mind that SDL objects are thread sensitive, and must be cleaned up in the same thread they were created. Also that finalization occurs in an unknown thread.
* No error codes are checked for you and coerced to errors.
* No integer values are coerced to booleans, not even sdl-bool.
