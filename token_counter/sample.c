#include <stdio.h>

// This is a single-line comment
/* This is a 
   multi-line comment */

int main() {
    int count = 0;
    float average = 0.0;
    
    // Calculate sum and average
    for (int i = 1; i <= 10; i++) {
        count += i;
    }
    
    average = count / 10.0;
    
    if (average > 5) {
        printf("Average is greater than 5\n");
    } else {
        printf("Average is less than or equal to 5\n");
    }
    
    return 0;
}