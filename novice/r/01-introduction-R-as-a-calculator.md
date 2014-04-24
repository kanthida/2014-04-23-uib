

# Novice R materials
--------------------------------------------------
This material combines materials from the Sofware Carpentry Bootcamp novice course
with slides from the interactive Swirl package (Nick Carchedi et al) https://github.com/swirldev/


### So, what is R?

* R is a versatile, open source programming language
* It's particularly well suited for statistics, data science and visualization
* Widely used in academia and industry, with a growing community.
* Huge library of user contributed problem-specific packages, > 5,000 at this time. 
* Biology-specific packages via Bioconductor
* Available on all platforms.
* Is object oriented and functional.  


### Introduction to R and RStudio

_Point out the different windows in RStudio_
* Console, Scripts, Environments, Plots
* Code and workflow is more reproducible if we can document everything that we do.
* Our end goal is not just to "do stuff" but to do it in a way that anyone can easily and exactly replicate our workflow and results.


In it's simplest form, R can be used as an interactive calculator. On the R console, type 5 + 7 and press Enter.

Alternatively, if you are running this code from an R markdown script in RStudio, place the cursor at the line you wish to run, and choose "Code RunLines" from the top menu or press ctrl-Enter. 


```r
5 + 7
```


R simply prints the result of 12 by default. 

However, we often wish to automate some process or avoid unnecessary repetition.

Here, we may want to use our result from above in a second calculation.

Instead of retyping 5 + 7 every time we need it, we can just create a new variable that stores the result.

Assigning a value to a variable in R is done via the assignment operator, which is just a 'less than' symbol followed by a 'minus' sign. It looks like this: <-

Think of the assignment operator as an arrow. You are assigning the value on the right side of the arrow to the variable name on the left side of the arrow.


To assign the result of 5 + 7 to a new variable called x, you type x <- 5 + 7. This can be read as 'x gets 5 plus 7'. Let's give it a try.


```r
x <- 5 + 7
```


R did not print the result of 12 this time. When you use the assignment operator, R assumes that you don't want to see the result immediately, but rather that you intend to use the result for something else later on.

For clarity, you can include a single space on each side of the assignment operator, but do NOT put a space between the `<` and the `-` that form the arrow.


To view the contents of the variable x, just type x and press Enter.


```r
x
```



A variable is just a name for a value, such as x, current_temperature, or subject_id. 
We can create a variables with longer, more descriptive names.


```r
weight_kg <- 55
```


and do arithmetic with it:


```r
2.2 * weight_kg
```


We can use the function `paste` to print several things at once, if we separate them with commas.


```r
paste("weight in pounds:", 2.2 * weight_kg)
```


### Updating the values of variables

We can also change a variable's value by assigning it a new one:


```r
weight_kg <- 57.5
paste("weight in kilograms is now:", weight_kg)
```


If we imagine the variable as a sticky note with a name written on it, 
assignment is like putting the sticky note on a particular value:

This means that assigning a value to one variable does not change the values of other variables. 
For example, let's calculate the subject's weight in pounds, and store in a variable:


```r
weight_lb <- 2.2 * weight_kg
paste("weight in kilograms:", weight_kg, "and in pounds:", weight_lb)
```


and then change weight_kg:


```r
weight_kg <- 100
paste("weight in kilograms is now:", weight_kg, "and weight in pounds is still:", 
    weight_lb)
```


__Updating a Variable__

Since weight_lb doesn't "remember" where its value came from, it isn't automatically updated when weight_kg changes. 

This is different from the way spreadsheets work.

###Challenge

Write down what values the variables refer to after each statement in the following program:


```r
mass <- 47.5
age <- 122
mass <- mass * 2
age <- age - 20
```



### Vectors

Now, let's create a small collection of numbers called a `vector` (known as array in some other programming languages)

* Any object that contains data is called a data structure
* Numeric vectors are the simplest type of data structure in R.
* In fact, even a single number is considered a vector of length one.

The easiest way to create a vector is with the c() function, which stands for 'concatenate' or 'combine'.

Here, we create a vector containing the numbers 1.1, 9, and 3.14 and store the result in a variable called z


```r
z <- c(1.1, 9, 3.14)
```


Including single spaces after the commas in the vector is not required, but helps make your code less cluttered and more readable.

---

Anytime you have questions about a particular function, you can access R's built-in help files via the `?` command. For example, if you want more information on the c() function, type ?c without the parentheses that normally follow a function name. Give it a try.


```r
`?`(c)
```


Type z to view it's contents. Notice that there are no commas separating the values in the output.


```r
z
```


You can combine vectors to make a new vector. Create a new vector that contains z, 555, then z again in that order. Don't assign this vector to a new variable, so that we can just see the result immediately.


```r
c(z, 555, z)
```



What happens here is that we take the original vector of weights, add a new value, and then the original vector values again. We can do this over and over again to build a vector or a dataset. As we program, this may be useful to update results that we are collecting or calculating.

Numeric vectors can be used in arithmetic expressions. Type the following to see what happens: z * 2 + 100.


```r
z
z * 2 + 100
```


First, R multiplied each of the three elements in z by 2. Then it added 100 to each element to get the result you see above.

Other common arithmetic operators are `+`, `-`, `/`, and `^` (where x^2 means 'x squared'). 

To take the square root, use the `sqrt()` function 
For the absolute value, use the `abs()` function.

Let's take the square root of z - 1 and assign it to a new variable called mySqrt.


```r
mySqrt <- sqrt(z - 1)
```


Before we view the contents of the mySqrt variable, what do you think it contains?
Think about how R handled the other 'vectorized' operations: element-by-element.

1. a vector of length 3
2. a single number (i.e a vector of length 1)
3. a vector of length 0 (i.e. an empty vector)

Variable names are case-sensitive and you are creating a variable called mySqrt, so make sure the letter S is capitalized and everything else is lowercase.

---

Print the contents of mySqrt.


```r
mySqrt
```


As you may have guessed, R first subtracted 1 from each element of z, then took the square root of each element. This leaves you with a vector of the same length as the original vector z.

Now, create a new variable called myDiv that gets the value of z divided by mySqrt.


```r
myDiv <- z/mySqrt
```


Which statement do you think is true?

1. The first element of myDiv is equal to the first element of z divided by the first element of mySqrt, and so on...
2. myDiv is a single number (i.e a vector of length 1)
3. myDiv is undefined

We print the contents of myDiv:


```r
myDiv
```


When given two vectors of the same length, R sperforms the specified arithmetic operation (`+`, `-`, `*`, etc.) element-by-element.

If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.

When we did z * 2 + 100 in our earlier example, z was a vector of length 3, but technically 2 and 100 are each vectors of length 1.

Behind the scenes, R is 'recycling' the 2 to make a vector of 2s and the 100 to make a vector of 100s. In other words, when you ask R to compute z * 2 + 100, what it really computes is this: z * c(2, 2, 2) + c(100, 100, 100).

To see another example of how this vector 'recycling' works, try adding c(1, 2, 3, 4) and c(0, 10). Don't worry about saving the result in a new variable.


```r
c(1, 2, 3, 4) + c(0, 10)
```


If the length of the shorter vector does not divide evenly into the length of the longer vector, R will still apply the 'recycling' method, but will throw a warning to let you know something fishy might be going on.

Let's try c(1, 2, 3, 4) + c(0, 10, 100) for an example.


```r
c(1, 2, 3, 4) + c(0, 10, 100)
```

```
## Warning: longer object length is not a multiple of shorter object length
```



