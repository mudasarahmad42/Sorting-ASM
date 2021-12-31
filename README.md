> **DO NOT CLONE, COPY OR DISTRIBUTE THIS CODE** 

# SORTING ALGORITHMS

In assembly, there are only 16 registers, most of which are not accessible. Therefore, it is not at all feasible to store list data in registers. That means the list must be stored in memory. The way to do this in assembly is to declare your list like this in data segment:

> Array DB 7, 5, 4, 1, 6, 8, 3, 2, 9, 0

In many languages like C/C++, printing out is easy, Not so in assembly. There is no easy way to print out exactly the thing you want to print. Instead, there is a weird way to set up a system to print out what you want. It includes adding or subtracting right ascii code getting the right array and its members and incrementing that pointer in array to get next number (pointer register mostly used is SI)
The three algorithms I implemented in assembly were bubble sort, selection sort and insertion sort. They presented interesting challenges and I learned a lot about writing code in assembly. I had the advantage of writing the C++ code for these first, which allowed me to much better understand the steps involved, without keeping it all in my head. Rather, I would take the C++ program line by line and translate it, keeping in mind the whole flow of the algorithm. Bubble sort was fairly easy to implement since it was just a double nested for loop. Insertion sort and selection sort were more challenging, but with some debugging, I was able to get them to run perfectly. 

## Bubble Sort

for (int i = 0; i < 5; i++) <br>
{ <br>
  for (int j = 0; j < 5; j++) <br>
        { <br>
            if(arr[j] < arr[j+1]) <br>
                temp = arr[j]; <br>
                arr[j] = arr[j+1]; <br>
                arr[j+1] = temp; <br>
        } <br>
} <br>


## Selection Sort

for (int I = 0; I < 4; i++) <br>
{ <br>
min = i; <br>
for (int j = i+1; j < 5; j++) <br>
{ <br>
if(arr[j] < arr[min] <br>
min = j; <br>
} //end of inner loop <br>
if (min != i) <br>
     { <br>
 temp = arr[i]; <br>
arr[i] = arr[min]; <br>
      } <br>
} <br>


## Insertion Sort

for (int i = 0; i < 5; i++) <br>
{ <br>
int temp = arr[i]; <br>
j = i-1; <br>
while (j >= 0 && arr[j] > temp) <br>
{ <br>
arr[j+1] = arr[j]; <br>
j--; <br>
} <br>
arr[j+1] = temp; <br>
} <br>

