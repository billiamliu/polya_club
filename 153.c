#include <stdio.h>

int findMin(int *nums, int numsSize)
{
  int i, j = 0;

  for (i = 1; i < numsSize; i++)
    if (nums[i] < nums[j])
      j = i;

  return nums[j];
}

int main(void)
{
  int res;
  int arr[] = {1, 2, 0};

  res = findMin(arr, 3);

  printf("%d\n", res);
}
