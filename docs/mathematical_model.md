# Mathematical model

The source uses a lumped vehicle mass of 1000 kg and linear resistance b = 50 N·s/m. Newton's law gives `m dv/dt = F - b v` and `dx/dt = v`. The plant transfer function under zero initial conditions is `G(s) = 1/(1000s+50)`.

The PI control law is `F = Kp e + Ki integral(e dt)` with `e = reference - speed`, Kp = 500 and Ki = 50. The closed-loop transfer function is `(500s+50)/(1000s^2+550s+50)`.

The numerical integration uses forward Euler for speed and position with a 0.01 s step, and updates the accumulated error before computing the force at each sample. The reference steps from 0 to 20 m/s at 10 s.

This is conventional speed tracking, not radar-based adaptive cruise control. It does not model headway or another vehicle.
