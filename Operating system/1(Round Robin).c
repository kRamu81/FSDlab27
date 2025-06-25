/*
 * Round Robin CPU Scheduling Algorithm in C
 * -----------------------------------------
 *
 * Sample Input/Output:
 *
 * Enter the number of processes: 4
 * Enter Burst Time for Process 1: 5
 * Enter Burst Time for Process 2: 15
 * Enter Burst Time for Process 3: 4
 * Enter Burst Time for Process 4: 3
 * Enter the Time Slice (Quantum): 5
 *
 * Average Turnaround Time = 14.50
 * Average Waiting Time    = 7.00
 *
 * PROCESS	BURST TIME	WAITING TIME	TURNAROUND TIME
 * P1		5		0		5
 * P2		15		15		30
 * P3		4		9		13
 * P4		3		4		7
 */

#include <stdio.h>

int main() {
    int i, j, n, bu[10], wa[10], tat[10], t, ct[10], max;
    float awt = 0, att = 0, temp = 0;

    // Input number of processes
    printf("Enter the number of processes: ");
    scanf("%d", &n);

    // Input burst time for each process
    for (i = 0; i < n; i++) {
        printf("Enter Burst Time for Process %d: ", i + 1);
        scanf("%d", &bu[i]);
        ct[i] = bu[i];  // Keep a copy of original burst time
    }

    // Input time quantum
    printf("Enter the Time Slice (Quantum): ");
    scanf("%d", &t);

    // Find the maximum burst time
    max = bu[0];
    for (i = 1; i < n; i++) {
        if (max < bu[i])
            max = bu[i];
    }

    // Round Robin Scheduling
    for (j = 0; j < (max / t) + 1; j++) {
        for (i = 0; i < n; i++) {
            if (bu[i] > 0) {
                if (bu[i] <= t) {
                    temp += bu[i];
                    tat[i] = temp;
                    bu[i] = 0;
                } else {
                    bu[i] -= t;
                    temp += t;
                }
            }
        }
    }

    // Calculate Waiting Time
    for (i = 0; i < n; i++) {
        wa[i] = tat[i] - ct[i];
        att += tat[i];
        awt += wa[i];
    }

    

    // Print detailed results
    printf("\n\nPROCESS\tBURST TIME\tWAITING TIME\tTURNAROUND TIME\n");
    for (i = 0; i < n; i++) {
        printf("P%d\t%d\t\t%d\t\t%d\n", i + 1, ct[i], wa[i], tat[i]);
    }
  // Display average times
    printf("\nAverage Turnaround Time = %.2f", att / n);
    printf("\nAverage Waiting Time    = %.2f", awt / n);

    
}