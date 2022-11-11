#include "cordiccart2pol.h"
#include <stdio.h>

// 2^(-k), k=0~15
data_t angles[NO_ITER] = {	0.785398163397448,		0.463647609000806,		0.244978663126864,		0.124354994546761,	
							0.0624188099959574,		0.0312398334302683,		0.0156237286204768,		0.00781234106010111,	
							0.00390623013196697,	0.00195312251647882,	0.000976562189559320};


void cordiccart2pol(data_t x, data_t y, data_t * r,  data_t * theta){
	data_t theta_out=0;
	data_t x_cordic, y_cordic, x_temp;

	// pre-rotate
	if(x>=0){
		x_cordic = x;
		y_cordic = y;
	}
	else{
		x_cordic = -x;
		y_cordic = -y;
	}

	x_temp = x_cordic;

	// cordic core
	cordic_loop:
	for(int i=0;i<NO_ITER;i++){

		// method 1
		if(y_cordic>=0){
			switch(i){
				case 0:
					x_cordic += y_cordic;
					y_cordic -= x_temp;
					break;
				case 1:
					x_cordic += (y_cordic>>1);
					y_cordic -= (x_temp>>1);
					break;
				case 2:
					x_cordic += (y_cordic>>2);
					y_cordic -= (x_temp>>2);
					break;
				case 3:
					x_cordic += (y_cordic>>3);
					y_cordic -= (x_temp>>3);
					break;
				case 4:
					x_cordic += (y_cordic>>4);
					y_cordic -= (x_temp>>4);
					break;
				case 5:
					x_cordic += (y_cordic>>5);
					y_cordic -= (x_temp>>5);
					break;
				case 6:
					x_cordic += (y_cordic>>6);
					y_cordic -= (x_temp>>6);
					break;
				case 7:
					x_cordic += (y_cordic>>7);
					y_cordic -= (x_temp>>7);
					break;
				case 8:
					x_cordic += (y_cordic>>8);
					y_cordic -= (x_temp>>8);
					break;
				case 9:
					x_cordic += (y_cordic>>9);
					y_cordic -= (x_temp>>9);
					break;
				case 10:
					x_cordic += (y_cordic>>10);
					y_cordic -= (x_temp>>10);
					break;
				default:
					break;
			}
			theta_out += angles[i];
		}
		else{
			switch(i){
				case 0:
					x_cordic -= y_cordic;
					y_cordic += x_temp;
					break;
				case 1:
					x_cordic -= (y_cordic>>1);
					y_cordic += (x_temp>>1);
					break;
				case 2:
					x_cordic -= (y_cordic>>2);
					y_cordic += (x_temp>>2);
					break;
				case 3:
					x_cordic -= (y_cordic>>3);
					y_cordic += (x_temp>>3);
					break;
				case 4:
					x_cordic -= (y_cordic>>4);
					y_cordic += (x_temp>>4);
					break;
				case 5:
					x_cordic -= (y_cordic>>5);
					y_cordic += (x_temp>>5);
					break;
				case 6:
					x_cordic -= (y_cordic>>6);
					y_cordic += (x_temp>>6);
					break;
				case 7:
					x_cordic -= (y_cordic>>7);
					y_cordic += (x_temp>>7);
					break;
				case 8:
					x_cordic -= (y_cordic>>8);
					y_cordic += (x_temp>>8);
					break;
				case 9:
					x_cordic -= (y_cordic>>9);
					y_cordic += (x_temp>>9);
					break;
				case 10:
					x_cordic -= (y_cordic>>10);
					y_cordic += (x_temp>>10);
					break;
				default:
					break;
			}
			theta_out -= angles[i];
		}
		x_temp = x_cordic;
	}

	// code correction
//	*r 	   = scaler * x_cordic;
	*r 	   = (x_cordic>>1) + (x_cordic>>3) - (x_cordic>>6)  - (x_cordic>>9);
	if(x>=0){*theta = theta_out;}
	else{
		if(y>=0){*theta = (data_t)3.14159265359 + theta_out;}
		else{*theta = theta_out - (data_t)3.14159265359;}
	}
}
