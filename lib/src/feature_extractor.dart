// import 'dart:math';
// import 'sdnn.dart';
// import 'wear_bridge.dart';

// class FeatureVector {
//   final List<double> values; // schema order
//   const FeatureVector(this.values);
// }

// class FeatureExtractor {
//   static const schema = [
//     "SDNN",
//     "RMSSD",
//     "pNN50",
//     "Mean_RR",
//     "HR_mean",
//   ];

//   /// Generate features expected by the ExtraTrees ONNX model.
//   ///
//   /// Returns `null` when insufficient RR data is available to compute the
//   /// required HRV features.
//   FeatureVector? toFeatures(List<SwipSample> window) {
//     final hrs = window.map((s) => s.hrBpm).whereType<double>().toList();
//     if (hrs.isEmpty) {
//       return null;
//     }
//     final hrMean = hrs.reduce((a, b) => a + b) / hrs.length;

//     final sdnn = _resolveSdnn(window);

//     final rrAll = window
//         .map((s) => s.rrMs)
//         .whereType<List<double>>()
//         .expand((e) => e)
//         .toList();

//     if (rrAll.length < 20 || sdnn == null) {
//       // Require a reasonable number of RR intervals for stable features.
//       return null;
//     }

//     final rmssd = _computeRmssd(rrAll);
//     final pnn50 = _computePnn50(rrAll);
//     final meanRr = rrAll.reduce((a, b) => a + b) / rrAll.length;

//     if (rmssd == null || pnn50 == null || meanRr.isNaN) {
//       return null;
//     }

//     return FeatureVector([
//       sdnn,
//       rmssd,
//       pnn50,
//       meanRr,
//       hrMean,
//     ]);
//   }

//   double? _resolveSdnn(List<SwipSample> window) {
//     final sdnnFromWear = window.map((s) => s.sdnnMs).whereType<double>().toList();
//     if (sdnnFromWear.isNotEmpty) {
//       sdnnFromWear.sort();
//       final n = sdnnFromWear.length;
//       return n.isOdd
//           ? sdnnFromWear[n >> 1]
//           : 0.5 * (sdnnFromWear[n ~/ 2 - 1] + sdnnFromWear[n ~/ 2]);
//     }

//     final rrAll = window
//         .map((s) => s.rrMs)
//         .whereType<List<double>>()
//         .expand((e) => e)
//         .toList();
//     if (rrAll.isEmpty) {
//       return null;
//     }
//     return computeSdnnMs(rrAll);
//   }

//   double? _computeRmssd(List<double> rr) {
//     if (rr.length < 2) return null;

//     double sumSquares = 0;
//     for (var i = 1; i < rr.length; i++) {
//       final diff = rr[i] - rr[i - 1];
//       sumSquares += diff * diff;
//     }
//     return sqrt(sumSquares / (rr.length - 1));
//   }

//   double? _computePnn50(List<double> rr) {
//     if (rr.length < 2) return null;
//     int count = 0;
//     for (var i = 1; i < rr.length; i++) {
//       if ((rr[i] - rr[i - 1]).abs() > 50.0) {
//         count++;
//       }
//     }
//     return (count / (rr.length - 1)) * 100.0;
//   }
// }
