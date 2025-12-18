# swip_core (Flutter)

SWIP SDK core – integrates with `synheart_wear`, computes SDNN, runs a tiny on‑device model, and streams a 0–100 SWIP score.

## Quick start
```dart
final swip = SWIPManager();
await swip.initialize(
  config: const SWIPConfig(
    modelBackend: 'onnx',
    modelAssetPath:
        'packages/swip_core/assets/models/extratrees_wrist_all_v1_0.onnx',
  ),
);
await swip.start();
swip.scores.listen((s) {
  print('SWIP ${s.score0to100.toStringAsFixed(1)} via ${s.modelInfo.id}');
});
```

## Patent Pending Notice

This project is provided under an open-source license. Certain underlying systems, methods, and architectures described or implemented herein may be covered by one or more pending patent applications.

Nothing in this repository grants any license, express or implied, to any patents or patent applications, except as provided by the applicable open-source license.