# MoonElec - Electrical Engineering Calculation Library

**MoonElec** is a comprehensive electrical engineering calculation library written in **Moonbit**, providing functions for circuit analysis, power systems, electronics, and control systems.

---

## Features

### DC Circuit Analysis

* **Ohm's Law**: Voltage, current, and resistance relationships (V = I × R)
* **Power Calculations**: Electrical power in various forms (P = V × I, P = I² × R, P = V² / R)
* **Resistor Networks**: Series and parallel resistor combinations
* **Voltage Division**: Voltage divider circuits and calculations
* **Kirchhoff's Laws**: KCL and KVL verification functions

---

### AC Circuit Analysis

* **Frequency Analysis**: Angular frequency, inductive reactance, capacitive reactance
* **Resonance**: LC circuit resonance frequency calculations
* **Impedance**: Complex impedance calculations for AC circuits
* **Phase Relationships**: Phase angle calculations and relationships

---

### Power Systems

* **AC Power**: Apparent power, active power, reactive power, power factor
* **Three-Phase Systems**: Three-phase power calculations, voltage transformations
* **Transformers**: Turns ratio, voltage ratio, current ratio calculations
* **Electric Motors**: Synchronous speed, slip calculations for induction motors

---

### Signal Processing

* **RMS Calculations**: Root mean square value conversions for AC signals
* **Peak-to-RMS**: Peak value to RMS conversions and vice versa
* **Frequency Analysis**: Signal frequency component calculations

---

### Electronics

* **Diodes**: Forward voltage drop calculations
* **Operational Amplifiers**: Inverting and non-inverting amplifier gain calculations
* **Filters**: Low-pass, high-pass, and band-pass filter frequency calculations
* **Passive Components**: Capacitor charging/discharging, inductor behavior

---

### Control Systems

* **First-Order Systems**: Time constant and step response calculations
* **System Analysis**: Transfer function analysis tools
* **Stability Analysis**: Basic stability verification functions

---

### Mathematical Utilities

* **Complex Numbers**: Complex number operations (addition, magnitude, phase)
* **Trigonometric Functions**: Advanced trigonometric calculations
* **Logarithmic Functions**: Decibel conversions and logarithmic calculations

---

## Usage

### DC Circuit Analysis

```moonbit
test "dc circuit" {
  // Ohm's law: V = I * R
  // V = 2A * 10Ω = 20V
  let v = ohm_law_voltage(2.0, 10.0)
  assert_eq(v, 20.0)

  // Current: I = V / R = 20V / 10Ω = 2A
  let i = ohm_law_current(20.0, 10.0)
  assert_eq(i, 2.0)

  // Power: P = V * I = 20V * 2A = 40W
  let p = power_vi(20.0, 2.0)
  assert_eq(p, 40.0)

  // Power: P = I² * R = 2² * 10 = 40W
  let p2 = power_resistance(2.0, 10.0)
  assert_eq(p2, 40.0)

  // Resistor series: R = 10 + 20 = 30Ω
  let rs = resistance_series(10.0, 20.0)
  assert_eq(rs, 30.0)

  // Resistor parallel: R = 1/(1/10 + 1/20) = 6.67Ω
  let rp = resistance_parallel(10.0, 20.0)
  assert_eq(approx_equal(rp, 6.67, 0.1), true)

  // Voltage divider: V_out = 10V * 20/(10+20) = 6.67V
  let vout = voltage_divider(10.0, 10.0, 20.0)
  assert_eq(approx_equal(vout, 6.67, 0.1), true)
}
```

---

### AC Circuit Analysis

```moonbit
test "ac circuit" {
  // Angular frequency: ω = 2πf = 2π*50 = 314.16 rad/s
  let omega = angular_frequency(50.0)
  assert_eq(approx_equal(omega, 314.16, 1.0), true)

  // Inductive reactance: X_L = 2πfL = 2π*50*0.1 = 31.42Ω
  let xl = inductive_reactance(50.0, 0.1)
  assert_eq(approx_equal(xl, 31.42, 0.5), true)

  // Capacitive reactance: X_C = 1/(2πfC) = 1/(2π*50*100e-6) = 31.83Ω
  let xc = capacitive_reactance(50.0, 100.0e-6)
  assert_eq(approx_equal(xc, 31.83, 0.5), true)

  // Resonance frequency: f_0 = 1/(2π√(LC)) = 1/(2π√(0.1*100e-6)) = 50.33Hz
  let f0 = resonance_frequency(0.1, 100.0e-6)
  assert_eq(approx_equal(f0, 50.33, 1.0), true)
}
```

---

### AC Power Calculations

```moonbit
test "ac power" {
  // Apparent power: S = V * I = 220V * 10A = 2200VA
  let s = apparent_power(220.0, 10.0)
  assert_eq(s, 2200.0)

  // Active power: P = V*I*cos(φ) = 220*10*0.85 = 1870W
  let phi = power_factor_angle(0.85)
  let p = active_power(220.0, 10.0, phi)
  assert_eq(approx_equal(p, 1870.0, 10.0), true)

  // Power factor: PF = P/S = 1870/2200 = 0.85
  let pf = power_factor(1870.0, 2200.0)
  assert_eq(approx_equal(pf, 0.85, 0.01), true)
}
```

---

### Transformer Calculations

```moonbit
test "transformer" {
  // Turns ratio: n = N1/N2 = 1000/100 = 10
  let n = transformer_turns_ratio(1000, 100)
  assert_eq(n, 10.0)

  // Voltage ratio: V2 = V1*N2/N1 = 220*100/1000 = 22V
  let v2 = transformer_voltage_ratio(220.0, 1000, 100)
  assert_eq(v2, 22.0)

  // Current ratio: I2 = I1*N1/N2 = 1*1000/100 = 10A
  let i2 = transformer_current_ratio(1.0, 1000, 100)
  assert_eq(i2, 10.0)
}
```

---

### Motor Calculations

```moonbit
test "motor" {
  // Synchronous speed: n_s = 60*f/p = 60*50/2 = 1500 rpm
  let ns = synchronous_speed(50.0, 2)
  assert_eq(ns, 1500.0)

  // Slip: s = (1500-1440)/1500 = 0.04
  let s = slip(1500.0, 1440.0)
  assert_eq(approx_equal(s, 0.04, 0.001), true)

  // Actual speed: n = 1500*(1-0.04) = 1440 rpm
  let n = induction_motor_speed(1500.0, 0.04)
  assert_eq(n, 1440.0)
}
```

---

### Three-Phase Systems

```moonbit
test "three phase" {
  // Three-phase power: P = √3*V_L*I_L*PF = √3*380*10*0.85 = 5594W
  let p = three_phase_power_star(380.0, 10.0, 0.85)
  assert_eq(approx_equal(p, 5594.0, 10.0), true)

  // Line to phase voltage: V_ph = 380/√3 = 219.4V
  let vph = line_to_phase_voltage_star(380.0)
  assert_eq(approx_equal(vph, 219.4, 0.5), true)
}
```

---

### Complex Number Operations

```moonbit
test "complex" {
  // Complex number: z = 3 + 4i
  let z = complex(3.0, 4.0)
  assert_eq(z.real, 3.0)
  assert_eq(z.imag, 4.0)

  // Magnitude: |z| = √(3²+4²) = 5
  let mag = complex_magnitude(z)
  assert_eq(mag, 5.0)

  // Phase angle: φ = arctan(4/3) = 53.13°
  let phase = complex_phase(z)
  assert_eq(approx_equal(rad_to_deg(phase), 53.13, 1.0), true)

  // Complex addition: (3+4i) + (1+2i) = 4+6i
  let z1 = complex(3.0, 4.0)
  let z2 = complex(1.0, 2.0)
  let z_sum = complex_add(z1, z2)
  assert_eq(z_sum.real, 4.0)
  assert_eq(z_sum.imag, 6.0)
}
```

---

### Signal Processing

```moonbit
test "signal processing" {
  // RMS value: RMS = A/√2 = 10/√2 = 7.07V
  let rms = rms_sine(10.0)
  assert_eq(approx_equal(rms, 7.07, 0.1), true)

  // Peak to RMS: 10V -> 7.07V
  let rms2 = peak_to_rms(10.0)
  assert_eq(approx_equal(rms2, 7.07, 0.1), true)

  // RMS to peak: 7.07V -> 10V
  let peak = rms_to_peak(7.07)
  assert_eq(approx_equal(peak, 10.0, 0.1), true)
}
```

---

### Filter Design

```moonbit
test "filter" {
  // Low-pass cutoff frequency: f_c = 1/(2πRC) = 1/(2π*1000*1e-6) = 159.15Hz
  let fc = lowpass_cutoff_frequency(1000.0, 1.0e-6)
  assert_eq(approx_equal(fc, 159.15, 1.0), true)

  // Band-pass center frequency: f_0 = 1/(2π√(LC)) = 1/(2π√(0.001*1e-6)) = 5033Hz
  let f0 = bandpass_center_frequency(0.001, 1.0e-6)
  assert_eq(approx_equal(f0, 5033.0, 10.0), true)
}
```

---

### Electronics Components

```moonbit
test "electronics" {
  // Diode forward voltage: Silicon diode 0.7V
  let vf = diode_forward_voltage(true)
  assert_eq(vf, 0.7)

  // Op-amp inverting gain: A_v = -R_f/R_in = -10k/1k = -10
  let av = opamp_inverting_gain(10000.0, 1000.0)
  assert_eq(av, -10.0)

  // Op-amp non-inverting gain: A_v = 1 + R_f/R_in = 1 + 10k/1k = 11
  let av2 = opamp_non_inverting_gain(10000.0, 1000.0)
  assert_eq(av2, 11.0)
}
```

---

### Control Systems

```moonbit
test "control" {
  // First-order system time constant: τ = RC = 1000*1e-6 = 0.001s
  let tau = first_order_time_constant(1000.0, 1.0e-6)
  assert_eq(tau, 0.001)

  // First-order step response: y(0.001) = 1*(1-exp(-1)) = 0.632
  let y = first_order_step_response(1.0, 0.001, 0.001)
  assert_eq(approx_equal(y, 0.632, 0.01), true)
}
```

---

### Signal Analysis

```moonbit
test "signal analysis" {
  // Decibel to voltage ratio: 20dB -> 10^(20/20) = 10
  let ratio = db_to_voltage_ratio(20.0)
  assert_eq(approx_equal(ratio, 10.0, 0.1), true)

  // Voltage ratio to decibel: 10 -> 20*log10(10) = 20dB
  let db = voltage_ratio_to_db(10.0)
  assert_eq(approx_equal(db, 20.0, 0.1), true)
}
```

---

### Capacitor and Inductor

```moonbit
test "capacitor inductor" {
  // Capacitor charging: V(τ) = V0*(1-exp(-1)) = 10*0.632 = 6.32V
  let vc = capacitor_charging_voltage(10.0, 0.001, 1000.0, 1.0e-6)
  assert_eq(approx_equal(vc, 6.32, 0.1), true)

  // Capacitor discharging: V(τ) = V0*exp(-1) = 10*0.368 = 3.68V
  let vd = capacitor_discharging_voltage(10.0, 0.001, 1000.0, 1.0e-6)
  assert_eq(approx_equal(vd, 3.68, 0.1), true)
}
```

---

## Parameter Ranges

### Valid Input Ranges

* **Voltage**: 0–1000 V (DC and AC voltages)
* **Current**: 0–1000 A (DC and AC currents)
* **Resistance**: 0.001–10⁶ Ω (resistor values)
* **Capacitance**: 10⁻¹²–10⁻³ F (capacitor values)
* **Inductance**: 10⁻⁹–10⁻³ H (inductor values)
* **Frequency**: 0.1–10⁶ Hz (AC signal frequencies)
* **Power**: 0–10⁶ W (electrical power)
* **Phase Angle**: -π to π radians (phase angles)

---

### Typical Engineering Values

* **Standard Voltage**: 220V/380V (single/three-phase)
* **Power Frequency**: 50Hz/60Hz (regional standards)
* **Power Factor**: 0.7–1.0 (industrial/commercial loads)
* **Motor Efficiency**: 0.8–0.95 (electric motor efficiency)
* **Cable Resistance**: 0.01–100 Ω/km (conductor resistance)

---

## Testing

The project includes a comprehensive test suite covering all major functionalities:

```bash
moon test
```

### Test Coverage

* DC circuit analysis (Ohm's law, power, resistor networks)
* AC circuit analysis (frequency, impedance, resonance)
* Power systems (AC power, three-phase systems, transformers)
* Electric motors (induction motors, synchronous machines)
* Signal processing (RMS, peak-peak conversions)
* Electronics (diodes, operational amplifiers, filters)
* Control systems (first-order systems, step response)
* Mathematical utilities (complex numbers, trigonometry)
* Passive components (capacitors, inductors)
* Boundary conditions and edge cases

---

## Technical Details

### Standards and References

* **IEC Standards**: International Electrotechnical Commission standards
* **IEEE Standards**: Institute of Electrical and Electronics Engineers standards
* **Electrical Engineering Textbooks**: Standard electrical engineering references
* **SI Units**: All calculations use International System of Units

---

### Mathematical Methods

* **Circuit Analysis**: Kirchhoff's laws, Ohm's law, power relationships
* **AC Analysis**: Phasor analysis, complex number representation
* **Frequency Domain**: Laplace transforms for control systems
* **Signal Processing**: RMS calculations, frequency analysis
* **Numerical Methods**: Root finding, interpolation, numerical integration

---

### Unit System

All calculations use the **International System of Units (SI)**:
- Voltage: volts (V)
- Current: amperes (A)
- Resistance: ohms (Ω)
- Capacitance: farads (F)
- Inductance: henries (H)
- Frequency: hertz (Hz)
- Power: watts (W)

---

## Notes

1. **Units**: All calculations use SI units (volts, amperes, ohms, etc.)
2. **Precision**: Floating-point calculations may have numerical precision limitations
3. **Boundary Conditions**: Values outside valid ranges may yield inaccurate results
4. **Phase Angles**: All angles must be in radians (use conversion functions if needed)
5. **Complex Numbers**: For AC circuit analysis, complex representation is used
6. **Safety Factors**: Engineering calculations should include appropriate safety margins
7. **Standards Compliance**: Functions follow international electrical engineering standards
8. **Validation**: Results should be verified against commercial electrical engineering software

---

## Application Scenarios

* **Electrical Engineering Education**: Circuit analysis and power systems teaching
* **Power System Design**: Electrical distribution and transmission system design
* **Electronics Design**: Analog and digital circuit design and analysis
* **Control Systems Engineering**: Industrial control systems and automation
* **Renewable Energy**: Solar, wind, and other renewable energy system calculations
* **Electric Vehicle Design**: Battery systems and electric motor calculations
* **Industrial Automation**: PLC programming and industrial control systems
* **Telecommunications**: Signal processing and communication system analysis
* **Instrumentation**: Measurement systems and sensor calculations
* **Research Applications**: Electrical engineering research and development

---

## Version Information

The current version (0.1.0) implements **comprehensive electrical engineering calculation functions** including:

* DC circuit analysis (Ohm's law, power, networks)
* AC circuit analysis (frequency, impedance, resonance)
* Power systems (three-phase, transformers, motors)
* Signal processing (RMS, filtering, analysis)
* Electronics (diodes, op-amps, passive components)
* Control systems (first-order systems, responses)
* Mathematical utilities (complex numbers, trigonometry)

The library is actively developed and aims to provide comprehensive coverage of electrical engineering calculations while being optimized for MoonBit.
