# MoonElec - Electrical Engineering Calculation Library

**MoonElec** is a comprehensive electrical engineering and circuit analysis library written in **Moonbit**, providing essential calculation functions for electrical engineers, power systems analysts, and electronics designers.

---

## Features

### DC Circuit Analysis

* **Ohm's Law Calculations**: Voltage (V = I×R), current (I = V/R), and resistance (R = V/I) calculations
* **Power Calculations**: Power from voltage/current (P = V×I) and power through resistance (P = I²×R, P = V²/R)
* **Resistance Networks**: Series and parallel resistance combinations
* **Kirchhoff's Laws**: Current law (KCL) and voltage law (KVL) verification
* **Voltage/Current Dividers**: Resistor divider calculations

---

### AC Circuit Analysis

* **Frequency Calculations**: Angular frequency (ω = 2πf) and frequency conversions
* **Impedance Calculations**: Inductive reactance (Xₗ = ωL), capacitive reactance (Xc = 1/ωC)
* **Complex Impedance**: RL, RC, RLC series and parallel circuit impedances
* **Resonance Analysis**: RLC series resonance frequency and quality factor calculations

---

### Power Systems

* **AC Power Calculations**: Apparent power (S = V×I), active power (P = S×cosφ), reactive power (Q = S×sinφ)
* **Power Factor Analysis**: Power factor calculation and power factor angle determination
* **Power Triangle**: Complete power calculations from P and Q components

---

### Transformers

* **Transformer Ratios**: Turns ratio, voltage ratio, and current ratio calculations
* **Impedance Transformation**: Impedance reflection through transformer windings
* **Efficiency Calculations**: Transformer efficiency and power loss analysis

---

### Electric Motors

* **Synchronous Speed**: Calculation of synchronous motor speed from frequency and pole pairs
* **Slip Calculations**: Induction motor slip and actual speed calculations
* **Motor Performance**: Output power, input power, efficiency, and torque calculations

---

### Three-Phase Systems

* **Three-Phase Power**: Power calculations for star (Y) and delta (Δ) connected systems
* **Voltage/Current Transformations**: Line-to-phase and phase-to-line conversions
* **Short Circuit Analysis**: Basic short circuit current calculations

---

## Usage

### Basic DC Circuit Calculations

```moonbit
// Ohm's law calculations
let voltage = ohm_law_voltage(2.0, 10.0)  // V = 2A × 10Ω = 20V
let current = ohm_law_current(20.0, 10.0)  // I = 20V ÷ 10Ω = 2A

// Power calculations
let power = power_vi(20.0, 2.0)  // P = 20V × 2A = 40W

// Resistance networks
let r_series = resistance_series(10.0, 20.0)  // R_total = 10Ω + 20Ω = 30Ω
let r_parallel = resistance_parallel(10.0, 20.0)  // R_total = 6.67Ω
```

### AC Circuit Analysis

```moonbit
// Frequency and reactance calculations
let omega = angular_frequency(50.0)  // ω = 2π × 50Hz = 314.16 rad/s
let xl = inductive_reactance(50.0, 0.1)  // X_L = 2π × 50 × 0.1 = 31.42Ω
let xc = capacitive_reactance(50.0, 100e-6)  // X_C = 1/(2π × 50 × 100µF) = 31.83Ω

// RLC resonance
let f0 = resonance_frequency(0.1, 100e-6)  // f₀ = 1/(2π√(LC)) = 50.33Hz
let q = quality_factor_rlc(0.1, 100e-6, 10.0)  // Q = ω₀L/R = 1.00
```

### Power Systems

```moonbit
// Three-phase power calculation (star connection)
let power_3ph = three_phase_power_star(400.0, 10.0, 0.85)  // P = √3 × 400V × 10A × 0.85 = 5888W

// Power factor analysis
let pf = power_factor(5000.0, 6000.0)  // PF = 5000W ÷ 6000VA = 0.833
let angle = power_factor_angle(0.833)  // φ = arccos(0.833) = 33.6°

// Transformer calculations
let v2 = transformer_voltage_ratio(11000.0, 1000, 100)  // V₂ = 11000V × 100/1000 = 1100V
let turns_ratio = transformer_turns_ratio(1000, 100)  // n = 1000/100 = 10.0
```

### Motor Calculations

```moonbit
// Synchronous motor speed
let ns = synchronous_speed(50.0, 2)  // n_s = 60 × 50Hz / 2 poles = 1500 RPM

// Induction motor calculations
let slip = slip(1500.0, 1425.0)  // s = (1500 - 1425)/1500 = 0.05 (5%)
let n_actual = induction_motor_speed(1500.0, 0.05)  // n = 1500 × (1 - 0.05) = 1425 RPM

// Motor performance
let torque = motor_torque(1000.0, 157.08)  // T = 1000W / 157.08 rad/s = 6.37 N·m
let efficiency = motor_efficiency(850.0, 1000.0)  // η = 850W / 1000W = 0.85 (85%)
```

---

## Installation

Add MoonElec to your MoonBit project:

```bash
moon add SupremeHuaji/MoonElec
```

---

## Dependencies

MoonElec has minimal dependencies and works with standard MoonBit library functions.

---

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

---

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

---

## Author

**SupremeHuaji** - x30358525@163.com

---

*Built with [MoonBit](https://moonbitlang.com) for reliable electrical engineering calculations.*
