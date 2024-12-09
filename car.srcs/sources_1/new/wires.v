module wires(
	input clk,
	//USART
	input USART1_TX,
	output USART1_RX,
	input USART2_TX,
	output USART2_RX,
	input USART3_TX,
	output USART3_RX,
	//I2C
	input MCU_SDA,
	input MCU_SCL,
	//PWM
	input PWM_M,
	input PWM_M_N,
	output MORTOR,
	output MORTOR_N,
	input PWM_R,
	output ROUTER,
	//Ranging
	input Left_RX,
	output Left_TX,
	input Right_RX,
	output Right_TX,
	//GPS
	input GPS_RX,
	output GPS_TX,
	//IMU
	input IMU_RX,
	output IMU_TX,
	//BL
	input BL_RX,
	output BL_TX,
	//OLED
	output OLED_SDA,
	output OLED_SCL,
	input rstn,
	//Coder
	input Coder_A,
	input Coder_B,
	output PWM3,
	output PWM4,
	//Light
	input control,
	output BUZZER,
	//DEBUG
	input U1,
	output U3,
	input V8,
	output V7,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,
	output LED6
    );
	
	//PWM
	assign MORTOR = PWM_M_N ? 1'b1 : PWM_M;
	assign MORTOR_N = PWM_M_N ? PWM_M : 1'b1;
	assign ROUTER = PWM_R;
	
	//Ranging
	wire Ranging_RX;
	assign Ranging_RX = Left_RX ? Right_RX : 1'b0;
	assign Left_TX = USART3_TX;
	assign Right_TX = USART3_TX;
	assign USART3_RX = Ranging_RX;

	//GPS
	assign USART1_RX = GPS_RX;
//	assign GPS_TX = USART1_TX;

	//IMU
	assign IMU_TX = USART2_TX;
	assign USART2_RX = IMU_RX;
	
	//BL
	assign BL_TX = USART1_TX;
//	assign USART1_RX = BL_RX;

	//OLED
	assign OLED_SDA = MCU_SDA;
	assign OLED_SCL = MCU_SCL;
	
	//Coder
	assign PWM3 = Coder_A;
	assign PWM4 = Coder_B;
	
	//Light
	PWM_out #(
	.freq(1000)
	)PWM_out1(
	.clkin	(clk),
	.rst(!rstn),
	.en(control),
	.pwm_out(BUZZER)
	);
	//DEBUG
//	assign U3 = Ranging_RX;
//	assign GPS_TX = U1;
//	assign V7 = Ranging_RX;
//	assign IMU_TX = V8;
//	assign Right_TX = V8;
//	assign BL_TX = GPS_RX;
	assign LED1 = !control;
	assign LED2 = 1'b1;
	assign LED3 = 1'b1;
	assign LED4 = 1'b1;
	assign LED5 = 1'b1;
	assign LED6 = 1'b1;
	
endmodule