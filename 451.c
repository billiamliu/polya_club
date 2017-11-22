#include <stdio.h>
#include <stdlib.h>

#define ASCII 256

struct ll {
  char c;
  struct ll *next;
};

void addToFreq(struct ll **ll, char c)
{
  struct ll *p;

  p = malloc(sizeof(struct ll));
  p->c = c;
  p->next = NULL;

  if (*ll == NULL)
    *ll = p;
  else {
    p->next = *ll;
    *ll = p;
  }
}

char popChar(struct ll **l)
{
  if (*l == NULL)
    return '\0';

  struct ll *p;
  char c;
  
  c = (*l)->c;
  
  p = *l;
  *l = (*l)->next;
  free(p);

  return c;
}

char *frequencySort(char *s) {
  /* ASCII = 1 byte = 8 bits = 256 */
  int i, j, k, sleng = 0;
  int count[ASCII];

  for (k = 0; k < ASCII; k++)
    count[k] = 0;

  while (s[i] != '\0') {
    count[(int) s[i]]++;
    i++;
    sleng++;
  }

  struct ll *freq[sleng + 1];

  /* init freq */
  while (j < sleng + 1)
    freq[j++] = NULL;

  /* add count to freq */
  i = 0;
  while (i < ASCII) {
    if (count[i])
      addToFreq(&freq[count[i]], (char) i);
    i++;
  }

  char c;
  /* freq to string */
  j = 0;
  for (i = sleng; i > 0; i--) {
    if (freq[i] != NULL) 
      while ((c = popChar(&freq[i])) != '\0')
        for (k = 1; k <= i; k++)
          s[j++] = c;
  }
  
  return s;
}

char *test(char *s)
{
  int i, j;
  for (j = 0, i = 97; i < 103 && j < 6; i++, j++)
    s[j] = (char) i;

  return s;
}

int main(void)
{
  char str[] = "thequickbrownfoxjumpsoverthelazydog";
  printf("outer\n%s\n", frequencySort(str));
}
