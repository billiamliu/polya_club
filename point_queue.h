typedef struct job {
  struct job *next;
  int x;
  int y;
} Job;

typedef struct queue {
  struct job *head;
  struct job *tail;
} Queue;

Queue *makeQueue(void);
Job *createJob(int, int);
void enqueue(Queue *, Job *);
Job *dequeue(Queue *);

