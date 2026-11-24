# Performance analysis

The original MATLAB numerical algorithm was independently reproduced in Python to generate the included plot and reference values. These are simulated values, not physical measurements or evidence of a MATLAB execution.

| Metric | Value | Definition |
|---|---:|---|
| Rise time | 3.57 s | First 10% to first 90% of target |
| Settling time | 20.05 s | Time after reference step from which speed remains within ±2% through the simulation end |
| Overshoot | 4.88% | Peak above 20 m/s |
| Final absolute error | 0.000131 m/s | Absolute error at 100 s |

The nominal force in steady state is 1,000 N. The model omits actuator saturation, nonlinear drag, road grade and sensor noise; the initial force demand is illustrative only. MATLAB results should be checked locally with the supplied test function.
