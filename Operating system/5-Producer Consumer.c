// Program to simulate Producer-Consumer Problem using Semaphores
// Author: [Your Name]
// Date: [Exam Date]

#include <stdio.h>
#include <stdlib.h>

// Simulated semaphores and buffer variables
int mutex = 1;
int full = 0;
int empty = 10;
int x = 0;

// Function to simulate producer
void producer() {
    --mutex;
    ++full;
    --empty;
    x++;
    printf("\nProducer produces item %d", x);
    ++mutex;
}

// Function to simulate consumer
void consumer() {
    --mutex;
    --full;
    ++empty;
    printf("\nConsumer consumes item %d", x);
    x--;
    ++mutex;
}

// Main function with menu
int main() {
    int choice;

    printf("Producer-Consumer Problem using Semaphores (Simulated)\n");

    while (1) {
        printf("\n\n1. Press 1 to Produce");
        printf("\n2. Press 2 to Consume");
        printf("\n3. Press 3 to Exit");
        printf("\nEnter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                if (mutex == 1 && empty != 0) {
                    producer();
                } else {
                    printf("\nBuffer is full!");
                }
                break;

            case 2:
                if (mutex == 1 && full != 0) {
                    consumer();
                } else {
                    printf("\nBuffer is empty!");
                }
                break;

            case 3:
                exit(0);
                break;

            default:
                printf("\nInvalid choice! Please try again.");
        }
    }

    return 0;
}