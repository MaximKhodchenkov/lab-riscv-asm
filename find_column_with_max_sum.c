#include <stdio.h>

#define N 3
#define M 3

void process(int n, int m, int matrix [M][N], int *result)
{
    int current_sum = 0;
    int largest_sum = 0;

    (*result)  = 0;

    for (int i = 0; i < m; ++i) {
        current_sum = 0;
        for (int j = 0; j < n; ++j) {
            current_sum += matrix[i][j];
        }
        if (current_sum > largest_sum) {
            largest_sum = current_sum;
            (*result)  = i;
        }
        
//      else if (i == 0) {
//          largest_sum = current_sum;
//          (*result) = 0;
//      }            
        
    }

}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int result;
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, &result);


        printf("%d ", result);


    return 0;
}