#include<stdio.h>
int main(){
	int p[10],b[10],allocation[10];
	int pcnt,bcnt;
	int i,j;
	
	printf("enter number of memory blocks:");
	scanf("%d",&bcnt);
	
	printf("enter the size of each block:");
	for(i=0;i<bcnt;i++){
		printf("block %d:",i+1);
		scanf("%d",&b[i]);
	}
	
	printf("enter the number of process:");
	scanf("%d",&pcnt);
	
	printf("enter the size of ezch process:");
	for(i=0;i<pcnt;i++){
		printf("process %d:",i+1);
		scanf("%d",&p[i]);
		allocation[i] = -1;
	}
	
	
	// best fit allocation
	
	for(i=0;i<pcnt;i++){
		int bestIdx = -1;
		for(j=0;j<bcnt;j++){
			if(b[j]>=p[i]){
				if(bestIdx == -1 || b[j]<b[bestIdx]){
					bestIdx =j;
				}
			}
		}
		
		if(bestIdx != -1){
			allocation[i] = bestIdx;
			b[bestIdx] -= p[i];
		}
	}
	
	
	printf("\n processno \t process size\tblock no\n");
	for(i=0;i<pcnt;i++){
		printf("%d\t\t%d\t\t",i+1,p[i]);
		if(allocation[i] != -1)
		    printf("%d\n",allocation[i]+1);
        else
            printf("NOt allocated\n");
	}
}
