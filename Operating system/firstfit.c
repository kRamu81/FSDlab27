#include <stdio.h>

int main() {
    int bsize[10], psize[10], pcount, bcount;
    int allocation[10];
    int i, j;

    printf("Enter the number of memory blocks: ");
    scanf("%d", &bcount);

    printf("Enter size of each block:\n");
    for(i = 0; i < bcount; i++) {
        printf("Block %d: ", i + 1);
        scanf("%d", &bsize[i]);
    }

    printf("Enter the number of processes: ");
    scanf("%d", &pcount);

    printf("Enter size of each process:\n");
    for(i = 0; i < pcount; i++) {
        printf("Process %d: ", i + 1);
        scanf("%d", &psize[i]);
        allocation[i] = -1; // Initially unallocated
    }

    // First Fit Allocation
    for(i = 0; i < pcount; i++) {
        for(j = 0; j < bcount; j++) {
            if(bsize[j] >= psize[i]) {
                allocation[i] = j;
                bsize[j] -= psize[i];
                break;
            }
        }
    }

    // Display result
    printf("\nProcess No\tProcess Size\tBlock No\n");
    for(i = 0; i < pcount; i++) {
        printf("%d\t\t%d\t\t", i + 1, psize[i]);
        if(allocation[i] != -1)
            printf("%d\n", allocation[i] + 1); // block number (1-based)
        else
            printf("Not Allocated\n");
    }

    return 0;
}
