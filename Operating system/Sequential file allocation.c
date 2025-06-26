#include <stdio.h>
#include <stdlib.h>

int main() {
    int f[50], i, st, len, j, c;

    // Step 1: Initialize all disk blocks as free (0)
    for (i = 0; i < 50; i++)
        f[i] = 0;

    // Step 2: Repeat until user exits
    do {
        printf("\nEnter the starting block and length of the file: ");
        scanf("%d%d", &st, &len);

        int flag = 0;

        // Step 3: Check availability of required blocks
        for (j = st; j < (st + len); j++) {
            if (f[j] != 0) {
                flag = 1;
                break;
            }
        }

        // Step 4: Allocate if available
        if (flag == 0) {
            for (j = st; j < (st + len); j++) {
                f[j] = 1;
                printf("Block %d allocated.\n", j);
            }
            printf("File allocated successfully!\n");
        } else {
            printf("Block(s) already allocated. File cannot be allocated.\n");
        }

        // Step 5: Ask if more files are to be allocated
        printf("Do you want to enter more files? (Yes - 1 / No - 0): ");
        scanf("%d", &c);

    } while (c == 1);

    return 0;
}