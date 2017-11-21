int searchMatrix(int **matrix, int matrixRowSize, int matrixColSize, int target)
{
  if (matrixRowSize == 0 || matrixColSize == 0) return 0;

  int left = 0, right = matrixRowSize * matrixColSize - 1;
  int mid;

  while (left != right) {
    mid = (left + right - 1) >> 1;
    if (matrix[mid / matrixColSize][mid % matrixColSize] < target)
      left = mid + 1;
    else
      right = mid;
  }

  return matrix[right / matrixColSize][right % matrixColSize] == target;
}

