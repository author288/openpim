#include <verilated.h>
#include <verilated_vcd_c.h>
#include "VTile_tb.h" // revise here

int main(int argc, char** argv){
//构造环境对象，设计对象，波形对象
  VerilatedContext* m_contextp = new VerilatedContext;//环境
  VerilatedVcdC*    m_tracep   = new VerilatedVcdC;//波形
  VTile_tb*     m_duvp     = new VTile_tb;//设计
//波形配置
  m_contextp->traceEverOn(true);//环境里打开波形开关
  m_duvp->trace(m_tracep,3);//深度为3
  m_tracep->open("wave.vcd");//打开要存数据的vcd文件
//写入数据到波形文件里
  while (!m_contextp->gotFinish()){
  //刷新电路状态
    m_duvp->eval();
  //dump数据
    m_tracep->dump(m_contextp->time());
  //增加仿真时间
    m_contextp->timeInc(1);
  }
//记得关闭trace对象以保存文件里的数据
  m_tracep->close();
//释放内存
  delete m_duvp;
  return 0;
}
