#include <stdio.h>

#define N 6
#define M 6

void process(int n, int m, int matrix [N][M], int *result)
{
    int current_sum = 0;
    int largest_sum = -2147483648;
  
    (*result)  = 0;
    for (int i = 0; i < m; ++i) {
        current_sum = 0;
        for (int j = 0; j < n; ++j) {
            current_sum += matrix[j][i];
        }
        
        if (current_sum > largest_sum) {            
            largest_sum = current_sum;
            (*result)  = i;
        }
  
//        if (i == 0) {
//            largest_sum = current_sum;
//            (*result) = 0;
//        }            
        
    }

}

int main(int argc, char** argv)
{
    int matrix[M][N] = {
    {-2, -94, -13, -5,    0, -21},
    {-1,  -4, -13, -5,    0, -21},
    {-5,  -2, -10, -5,    0, -21},
    {-1, -46,  -1, -5,    0, -21},
    {-5, -23,  -7, -5,    0, -21},
    {-2, -74,  13, -5, -100,-200}};

    int result;


    process(N, M, matrix, &result);


        printf("%d column with maximum sum of elements\n", result);


    return 0;
}