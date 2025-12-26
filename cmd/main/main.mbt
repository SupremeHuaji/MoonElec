///|
fn main {
  // 示例：直流电路计算
  let v = @lib.ohm_law_voltage(2.0, 10.0)
  let p = @lib.power_vi(v, 2.0)
  println("电压: \{v} V")
  println("功率: \{p} W")

  // 示例：交流电路计算
  let omega = @lib.angular_frequency(50.0)
  let xl = @lib.inductive_reactance(50.0, 0.1)
  println("角频率: \{omega} rad/s")
  println("感抗: \{xl} Ω")

  // 示例：变压器计算
  let v2 = @lib.transformer_voltage_ratio(220.0, 1000, 100)
  println("变压器输出电压: \{v2} V")
}
