//////////////////////////////////////////////////////////////////////////////////
// Group: Power Generation Trio
// Engineer: Yanagiha Mizuumi
//
// Create Date: 2024/10/1 16:00:00
// Project Name: basic
// Design Name: mine
// Module Name: PWM_out
// Target Devices: EQ6HL130-CSG484_H
// EDA Versions: elinx3.0.7
// Target Language: Verilog HDL
// Encoding Format: UTF-8
// Description: PWM生成模块
//
// Revision: V2.0.0
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module PWM_out #(
    parameter freq = 50,            // PWM频率
    parameter duty = 50,            // PWM占空比
    parameter clk_ = 50_000_000     // 输入时钟信号的频率
    )
(
    input       clkin,      // clk信号
    input       rst,        // rst信号
    input       en,         // PWM_out使能信号
    output reg  pwm_out     // PWM_out输出
);

    integer count_max = clk_ / freq - 1;                // 周期延时计数
    integer count_change = clk_ / freq * duty /100 - 1; // 下降沿延时计数
    reg [23:0] count;       // 延时计数

    // 周期延时计数
    always @(posedge clkin) begin
        if(rst | !en)
            count <= 1'b0;
        else if(count < count_max)
            count <= count + 1'b1;
        else
            count <= 1'b0;
    end

    // 下降沿延时计数
    always @(posedge clkin) begin
        if(rst | !en)
            pwm_out <= 1'b0;
        else if(count <= count_change)
            pwm_out <= 1'b1;
        else
            pwm_out <= 1'b0;
    end


endmodule
