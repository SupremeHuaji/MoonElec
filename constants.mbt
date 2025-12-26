// MoonElec - 电气工程常量定义

// ==================== 数学常量 ====================

///|
/// 圆周率
pub const PI : Double = 3.141592653589793

///|
/// 浮点数比较精度
pub const EPSILON : Double = 1.0e-10

// ==================== 基本物理常数 ====================

///|
/// 真空介电常数 (F/m)
pub const EPSILON_0 : Double = 8.854187817e-12

///|
/// 真空磁导率 (H/m)
pub const MU_0 : Double = 4.0 * PI * 1.0e-7

///|
/// 光速 (m/s)
pub const C_LIGHT : Double = 299792458.0

///|
/// 基本电荷 (C)
pub const E_CHARGE : Double = 1.602176634e-19

///|
/// 玻尔兹曼常数 (J/K)
pub const K_BOLTZMANN : Double = 1.380649e-23

///|
/// 普朗克常数 (J·s)
pub const H_PLANCK : Double = 6.62607015e-34

// ==================== 材料电学性质 ====================

///|
/// 铜电阻率 (Ω·m)
pub const RHO_CU : Double = 1.68e-8

///|
/// 铝电阻率 (Ω·m)
pub const RHO_AL : Double = 2.65e-8

///|
/// 银电阻率 (Ω·m)
pub const RHO_AG : Double = 1.59e-8

///|
/// 铁电阻率 (Ω·m)
pub const RHO_FE : Double = 9.7e-8

///|
/// 铜温度系数 (1/℃)
pub const ALPHA_CU : Double = 0.00393

///|
/// 铝温度系数 (1/℃)
pub const ALPHA_AL : Double = 0.0039

// ==================== 介电常数 ====================

///|
/// 空气相对介电常数
pub const EPSILON_R_AIR : Double = 1.0006

///|
/// 水相对介电常数
pub const EPSILON_R_WATER : Double = 80.0

///|
/// 玻璃相对介电常数
pub const EPSILON_R_GLASS : Double = 5.0

///|
/// 陶瓷相对介电常数
pub const EPSILON_R_CERAMIC : Double = 6.0

// ==================== 磁导率 ====================

///|
/// 空气相对磁导率
pub const MU_R_AIR : Double = 1.0

///|
/// 铁相对磁导率 (典型值)
pub const MU_R_IRON : Double = 5000.0

///|
/// 硅钢相对磁导率
pub const MU_R_SILICON_STEEL : Double = 7000.0

// ==================== 标准频率 ====================

///|
/// 工频 (Hz) - 中国
pub const FREQ_50HZ : Double = 50.0

///|
/// 工频 (Hz) - 美国
pub const FREQ_60HZ : Double = 60.0

///|
/// 角频率 (rad/s) - 50Hz
pub const OMEGA_50HZ : Double = 2.0 * PI * 50.0

///|
/// 角频率 (rad/s) - 60Hz
pub const OMEGA_60HZ : Double = 2.0 * PI * 60.0

// ==================== 标准电压等级 ====================

///|
/// 低压 (V)
pub const VOLTAGE_LV : Double = 380.0

///|
/// 中压 (V)
pub const VOLTAGE_MV : Double = 10000.0

///|
/// 高压 (V)
pub const VOLTAGE_HV : Double = 35000.0

///|
/// 超高压 (V)
pub const VOLTAGE_EHV : Double = 220000.0

///|
/// 特高压 (V)
pub const VOLTAGE_UHV : Double = 1000000.0

// ==================== 功率因数 ====================

///|
/// 标准功率因数 (感性)
pub const PF_STD_INDUCTIVE : Double = 0.85

///|
/// 标准功率因数 (容性)
pub const PF_STD_CAPACITIVE : Double = -0.85

///|
/// 单位功率因数
pub const PF_UNITY : Double = 1.0

// ==================== 电机参数 ====================

///|
/// 异步电机效率 (典型值)
pub const EFFICIENCY_ASYNC_MOTOR : Double = 0.85

///|
/// 同步电机效率 (典型值)
pub const EFFICIENCY_SYNC_MOTOR : Double = 0.92

///|
/// 直流电机效率 (典型值)
pub const EFFICIENCY_DC_MOTOR : Double = 0.80

// ==================== 变压器参数 ====================

///|
/// 变压器效率 (典型值)
pub const EFFICIENCY_TRANSFORMER : Double = 0.95

///|
/// 变压器空载损耗系数
pub const TRANSFORMER_NO_LOAD_LOSS : Double = 0.01

///|
/// 变压器负载损耗系数
pub const TRANSFORMER_LOAD_LOSS : Double = 0.02

// ==================== 半导体参数 ====================

///|
/// 硅禁带宽度 (eV)
pub const E_GAP_SI : Double = 1.12

///|
/// 锗禁带宽度 (eV)
pub const E_GAP_GE : Double = 0.67

///|
/// 本征载流子浓度 (Si, cm⁻³)
pub const N_I_SI : Double = 1.5e10

///|
/// 热电压 (V, 室温)
pub const V_T : Double = 0.026

// ==================== 单位换算 ====================

///|
/// kV 转 V
pub const KV_TO_V : Double = 1000.0

///|
/// V 转 kV
pub const V_TO_KV : Double = 0.001

///|
/// MW 转 W
pub const MW_TO_W : Double = 1000000.0

///|
/// W 转 MW
pub const W_TO_MW : Double = 0.000001

///|
/// kW 转 W
pub const KW_TO_W : Double = 1000.0

///|
/// W 转 kW
pub const W_TO_KW : Double = 0.001

///|
/// MVA 转 VA
pub const MVA_TO_VA : Double = 1000000.0

///|
/// VA 转 MVA
pub const VA_TO_MVA : Double = 0.000001

///|
/// kVA 转 VA
pub const KVA_TO_VA : Double = 1000.0

///|
/// VA 转 kVA
pub const VA_TO_KVA : Double = 0.001

///|
/// mH 转 H
pub const MH_TO_H : Double = 0.001

///|
/// H 转 mH
pub const H_TO_MH : Double = 1000.0

///|
/// μF 转 F
pub const UF_TO_F : Double = 1.0e-6

///|
/// F 转 μF
pub const F_TO_UF : Double = 1000000.0

///|
/// nF 转 F
pub const NF_TO_F : Double = 1.0e-9

///|
/// F 转 nF
pub const F_TO_NF : Double = 1000000000.0

///|
/// pF 转 F
pub const PF_TO_F : Double = 1.0e-12

///|
/// F 转 pF
pub const F_TO_PF : Double = 1000000000000.0

///|
/// 度转弧度
pub const DEG_TO_RAD : Double = 0.017453292519943295

///|
/// 弧度转度
pub const RAD_TO_DEG : Double = 57.29577951308232

///|
/// Hz 转 rad/s
pub const HZ_TO_RAD_S : Double = 2.0 * PI

///|
/// rad/s 转 Hz
pub const RAD_S_TO_HZ : Double = 1.0 / (2.0 * PI)


