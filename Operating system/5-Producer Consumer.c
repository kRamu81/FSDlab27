#include <stdio.h>
#include <stdlib.h>

int mutex = 1;
int full = 0;
int empty = 10;
int x = 0;

void producer() {
    --mutex;
    ++full;
    --empty;
    x++;
    printf("\nProducer produces item %d", x);
    ++mutex;
}

void consumer() {
    --mutex;
    --full;
    ++empty;
    printf("\nConsumer consumes item %d", x);
    x--;
    ++mutex;
}

int main() {
    int n;

    printf("\n1. Press 1 for Producer");
    printf("\n2. Press 2 for Consumer");
    printf("\n3. Press 3 for Exit");

    while (1) {
        printf("\n\nEnter your choice: ");
        scanf("%d", &n);

        switch (n) {
            case 1:
                if (mutex == 1 && empty != 0)
                    producer();
                else
                    printf("\nBuffer is full!");
                break;

            case 2:
                if (mutex == 1 && full != 0)
                    consumer();
                else
                    printf("\nBuffer is empty!");
                break;

            case 3:
                exit(0);

            default:
                printf("\nInvalid choice!");
        }
    }

    return 0;
}
