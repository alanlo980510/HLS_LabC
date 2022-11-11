#include <iostream>
using namespace std;
#include <math.h>
#include "fast.h"

typedef ap_uint<5> Cont_TYPE;



void shift_data(DTYPE buffer[N], DTYPE new_data){
    #pragma HLS INLINE

    for(int k=0;k<N-1;k++){
        #pragma HLS UNROLL
        buffer[k] = buffer[k+1];
    }
    buffer[N-1] = new_data;
}


//void calculation(DTYPE buffer[N], int threshold, Cont_TYPE &Comp_hard, Cont_TYPE &Comp_soft){
//    #pragma HLS INLINE
//
//    int loc_array[16] = {382, 254, 127, 0, 1, 2, 131, 260, 388, 516, 643, 770, 769, 768, 639, 510};
//    Cont_TYPE acc_hard=0;
//    Cont_TYPE acc_soft=0;
//
//    for(int k=0;k<16;k++){
//        #pragma HLS UNROLL
//        if( abs(buffer[385]-buffer[loc_array[k]]) > threshold ){
//            acc_soft += 1;
//            if( (k%4) == 0 )
//                acc_hard += 1;
////            else
////                acc_hard += 0;
//        }
////        else{
////            acc_soft += 0;
////            acc_hard += 0;
////        }
//    }
//    Comp_hard = acc_hard;
//    Comp_soft = acc_soft;
//}




void calculation(DTYPE buffer[N], int threshold, Cont_TYPE &Comp_hard, Cont_TYPE &Comp_soft){
    #pragma HLS INLINE

    Cont_TYPE acc1, acc2, acc3, acc4, acc5, acc6, acc7, acc8, acc9, acc10, acc11, acc12, acc13, acc14, acc15, acc16;

    // compare 1
    if( abs(buffer[385]-buffer[382]) > threshold )
		acc1 = 1;
	else
		acc1 = 0;
	// compare 2
	if( abs(buffer[385]-buffer[254]) > threshold )
		acc2 = 1;
	else
		acc2 = 0;
	// compare 3
	if( abs(buffer[385]-buffer[127]) > threshold )
		acc3 = 1;
	else
		acc3 = 0;
	// compare 4
	if( abs(buffer[385]-buffer[0]) > threshold )
		acc4 = 1;
	else
		acc4 = 0;
	// compare 5
	if( abs(buffer[385]-buffer[1]) > threshold )
		acc5 = 1;
	else
		acc5 = 0;
	// compare 6
	if( abs(buffer[385]-buffer[2]) > threshold )
		acc6 = 1;
	else
		acc6 = 0;
	// compare 7
	if( abs(buffer[385]-buffer[131]) > threshold )
		acc7 = 1;
	else
		acc7 = 0;
	// compare 8
	if( abs(buffer[385]-buffer[260]) > threshold )
		acc8 = 1;
	else
		acc8 = 0;
	// compare 9
	if( abs(buffer[385]-buffer[388]) > threshold )
		acc9 = 1;
	else
		acc9 = 0;
	// compare 10
	if( abs(buffer[385]-buffer[516]) > threshold )
		acc10 = 1;
	else
		acc10 = 0;
	// compare 11
	if( abs(buffer[385]-buffer[643]) > threshold )
		acc11 = 1;
	else
		acc11 = 0;
	// compare 12
	if( abs(buffer[385]-buffer[770]) > threshold )
		acc12 = 1;
	else
		acc12 = 0;
	// compare 13
	if( abs(buffer[385]-buffer[769]) > threshold )
		acc13 = 1;
	else
		acc13 = 0;
	// compare 14
	if( abs(buffer[385]-buffer[768]) > threshold )
		acc14 = 1;
	else
		acc14 = 0;
	// compare 15
	if( abs(buffer[385]-buffer[639]) > threshold )
		acc15 = 1;
	else
		acc15 = 0;
	// compare 16
	if( abs(buffer[385]-buffer[510]) > threshold )
		acc16 = 1;
	else
		acc16 = 0;


    Comp_hard = (acc1 + acc5 + acc9 + acc13);
    Comp_soft = (acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7 + acc8 + acc9 + acc10 + acc11 + acc12+ acc13 + acc14 + acc15 + acc16);
}




void write_data(DTYPE* img_out, bool out_en, int counter, DTYPE write_data){
    #pragma HLS INLINE
    if(out_en){
        img_out[counter] = write_data;
    }
}



void fast_accel(DTYPE* img_in, int threshold, DTYPE* img_out, int rows, int cols){   

    // data definition
    DTYPE buffer[N]={0};
    DTYPE new_data=0, out_data=0;
    Cont_TYPE Comp_hard, Comp_soft;

    ap_int<10> in_i=0, out_i=-4;
    ap_uint<7> in_j=0, out_j=127;
    bool out_en;

    Compute_Loop:
        for(int c_c=-385; c_c<16384; c_c++){
            // input new data
            if( (in_i<rows) && (in_j<cols) )
                new_data = img_in[in_i*rows+in_j];
            else
                new_data = 0;
            shift_data(buffer, new_data);

            if(in_j==127)
				in_i += 1;
			in_j += 1;

            // compute feature
            calculation(buffer, threshold, Comp_hard, Comp_soft);

            // write data
            out_en = (out_i>=0) && (out_j<cols);
            out_data = ((out_i>2)&&(out_i<rows-3)&&(out_j>2)&&(out_j<cols-3)) ? (((Comp_hard>=3)&&(Comp_soft>=12)) ? 255 : 0) : 0;
            if(out_en)
                write_data(img_out, out_en, out_i*rows+out_j, out_data);

            if(out_j==127)
            	out_i += 1;
            out_j += 1;
        }
}


