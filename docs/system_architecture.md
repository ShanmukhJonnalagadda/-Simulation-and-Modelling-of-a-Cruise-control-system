# System architecture

```mermaid
flowchart LR
 R[Reference speed] --> S((Difference))
 S -->|Speed error| C[PI controller]
 C -->|Force| V[Vehicle dynamics]
 V -->|Actual speed| O[Speed output]
 O -->|Negative feedback| S
 V --> P[Position integration]
```

The reference and measured model speed form the error. The PI controller converts that error to a force command. The vehicle model integrates acceleration into speed and speed into position. The simulated speed is fed back to close the loop.
