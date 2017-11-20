#include <stdlib.h>
#include <stdio.h>

char test[4][5] = {
  {'1', '0', '1', '0', '1'},
  {'1', '1', '1', '0', '0'},
  {'0', '0', '1', '0', '0'},
  {'0', '0', '1', '0', '1'}
};

void fill(char **grid, int **visited, int row, int col, int i, int j)
{
  visited[i][j] = 1;

  if (i + 1 < row && grid[i + 1][j] == '1' && !visited[i + 1][j]) {
    fill(grid, visited, row, col, i + 1, j);
  }
  if (i + 1 < row && j + 1 < col && grid[i + 1][j + 1] == '1' && !visited[i + 1][j + 1]) {
    fill(grid, visited, row, col, i + 1, j + 1);
  }
  if (i - 1 >= 0 && grid[i - 1][j] == '1' && !visited[i - 1][j]) {
    fill(grid, visited, row, col, i - 1, j);
  }
  if (i - 1 >= 0 && j - 1 >= 0 && grid[i - 1][j - 1] == '1' && !visited[i - 1][j - 1]) {
    fill(grid, visited, row, col, i - 1, j - 1);
  }
}

void initGrid(int **grid, int row, int col)
{
  int i, j;
  for (i = 0; i < row; i++) {
    grid[i] = malloc(sizeof(int) * col);
    for (j = 0; j < col; j++)
      grid[i][j] = 0;
  }
}

int numIslands(char **grid, int gridRowSize, int gridColSize)
{
  int i, j, count;
  int *visited[gridRowSize];

  initGrid(visited, gridRowSize, gridColSize);

  count = 0;
  for (i = 0; i < gridRowSize; i++) {
    for (j = 0; j < gridColSize; j++) {
      if (grid[i][j] == '1' && !visited[i][j]) {
        fill(grid, visited, gridRowSize, gridColSize, i, j);
        count++;
      }
    }
  }

  return count;
}

int main(void)
{
  int i;
  char *testGrid[4];
  for (i = 0; i < 4; i++)
    testGrid[i] = test[i];

  printf("ans: %d\n", numIslands(testGrid, 4, 5));
}
