

# Very basics of R

R is a versatile, open source programming/scripting language that's useful both for statistics but also data science. Inspired by the programming language [`S`][S].

* Open source software under [GPL][].
* Superior (if not just comparable) to commercial alternatives. R has over 5,000 user contributed packages at this time. It's widely used both in academia and industry.
* Available on all platforms.
* Not just for statistics, but also general purpose programming.
* Is object oriented and functional.
* Large and growing community of peers.

[S]: http://stat.bell-labs.com/S/
[GPL]: https://www.gnu.org/licenses/gpl.html

**How to run `R`**  

You can run `R` interactively or in batch mode.

*Interactive mode*  
e.g. type in `R` from the shell. The window that appears is called the R console. Any command you type into the prompt is interpreted by the R kernel. An output may or may not be printed to the screen depending on the types of commands that you run.

*Batch mode*  
You can also run one or more R scripts in batch mode.

```
R CMD BATCH script_1.R script_2.R
```
You can also script inline using `Rscript -e`. *Example*

```{R, eval = FALSE}
Rscript -e "library(knitr); knit('script.Rmd')"
# Notice how we use a semi-colon to separate multiple commands in a single line
```

**Viewing objects in your global environment and how to clean them up**

List objects in your current environment

```{R, eval = FALSE}
ls()
```

remove objects from your current environment


```r
x <- 5
rm(x)
x
```

```
## Error: object 'x' not found
```


remove all objects from your current environment

```{R, eval = FALSE}
rm(list = ls())
```
*Notice that we have nested one function inside another.*

Use `#` signs to comment. Comment liberally in your R scripts. Anything to the right of a `#` is ignored by R. 

**Assignment operator**

`<- ` is the assignment operator. Assigns values on the right to objects on the left. Mostly similar to `=` but not always. Learn to use `<-` as it is good programming practice. Using `=` in place of `<-` can lead to issues down the line.

**Package management**

* `install.packages("package-name")` will download a package from one of the CRAN mirrors assuming that a binary is available for your operating system. If you have not set a preferred CRAN mirror in your `options()`, then a menu will pop up asking you to choose a location.

* Use `old.packages()` to list all your locally installed packages that are now out of date. 
`update.packages()` - will update all packages in the known libraries interactively. This can take a while if you haven't done it recently. To update everything without any user intervention, use the `ask = FALSE` argument.  

```{R, eval = FALSE}
update.packages(ask = FALSE)
```



**Quitting R**

type in `quit()` or `q()` and answer `y` to quit.
