// MoonElec - 电气工程库
// 主模块：包含核心计算功能

// ==================== 直流电路 ====================

///|
/// 欧姆定律
/// V = I * R
pub fn ohm_law_voltage(current : Double, resistance : Double) -> Double {
  current * resistance
}

///|
/// 欧姆定律 - 电流
/// I = V / R
pub fn ohm_law_current(voltage : Double, resistance : Double) -> Double {
  if abs(resistance) < EPSILON {
    return 0.0
  }
  voltage / resistance
}

///|
/// 欧姆定律 - 电阻
/// R = V / I
pub fn ohm_law_resistance(voltage : Double, current : Double) -> Double {
  if abs(current) < EPSILON {
    return 0.0
  }
  voltage / current
}

///|
/// 功率计算
/// P = V * I
pub fn power_vi(voltage : Double, current : Double) -> Double {
  voltage * current
}

///|
/// 功率计算 (电阻)
/// P = I² * R
pub fn power_resistance(current : Double, resistance : Double) -> Double {
  if abs(resistance) < EPSILON {
    return 0.0
  }
  square(current) * resistance
}

///|
/// 功率计算 (电阻, 使用电压)
/// P = V² / R
pub fn power_resistance_voltage(
  voltage : Double,
  resistance : Double,
) -> Double {
  if abs(resistance) < EPSILON {
    return 0.0
  }
  square(voltage) / resistance
}

///|
/// 电阻串联
/// R_total = R1 + R2 + ... + Rn
pub fn resistance_series(r1 : Double, r2 : Double) -> Double {
  r1 + r2
}

///|
/// 电阻并联
/// R_total = 1 / (1/R1 + 1/R2)
pub fn resistance_parallel(r1 : Double, r2 : Double) -> Double {
  if abs(r1) < EPSILON || abs(r2) < EPSILON {
    return 0.0
  }
  if abs(r1 + r2) < EPSILON {
    return 0.0
  }
  r1 * r2 / (r1 + r2)
}

///|
/// 基尔霍夫电流定律 (KCL)
/// ΣI_in = ΣI_out
pub fn kcl_current_sum(
  currents_in : Array[Double],
  currents_out : Array[Double],
) -> Bool {
  let mut sum_in = 0.0
  let mut sum_out = 0.0
  for i = 0; i < currents_in.length(); i = i + 1 {
    sum_in = sum_in + currents_in[i]
  }
  for i = 0; i < currents_out.length(); i = i + 1 {
    sum_out = sum_out + currents_out[i]
  }
  approx_equal(sum_in, sum_out, 0.001)
}

///|
/// 基尔霍夫电压定律 (KVL)
/// ΣV = 0 (回路)
pub fn kvl_voltage_sum(voltages : Array[Double]) -> Bool {
  let mut sum = 0.0
  for i = 0; i < voltages.length(); i = i + 1 {
    sum = sum + voltages[i]
  }
  approx_equal(sum, 0.0, 0.001)
}

///|
/// 分压公式
/// V_out = V_in * R2 / (R1 + R2)
pub fn voltage_divider(vin : Double, r1 : Double, r2 : Double) -> Double {
  if abs(r1 + r2) < EPSILON {
    return 0.0
  }
  vin * r2 / (r1 + r2)
}

///|
/// 分流公式
/// I1 = I_total * R2 / (R1 + R2)
pub fn current_divider(itotal : Double, r1 : Double, r2 : Double) -> Double {
  if abs(r1 + r2) < EPSILON {
    return 0.0
  }
  itotal * r2 / (r1 + r2)
}

// ==================== 交流电路 ====================

///|
/// 角频率
/// ω = 2πf
pub fn angular_frequency(freq : Double) -> Double {
  2.0 * PI * freq
}

///|
/// 频率
/// f = ω / (2π)
pub fn frequency(omega : Double) -> Double {
  omega / (2.0 * PI)
}

///|
/// 感抗
/// X_L = ωL = 2πfL
pub fn inductive_reactance(freq : Double, inductance : Double) -> Double {
  2.0 * PI * freq * inductance
}

///|
/// 容抗
/// X_C = 1/(ωC) = 1/(2πfC)
pub fn capacitive_reactance(freq : Double, capacitance : Double) -> Double {
  if abs(freq) < EPSILON || abs(capacitance) < EPSILON {
    return 0.0
  }
  1.0 / (2.0 * PI * freq * capacitance)
}

///|
/// 阻抗 (RL串联)
/// Z = R + jωL
pub fn impedance_rl_series(
  resistance : Double,
  freq : Double,
  inductance : Double,
) -> Complex {
  let xl = inductive_reactance(freq, inductance)
  { real: resistance, imag: xl }
}

///|
/// 阻抗 (RC串联)
/// Z = R - j/(ωC)
pub fn impedance_rc_series(
  resistance : Double,
  freq : Double,
  capacitance : Double,
) -> Complex {
  let xc = capacitive_reactance(freq, capacitance)
  { real: resistance, imag: -xc }
}

///|
/// 阻抗 (RLC串联)
/// Z = R + j(ωL - 1/(ωC))
pub fn impedance_rlc_series(
  resistance : Double,
  freq : Double,
  inductance : Double,
  capacitance : Double,
) -> Complex {
  let xl = inductive_reactance(freq, inductance)
  let xc = capacitive_reactance(freq, capacitance)
  { real: resistance, imag: xl - xc }
}

///|
/// 阻抗 (RL并联)
/// Z = (R * jωL) / (R + jωL)
pub fn impedance_rl_parallel(
  resistance : Double,
  freq : Double,
  inductance : Double,
) -> Complex {
  let xl = inductive_reactance(freq, inductance)
  let zl = { real: 0.0, imag: xl }
  let zr = { real: resistance, imag: 0.0 }
  let numerator = complex_multiply(zr, zl)
  let denominator = complex_add(zr, zl)
  complex_divide(numerator, denominator)
}

///|
/// 阻抗 (RC并联)
/// Z = (R * (-j/(ωC))) / (R - j/(ωC))
pub fn impedance_rc_parallel(
  resistance : Double,
  freq : Double,
  capacitance : Double,
) -> Complex {
  let xc = capacitive_reactance(freq, capacitance)
  let zc = { real: 0.0, imag: -xc }
  let zr = { real: resistance, imag: 0.0 }
  let numerator = complex_multiply(zr, zc)
  let denominator = complex_add(zr, zc)
  complex_divide(numerator, denominator)
}

///|
/// 谐振频率 (RLC串联)
/// f_0 = 1 / (2π√(LC))
pub fn resonance_frequency(inductance : Double, capacitance : Double) -> Double {
  if inductance <= 0.0 || capacitance <= 0.0 {
    return 0.0
  }
  1.0 / (2.0 * PI * (inductance * capacitance).sqrt())
}

///|
/// 品质因数 Q (RLC串联)
/// Q = ω_0 * L / R = 1 / (ω_0 * C * R)
pub fn quality_factor_rlc(
  freq : Double,
  inductance : Double,
  resistance : Double,
) -> Double {
  if abs(resistance) < EPSILON {
    return 0.0
  }
  let omega = angular_frequency(freq)
  omega * inductance / resistance
}

// ==================== 交流功率 ====================

///|
/// 视在功率
/// S = V * I
pub fn apparent_power(voltage : Double, current : Double) -> Double {
  voltage * current
}

///|
/// 有功功率
/// P = V * I * cos(φ) = S * cos(φ)
pub fn active_power(
  voltage : Double,
  current : Double,
  phase_angle_rad : Double,
) -> Double {
  voltage * current * cos(phase_angle_rad)
}

///|
/// 无功功率
/// Q = V * I * sin(φ) = S * sin(φ)
pub fn reactive_power(
  voltage : Double,
  current : Double,
  phase_angle_rad : Double,
) -> Double {
  voltage * current * sin(phase_angle_rad)
}

///|
/// 功率因数
/// PF = cos(φ) = P / S
pub fn power_factor(active_power : Double, apparent_power : Double) -> Double {
  if abs(apparent_power) < EPSILON {
    return 0.0
  }
  clamp(active_power / apparent_power, -1.0, 1.0)
}

///|
/// 功率因数角
/// φ = arccos(PF)
pub fn power_factor_angle(pf : Double) -> Double {
  let pf_clamped = clamp(pf, -1.0, 1.0)
  acos(pf_clamped)
}

///|
/// 功率三角形 - 视在功率
/// S = √(P² + Q²)
pub fn apparent_power_from_pq(
  active_power : Double,
  reactive_power : Double,
) -> Double {
  (square(active_power) + square(reactive_power)).sqrt()
}

// ==================== 变压器 ====================

///|
/// 变压器变比
/// n = N1 / N2 = V1 / V2 = I2 / I1
pub fn transformer_turns_ratio(n1 : Int, n2 : Int) -> Double {
  if n2 == 0 {
    return 0.0
  }
  n1.to_double() / n2.to_double()
}

///|
/// 变压器电压比
/// V2 = V1 * N2 / N1
pub fn transformer_voltage_ratio(v1 : Double, n1 : Int, n2 : Int) -> Double {
  if n1 == 0 {
    return 0.0
  }
  v1 * n2.to_double() / n1.to_double()
}

///|
/// 变压器电流比
/// I2 = I1 * N1 / N2
pub fn transformer_current_ratio(i1 : Double, n1 : Int, n2 : Int) -> Double {
  if n2 == 0 {
    return 0.0
  }
  i1 * n1.to_double() / n2.to_double()
}

///|
/// 变压器阻抗变换
/// Z2 = Z1 * (N2/N1)²
pub fn transformer_impedance_transformation(
  z1 : Double,
  n1 : Int,
  n2 : Int,
) -> Double {
  if n1 == 0 {
    return 0.0
  }
  let ratio = n2.to_double() / n1.to_double()
  z1 * square(ratio)
}

///|
/// 变压器效率
/// η = P_out / P_in
pub fn transformer_efficiency(p_out : Double, p_in : Double) -> Double {
  if abs(p_in) < EPSILON {
    return 0.0
  }
  clamp(p_out / p_in, 0.0, 1.0)
}

///|
/// 变压器损耗
/// P_loss = P_in - P_out
pub fn transformer_loss(p_in : Double, p_out : Double) -> Double {
  max(0.0, p_in - p_out)
}

// ==================== 电机 ====================

///|
/// 同步转速
/// n_s = 60 * f / p
/// 参数: f - 频率 (Hz), p - 极对数
pub fn synchronous_speed(freq : Double, pole_pairs : Int) -> Double {
  if pole_pairs <= 0 {
    return 0.0
  }
  60.0 * freq / pole_pairs.to_double()
}

///|
/// 转差率
/// s = (n_s - n) / n_s
/// 参数: ns - 同步转速, n - 实际转速
pub fn slip(sync_speed : Double, actual_speed : Double) -> Double {
  if abs(sync_speed) < EPSILON {
    return 0.0
  }
  (sync_speed - actual_speed) / sync_speed
}

///|
/// 异步电机实际转速
/// n = n_s * (1 - s)
pub fn induction_motor_speed(
  sync_speed : Double,
  slip_ratio : Double,
) -> Double {
  sync_speed * (1.0 - slip_ratio)
}

///|
/// 电机输出功率
/// P_out = T * ω
/// 参数: t - 转矩 (N·m), omega - 角速度 (rad/s)
pub fn motor_output_power(torque : Double, omega : Double) -> Double {
  torque * omega
}

///|
/// 电机输入功率
/// P_in = V * I * PF
pub fn motor_input_power(
  voltage : Double,
  current : Double,
  pf : Double,
) -> Double {
  voltage * current * pf
}

///|
/// 电机效率
/// η = P_out / P_in
pub fn motor_efficiency(p_out : Double, p_in : Double) -> Double {
  if abs(p_in) < EPSILON {
    return 0.0
  }
  clamp(p_out / p_in, 0.0, 1.0)
}

///|
/// 电机转矩
/// T = P / ω
pub fn motor_torque(power : Double, omega : Double) -> Double {
  if abs(omega) < EPSILON {
    return 0.0
  }
  power / omega
}

// ==================== 电力系统 ====================

///|
/// 三相功率 (星形连接)
/// P = √3 * V_L * I_L * cos(φ)
/// 参数: vl - 线电压, il - 线电流, pf - 功率因数
pub fn three_phase_power_star(vl : Double, il : Double, pf : Double) -> Double {
  3.0.sqrt() * vl * il * pf
}

///|
/// 三相功率 (三角形连接)
/// P = √3 * V_L * I_L * cos(φ)
pub fn three_phase_power_delta(vl : Double, il : Double, pf : Double) -> Double {
  three_phase_power_star(vl, il, pf)
}

///|
/// 线电压转相电压 (星形)
/// V_ph = V_L / √3
pub fn line_to_phase_voltage_star(vl : Double) -> Double {
  vl / 3.0.sqrt()
}

///|
/// 相电压转线电压 (星形)
/// V_L = V_ph * √3
pub fn phase_to_line_voltage_star(vph : Double) -> Double {
  vph * 3.0.sqrt()
}

///|
/// 线电流转相电流 (星形)
/// I_ph = I_L
pub fn line_to_phase_current_star(il : Double) -> Double {
  il
}

///|
/// 线电流转相电流 (三角形)
/// I_ph = I_L / √3
pub fn line_to_phase_current_delta(il : Double) -> Double {
  il / 3.0.sqrt()
}

///|
/// 短路电流
/// I_sc = V / Z
pub fn short_circuit_current(voltage : Double, impedance : Double) -> Double {
  if abs(impedance) < EPSILON {
    return 0.0
  }
  voltage / impedance
}

///|
/// 电压降
/// ΔV = I * R
pub fn voltage_drop(current : Double, resistance : Double) -> Double {
  current * resistance
}

///|
/// 电压降百分比
/// %ΔV = (ΔV / V) * 100
pub fn voltage_drop_percentage(
  voltage_drop : Double,
  voltage : Double,
) -> Double {
  if abs(voltage) < EPSILON {
    return 0.0
  }
  voltage_drop / voltage * 100.0
}

// ==================== 传输线 ====================

///|
/// 线路电阻
/// R = ρ * L / A
/// 参数: rho - 电阻率, l - 长度, a - 截面积
pub fn line_resistance(rho : Double, l : Double, a : Double) -> Double {
  if abs(a) < EPSILON {
    return 0.0
  }
  rho * l / a
}

///|
/// 线路电抗
/// X = ωL = 2πfL
pub fn line_reactance(
  freq : Double,
  inductance_per_unit : Double,
  length : Double,
) -> Double {
  2.0 * PI * freq * inductance_per_unit * length
}

///|
/// 线路电纳
/// B = ωC = 2πfC
pub fn line_susceptance(
  freq : Double,
  capacitance_per_unit : Double,
  length : Double,
) -> Double {
  2.0 * PI * freq * capacitance_per_unit * length
}

///|
/// 特性阻抗
/// Z_0 = √(L/C)
pub fn characteristic_impedance(
  inductance : Double,
  capacitance : Double,
) -> Double {
  if capacitance <= 0.0 {
    return 0.0
  }
  (inductance / capacitance).sqrt()
}

///|
/// 传播常数
/// γ = √((R+jωL)(G+jωC))
/// 简化: γ ≈ jω√(LC) (低损耗)
pub fn propagation_constant(
  freq : Double,
  inductance : Double,
  capacitance : Double,
) -> Complex {
  let omega = angular_frequency(freq)
  let term = omega * (inductance * capacitance).sqrt()
  { real: 0.0, imag: term }
}

// ==================== 电子器件 ====================

///|
/// 二极管正向压降 (简化)
/// V_F ≈ 0.7V (硅) 或 0.3V (锗)
pub fn diode_forward_voltage(is_silicon : Bool) -> Double {
  if is_silicon {
    0.7
  } else {
    0.3
  }
}

///|
/// 二极管反向饱和电流 (肖克利方程简化)
/// I_S ≈ I_0 * exp(-E_g/(k*T))
pub fn diode_reverse_saturation_current(
  i0 : Double,
  eg : Double,
  temp : Double,
) -> Double {
  if temp <= 0.0 {
    return 0.0
  }
  let kt = K_BOLTZMANN * temp
  if abs(kt) < EPSILON {
    return 0.0
  }
  i0 * @math.exp(-eg / kt)
}

///|
/// 晶体管电流增益 (共射)
/// β = I_C / I_B
pub fn transistor_beta(ic : Double, ib : Double) -> Double {
  if abs(ib) < EPSILON {
    return 0.0
  }
  ic / ib
}

///|
/// 晶体管集电极电流
/// I_C = β * I_B
pub fn transistor_collector_current(beta : Double, ib : Double) -> Double {
  beta * ib
}

///|
/// 运算放大器增益 (反相)
/// A_v = -R_f / R_in
pub fn opamp_inverting_gain(rf : Double, rin : Double) -> Double {
  if abs(rin) < EPSILON {
    return 0.0
  }
  -rf / rin
}

///|
/// 运算放大器增益 (同相)
/// A_v = 1 + R_f / R_in
pub fn opamp_non_inverting_gain(rf : Double, rin : Double) -> Double {
  if abs(rin) < EPSILON {
    return 0.0
  }
  1.0 + rf / rin
}

// ==================== 控制理论 ====================

///|
/// 一阶系统时间常数
/// τ = RC 或 τ = L/R
pub fn first_order_time_constant(r : Double, c_or_l : Double) -> Double {
  r * c_or_l
}

///|
/// 一阶系统响应 (阶跃)
/// y(t) = K * (1 - exp(-t/τ))
pub fn first_order_step_response(
  k : Double,
  t : Double,
  tau : Double,
) -> Double {
  if tau <= 0.0 {
    return k
  }
  k * (1.0 - @math.exp(-t / tau))
}

///|
/// 二阶系统自然频率
/// ω_n = √(k/m) 或 ω_n = 1/√(LC)
pub fn second_order_natural_frequency(
  k_or_l : Double,
  m_or_c : Double,
) -> Double {
  if m_or_c <= 0.0 {
    return 0.0
  }
  (k_or_l / m_or_c).sqrt()
}

///|
/// 二阶系统阻尼比
/// ζ = c / (2*√(k*m)) 或 ζ = R/(2*√(L/C))
pub fn second_order_damping_ratio(
  c_or_r : Double,
  k_or_l : Double,
  m_or_c : Double,
) -> Double {
  if m_or_c <= 0.0 {
    return 0.0
  }
  let term = (k_or_l * m_or_c).sqrt()
  if abs(term) < EPSILON {
    return 0.0
  }
  c_or_r / (2.0 * term)
}

///|
/// PID控制器输出
/// u(t) = K_p*e(t) + K_i*∫e(t)dt + K_d*de(t)/dt
/// 简化: u = K_p*e + K_i*integral + K_d*derivative
pub fn pid_controller_output(
  kp : Double,
  ki : Double,
  kd : Double,
  error : Double,
  integral : Double,
  derivative : Double,
) -> Double {
  kp * error + ki * integral + kd * derivative
}

// ==================== 信号分析 ====================

///|
/// 傅里叶级数系数 (简化, 方波)
/// a_n = (2*A/π) * sin(n*π/2) / n
pub fn fourier_coefficient_square_wave(amplitude : Double, n : Int) -> Double {
  if n == 0 {
    return 0.0
  }
  let n_double = n.to_double()
  2.0 * amplitude / PI * sin(n_double * PI / 2.0) / n_double
}

///|
/// 信号带宽
/// BW = f_high - f_low
pub fn signal_bandwidth(f_high : Double, f_low : Double) -> Double {
  max(0.0, f_high - f_low)
}

///|
/// 信噪比 (dB)
/// SNR = 20*log10(V_signal / V_noise)
pub fn signal_to_noise_ratio_db(v_signal : Double, v_noise : Double) -> Double {
  if abs(v_noise) < EPSILON {
    return 0.0
  }
  let ratio = v_signal / v_noise
  if ratio <= 0.0 {
    return 0.0
  }
  20.0 * @math.log10(ratio)
}

///|
/// 分贝转功率比
/// P_ratio = 10^(dB/10)
pub fn db_to_power_ratio(db : Double) -> Double {
  @math.pow(10.0, db / 10.0)
}

///|
/// 功率比转分贝
/// dB = 10*log10(P_ratio)
pub fn power_ratio_to_db(p_ratio : Double) -> Double {
  if p_ratio <= 0.0 {
    return 0.0
  }
  10.0 * @math.log10(p_ratio)
}

///|
/// 分贝转电压比
/// V_ratio = 10^(dB/20)
pub fn db_to_voltage_ratio(db : Double) -> Double {
  @math.pow(10.0, db / 20.0)
}

///|
/// 电压比转分贝
/// dB = 20*log10(V_ratio)
pub fn voltage_ratio_to_db(v_ratio : Double) -> Double {
  if v_ratio <= 0.0 {
    return 0.0
  }
  20.0 * @math.log10(v_ratio)
}

// ==================== 辅助函数 ====================

///|
/// 温度对电阻的影响
/// R(T) = R_0 * (1 + α*(T - T_0))
pub fn resistance_temperature(
  r0 : Double,
  alpha : Double,
  t : Double,
  t0 : Double,
) -> Double {
  r0 * (1.0 + alpha * (t - t0))
}

///|
/// 电容充电电压
/// V(t) = V_0 * (1 - exp(-t/(RC)))
pub fn capacitor_charging_voltage(
  v0 : Double,
  t : Double,
  r : Double,
  c : Double,
) -> Double {
  let tau = r * c
  if tau <= 0.0 {
    return v0
  }
  v0 * (1.0 - @math.exp(-t / tau))
}

///|
/// 电容放电电压
/// V(t) = V_0 * exp(-t/(RC))
pub fn capacitor_discharging_voltage(
  v0 : Double,
  t : Double,
  r : Double,
  c : Double,
) -> Double {
  let tau = r * c
  if tau <= 0.0 {
    return 0.0
  }
  v0 * @math.exp(-t / tau)
}

///|
/// 电感电流 (充电)
/// I(t) = (V/R) * (1 - exp(-t*R/L))
pub fn inductor_charging_current(
  v : Double,
  r : Double,
  l : Double,
  t : Double,
) -> Double {
  if abs(r) < EPSILON {
    return 0.0
  }
  let tau = l / r
  if tau <= 0.0 {
    return v / r
  }
  v / r * (1.0 - @math.exp(-t / tau))
}

///|
/// 电感电流 (放电)
/// I(t) = I_0 * exp(-t*R/L)
pub fn inductor_discharging_current(
  i0 : Double,
  r : Double,
  l : Double,
  t : Double,
) -> Double {
  let tau = l / r
  if tau <= 0.0 {
    return 0.0
  }
  i0 * @math.exp(-t / tau)
}
