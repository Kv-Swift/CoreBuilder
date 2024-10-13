owner: KivySwiftLink

repository: KivyExtra

swift_version: 5.9

products:
  - library: KiwiSolver
    targets:
      - KiwiSolver
  - library: FFMpeg
    targets:
      - FFMpeg
  - library: FFPyplayer
    targets:
      - FFPyplayer
  - library: MatPlotLib
    targets:
      - MatPlotLib
  # - library: MaterialYouColor
  #   targets:
  #     - MaterialYouColor
  - library: Pillow
    targets:
      - Pillow

dependencies:
  - package: PythonCore
    url: https://github.com/KivySwiftLink/PythonCore
    version:
      upToNextMajor: 311.0.0

targets:
  - target: KiwiSolver
    dependencies:
      - product: PythonCore
        package: PythonCore
        
      - binary: output/kiwisolver/xcframework

    linkerSettings: []

  - target: FFMpeg
    dependencies:
      - product: PythonCore
        package: PythonCore
        
      - binary: output/ffmpeg/xcframework

    linkerSettings:
      - framework: VideoToolbox

  - target: FFPyplayer
    dependencies:
      - product: PythonCore
        package: PythonCore
      - target: FFMpeg
        
      - binary: output/ffpyplayer/xcframework

    linkerSettings:
      - framework: CoreVideo
      - framework: CoreMedia
      - framework: CoreImage
      - framework: AVFoundation
      - framework: UIKit
      - framework: CoreMotion


  - target: MatPlotLib
    dependencies:
      - product: PythonCore
        package: PythonCore
      - target: KiwiSolver
      - binary: output/matplotlib/xcframework

    linkerSettings: []

  - target: Pillow
    dependencies:
      - product: PythonCore
        package: PythonCore
        
      - binary: output/pillow/xcframework

    linkerSettings: []
