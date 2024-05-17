#ifndef WORKQUEUE_H
#define WORKQUEUE_H

typedef struct WorkQueueItem {
    char s[100];
} WorkQueueItem;

typedef struct WorkQueue WorkQueue;

WorkQueue* workQueueNew();

// Removes the top item from work queue:
WorkQueueItem* workQueueTake(WorkQueue* q);

// Adds an item to the top of work queue:
void workQueuePush(WorkQueue* q, WorkQueueItem* item);

// Removes the bottom item from work queue:
WorkQueueItem* workQueueSteal(WorkQueue* q);

#endif
