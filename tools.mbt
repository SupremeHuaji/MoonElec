// MoonElec - 工具函数

// ==================== 基本数学运算 ====================

///|
/// 计算平方
pub fn square(x : Double) -> Double {
  x * x
}

///|
/// 计算立方
pub fn cube(x : Double) -> Double {
  x * x * x
}

///|
/// 计算四次方
pub fn pow4(x : Double) -> Double {
  let x2 = x * x
  x2 * x2
}

///|
/// 计算绝对值
pub fn abs(x : Double) -> Double {
  if x < 0.0 {
    -x
  } else {
    x
  }
}

///|
/// 计算最大值
pub fn max(a : Double, b : Double) -> Double {
  if a > b {
    a
  } else {
    b
  }
}

///|
/// 计算最小值
pub fn min(a : Double, b : Double) -> Double {
  if a < b {
    a
  } else {
    b
  }
}

///|
/// 安全除法，分母为零时返回默认值
pub fn safe_div(num : Double, den : Double, fallback : Double) -> Double {
  if abs(den) <= EPSILON {
    fallback
  } else {
    num / den
  }
}

///|
/// 判断两个浮点数是否近似相等
pub fn approx_equal(a : Double, b : Double, tolerance : Double) -> Bool {
  abs(a - b) < tolerance
}

///|
/// 限制值在范围内
pub fn clamp(value : Double, min_val : Double, max_val : Double) -> Double {
  if value < min_val {
    min_val
  } else if value > max_val {
    max_val
  } else {
    value
  }
}

// ==================== 角度转换 ====================

///|
/// 角度转弧度
pub fn deg_to_rad(deg : Double) -> Double {
  deg * PI / 180.0
}

///|
/// 弧度转角度
pub fn rad_to_deg(rad : Double) -> Double {
  rad * 180.0 / PI
}

// ==================== 三角函数 ====================

///|
/// 正弦函数
pub fn sin(x : Double) -> Double {
  @math.sin(x)
}

///|
/// 余弦函数
pub fn cos(x : Double) -> Double {
  @math.cos(x)
}

///|
/// 正切函数
pub fn tan(x : Double) -> Double {
  @math.tan(x)
}

///|
/// 反正切函数 (返回弧度)
pub fn atan2(y : Double, x : Double) -> Double {
  @math.atan2(y, x)
}

///|
/// 反正弦函数 (返回弧度)
pub fn asin(x : Double) -> Double {
  @math.asin(x)
}

///|
/// 反余弦函数 (返回弧度)
pub fn acos(x : Double) -> Double {
  @math.acos(x)
}

// ==================== 复数运算 ====================

///|
/// 复数结构
pub struct Complex {
  real : Double
  imag : Double
}

///|
/// 创建复数
pub fn complex(real : Double, imag : Double) -> Complex {
  { real, imag }
}

///|
/// 复数模长
/// |z| = √(a² + b²)
pub fn complex_magnitude(z : Complex) -> Double {
  (square(z.real) + square(z.imag)).sqrt()
}

///|
/// 复数相位角 (弧度)
/// φ = arctan(b/a)
pub fn complex_phase(z : Complex) -> Double {
  atan2(z.imag, z.real)
}

///|
/// 复数相加
pub fn complex_add(z1 : Complex, z2 : Complex) -> Complex {
  { real: z1.real + z2.real, imag: z1.imag + z2.imag }
}

///|
/// 复数相减
pub fn complex_subtract(z1 : Complex, z2 : Complex) -> Complex {
  { real: z1.real - z2.real, imag: z1.imag - z2.imag }
}

///|
/// 复数相乘
/// (a+bi)(c+di) = (ac-bd) + (ad+bc)i
pub fn complex_multiply(z1 : Complex, z2 : Complex) -> Complex {
  {
    real: z1.real * z2.real - z1.imag * z2.imag,
    imag: z1.real * z2.imag + z1.imag * z2.real,
  }
}

///|
/// 复数相除
/// (a+bi)/(c+di) = ((ac+bd) + (bc-ad)i) / (c²+d²)
pub fn complex_divide(z1 : Complex, z2 : Complex) -> Complex {
  let denom = square(z2.real) + square(z2.imag)
  if abs(denom) < EPSILON {
    return { real: 0.0, imag: 0.0 }
  }
  {
    real: (z1.real * z2.real + z1.imag * z2.imag) / denom,
    imag: (z1.imag * z2.real - z1.real * z2.imag) / denom,
  }
}

///|
/// 复数共轭
pub fn complex_conjugate(z : Complex) -> Complex {
  { real: z.real, imag: -z.imag }
}

///|
/// 复数倒数
pub fn complex_reciprocal(z : Complex) -> Complex {
  let mag_sq = square(z.real) + square(z.imag)
  if abs(mag_sq) < EPSILON {
    return { real: 0.0, imag: 0.0 }
  }
  { real: z.real / mag_sq, imag: -z.imag / mag_sq }
}

///|
/// 从极坐标创建复数
/// z = r * e^(i*θ) = r*cos(θ) + i*r*sin(θ)
pub fn complex_from_polar(r : Double, theta_rad : Double) -> Complex {
  { real: r * cos(theta_rad), imag: r * sin(theta_rad) }
}

///|
/// 复数转极坐标 - 模长
pub fn complex_to_polar_magnitude(z : Complex) -> Double {
  complex_magnitude(z)
}

///|
/// 复数转极坐标 - 相位角
pub fn complex_to_polar_phase(z : Complex) -> Double {
  complex_phase(z)
}

// ==================== 信号处理 ====================

///|
/// RMS值 (均方根)
/// RMS = √(1/T * ∫x²(t)dt)
/// 对于正弦波: RMS = A/√2
pub fn rms_sine(amplitude : Double) -> Double {
  amplitude / 2.0.sqrt()
}

///|
/// 峰值转RMS (正弦波)
pub fn peak_to_rms(peak : Double) -> Double {
  rms_sine(peak)
}

///|
/// RMS转峰值 (正弦波)
pub fn rms_to_peak(rms : Double) -> Double {
  rms * 2.0.sqrt()
}

///|
/// 平均值 (正弦波半周期)
pub fn average_sine_half(amplitude : Double) -> Double {
  2.0 * amplitude / PI
}

// ==================== 滤波器 ====================

///|
/// 低通滤波器截止频率
/// f_c = 1 / (2*π*R*C)
pub fn lowpass_cutoff_frequency(r : Double, c : Double) -> Double {
  if r <= 0.0 || c <= 0.0 {
    return 0.0
  }
  1.0 / (2.0 * PI * r * c)
}

///|
/// 高通滤波器截止频率
/// f_c = 1 / (2*π*R*C)
pub fn highpass_cutoff_frequency(r : Double, c : Double) -> Double {
  lowpass_cutoff_frequency(r, c)
}

///|
/// 带通滤波器中心频率
/// f_0 = 1 / (2*π*√(L*C))
pub fn bandpass_center_frequency(l : Double, c : Double) -> Double {
  if l <= 0.0 || c <= 0.0 {
    return 0.0
  }
  1.0 / (2.0 * PI * (l * c).sqrt())
}

///|
/// 带通滤波器带宽
/// BW = R / (2*π*L)
pub fn bandpass_bandwidth(r : Double, l : Double) -> Double {
  if l <= 0.0 {
    return 0.0
  }
  r / (2.0 * PI * l)
}

///|
/// 品质因数 Q
/// Q = f_0 / BW
pub fn quality_factor(f0 : Double, bw : Double) -> Double {
  if abs(bw) < EPSILON {
    return 0.0
  }
  f0 / bw
}
