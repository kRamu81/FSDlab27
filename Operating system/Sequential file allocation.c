#include <stdio.h>

int main() {
    int file[50], i, startBlock, length, j, flag = 0;

    for(i = 0; i < 50; i++)
        file[i] = 0;  // Initially all blocks are free

    int n;
    printf("Enter the number of files: ");
    scanf("%d", &n);

    for(i = 0; i < n; i++) {
        printf("\nEnter starting block and length of file %d: ", i+1);
        scanf("%d %d", &startBlock, &length);

        flag = 0;
        for(j = startBlock; j < (startBlock + length); j++) {
            if(file[j] == 1) {
                flag = 1;
                break;
            }
        }

        if(flag == 0) {
            for(j = startBlock; j < (startBlock + length); j++) {
                file[j] = 1;  // Allocate blocks
            }
            printf("File %d allocated from block %d to %d\n", i+1, startBlock, startBlock + length - 1);
        } else {
            printf("File %d cannot be allocated due to overlapping blocks.\n", i+1);
        }
    }

    return 0;
}