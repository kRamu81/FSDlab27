#include <stdio.h>

int main() {
    int i, j, n, bt[10], wt[10], tat[10], ct[10], max, t, temp = 0;
    float tatavg = 0, wtavg = 0;

    printf("Enter the number of processes: ");
    scanf("%d", &n);

    for(i = 0; i < n; i++) {
        printf("Enter the burst time of process %d: ", i + 1);
        scanf("%d", &bt[i]);
        ct[i] = bt[i];  // Copy of burst time
    }

    printf("Enter the time slice: ");
    scanf("%d", &t);

    max = bt[0];
    for(i = 1; i < n; i++) {
        if(max < bt[i])
            max = bt[i];
    }

    for(j = 0; j <= (max / t) + 1; j++) {
        for(i = 0; i < n; i++) {
            if(bt[i] != 0) {
                if(bt[i] <= t) {
                    temp += bt[i];
                    tat[i] = temp;
                    bt[i] = 0;
                } else {
                    bt[i] -= t;
                    temp += t;
                }
            }
        }
    }

    for(i = 0; i < n; i++) {
        wt[i] = tat[i] - ct[i];
        tatavg += tat[i];
        wtavg += wt[i];
    }

    printf("\nProcess\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for(i = 0; i < n; i++) {
        printf("%d\t%d\t\t%d\t\t%d\n", i + 1, ct[i], wt[i], tat[i]);
    }

    printf("\nAverage Waiting Time: %.2f", wtavg / n);
    printf("\nAverage Turnaround Time: %.2f\n", tatavg / n);

    return 0;
}


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

