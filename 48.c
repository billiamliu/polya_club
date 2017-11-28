#include <stdio.h>

void swap(int *h, int *i, int *j, int *k)
{
  int temp;
  temp = *k;
  *k = *j;
  *j = *i;
  *i = *h;
  *h = temp;
}

void rotate(int **matrix, int size, int _)
{
  /* matrix is n by n, only using row size */
  int i, j, end;

  end = (size >> 1) + (size % 2);
  size--;

  for (i = 0; i < end; i++)
    for (j = i; j < size - i; j++)
      swap(
          &matrix[i][j],
          &matrix[j][size - i],
          &matrix[size - i][size - j],
          &matrix[size - j][i]
          );
}

void printMatrix(int **matrix, int row, int col)
{
  int i, j;

  for (i = 0; i < row; i++) {
    for (j = 0; j < col; j++)
      printf("%3d", matrix[i][j]);
    printf("\n");
  }
}

int main(void)
{
  int r1[] = {1, 2, 3, 4};
  int r2[] = {5, 6, 7, 8};
  int r3[] = {9, 10, 11, 12};
  int r4[] = {13, 14, 15, 16};
  int *mat[] = {r1, r2, r3, r4};

  int r31[] = {1, 2, 3};
  int r32[] = {4, 5, 6};
  int r33[] = {7, 8, 9};
  int *mat3[] = {r31, r32, r33};

  rotate(mat3, 3, 3);
  printMatrix(mat3, 3, 3);

  rotate(mat, 4, 4);
  printMatrix(mat, 4, 4);

  return 0;
}
