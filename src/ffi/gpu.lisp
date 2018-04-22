;;;raw-bindings-sdl2-gpu - FFI bindings to SDL2_gpu
;;;Written in 2017 by Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>
;;;
;;;To the extent possible under law, the author(s) have dedicated all copyright
;;;and related and neighboring rights to this software to the public domain
;;;worldwide. This software is distributed without any warranty.
;;;You should have received a copy of the CC0 Public Domain Dedication along
;;;with this software. If not, see
;;;<http://creativecommons.org/publicdomain/zero/1.0/>.

(in-package #:raw-bindings-sdl2-gpu)

(defgpuconstant +sdl-gpu-version-major+ 0)
(defgpuconstant +sdl-gpu-version-minor+ 11)
(defgpuconstant +sdl-gpu-version-patch+ 0)

(defgputype gpu-bool :int)

(defgpuconstant +gpu-false+ 0)
(defgpuconstant +gpu-true+ 1)

(defgpustruct gpu-rect
  (x :float)
  (y :float)
  (w :float)
  (h :float))

(defgpuconstant +gpu-renderer-order-max+ 10)

(defgputype gpu-renderer-enum :uint32)

(defgpuconstant +gpu-renderer-unknown+ 0)
(defgpuconstant +gpu-renderer-opengl-1-base+ 1)
(defgpuconstant +gpu-renderer-opengl-1+ 2)
(defgpuconstant +gpu-renderer-opengl-2+ 3)
(defgpuconstant +gpu-renderer-opengl-3+ 4)
(defgpuconstant +gpu-renderer-opengl-4+ 5)
(defgpuconstant +gpu-renderer-gles-1+ 11)
(defgpuconstant +gpu-renderer-gles-2+ 12)
(defgpuconstant +gpu-renderer-gles-3+ 13)
(defgpuconstant +gpu-renderer-d3d9+ 21)
(defgpuconstant +gpu-renderer-d3d10+ 22)
(defgpuconstant +gpu-renderer-d3d11+ 23)

(defgpuconstant +gpu-renderer-custom-0+ 1000)

(defgpustruct gpu-renderer-id
  (name (:string :encoding :utf-8))
  (renderer gpu-renderer-enum)
  (major-version :int)
  (minor-version :int))

(defgpuenum gpu-blend-func-enum
  (+gpu-func-zero+ 0)
  (+gpu-func-one+ 1)
  (+gpu-func-src-color+ #x0300)
  (+gpu-func-dst-color+ #x0306)
  (+gpu-func-one-minus-src+ #x0301)
  (+gpu-func-one-minus-dst+ #x0307)
  (+gpu-func-src-alpha+ #x0302)
  (+gpu-func-dst-alpha+ #x0304)
  (+gpu-func-one-minus-src-alpha+ #x0303)
  (+gpu-func-one-minus-dst-alpha+ #x0305))

(defgpuenum gpu-blend-eq-enum
  (+gpu-eq-add+ #x8006)
  (+gpu-eq-subtract+ #x800A)
  (+gpu-eq-reverse-subtract+ #x800B))

(defgpustruct gpu-blend-mode
  (source-color gpu-blend-func-enum)
  (dest-color gpu-blend-func-enum)
  (source-alpha gpu-blend-func-enum)
  (dest-alpha gpu-blend-func-enum)
  (color-equation gpu-blend-eq-enum)
  (alpha-equation gpu-blend-eq-enum))

(defgpuenum gpu-blend-preset-enum
  (+gpu-blend-normal+ 0)
  (+gpu-blend-premultiplied-alpha+ 1)
  (+gpu-blend-multiply+ 2)
  (+gpu-blend-add+ 3)
  (+gpu-blend-subtract+ 4)
  (+gpu-blend-mod-alpha+ 5)
  (+gpu-blend-set-alpha+ 6)
  (+gpu-blend-set+ 7)
  (+gpu-blend-normal-keep-alpha+ 8)
  (+gpu-blend-normal-add-alpha+ 9)
  (+gpu-blend-normal-factor-alpha+ 10))

(defgpuenum gpu-filter-enum
  (+gpu-filter-nearest+ 0)
  (+gpu-filter-linear+ 1)
  (+gpu-filter-linear-mipmap+ 2))

(defgpuenum gpu-snap-enum
  (+gpu-snap-none+ 0)
  (+gpu-snap-position+ 1)
  (+gpu-snap-dimensions+ 2)
  (+gpu-snap-position-and-dimensions+ 3))

(defgpuenum gpu-wrap-enum
  (+gpu-wrap-none+ 0)
  (+gpu-wrap-repeat+ 1)
  (+gpu-wrap-mirrored+ 2))

(defgpuenum gpu-format-enum
  (+gpu-format-luminance+ 1)
  (+gpu-format-luminance-alpha+ 2)
  (+gpu-format-rgb+ 3)
  (+gpu-format-rgba+ 4)
  (+gpu-format-alpha+ 5)
  (+gpu-format-rg+ 6)
  (+gpu-format-ycbcr422+ 7)
  (+gpu-format-ycbcr420p+ 8)
  (+gpu-format-bgr+ 9)
  (+gpu-format-bgra+ 10)
  (+gpu-format-abgr+ 11))

(defgpuenum gpu-file-format-enum
  (+gpu-file-auto+ 0)
  +gpu-file-png+
  +gpu-file-bmp+
  +gpu-file-tga+)

(defgpustruct gpu-image
  (renderer :pointer)
  (context-target :pointer)
  (target :pointer)
  (w :uint16)
  (h :uint16)
  (using-virtual-resolution gpu-bool)
  (format gpu-format-enum)
  (num-layers :int)
  (bytes-per-pixel :int)
  (base-w :uint16)
  (base-h :uint16)
  (texture-w :uint16)
  (texture-h :uint16)
  (has-mipmaps gpu-bool)
  (anchor-x :float)
  (anchor-y :float)
  (color (:struct sdl-color))
  (use-blending gpu-bool)
  (blend-mode (:struct gpu-blend-mode))
  (filter-mode gpu-filter-enum)
  (snap-mode gpu-snap-enum)
  (wrap-mode-x gpu-wrap-enum)
  (wrap-mode-y gpu-wrap-enum)
  (data :pointer)
  (refcount :int)
  (is-alias gpu-bool))

(defgpustruct gpu-camera
  (x :float)
  (y :float)
  (z :float)
  (angle :float)
  (zoom :float))

(defgpustruct gpu-shader-block
  (position-loc :int)
  (texcoord-loc :int)
  (color-loc :int)
  (model-view-projection-loc :int))

(defgpuconstant +gpu-modelview+ 0)
(defgpuconstant +gpu-projection+ 1)

(defgpustruct gpu-matrix-stack
  (storage-size :uint)
  (size :uint)
  (matrix (:pointer (:pointer :float))))

(defgpustruct gpu-context
  (context :pointer)
  (failed gpu-bool)
  (window-id :uint32)
  (window-w :int)
  (window-h :int)
  (drawable-w :int)
  (drawable-h :int)
  (stored-window-w :int)
  (stored-window-h :int)
  (current-shader-program :uint32)
  (default-textured-shader-program :uint32)
  (default-untextured-shader-program :uint32)
  (current-shader-block (:struct gpu-shader-block))
  (default-textured-shader-block (:struct gpu-shader-block))
  (default-untextured-shader-block (:struct gpu-shader-block))
  (shapes-use-blending gpu-bool)
  (shapes-blend-mode (:struct gpu-blend-mode))
  (line-thickness :float)
  (use-texturing gpu-bool)
  (matrix-mode :int)
  (projection-matrix (:struct gpu-matrix-stack))
  (modelview-matrix (:struct gpu-matrix-stack))
  (refcount :int)
  (data :pointer))

(defgpustruct gpu-target
  (renderer :pointer)
  (context-target :pointer)
  (image (:pointer (:struct gpu-image)))
  (data (:pointer :void))
  (w :uint16)
  (h :uint16)
  (using-virtual-resolution gpu-bool)
  (base-w :uint16)
  (base-h :uint16)
  (use-clip-rect gpu-bool)
  (clip-rect (:struct gpu-rect))
  (use-color gpu-bool)
  (color (:struct sdl-color))
  (viewport (:struct gpu-rect))
  (camera (:struct gpu-camera))
  (use-camera gpu-bool)
  (use-depth-test gpu-bool)
  (use-depth-write gpu-bool)
  (context (:pointer (:struct gpu-context)))
  (refcount :int)
  (is-alias gpu-bool))

(defgputype gpu-feature-enum :uint32)
(defgpuconstant +gpu-feature-non-power-of-two+ #x1)
(defgpuconstant +gpu-feature-render-targets+ #x2)
(defgpuconstant +gpu-feature-blend-equations+ #x4)
(defgpuconstant +gpu-feature-blend-func-separate+ #x8)
(defgpuconstant +gpu-feature-blend-equations-separate+ #x10)
(defgpuconstant +gpu-feature-gl-bgr+ #x20)
(defgpuconstant +gpu-feature-gl-bgra+ #x40)
(defgpuconstant +gpu-feature-gl-abgr+ #x80)
(defgpuconstant +gpu-feature-vertex-shader+ #x100)
(defgpuconstant +gpu-feature-fragment-shader+ #x200)
(defgpuconstant +gpu-feature-pixel-shader+ #x200)
(defgpuconstant +gpu-feature-geometry-shader+ #x400)
(defgpuconstant +gpu-feature-wrap-repeat-mirrored+ #x800)
(defgpuconstant +gpu-feature-core-framebuffer-objects+ #x1000)

(defgpuconstant +gpu-feature-all-base+ +gpu-feature-render-targets+)
(defgpuconstant +gpu-feature-all-blend-presets+ (logior +gpu-feature-blend-equations+  +gpu-feature-blend-func-separate+))
(defgpuconstant +gpu-feature-all-gl-formats+ (logior +gpu-feature-gl-bgr+  +gpu-feature-gl-bgra+  +gpu-feature-gl-abgr+))
(defgpuconstant +gpu-feature-basic-shaders+ (logior +gpu-feature-fragment-shader+  +gpu-feature-vertex-shader+))
(defgpuconstant +gpu-feature-all-shaders+ (logior +gpu-feature-fragment-shader+  +gpu-feature-vertex-shader+  +gpu-feature-geometry-shader+))


(defgputype gpu-window-flag-enum :uint32)

(defgputype gpu-init-flag-enum :uint32)
(defgpuconstant +gpu-init-enable-vsync+ #x1)
(defgpuconstant +gpu-init-disable-vsync+ #x2)
(defgpuconstant +gpu-init-disable-double-buffer+ #x4)
(defgpuconstant +gpu-init-disable-auto-virtual-resolution+ #x8)
(defgpuconstant +gpu-init-request-compatibility-profile+ #x10)
(defgpuconstant +gpu-init-use-row-by-row-texture-upload-fallback+ #x20)
(defgpuconstant +gpu-init-use-copy-texture-upload-fallback+ #x40)

(defgpuconstant +gpu-default-init-flags+ 0)

(defgpuconstant +gpu-none+ #x0)

(defgputype gpu-batch-flag-enum :uint32)
(defgpuconstant +gpu-batch-xy+ #x1)
(defgpuconstant +gpu-batch-xyz+ #x2)
(defgpuconstant +gpu-batch-st+ #x4)
(defgpuconstant +gpu-batch-rgb+ #x8)
(defgpuconstant +gpu-batch-rgba+ #x10)
(defgpuconstant +gpu-batch-rgb8+ #x20)
(defgpuconstant +gpu-batch-rgba8+ #x40)

(defgpuconstant +gpu-batch-xy-st+ (logior +gpu-batch-xy+ +gpu-batch-st+))
(defgpuconstant +gpu-batch-xyz-st+ (logior +gpu-batch-xyz+ +gpu-batch-st+))
(defgpuconstant +gpu-batch-xy-rgb+ (logior +gpu-batch-xy+ +gpu-batch-rgb+))
(defgpuconstant +gpu-batch-xyz-rgb+ (logior +gpu-batch-xyz+ +gpu-batch-rgb+))
(defgpuconstant +gpu-batch-xy-rgba+ (logior +gpu-batch-xy+ +gpu-batch-rgba+))
(defgpuconstant +gpu-batch-xyz-rgba+ (logior +gpu-batch-xyz+ +gpu-batch-rgba+))
(defgpuconstant +gpu-batch-xy-st-rgba+ (logior +gpu-batch-xy+ +gpu-batch-st+ +gpu-batch-rgba+))
(defgpuconstant +gpu-batch-xyz-st-rgba+ (logior +gpu-batch-xyz+ +gpu-batch-st+ +gpu-batch-rgba+))
(defgpuconstant +gpu-batch-xy-rgb8+ (logior +gpu-batch-xy+ +gpu-batch-rgb8+))
(defgpuconstant +gpu-batch-xyz-rgb8+ (logior +gpu-batch-xyz+ +gpu-batch-rgb8+))
(defgpuconstant +gpu-batch-xy-rgba8+ (logior +gpu-batch-xy+ +gpu-batch-rgba8+))
(defgpuconstant +gpu-batch-xyz-rgba8+ (logior +gpu-batch-xyz+ +gpu-batch-rgba8+))
(defgpuconstant +gpu-batch-xy-st-rgba8+ (logior +gpu-batch-xy+ +gpu-batch-st+ +gpu-batch-rgba8+))
(defgpuconstant +gpu-batch-xyz-st-rgba8+ (logior +gpu-batch-xyz+ +gpu-batch-st+ +gpu-batch-rgba8+))

(defgputype gpu-flip-enum :uint32)
(defgpuconstant +gpu-flip-none+ #x0)
(defgpuconstant +gpu-flip-horizontal+ #x1)
(defgpuconstant +gpu-flip-vertical+ #x2)


(defgputype gpu-type-enum :uint32)

(defgpuconstant +gpu-type-byte+ #x1400)
(defgpuconstant +gpu-type-unsigned-byte+ #x1401)
(defgpuconstant +gpu-type-short+ #x1402)
(defgpuconstant +gpu-type-unsigned-short+ #x1403)
(defgpuconstant +gpu-type-int+ #x1404)
(defgpuconstant +gpu-type-unsigned-int+ #x1405)
(defgpuconstant +gpu-type-float+ #x1406)
(defgpuconstant +gpu-type-double+ #x140A)

(defgpuenum gpu-shader-enum
  (+gpu-vertex-shader+ 0)
  (+gpu-fragment-shader+ 1)
  (+gpu-pixel-shader+ 1)
  (+gpu-geometry-shader+ 2))

(defgpuenum gpu-shader-language-enum
  (+gpu-language-none+ 0)
  (+gpu-language-arb-assembly+ 1)
  (+gpu-language-glsl+ 2)
  (+gpu-language-glsles+ 3)
  (+gpu-language-hlsl+ 4)
  (+gpu-language-cg+ 5))

(defgpustruct gpu-attribute-format
  (is-per-sprite gpu-bool)
  (num-elems-per-value :int)
  (type gpu-type-enum)
  (normalize gpu-bool)
  (stride-bytes :int)
  (offset-bytes :int))

(defgpustruct gpu-attribute
  (location :int)
  (values (:pointer :void))
  (format gpu-attribute-format))

(defgpustruct gpu-attribute-source
  (enabled gpu-bool)
  (num_values :int)
  (next_value (:pointer :void))
  (per-vertex-storage-stride-bytes :int)
  (per-vertex-storage-offset-bytes :int)
  (per-vertex-storage-size :int)
  (per-vertex-storage (:pointer :void))
  (attribute gpu-attribute))

(defgpuenum gpu-error-enum
  (+gpu-error-none+ 0)
  (+gpu-error-backend-error+ 1)
  (+gpu-error-data-error+ 2)
  (+gpu-error-user-error+ 3)
  (+gpu-error-unsupported-function+ 4)
  (+gpu-error-null-argument+ 5)
  (+gpu-error-file-not-found+ 6))

(defgpustruct gpu-error-object
  (function (:string :encoding :utf-8))
  (error gpu-error-enum)
  (details (:string :encoding :utf-8)))

(defgpuenum gpu-debug-level-enum
  (+gpu-debug-level-0+ 0)
  (+gpu-debug-level-1+ 1)
  (+gpu-debug-level-2+ 2)
  (+gpu-debug-level-3+ 3)
  (+gpu-debug-level-max+ 3))

(defgpuenum gpu-log-level-enum
  (+gpu-log-info+ 0)
  +gpu-log-warning+
  +gpu-log-error+)

(defgpustruct gpu-renderer-impl)

(defgpustruct gpu-renderer
  (id gpu-renderer-id)
  (requested-id gpu-renderer-id)
  (sdl-init-flags gpu-window-flag-enum)
  (gpu-init-flags gpu-init-flag-enum)
  (shader-language gpu-shader-language-enum)
  (min-shader-version :int)
  (max-shader-version :int)
  (enabled-features gpu-feature-enum)
  (current-context-target (:pointer gpu-target))
  (coordinate-mode gpu-bool)
  (default-image-anchor-x :float)
  (default-image-anchor-y :float)
  (impl (:pointer gpu-renderer-impl)))

#+fsbv
(defgpu-lispfun gpu-get-compiled-version ()
  ;;Construct a plist to immitate cffi-libffi
  (list 'patch +sdl-gpu-version-patch+
        'minor +sdl-gpu-version-minor+
        'major +sdl-gpu-version-major+))

#+fsbv
(defgpufun ("GPU_GetLinkedVersion" gpu-get-linked-version) sdl-version)

(defgpufun ("GPU_SetInitWindow" gpu-set-init-window) :void
  (window-id :uint32))

(defgpufun ("GPU_GetInitWindow" gpu-get-init-window) :uint32)

(defgpufun ("GPU_SetPreInitFlags" gpu-set-pre-init-flags) :void
  (gpu-flags gpu-init-flag-enum))

(defgpufun ("GPU_GetPreInitFlags" gpu-get-pre-init-flags) gpu-init-flag-enum)

(defgpufun ("GPU_SetRequiredFeatures" gpu-set-required-features) :void
  (features gpu-feature-enum))

(defgpufun ("GPU_GetRequiredFeatures" gpu-get-required-features) gpu-feature-enum)

(defgpufun ("GPU_GetDefaultRendererOrder" gpu-get-default-renderer-order) :void
  (order-size (:pointer :int))
  (order (:pointer gpu-renderer-id)))

(defgpufun ("GPU_GetRendererOrder" gpu-get-renderer-order) :void
  (order-size (:pointer :int))
  (order (:pointer gpu-renderer-id)))

(defgpufun ("GPU_SetRendererOrder" gpu-set-renderer-order) :void
  (order-size :int)
  (order (:pointer gpu-renderer-id)))

(defgpufun ("GPU_Init" gpu-init) (:pointer gpu-target)
  (w :uint16)
  (h :uint16)
  (sdl-flags gpu-window-flag-enum))

(defgpufun ("GPU_InitRenderer" gpu-init-renderer) (:pointer gpu-target)
  (renderer-enum gpu-renderer-enum)
  (w :uint16)
  (h :uint16)
  (sdl-flags gpu-window-flag-enum))

#+fsbv
(defgpufun ("GPU_InitRendererByID" gpu-init-renderer-by-id) (:pointer gpu-target)
  (renderer-request gpu-renderer-id)
  (w :uint16)
  (h :uint16)
  (sdl-flags gpu-window-flag-enum))

(defgpufun ("GPU_IsFeatureEnabled" gpu-is-feature-enabled) gpu-bool
  (feature gpu-feature-enum))

(defgpufun ("GPU_CloseCurrentRenderer" gpu-close-current-renderer) :void)

(defgpufun ("GPU_Quit" gpu-quit) :void)

(defgpufun ("GPU_SetDebugLevel" gpu-set-debug-level) :void
  (level gpu-debug-level-enum))

(defgpufun ("GPU_GetDebugLevel" gpu-get-debug-level) gpu-debug-level-enum)

(defgpufun ("GPU_LogInfo" gpu-log-info) :void
  (format (:string :encoding :utf-8))
  &rest)

(defgpufun ("GPU_LogWarning" gpu-log-warning) :void
  (format (:string :encoding :utf-8))
  &rest)

(defgpufun ("GPU_LogError" gpu-log-error) :void
  (format (:string :encoding :utf-8))
  &rest)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro gpu-log (format &rest args)
    `(gpu-log-info ,format ,@args))

  (export 'gpu-log))

#+nil ;;No support for va_list
(defgpufun ("GPU_SetLogCallback" gpu-set-log-callback) :void
  (callback :pointer)
  (log-level gpu-log-level-enum)
  (format (:string :encoding :utf-8))
  (args va_list))

(defgpufun ("GPU_PushErrorCode" gpu-push-error-code) :void
  (function (:string :encoding :utf-8))
  (error gpu-error-enum)
  (details (:string :encoding :utf-8))
  &rest)

#+fsbv
(defgpufun ("GPU_PopErrorCode" gpu-pop-error-code) gpu-error-object)

(defgpufun ("GPU_GetErrorString" gpu-get-error-string) (:string :encoding :utf-8)
  (error gpu-error-enum))

(defgpufun ("GPU_SetErrorQueueMax" gpu-set-error-queue-max) :void
  (max :uint))

#+fsbv
(defgpufun ("GPU_MakeRendererID" gpu-make-renderer-id) gpu-renderer-id
  (name (:string :encoding :utf-8))
  (renderer gpu-renderer-enum)
  (major-version :int)
  (minor-version :int))

#+fsbv
(defgpufun ("GPU_GetRendererID" gpu-get-renderer-id) gpu-renderer-id
  (renderer gpu-renderer-enum))

(defgpufun ("GPU_GetNumRegisteredRenderers" gpu-get-num-registered-renderers) :int)

(defgpufun ("GPU_GetRegisteredRendererList" gpu-get-registered-renderer-list) :void
  (renderers-array (:pointer gpu-renderer-id)))

#+fsbv
(defgpufun ("GPU_RegisterRenderer" gpu_register-renderer) :void
  (id gpu-renderer-id)
  (create-renderer :pointer)
  (free-renderer :pointer))

(defgpufun ("GPU_ReserveNextRendererEnum" gpu-reserve-next-renderer-enum) gpu-renderer-enum)

(defgpufun ("GPU_GetNumActiveRenderers" gpu-get-num-active-renderers) :int)

(defgpufun ("GPU_GetActiveRendererList" gpu-get-active-renderer-list) :void
  (renderers-array (:pointer gpu-renderer-id)))

(defgpufun ("GPU_GetCurrentRenderer" gpu-get-current-renderer) (:pointer gpu-renderer))

#+fsbv
(defgpufun ("GPU_SetCurrentRenderer" gpu-set-current-renderer) :void
  (id gpu-renderer-id))

#+fsbv
(defgpufun ("GPU_GetRenderer" gpu-get-renderer) (:pointer gpu-renderer)
  (id gpu-renderer-id))

(defgpufun ("GPU_FreeRenderer" gpu-free-renderer) :void
  (renderer (:pointer gpu-renderer)))

(defgpufun ("GPU_ResetRendererState" gpu-reset-renderer-state) :void)

(defgpufun ("GPU_SetCoordinateMode" gpu-set-coordinate-mode) :void
  (use-math-coords gpu-bool))

(defgpufun ("GPU_GetCoordinateMode" gpu-get-coordinate-mode) gpu-bool)

(defgpufun ("GPU_SetDefaultAnchor" gpu-set-default-anchor) :void
  (anchor-x :float)
  (anchor-y :float))

(defgpufun ("GPU_GetDefaultAnchor" gpu-get-default-anchor) :void
  (anchor-x (:pointer :float))
  (anchor-y (:pointer :float)))

(defgpufun ("GPU_GetContextTarget" gpu-get-context-target) (:pointer gpu-target))

(defgpufun ("GPU_GetWindowTarget" gpu-get-window-target) (:pointer gpu-target)
  (windowID :uint32))

(defgpufun ("GPU_CreateTargetFromWindow" gpu-create-target-from-window) (:pointer gpu-target)
  (windowID :uint32))

(defgpufun ("GPU_MakeCurrent" gpu-make-current) :void
  (target (:pointer gpu-target))
  (windowID :uint32))

(defgpufun ("GPU_SetWindowResolution" gpu-set-window-resolution) gpu-bool
  (w :uint16)
  (h :uint16))

(defgpufun ("GPU_SetFullscreen" gpu-set-fullscreen) gpu-bool
  (enable-fullscreen gpu-bool)
  (use-desktop-resolution gpu-bool))

(defgpufun ("GPU_GetFullscreen" gpu-get-fullscreen) gpu-bool)

(defgpufun ("GPU_SetShapeBlending" gpu-set-shape-blending) :void
  (enable gpu-bool))

#+fsbv
(defgpufun ("GPU_GetBlendModeFromPreset" gpu-get-blend-mode-from-preset) gpu-blend-mode
  (preset gpu-blend-preset-enum))

(defgpufun ("GPU_SetShapeBlendFunction" gpu-set-shape-blend-function) :void
  (source-color gpu-blend-func-enum)
  (dest-color gpu-blend-func-enum)
  (source-alpha gpu-blend-func-enum)
  (dest-alpha gpu-blend-func-enum))

(defgpufun ("GPU_SetShapeBlendEquation" gpu-set-shape-blend-equation) :void
  (color-equation gpu-blend-eq-enum)
  (alpha-equation gpu-blend-eq-enum))

(defgpufun ("GPU_SetShapeBlendMode" gpu-set-shape-blend-mode) :void
  (mode gpu-blend-preset-enum))

(defgpufun ("GPU_SetLineThickness" gpu-set-line-thickness) :float
  (thickness :float))

(defgpufun ("GPU_GetLineThickness" gpu-get-line-thickness) :float)

(defgpufun ("GPU_CreateAliasTarget" gpu-create-alias-target) (:pointer gpu-target)
  (target (:pointer gpu-target)))

(defgpufun ("GPU_LoadTarget" gpu-load-target) (:pointer gpu-target)
  (image (:pointer gpu-image)))

(defgpufun ("GPU_GetTarget" gpu-get-target) (:pointer gpu-target)
  (image (:pointer gpu-image)))

(defgpufun ("GPU_FreeTarget" gpu-free-target) :void
  (target (:pointer gpu-target)))

(defgpufun ("GPU_SetVirtualResolution" gpu-set-virtual-resolution) :void
  (target (:pointer gpu-target))
  (w :uint16)
  (h :uint16))

(defgpufun ("GPU_GetVirtualResolution" gpu-get-virtual-resolution) :void
  (target (:pointer gpu-target))
  (w (:pointer :uint16))
  (h (:pointer :uint16)))

(defgpufun ("GPU_GetVirtualCoords" gpu-get-virtual-coords) :void
  (target (:pointer gpu-target))
  (x (:pointer :float))
  (y (:pointer :float))
  (display-x :float)
  (display-y :float))

(defgpufun ("GPU_UnsetVirtualResolution" gpu-unset-virtual-resolution) :void
  (target (:pointer gpu-target)))

#+fsbv
(defgpufun ("GPU_MakeRect" gpu-make-rect) gpu-rect
  (x :float)
  (y :float)
  (w :float)
  (h :float))

#+fsbv
(defgpufun ("GPU_MakeColor" gpu-make-color) sdl-color
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

#+fsbv
(defgpufun ("GPU_SetViewport" gpu-set-viewport) :void
  (target (:pointer gpu-target))
  (viewport gpu-rect))

(defgpufun ("GPU_UnsetViewport" gpu-unset-viewport) :void
  (target (:pointer gpu-target)))

#+fsbv
(defgpufun ("GPU_GetDefaultCamera" gpu-get-default-camera) gpu-camera)

#+fsbv
(defgpufun ("GPU_GetCamera" gpu-get-camera) gpu-camera
  (target (:pointer gpu-target)))

#+fsbv
(defgpufun ("GPU_SetCamera" gpu-set-camera) gpu-camera
  (target (:pointer gpu-target))
  (cam (:pointer gpu-camera)))

(defgpufun ("GPU_EnableCamera" gpu-enable-camera) :void
  (target (:pointer gpu-target))
  (use-camera gpu-bool))

(defgpufun ("GPU_IsCameraEnabled" gpu-is-camera-enabled) gpu-bool
  (target (:pointer gpu-target)))

(defgpufun ("GPU_AddDepthBuffer" gpu-add-depth-buffer) gpu-bool
  (target (:pointer gpu-target)))

(defgpufun ("GPU_SetDepthTest" gpu-set-depth-test) :void
  (target (:pointer gpu-target))
  (enable gpu-bool))

(defgpufun ("GPU_SetDepthWrite" gpu-set-depth-write) :void
  (target (:pointer gpu-target))
  (enable gpu-bool))

#+fsbv
(defgpufun ("GPU_GetPixel" gpu-get-pixel) sdl-color
  (target (:pointer gpu-target))
  (x :int16)
  (y :int16))

#+fsbv
(defgpufun ("GPU_SetClipRect" gpu-set-clip-rect) gpu-rect
  (target (:pointer gpu-target))
  (rect gpu-rect))

#+fsbv
(defgpufun ("GPU_SetClip" gpu-set-clip) gpu-rect
  (target (:pointer gpu-target))
  (x :int16)
  (y :int16)
  (w :uint16)
  (h :uint16))

(defgpufun ("GPU_UnsetClip" gpu-unset-clip) :void
  (target (:pointer gpu-target)))

#+fsbv
(defgpufun ("GPU_IntersectRect" gpu-intersect-rect) gpu-bool
  (a gpu-rect)
  (b gpu-rect)
  (result (:pointer gpu-rect)))

#+fsbv
(defgpufun ("GPU_IntersectClipRect" gpu-intersect-clip-rect) gpu-bool
  (target (:pointer gpu-target))
  (b gpu-rect)
  (result (:pointer gpu-rect)))

#+fsbv
(defgpufun ("GPU_SetTargetColor" gpu-set-target-color) :void
  (target (:pointer gpu-target))
  (color sdl-color))

(defgpufun ("GPU_SetTargetRGB" gpu-set-target-rgb) :void
  (target (:pointer gpu-target))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(defgpufun ("GPU_SetTargetRGBA" gpu-set-target-rgba) :void
  (target (:pointer gpu-target))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(defgpufun ("GPU_UnsetTargetColor" gpu-unset-target-color) :void
  (target (:pointer gpu-target)))

(defgpufun ("GPU_LoadSurface" gpu-load-surface) (:pointer sdl-surface)
  (filename (:string :encoding :utf-8)))

(defgpufun ("GPU_LoadSurface_RW" gpu-load-surface-rw) (:pointer sdl-surface)
  (rwops (:pointer sdl-rwops))
  (free-rwops gpu-bool))

(defgpufun ("GPU_SaveSurface" gpu-save-surface) gpu-bool
  (surface (:pointer sdl-surface))
  (filename (:string) :encoding :utf-8)
  (format gpu-file-format-enum))

(defgpufun ("GPU_SaveSurface_RW" gpu-save-surface-rw) gpu-bool
  (surface (:pointer sdl-surface))
  (rwops (:pointer sdl-rwops))
  (free-rwops gpu-bool)
  (format gpu-file-format-enum))

(defgpufun ("GPU_CreateImage" gpu-create-image) (:pointer gpu-image)
  (w :uint16)
  (h :uint16)
  (format gpu-format-enum))

(defgpufun ("GPU_CreateImageUsingTexture" gpu-create-image-using-texture) (:pointer gpu-image)
  (handle :uint32)
  (take-ownership gpu-bool))

(defgpufun ("GPU_LoadImage" gpu-load-image) (:pointer gpu-image)
  (filename (:string :encoding :utf-8)))

(defgpufun ("GPU_LoadImage_RW" gpu-load-image-rw) (:pointer gpu-image)
  (rwops (:pointer sdl-rwops))
  (free-rwops gpu-bool))

(defgpufun ("GPU_CreateAliasImage" gpu-create-alias-image) (:pointer gpu-image)
  (image (:pointer gpu-image)))

(defgpufun ("GPU_CopyImage" gpu-copy-image) (:pointer gpu-image)
  (image (:pointer gpu-image)))

(defgpufun ("GPU_FreeImage" gpu-free-image) :void
  (image (:pointer gpu-image)))

(defgpufun ("GPU_SetImageVirtualResolution" gpu-set-image-virtual-resolution) :void
  (image (:pointer gpu-image))
  (w :uint16)
  (h :uint16))

(defgpufun ("GPU_UnsetImageVirtualResolution" gpu-unset-image-virtual-resolution) :void
  (image (:pointer gpu-image)))

(defgpufun ("GPU_UpdateImage" gpu-update-image) :void
  (image (:pointer gpu-image))
  (image-rect (:pointer gpu-rect))
  (surface (:pointer sdl-surface))
  (surface-rect (:pointer gpu-rect)))

(defgpufun ("GPU_UpdateImageBytes" gpu-update-image-bytes) :void
  (image (:pointer gpu-image))
  (image-rect (:pointer gpu-rect))
  (bytes (:pointer :uint8))
  (bytes-per-row :int))
(defgpufun ("GPU_ReplaceImage" gpu-replace-image) gpu-bool
  (image (:pointer gpu-image))
  (surface (:pointer sdl-surface))
  (surface-rect (:pointer gpu-rect)))

(defgpufun ("GPU_SaveImage" gpu-save-image) gpu-bool
  (image (:pointer gpu-image))
  (filename (:string :encoding :utf-8))
  (format gpu-file-format-enum))

(defgpufun ("GPU_SaveImage_RW" gpu-save-image-rw) gpu-bool
  (image (:pointer gpu-image))
  (rwops (:pointer sdl-rwops))
  (free-rwops gpu-bool)
  (format gpu-file-format-enum))

(defgpufun ("GPU_GenerateMipmaps" gpu-generate-mipmaps) :void
  (image (:pointer gpu-image)))

#+fsbv
(defgpufun ("GPU_SetColor" gpu-set-color) :void
  (image (:pointer gpu-image))
  (color sdl-color))

(defgpufun ("GPU_SetRGB" gpu-set-rgb) :void
  (image (:pointer gpu-image))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(defgpufun ("GPU_SetRGBA" gpu-set-rgba) :void
  (image (:pointer gpu-image))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(defgpufun ("GPU_UnsetColor" gpu-unset-color) :void
  (image (:pointer gpu-image)))

(defgpufun ("GPU_GetBlending" gpu-get-blending) gpu-bool
  (image (:pointer gpu-image)))

(defgpufun ("GPU_SetBlending" gpu-set-blending) :void
  (image (:pointer gpu-image))
  (enable gpu-bool))

(defgpufun ("GPU_SetBlendFunction" gpu-set-blend-function) :void
  (image (:pointer gpu-image))
  (source-color gpu-blend-func-enum)
  (dest-color gpu-blend-func-enum)
  (source-alpha gpu-blend-func-enum)
  (dest-alpha gpu-blend-func-enum))

(defgpufun ("GPU_SetBlendEquation" gpu-set-blend-equation) :void
  (image (:pointer gpu-image))
  (color-equation gpu-blend-eq-enum)
  (alpha-equation gpu-blend-eq-enum))

(defgpufun ("GPU_SetBlendMode" gpu-set-blend-mode) :void
  (image (:pointer gpu-image))
  (mode gpu-blend-preset-enum))

(defgpufun ("GPU_SetImageFilter" gpu-set-image-filter) :void
  (image (:pointer gpu-image))
  (filter gpu-filter-enum))

(defgpufun ("GPU_SetAnchor" gpu-set-anchor) :void
  (image (:pointer gpu-image))
  (anchor-x :float)
  (anchor-y :float))

(defgpufun ("GPU_GetAnchor" gpu-get-anchor) :void
  (image (:pointer gpu-image))
  (anchor-x (:pointer :float))
  (anchor-y (:pointer :float)))

(defgpufun ("GPU_GetSnapMode" gpu-get-snap-mode) gpu-snap-enum
  (image (:pointer gpu-image)))

(defgpufun ("GPU_SetSnapMode" gpu-set-snap-mode) :void
  (image (:pointer gpu-image))
  (mode gpu-snap-enum))

(defgpufun ("GPU_SetWrapMode" gpu-set-wrap-mode) :void
  (image (:pointer gpu-image))
  (wrap-mode-x gpu-wrap-enum)
  (wrap-mode-y gpu-wrap-enum))

(defgpufun ("GPU_CopyImageFromSurface" gpu-copy-image-from-surface) (:pointer gpu-image)
  (surface (:pointer sdl-surface)))

(defgpufun ("GPU_CopyImageFromTarget" gpu-copy-image-from-target) (:pointer gpu-image)
  (target (:pointer gpu-target)))

(defgpufun ("GPU_CopySurfaceFromTarget" gpu-copy-surface-from-target) (:pointer sdl-surface)
  (target (:pointer gpu-target)))

(defgpufun ("GPU_CopySurfaceFromImage" gpu-copy-surface-from-image) (:pointer sdl-surface)
  (image (:pointer gpu-image)))

(defgpufun ("GPU_VectorLength" gpu-vector-length) :float
  (vec3 (:pointer :float)))

(defgpufun ("GPU_VectorNormalize" gpu-vector-normalize) :void
  (vec3 (:pointer :float)))

(defgpufun ("GPU_VectorDot" gpu-vector-dot) :float
  (a (:pointer :float))
  (b (:pointer :float)))

(defgpufun ("GPU_VectorCross" gpu-vector-cross) :void
  (result (:pointer :float))
  (a (:pointer :float))
  (b (:pointer :float)))

(defgpufun ("GPU_VectorCopy" gpu-vector-copy) :void
  (result (:pointer :float))
  (a (:pointer :float)))

(defgpufun ("GPU_VectorApplyMatrix" gpu-vector-apply-matrix) :void
  (vec3 (:pointer :float))
  (matrix-4x4 (:pointer :float)))

(defgpufun ("GPU_Vector4ApplyMatrix" gpu-vector4apply-matrix) :void
  (vec4 (:pointer :float))
  (matrix-4x4 (:pointer :float)))

(defgpufun ("GPU_MatrixCopy" gpu-matrix-copy) :void
  (result (:pointer :float))
  (a (:pointer :float)))

(defgpufun ("GPU_MatrixIdentity" gpu-matrix-identity) :void
  (result (:pointer :float)))

(defgpufun ("GPU_MatrixOrtho" gpu-matrix-ortho) :void
  (result (:pointer :float))
  (left :float)
  (right :float)
  (bottom :float)
  (top :float)
  (near :float)
  (far :float))

(defgpufun ("GPU_MatrixFrustum" gpu-matrix-frustum) :void
  (result (:pointer :float))
  (left :float)
  (right :float)
  (bottom :float)
  (top :float)
  (near :float)
  (far :float))

(defgpufun ("GPU_MatrixPerspective" gpu-matrix-perspective) :void
  (result (:pointer :float))
  (fovy :float)
  (aspect :float)
  (z-near :float)
  (z-far :float))

(defgpufun ("GPU_MatrixLookAt" gpu-matrix-look-at) :void
  (matrix (:pointer :float))
  (eye-x :float)
  (eye-y :float)
  (eye-z :float)
  (target-x :float)
  (target-y :float)
  (target-z :float)
  (up-x :float)
  (up-y :float)
  (up-z :float))

(defgpufun ("GPU_MatrixTranslate" gpu-matrix-translate) :void
  (result (:pointer :float))
  (x :float)
  (y :float)
  (z :float))

(defgpufun ("GPU_MatrixScale" gpu-matrix-scale) :void
  (result (:pointer :float))
  (sx :float)
  (sy :float)
  (sz :float))

(defgpufun ("GPU_MatrixRotate" gpu-matrix-rotate) :void
  (result (:pointer :float))
  (degrees :float)
  (x :float)
  (y :float)
  (z :float))

(defgpufun ("GPU_MatrixMultiply" gpu-matrix-multiply) :void
  (result (:pointer :float))
  (a (:pointer :float))
  (b (:pointer :float)))

(defgpufun ("GPU_MultiplyAndAssign" gpu-multiply-and-assign) :void
  (result (:pointer :float))
  (b (:pointer :float)))

(defgpufun ("GPU_GetMatrixString" gpu-get-matrix-string) (:string :encoding :utf-8)
  (a (:pointer :float)))

(defgpufun ("GPU_GetCurrentMatrix" gpu-get-current-matrix) (:pointer :float))

(defgpufun ("GPU_GetModelView" gpu-get-model-view) (:pointer :float))

(defgpufun ("GPU_GetProjection" gpu-get-projection) (:pointer :float))

(defgpufun ("GPU_GetModelViewProjection" gpu-get-model-view-projection) :void
  (result (:pointer :float)))

(defgpufun ("GPU_InitMatrixStack" gpu-init-matrix-stack) :void
  (stack (:pointer gpu-matrix-stack)))

(defgpufun ("GPU_MatrixMode" gpu-matrix-mode) :void
  (matrix-mode :int))

(defgpufun ("GPU_PushMatrix" gpu-push-matrix) :void)

(defgpufun ("GPU_PopMatrix" gpu-pop-matrix) :void)

(defgpufun ("GPU_LoadIdentity" gpu-load-identity) :void)

(defgpufun ("GPU_LoadMatrix" gpu-load-matrix) :void
  (matrix4x4 (:pointer :float)))

(defgpufun ("GPU_Ortho" gpu-ortho) :void
  (left :float)
  (right :float)
  (bottom :float)
  (top :float)
  (near :float)
  (far :float))

(defgpufun ("GPU_Frustum" gpu-frustum) :void
  (left :float)
  (right :float)
  (bottom :float)
  (top :float)
  (near :float)
  (far :float))

(defgpufun ("GPU_Translate" gpu-translate) :void
  (x :float)
  (y :float)
  (z :float))

(defgpufun ("GPU_Scale" gpu-scale) :void
  (sx :float)
  (sy :float)
  (sz :float))

(defgpufun ("GPU_Rotate" gpu-rotate) :void
  (degrees :float)
  (x :float)
  (y :float)
  (z :float))

(defgpufun ("GPU_MultMatrix" gpu-mult-matrix) :void
  (matrix4x4 (:pointer :float)))

(defgpufun ("GPU_Clear" gpu-clear) :void
  (target (:pointer gpu-target)))

#+fsbv
(defgpufun ("GPU_ClearColor" gpu-clear-color) :void
  (target (:pointer gpu-target))
  (color sdl-color))

(defgpufun ("GPU_ClearRGB" gpu-clear-rgb) :void
  (target (:pointer gpu-target))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(defgpufun ("GPU_ClearRGBA" gpu-clear-rgba) :void
  (target (:pointer gpu-target))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(defgpufun ("GPU_Blit" gpu-blit) :void
  (image (:pointer gpu-image))
  (src-rect (:pointer gpu-rect))
  (target (:pointer gpu-target))
  (x :float)
  (y :float))

(defgpufun ("GPU_BlitRotate" gpu-blit-rotate) :void
  (image (:pointer gpu-image))
  (src-rect (:pointer gpu-rect))
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (degrees :float))

(defgpufun ("GPU_BlitScale" gpu-blit-scale) :void
  (image (:pointer gpu-image))
  (src-rect (:pointer gpu-rect))
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (scale-x :float)
  (scale-y :float))

(defgpufun ("GPU_BlitTransform" gpu-blit-transform) :void
  (image (:pointer gpu-image))
  (src-rect (:pointer gpu-rect))
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (degrees :float)
  (scale-x :float)
  (scale-y :float))

(defgpufun ("GPU_BlitTransformX" gpu-blit-transform-x) :void
  (image (:pointer gpu-image))
  (src-rect (:pointer gpu-rect))
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (pivot-x :float)
  (pivot-y :float)
  (degrees :float)
  (scale-x :float)
  (scale-y :float))

(defgpufun ("GPU_BlitRect" gpu-blit-rect) :void
  (image (:pointer gpu-image))
  (src-rect (:pointer gpu-rect))
  (target (:pointer gpu-target))
  (dest-rect (:pointer gpu-rect)))

(defgpufun ("GPU_BlitRectX" gpu-blit-rect-x) :void
  (image (:pointer gpu-image))
  (src-rect (:pointer gpu-rect))
  (target (:pointer gpu-target))
  (dest-rect (:pointer gpu-rect))
  (degrees :float)
  (pivot-x :float)
  (pivot-y :float)
  (flip-direction gpu-flip-enum))
(defgpufun ("GPU_TriangleBatch" gpu-triangle-batch) :void
  (image (:pointer gpu-image))
  (target (:pointer gpu-target))
  (num-vertices :ushort)
  (values (:pointer :float))
  (num-indices :uint)
  (indices (:pointer :ushort))
  (flags gpu-batch-flag-enum))

(defgpufun ("GPU_TriangleBatchX" gpu-triangle-batch-x) :void
  (image (:pointer gpu-image))
  (target (:pointer gpu-target))
  (num-vertices :ushort)
  (values :pointer)
  (num-indices :uint)
  (indices (:pointer :ushort))
  (flags gpu-batch-flag-enum))

(defgpufun ("GPU_FlushBlitBuffer" gpu-flush-blit-buffer) :void)

(defgpufun ("GPU_Flip" gpu-flip) :void
  (target (:pointer gpu-target)))

#+fsbv
(defgpufun ("GPU_Pixel" gpu-pixel) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Line" gpu-line) :void
  (target (:pointer gpu-target))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Arc" gpu-arc) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (radius :float)
  (start-angle :float)
  (end-angle :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_ArcFilled" gpu-arc-filled) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (radius :float)
  (start-angle :float)
  (end-angle :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Circle" gpu-circle) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (radius :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_CircleFilled" gpu-circle-filled) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (radius :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Ellipse" gpu-ellipse) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (rx :float)
  (ry :float)
  (degrees :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_EllipseFilled" gpu-ellipse-filled) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (rx :float)
  (ry :float)
  (degrees :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Sector" gpu-sector) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (inner-radius :float)
  (outer-radius :float)
  (start-angle :float)
  (end-angle :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_SectorFilled" gpu-sector-filled) :void
  (target (:pointer gpu-target))
  (x :float)
  (y :float)
  (inner-radius :float)
  (outer-radius :float)
  (start-angle :float)
  (end-angle :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Tri" gpu-tri) :void
  (target (:pointer gpu-target))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float)
  (x3 :float)
  (y3 :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_TriFilled" gpu-tri-filled) :void
  (target (:pointer gpu-target))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float)
  (x3 :float)
  (y3 :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Rectangle" gpu-rectangle) :void
  (target (:pointer gpu-target))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Rectangle2" gpu-rectangle2) :void
  (target (:pointer gpu-target))
  (rect gpu-rect)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_RectangleFilled" gpu-rectangle-filled) :void
  (target (:pointer gpu-target))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_RectangleFilled2" gpu-rectangle-filled2) :void
  (target (:pointer gpu-target))
  (rect gpu-rect)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_RectangleRound" gpu-rectangle-round) :void
  (target (:pointer gpu-target))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float)
  (radius :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_RectangleRound2" gpu-rectangle-round2) :void
  (target (:pointer gpu-target))
  (rect gpu-rect)
  (radius :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_RectangleRoundFilled" gpu-rectangle-round-filled) :void
  (target (:pointer gpu-target))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float)
  (radius :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_RectangleRoundFilled2" gpu-rectangle-round-filled2) :void
  (target (:pointer gpu-target))
  (rect gpu-rect)
  (radius :float)
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_Polygon" gpu-polygon) :void
  (target (:pointer gpu-target))
  (num-vertices :uint)
  (vertices (:pointer :float))
  (color sdl-color))

#+fsbv
(defgpufun ("GPU_PolygonFilled" gpu-polygon-filled) :void
  (target (:pointer gpu-target))
  (num-vertices :uint)
  (vertices (:pointer :float))
  (color sdl-color))

(defgpufun ("GPU_CreateShaderProgram" gpu-create-shader-program) :uint32)

(defgpufun ("GPU_FreeShaderProgram" gpu-free-shader-program) :void
  (program-object :uint32))

(defgpufun ("GPU_CompileShader_RW" gpu-compile-shader-rw) :uint32
  (shader-type gpu-shader-enum)
  (shader-source (:pointer sdl-rwops))
  (free-rwops gpu-bool))

(defgpufun ("GPU_CompileShader" gpu-compile-shader) :uint32
  (shader-type gpu-shader-enum)
  (shader-source (:string :encoding :utf-8)))

(defgpufun ("GPU_LoadShader" gpu-load-shader) :uint32
  (shader-type gpu-shader-enum)
  (filename (:string :encoding :utf-8)))

(defgpufun ("GPU_LinkShaders" gpu-link-shaders) :uint32
  (shader-object1 :uint32)
  (shader-object2 :uint32))

(defgpufun ("GPU_LinkManyShaders" gpu-link-many-shaders) :uint32
  (*shader-objects :uint32)
  (count :int))

(defgpufun ("GPU_FreeShader" gpu-free-shader) :void
  (shader-object :uint32))

(defgpufun ("GPU_AttachShader" gpu-attach-shader) :void
  (program-object :uint32)
  (shader-object :uint32))

(defgpufun ("GPU_DetachShader" gpu-detach-shader) :void
  (program-object :uint32)
  (shader-object :uint32))

(defgpufun ("GPU_LinkShaderProgram" gpu-link-shader-program) gpu-bool
  (program-object :uint32))

(defgpufun ("GPU_GetCurrentShaderProgram" gpu-get-current-shader-program) :uint32)

(defgpufun ("GPU_IsDefaultShaderProgram" gpu-is-default-shader-program) gpu-bool
  (program-object :uint32))

(defgpufun ("GPU_ActivateShaderProgram" gpu-activate-shader-program) :void
  (program-object :uint32)
  (block (:pointer gpu-shader-block)))

(defgpufun ("GPU_DeactivateShaderProgram" gpu-deactivate-shader-program) :void)

(defgpufun ("GPU_GetShaderMessage" gpu-get-shader-message) (:string :encoding :utf-8))

(defgpufun ("GPU_GetAttributeLocation" gpu-get-attribute-location) :int
  (program-object :uint32)
  (attrib-name (:string :encoding :utf-8)))

#+fsbv
(defgpufun ("GPU_MakeAttributeFormat" gpu-make-attribute-format) gpu-attribute-format
  (num-elems-per-vertex :int)
  (type gpu-type-enum)
  (normalize gpu-bool)
  (stride-bytes :int)
  (offset-bytes :int))

#+fsbv
(defgpufun ("GPU_MakeAttribute" gpu-make-attribute) gpu-attribute
  (location :int)
  (values :pointer)
  (format gpu-attribute-format))

(defgpufun ("GPU_GetUniformLocation" gpu-get-uniform-location) :int
  (program-object :uint32)
  (uniform-name (:string :encoding :utf-8)))

#+fsbv
(defgpufun ("GPU_LoadShaderBlock" gpu-load-shader-block) gpu-shader-block
  (program-object :uint32)
  (position-name (:string :encoding :utf-8))
  (texcoord-name (:string :encoding :utf-8))
  (color-name (:string :encoding :utf-8))
  (model-view-matrix-name (:string :encoding :utf-8)))

#+fsbv
(defgpufun ("GPU_SetShaderBlock" gpu-set-shader-block) :void
  (block gpu-shader-block))

#+fsbv
(defgpufun ("GPU_GetShaderBlock" gpu-get-shader-block) gpu-shader-block)

(defgpufun ("GPU_SetShaderImage" gpu-set-shader-image) :void
  (image (:pointer gpu-image))
  (location :int)
  (image-unit :int))

(defgpufun ("GPU_GetUniformiv" gpu-get-uniformiv) :void
  (program-object :uint32)
  (location :int)
  (values (:pointer :int)))

(defgpufun ("GPU_SetUniformi" gpu-set-uniformi) :void
  (location :int)
  (value :int))

(defgpufun ("GPU_SetUniformiv" gpu-set-uniformiv) :void
  (location :int)
  (num-elements-per-value :int)
  (num-values :int)
  (values (:pointer :int)))

(defgpufun ("GPU_GetUniformuiv" gpu-get-uniformuiv) :void
  (program-object :uint32)
  (location :int)
  (values (:pointer :uint)))

(defgpufun ("GPU_SetUniformui" gpu-set-uniformui) :void
  (location :int)
  (value :uint))

(defgpufun ("GPU_SetUniformuiv" gpu-set-uniformuiv) :void
  (location :int)
  (num-elements-per-value :int)
  (num-values :int)
  (values (:pointer :uint)))

(defgpufun ("GPU_GetUniformfv" gpu-get-uniformfv) :void
  (program-object :uint32)
  (location :int)
  (values (:pointer :float)))

(defgpufun ("GPU_SetUniformf" gpu-set-uniformf) :void
  (location :int)
  (value :float))

(defgpufun ("GPU_SetUniformfv" gpu-set-uniformfv) :void
  (location :int)
  (num-elements-per-value :int)
  (num-values :int)
  (values (:pointer :float)))

(defgpufun ("GPU_GetUniformMatrixfv" gpu-get-uniform-matrixfv) :void
  (program-object :uint32)
  (location :int)
  (values (:pointer :float)))

(defgpufun ("GPU_SetUniformMatrixfv" gpu-set-uniform-matrixfv) :void
  (location :int)
  (num-matrices :int)
  (num-rows :int)
  (num-columns :int)
  (transpose gpu-bool)
  (values (:pointer :float)))

(defgpufun ("GPU_SetAttributef" gpu-set-attributef) :void
  (location :int)
  (value :float))

(defgpufun ("GPU_SetAttributei" gpu-set-attributei) :void
  (location :int)
  (value :int))

(defgpufun ("GPU_SetAttributeui" gpu-set-attributeui) :void
  (location :int)
  (value :uint))

(defgpufun ("GPU_SetAttributefv" gpu-set-attributefv) :void
  (location :int)
  (num-elements :int)
  (value (:pointer :float)))

(defgpufun ("GPU_SetAttributeiv" gpu-set-attributeiv) :void
  (location :int)
  (num-elements :int)
  (value (:pointer :int)))

(defgpufun ("GPU_SetAttributeuiv" gpu-set-attributeuiv) :void
  (location :int)
  (num-elements :int)
  (value (:pointer :uint)))

#+fsbv
(defgpufun ("GPU_SetAttributeSource" gpu-set-attribute-source) :void
  (num-values :int)
  (source gpu-attribute))
