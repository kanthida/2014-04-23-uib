
# Data types and structures

### Understanding basic data types in R

To make the best of the R language you'll need:  

1. a good understanding of the data types and data structures available in R
2. to know how to operate on those.

Dealing with object conversions is commonly frustrating for beginners.
Mastering this knowledge will make your continued experience much more pleasant.

---

### **Everything** in R is an object.

R has 6 atomic classes.

* character
* numeric (real or decimal)
* integer
* logical
* complex
* raw

---


By *atomic*, we mean the vector only holds data of a single type.
 
 * **character**: `"a"`, `"swc"`
 * **numeric**: `2`, `15.5`
 * **integer**: `2L` (the `L` tells R to store this as an integer)
 * **logical**: `TRUE`, `FALSE`
 * **complex**: `1+4i` (complex numbers with real and imaginary parts)
---

R provides many functions to examine features of vectors and other objects, for example

* `typeof()` - what is it?  
* `length()` - how long is it? What about two dimensional objects?  
* `attributes()` - does it have any metadata?  


```r
# Example
x <- "dataset"
typeof(x)
```

```
## [1] "character"
```

```r
attributes(x)
```

```
## NULL
```

```r

y <- 1:10
y
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
typeof(y)
```

```
## [1] "integer"
```

```r
length(y)
```

```
## [1] 10
```

```r

z <- as.numeric(y)
typeof(z)
```

```
## [1] "double"
```


---

### Data structures

R has many __data structures__. These include

* atomic vector
* list
* matrix
* data frame
* factors

---

### Vectors

A vector is the most common and basic data structure in R, and is pretty much the workhorse of R.

Technically, vectors can be one of two types:

* atomic vectors
* lists

although the term "vector" most commonly refers to the atomic types not lists.

---

**Atomic Vectors**

An atomic vector holds values that are all of the same type (e.g `character`, `logical`, `numeric`, ...)

You can create an empty vector with `vector()` 
By default the mode is `logical`. You can be more explicit as shown in the examples below. 
It is more common to use direct constructors such as `character()`, `numeric()`, etc. 


```r
x <- vector()
# with a length and type
vector("character", length = 10)
```

```
##  [1] "" "" "" "" "" "" "" "" "" ""
```

```r
character(5)  ## character vector of length 5
```

```
## [1] "" "" "" "" ""
```

```r
numeric(5)
```

```
## [1] 0 0 0 0 0
```

```r
logical(5)
```

```
## [1] FALSE FALSE FALSE FALSE FALSE
```


### Creating vectors with values

**Numeric vectors**

```r
x <- c(1, 2.5, 3)
x
```

```
## [1] 1.0 2.5 3.0
```

```r
length(x)
```

```
## [1] 3
```


`x` is now numeric vector, where each value is a double precision real number.

**Logical vector**


```r
y <- c(TRUE, TRUE, FALSE, FALSE)
```


**character vectors**


```r
z <- c("Sarah", "Tracy", "Jon")
```


**Examine your vectors**


```r
typeof(z)
```

```
## [1] "character"
```

```r
length(z)
```

```
## [1] 3
```

```r
class(z)
```

```
## [1] "character"
```

```r
str(z)
```

```
##  chr [1:3] "Sarah" "Tracy" "Jon"
```


---

You can also create vectors by generating a sequence of numbers


```r
series <- 1:10
seq(10)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
seq(1, 10, by = 0.1)
```

```
##  [1]  1.0  1.1  1.2  1.3  1.4  1.5  1.6  1.7  1.8  1.9  2.0  2.1  2.2  2.3
## [15]  2.4  2.5  2.6  2.7  2.8  2.9  3.0  3.1  3.2  3.3  3.4  3.5  3.6  3.7
## [29]  3.8  3.9  4.0  4.1  4.2  4.3  4.4  4.5  4.6  4.7  4.8  4.9  5.0  5.1
## [43]  5.2  5.3  5.4  5.5  5.6  5.7  5.8  5.9  6.0  6.1  6.2  6.3  6.4  6.5
## [57]  6.6  6.7  6.8  6.9  7.0  7.1  7.2  7.3  7.4  7.5  7.6  7.7  7.8  7.9
## [71]  8.0  8.1  8.2  8.3  8.4  8.5  8.6  8.7  8.8  8.9  9.0  9.1  9.2  9.3
## [85]  9.4  9.5  9.6  9.7  9.8  9.9 10.0
```


**Add an element to a vector**


```r
z
```

```
## [1] "Sarah" "Tracy" "Jon"
```

```r
z <- c(z, "Annette")
```



`Inf` is infinity. You can have either positive or negative infinity.


```r
1/0
```

```
## [1] Inf
```


`NaN` means Not a Number. It's an undefined value.


```r
0/0
```

```
## [1] NaN
```


Objects can have __attributes__. Attribues are part of the object. These include:

* names
* dimnames
* dim
* class
* attributes (contain metadata)

You can also glean other attribute-like information such as length (works on vectors and lists) or number of characters (for character strings).


```r
length(1:10)
```

```
## [1] 10
```

```r
nchar("Software Carpentry")
```

```
## [1] 18
```


**What happens when you mix types?**

R will create a resulting vector that is the least common denominator. The coercion will move towards the one that's easiest to __coerce__ to.

Guess what the following do without running them first


```r
xx <- c(1.7, "a")
xx <- c(TRUE, 2)
xx <- c("a", TRUE)
```


This is called implicit coercion. You can also coerce vectors explicitly using the `as.<class_name>`. Example


```r
as.numeric()
```

```
## numeric(0)
```

```r
as.character()
```

```
## character(0)
```


### Matrix

In R matrices are an extension of the numeric or character vectors. They are not a separate type of object but simply an atomic vector with dimensions; the number of rows and columns.


```r
m <- matrix(nrow = 2, ncol = 2)
m
```

```
##      [,1] [,2]
## [1,]   NA   NA
## [2,]   NA   NA
```

```r
dim(m)
```

```
## [1] 2 2
```


Matrices in R are filled column-wise.


```r
m <- matrix(1:6, nrow = 2, ncol = 3)
```


Other ways to construct a matrix


```r
m <- 1:10
dim(m) <- c(2, 5)
```


This takes a vector and transform into a matrix with 2 rows and 5 columns.

Another way is to bind columns or rows using `cbind()` and `rbind()`.


```r
x <- 1:3
y <- 10:12
cbind(x, y)
```

```
##      x  y
## [1,] 1 10
## [2,] 2 11
## [3,] 3 12
```

```r
rbind(x, y)
```

```
##   [,1] [,2] [,3]
## x    1    2    3
## y   10   11   12
```


You can also use the byrow argument to specify how the matrix is filled. From R's own documentation:


```r
mdat <- matrix(c(1, 2, 3, 11, 12, 13), nrow = 2, ncol = 3, byrow = TRUE, dimnames = list(c("row1", 
    "row2"), c("C.1", "C.2", "C.3")))
mdat
```

```
##      C.1 C.2 C.3
## row1   1   2   3
## row2  11  12  13
```


### List

In R lists act as containers. Unlike atomic vectors, the contents of a list are not restricted to a single mode and can encompass any mixture of data types. Lists are sometimes called generic vectors, because the elements of a list can by of any type of R object, even lists containing further lists. This property makes them fundamentally different from atomic vectors.

A list is a special type of vector. Each element can be a different type.

Create lists using `list()` or coerce other objects using `as.list()`. An empty list of the required length can be created using `vector()`


```r
x <- list(1, "a", TRUE, 1 + (0+4i))
x
```

```
## [[1]]
## [1] 1
## 
## [[2]]
## [1] "a"
## 
## [[3]]
## [1] TRUE
## 
## [[4]]
## [1] 1+4i
```

```r


x <- vector("list", length = 5)  ## empty list
length(x)
```

```
## [1] 5
```

```r
x[[1]]
```

```
## NULL
```

```r

x <- 1:10
x <- as.list(x)
length(x)
```

```
## [1] 10
```


1. What is the class of `x[1]`?
2. What about `x[[1]]`?


```r
xlist <- list(a = "Karthik Ram", b = 1:10, data = head(iris))
xlist
```

```
## $a
## [1] "Karthik Ram"
## 
## $b
##  [1]  1  2  3  4  5  6  7  8  9 10
## 
## $data
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```


1. What is the length of this object? What about its structure?

Lists can be extremely useful inside functions. You can “staple” together lots of different kinds of results into a single object that a function can return.

A list does not print to the console like a vector. Instead, each element of the list starts on a new line.

Elements are indexed by double brackets. Single brackets will still return a(nother) list.


### Factors

Factors are special vectors that represent categorical data. Factors can be ordered or unordered and are important for modelling functions such as `lm()` and `glm()` and also in `plot` methods.

Once created factors can only contain a pre-defined set values, known as *levels*.

Factors are stored as integers that have labels associated the unique integers. While factors look (and often behave) like character vectors, they are actually integers under the hood, and you need to be careful when treating them like strings. Some string methods will coerce factors to strings, while others will throw an error.

Sometimes factors can be left unordered. Example: male, female.

Other times you might want factors to be ordered (or ranked). Example: low, medium, high.

Underlying it's represented by numbers 1, 2, 3.

They are better than using simple integer labels because factors are what are called self describing. male and female is more descriptive than 1s and 2s. Helpful when there is no additional metadata.

Which is male? 1 or 2? You wouldn't be able to tell with just integer data. Factors have this information built in.

Factors can be created with `factor()`. Input is often a character vector.


```r
x <- factor(c("yes", "no", "no", "yes", "yes"))
x
```

```
## [1] yes no  no  yes yes
## Levels: no yes
```


`table(x)` will return a frequency table counting the number of elements in each level.

If you need to convert a factor to a character vector, simply use


```r
as.character(x)
```

```
## [1] "yes" "no"  "no"  "yes" "yes"
```


To convert a factor to a numeric vector, go via a character. Compare


```r
f <- factor(c(1, 5, 10, 2))
as.numeric(f)  ## wrong!
```

```
## [1] 1 3 4 2
```

```r
as.numeric(as.character(f))
```

```
## [1]  1  5 10  2
```


In modeling functions, it is important to know what the baseline level is. This is the first factor but by default the ordering is determined by alphabetical order of words entered. You can change this by speciying the levels (another option is to use the function relevel).


```r
x <- factor(c("yes", "no", "yes"), levels = c("yes", "no"))
x
```

```
## [1] yes no  yes
## Levels: yes no
```


### Data frame

A data frame is a very important data type in R. It's pretty much the de facto data structure for most tabular data and what we use for statistics.

A data frame is a special type of list where every element of the list has same length.

Data frames can have additional attributes such as `rownames()`, which can be useful for annotating data, like subject_id or sample_id. But most of the time they are not used.

Some additional information on data frames:

* Usually created by `read.csv()` and `read.table()`.
* Can convert to matrix with `data.matrix()`
* Coercion will be forced and not always what you expect.
* Can also create with `data.frame()` function.
* Find the number of rows and columns with `nrow(dat)` and `ncol(dat)`, respectively.
* Rownames are usually 1..n.

## Combining data frames


```r
dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:20)
dat
```

```
##    id  x  y
## 1   a  1 11
## 2   b  2 12
## 3   c  3 13
## 4   d  4 14
## 5   e  5 15
## 6   f  6 16
## 7   g  7 17
## 8   h  8 18
## 9   i  9 19
## 10  j 10 20
```


### Useful functions

* `head()` - see first 6 rows
* `tail()` - see last 6 rows
* `dim()` - see dimensions
* `nrow()` - number of rows
* `ncol()` - number of columns
* `str()` - structure of each column
* `names()` - will list the names attribute for a data frame (or any object really), which gives the column names.
* A data frame is a special type of list where every element of the list has same length.

See that it is actually a special list:


```r
is.list(iris)
```

```
## [1] TRUE
```

```r
class(iris)
```

```
## [1] "data.frame"
```


| Dimensions | Homogenous | Heterogeneous |
| ------- | ---- | ---- |
| 1-D | atomic vector | list |
| 2_D | matrix | data frame |

### Indexing

Vectors have positions, these positions are ordered and can be called using name_vector[index]


```r
letters[2]
```

```
## [1] "b"
```


### Functions

A function is a saved object that takes inputs to perform a task. 
Functions take in information and return desired outputs.

output = name_of_function(inputs)


```r
x <- 1:10
y <- sum(x)
```


### Help

All functions come with help information. 
It is critical that you learn to read the help screens since they provide important information on what the function does, 
how it works, and usually sample examples at the very bottom.

### Install new  functions (package management)

`install.packages("package-name")` will download a package from one of the CRAN mirrors assuming that a binary is available for your operating system. If you have not set a preferred CRAN mirror in your options(), then a menu will pop up asking you to choose a location.

Use `old.packages()` to list all your locally installed packages that are now out of date. `update.packages()` will update all packages in the known libraries interactively. This can take a while if you haven't done it recently. To update everything without any user intervention, use the `ask = FALSE` argument.


```r
update.packages(ask = FALSE)
```


You can't ever learn all of R, but you can learn how to build a program and how to find help
to do the things that you want to do. Let's get hands-on.

