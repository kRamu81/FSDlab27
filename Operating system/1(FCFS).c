/*✅ Algorithm: FCFS Scheduling (Without Arrival Time)
Step 1: Start

Step 2: Declare the necessary variables:

Arrays for Burst Time bt[], Waiting Time wt[], Turnaround Time tat[]

Integer variables: i, n

Float variables: wtavg, tatavg for averages

Step 3: Input the number of processes n

Step 4: For each process i from 0 to n-1, do:
  → Input the Burst Time bt[i]

Step 5: Initialize:
  → wt[0] = 0 (First process has no waiting time)
  → tat[0] = bt[0] (TAT = BT for first process)
  → wtavg = 0
  → tatavg = tat[0]

Step 6: For each process i from 1 to n-1, do:
  → Calculate Waiting Time: wt[i] = wt[i-1] + bt[i-1]
  → Calculate Turnaround Time: tat[i] = wt[i] + bt[i]
  → Add wt[i] to wtavg
  → Add tat[i] to tatavg

Step 7: Display the table of:
  → Process Number, Burst Time, Waiting Time, Turnaround Time

Step 8: Calculate and display average waiting time: wtavg / n
  → Calculate and display average turnaround time: tatavg / n

Step 9: Stop
*/

#include <stdio.h>

int main()
{
    int bt[20], wt[20], tat[20], i, n;
    float wtavg = 0, tatavg = 0;

    printf("Enter the number of processes -- ");
    scanf("%d", &n);  // Read number of processes

    for(i = 0; i < n; i++) {
        printf("Enter Burst Time for Process %d -- ", i);
        scanf("%d", &bt[i]);  // Read burst time
    }

    wt[0] = 0;
    tat[0] = bt[0];
    wtavg = 0;
    tatavg = tat[0];

    for(i = 1; i < n; i++) {
        wt[i] = wt[i - 1] + bt[i - 1];
        tat[i] = wt[i] + bt[i];
        wtavg += wt[i];
        tatavg += tat[i];
    }

    printf("\nProcess\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for(i = 0; i < n; i++) {
        printf("P%d\t%d\t\t%d\t\t%d\n", i, bt[i], wt[i], tat[i]);
    }

    printf("\nAverage Waiting Time = %.2f", wtavg / n);
    printf("\nAverage Turnaround Time = %.2f\n", tatavg / n);

    return 0;
}

/*
🔷 Sample Input:
Enter the number of processes -- 3
Enter Burst Time for Process 0 -- 24
Enter Burst Time for Process 1 -- 3
Enter Burst Time for Process 2 -- 3

🔷 Output:
Process	Burst Time	Waiting Time	Turnaround Time
P0	    24		    0		        24
P1	    3		    24		        27
P2	    3		    27		        30

Average Waiting Time = 17.00
Average Turnaround Time = 27.00
*/
