# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-01-XX

### Added
- Initial release of swip_core package
- Core SWIP Score computation engine
- Integration with synheart_wear for sensor data
- Feature extraction from HR, HRV, and motion data
- Artifact filtering and adaptive baseline computation
- Support for multiple model backends (ONNX, JSON Linear, CoreML)
- Real-time SWIP score streaming (0-100 scale)
- Comprehensive test suite

### Fixed
- Fixed `inputNames` reference to use `inputSchema` in ONNXRuntimeModel
- Removed unused imports in pipeline.dart and swip_engine.dart

