//
//  main.m
//  Queue
//
//  Created by Robert Baghai on 6/1/16.
//  Copyright © 2016 Robert Baghai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node {
    int data;
    struct Node *nextNode;
} Node;

struct Node *top;

void createQueue();
void enqueue(int data);
void dequeue();
void traverseQueue();
void dequeueAll();
BOOL queueIsEmpty();
BOOL validQueueExists();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        createQueue();
        enqueue(1);
        enqueue(2);
        enqueue(3);
        dequeue();
        traverseQueue();
        dequeueAll();
    }
    return 0;
}

/*
    *If queue has not been created (if top is NULL), create a top node and have it point to NULL
 */
void createQueue() {
    if (top == NULL) {
        top = (Node*)malloc(sizeof(Node));
        top->nextNode = NULL;
    }
}

/*
    *If a valid queue exists, create a new node with the data
    *Traverse through the queue until we see the next node in the list is NULL
    *if the next node is NULL we add the new node to the bottom of the queue and have it point to NULL
    *do-while loop ensures the loop always runs at least once so a new node is always added to the queue
 */
void enqueue(int data) {
    if ( validQueueExists() ) {
        Node *tempPointer = top;
        Node *newNode     = (Node*)malloc(sizeof(Node));
        newNode->data     = data;
        newNode->nextNode = NULL;
        do {
            if (tempPointer->nextNode == NULL) {
                tempPointer->nextNode = newNode;
                tempPointer = newNode;
            }
            tempPointer = tempPointer->nextNode;
        } while (tempPointer != NULL);
    }
}

/*
    *if there is a valid queue and is not empty, remove from the queue whatever Top points to and have Top point to whatever the node to be removed (or dequeued) was pointing to
 */
void dequeue() {
    if( validQueueExists() && !queueIsEmpty() ){
        top->nextNode = top->nextNode->nextNode;
    }
}

/*
    *If the queue is valid and is not empty, traverse through the queue and print all data that exists in the queue
 */
void traverseQueue() {
    if( validQueueExists() && !queueIsEmpty() ) {
        Node *tempPointer = top->nextNode;
        while (tempPointer != NULL) {
            NSLog(@"%d",tempPointer->data);
            tempPointer = tempPointer->nextNode;
        }
    }
}

/*
    *As the elements in the Queue are bein iterated through they are being dequeued
 */

void dequeueAll() {
    if( validQueueExists() && !queueIsEmpty() ) {
        while (top->nextNode != NULL) {
            dequeue();
        }
        if ( queueIsEmpty() ) {
            NSLog(@"The Queue has been fully dequeued.");
        }
    }
}

#pragma mark - Queue Helper Methods

BOOL queueIsEmpty() {
    return (top->nextNode == NULL) ? YES : NO;
}

BOOL validQueueExists() {
    return (top != NULL) ? YES : NO;
}
