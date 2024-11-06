module wires(
	//UART
	input USART1_TX,
	output USART1_RX,
	output UART_TX1,
	input UART_RX1,
	input USART2_TX,
	output USART2_RX,
	output UART_TX2,
	input UART_RX2,
	input USART3_TX,
	output USART3_RX,
	output UART_TX3,
	input UART_RX3,
	//PWM
	input PWM_M,
	input PWM_M_N,
	output MORTOR,
	output MORTOR_N,
	input PWM_Raidar,
	output Raidar_PWM,
	input PWM_R,
	output ROUTER,
	//BUZZER
	input BUZZER,
	output BUZZERS,
	//DEBUG
	input U1,
	output U3
    );


	//UART
	assign UART_TX1 = USART1_TX;
	assign USART1_RX = UART_RX1;
//	assign UART_TX2 = USART2_TX;
//	assign USART2_RX = UART_RX2;
	assign UART_TX3 = USART3_TX;
	assign USART3_RX = UART_RX3;
//	assign UART_TX3 = UART_RX1;
//	assign UART_TX1 = UART_RX3;
//	assign UART_TX1 = UART_RX2;
//	assign UART_TX2 = UART_RX1;

	//PWM
	assign MORTOR = PWM_M_N ? 1'b0 : PWM_M;
	assign MORTOR_N = PWM_M_N ? PWM_M : 1'b0;
	assign ROUTER = PWM_R;
	assign Raidar_PWM = PWM_Raidar;


	//BUZZER
	assign BUZZERS = BUZZER;

	//DEBUG
	assign U3 = UART_RX2;
	assign UART_TX2 = U1;
	
endmodule
