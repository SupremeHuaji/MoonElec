// MoonElec - 测试代码

///|
test "dc circuit" {
  // 欧姆定律: V = I * R
  // V = 2A * 10Ω = 20V
  let v = ohm_law_voltage(2.0, 10.0)
  assert_eq(v, 20.0)

  // 电流: I = V / R = 20V / 10Ω = 2A
  let i = ohm_law_current(20.0, 10.0)
  assert_eq(i, 2.0)

  // 功率: P = V * I = 20V * 2A = 40W
  let p = power_vi(20.0, 2.0)
  assert_eq(p, 40.0)

  // 功率: P = I² * R = 2² * 10 = 40W
  let p2 = power_resistance(2.0, 10.0)
  assert_eq(p2, 40.0)

  // 电阻串联: R = 10 + 20 = 30Ω
  let rs = resistance_series(10.0, 20.0)
  assert_eq(rs, 30.0)

  // 电阻并联: R = 1/(1/10 + 1/20) = 6.67Ω
  let rp = resistance_parallel(10.0, 20.0)
  assert_eq(approx_equal(rp, 6.67, 0.1), true)

  // 分压: V_out = 10V * 20/(10+20) = 6.67V
  let vout = voltage_divider(10.0, 10.0, 20.0)
  assert_eq(approx_equal(vout, 6.67, 0.1), true)
}

///|
test "ac circuit" {
  // 角频率: ω = 2πf = 2π*50 = 314.16 rad/s
  let omega = angular_frequency(50.0)
  assert_eq(approx_equal(omega, 314.16, 1.0), true)

  // 感抗: X_L = 2πfL = 2π*50*0.1 = 31.42Ω
  let xl = inductive_reactance(50.0, 0.1)
  assert_eq(approx_equal(xl, 31.42, 0.5), true)

  // 容抗: X_C = 1/(2πfC) = 1/(2π*50*100e-6) = 31.83Ω
  let xc = capacitive_reactance(50.0, 100.0e-6)
  assert_eq(approx_equal(xc, 31.83, 0.5), true)

  // 谐振频率: f_0 = 1/(2π√(LC)) = 1/(2π√(0.1*100e-6)) = 50.33Hz
  let f0 = resonance_frequency(0.1, 100.0e-6)
  assert_eq(approx_equal(f0, 50.33, 1.0), true)
}

///|
test "ac power" {
  // 视在功率: S = V * I = 220V * 10A = 2200VA
  let s = apparent_power(220.0, 10.0)
  assert_eq(s, 2200.0)

  // 有功功率: P = V*I*cos(φ) = 220*10*0.85 = 1870W
  let phi = power_factor_angle(0.85)
  let p = active_power(220.0, 10.0, phi)
  assert_eq(approx_equal(p, 1870.0, 10.0), true)

  // 功率因数: PF = P/S = 1870/2200 = 0.85
  let pf = power_factor(1870.0, 2200.0)
  assert_eq(approx_equal(pf, 0.85, 0.01), true)
}

///|
test "transformer" {
  // 变比: n = N1/N2 = 1000/100 = 10
  let n = transformer_turns_ratio(1000, 100)
  assert_eq(n, 10.0)

  // 电压比: V2 = V1*N2/N1 = 220*100/1000 = 22V
  let v2 = transformer_voltage_ratio(220.0, 1000, 100)
  assert_eq(v2, 22.0)

  // 电流比: I2 = I1*N1/N2 = 1*1000/100 = 10A
  let i2 = transformer_current_ratio(1.0, 1000, 100)
  assert_eq(i2, 10.0)
}

///|
test "motor" {
  // 同步转速: n_s = 60*f/p = 60*50/2 = 1500 rpm
  let ns = synchronous_speed(50.0, 2)
  assert_eq(ns, 1500.0)

  // 转差率: s = (1500-1440)/1500 = 0.04
  let s = slip(1500.0, 1440.0)
  assert_eq(approx_equal(s, 0.04, 0.001), true)

  // 实际转速: n = 1500*(1-0.04) = 1440 rpm
  let n = induction_motor_speed(1500.0, 0.04)
  assert_eq(n, 1440.0)
}

///|
test "three phase" {
  // 三相功率: P = √3*V_L*I_L*PF = √3*380*10*0.85 = 5594W
  let p = three_phase_power_star(380.0, 10.0, 0.85)
  assert_eq(approx_equal(p, 5594.0, 10.0), true)

  // 线电压转相电压: V_ph = 380/√3 = 219.4V
  let vph = line_to_phase_voltage_star(380.0)
  assert_eq(approx_equal(vph, 219.4, 0.5), true)
}

///|
test "complex" {
  // 复数: z = 3 + 4i
  let z = complex(3.0, 4.0)
  assert_eq(z.real, 3.0)
  assert_eq(z.imag, 4.0)

  // 模长: |z| = √(3²+4²) = 5
  let mag = complex_magnitude(z)
  assert_eq(mag, 5.0)

  // 相位角: φ = arctan(4/3) = 53.13°
  let phase = complex_phase(z)
  assert_eq(approx_equal(rad_to_deg(phase), 53.13, 1.0), true)

  // 复数相加: (3+4i) + (1+2i) = 4+6i
  let z1 = complex(3.0, 4.0)
  let z2 = complex(1.0, 2.0)
  let z_sum = complex_add(z1, z2)
  assert_eq(z_sum.real, 4.0)
  assert_eq(z_sum.imag, 6.0)
}

///|
test "signal processing" {
  // RMS值: RMS = A/√2 = 10/√2 = 7.07V
  let rms = rms_sine(10.0)
  assert_eq(approx_equal(rms, 7.07, 0.1), true)

  // 峰值转RMS: 10V -> 7.07V
  let rms2 = peak_to_rms(10.0)
  assert_eq(approx_equal(rms2, 7.07, 0.1), true)

  // RMS转峰值: 7.07V -> 10V
  let peak = rms_to_peak(7.07)
  assert_eq(approx_equal(peak, 10.0, 0.1), true)
}

///|
test "filter" {
  // 低通截止频率: f_c = 1/(2πRC) = 1/(2π*1000*1e-6) = 159.15Hz
  let fc = lowpass_cutoff_frequency(1000.0, 1.0e-6)
  assert_eq(approx_equal(fc, 159.15, 1.0), true)

  // 带通中心频率: f_0 = 1/(2π√(LC)) = 1/(2π√(0.001*1e-6)) = 5033Hz
  let f0 = bandpass_center_frequency(0.001, 1.0e-6)
  assert_eq(approx_equal(f0, 5033.0, 10.0), true)
}

///|
test "electronics" {
  // 二极管正向压降: 硅管 0.7V
  let vf = diode_forward_voltage(true)
  assert_eq(vf, 0.7)

  // 运算放大器反相增益: A_v = -R_f/R_in = -10k/1k = -10
  let av = opamp_inverting_gain(10000.0, 1000.0)
  assert_eq(av, -10.0)

  // 运算放大器同相增益: A_v = 1 + R_f/R_in = 1 + 10k/1k = 11
  let av2 = opamp_non_inverting_gain(10000.0, 1000.0)
  assert_eq(av2, 11.0)
}

///|
test "control" {
  // 一阶系统时间常数: τ = RC = 1000*1e-6 = 0.001s
  let tau = first_order_time_constant(1000.0, 1.0e-6)
  assert_eq(tau, 0.001)

  // 一阶系统响应: y(0.001) = 1*(1-exp(-1)) = 0.632
  let y = first_order_step_response(1.0, 0.001, 0.001)
  assert_eq(approx_equal(y, 0.632, 0.01), true)
}

///|
test "signal analysis" {
  // 分贝转电压比: 20dB -> 10^(20/20) = 10
  let ratio = db_to_voltage_ratio(20.0)
  assert_eq(approx_equal(ratio, 10.0, 0.1), true)

  // 电压比转分贝: 10 -> 20*log10(10) = 20dB
  let db = voltage_ratio_to_db(10.0)
  assert_eq(approx_equal(db, 20.0, 0.1), true)
}

///|
test "capacitor inductor" {
  // 电容充电: V(τ) = V0*(1-exp(-1)) = 10*0.632 = 6.32V
  let vc = capacitor_charging_voltage(10.0, 0.001, 1000.0, 1.0e-6)
  assert_eq(approx_equal(vc, 6.32, 0.1), true)

  // 电容放电: V(τ) = V0*exp(-1) = 10*0.368 = 3.68V
  let vd = capacitor_discharging_voltage(10.0, 0.001, 1000.0, 1.0e-6)
  assert_eq(approx_equal(vd, 3.68, 0.1), true)
}
