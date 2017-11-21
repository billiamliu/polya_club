#include <stdlib.h>

struct job {
  struct job *next;
  int x;
  int y;
};

struct queue {
  struct job *head;
  struct job *tail;
};

struct queue *
makeQueue()
{
  struct queue *q = malloc(sizeof(struct queue));
  q->head = q->tail = NULL;
  return q;
}

struct job *
createJob(int x, int y)
{
  struct job *job = malloc(sizeof(struct job));
  job->next = NULL;
  job->x = x;
  job->y = y;

  return job;
}

void enqueue(struct queue *q, struct job *j)
{
  if (q->head == NULL) {
    q->head = q->tail = j;
  } else {
    q->tail->next = j;
    q->tail = j;
  }
}

struct job *dequeue(struct queue *q)
{
  if (q->head == NULL)
    return NULL;

  struct job *temp;
  temp = q->head;
  q->head = q->head->next;

  if (q->head == NULL)
    q->tail = NULL;

  return temp;
};
