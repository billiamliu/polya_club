#include <stdio.h>
int test[3][4] = {
  {1, 3, 5, 7},
  {10, 11, 16, 20},
  {23, 30, 34, 50}
};

int test2[3][1] = {
  {1},
  {3},
  {5}
};

int test3[2][1] = {
  {1}, {3}
};

int test4[18][2] = {
  {-10, -8},
  {-6, -5},
  {-2, -2},
  {-1, 0},
  {3, 4},
  {7, 7}, 
  {8, 9},
  {10, 10},
  {11, 11},
  {12, 14},
  {15, 16},
  {17, 19},
  {20, 21},
  {22, 22},
  {25, 27},
  {28, 30},
  {32, 32},
  {35, 36}
};

int bRangeSearch(int **matrix, int low, int high, int target)
{
  if (low > high) return -1;
  if (high == 0) return 0;

  if (matrix[high][0] == target) return high;
  if (matrix[high][0] > target && matrix[high - 1][0] <= target) {
    return high - 1;
  }
  if (low == high) return low;

  int middle = (low + high) / 2;

  if (matrix[middle][0] <= target && matrix[middle + 1][0] > target)
    return middle;

  if (matrix[middle][0] > target)
    return bRangeSearch(matrix, low, middle - 1, target);
  else
    return bRangeSearch(matrix, middle + 1, high, target);
}

int bTargetSearch(int *row, int low, int high, int target)
{
  if (low > high) return -1;

  int middle = (low + high) / 2;

  if (row[middle] == target)
    return middle;

  if (row[middle] > target)
    return bTargetSearch(row, low, middle - 1, target);
  else
    return bTargetSearch(row, middle + 1, high, target);
}

int searchMatrix(int **matrix, int matrixRowSize, int matrixColSize, int target)
{
  int rowIdx;;
  int found;

  rowIdx = bRangeSearch(matrix, 0, matrixRowSize - 1, target);
  
  if (rowIdx == -1)
    return 0;

  found = bTargetSearch(matrix[rowIdx], 0, matrixColSize - 1, target);

  return found != -1;
}

int main(void)
{
  int *matrix[20];
  int i;

  for (i = 0; i < 3; i++)
    matrix[i] = test[i];
  printf(searchMatrix(matrix, 3, 4, 11) ? "correct\n" : "incorrect\n");

  for (i = 0; i < 3; i++)
    matrix[i] = test2[i];
  printf(searchMatrix(matrix, 3, 1, 4) ? "incorrect\n" : "correct\n");

  for (i = 0; i < 2; i++)
    matrix[i] = test3[i];
  printf(searchMatrix(matrix, 2, 1, 4) ? "incorrect\n" : "correct\n");

  for (i = 0; i < 18; i++)
    matrix[i] = test4[i];
  printf(searchMatrix(matrix, 18, 2, 16) ? "correct\n" : "incorrect\n");
}
