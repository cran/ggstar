## ---- echo=FALSE, results="asis", message=FALSE, KnitrSetUp-------------------
knitr::opts_chunk$set(tidy=FALSE,warning=FALSE,message=FALSE)
Biocpkg <- function (pkg){
    sprintf("[%s](http://bioconductor.org/packages/%s)", pkg, pkg)
}

CRANpkg <- function(pkg){
    cran <- "https://CRAN.R-project.org/package" 
    fmt <- "[%s](%s=%s)"
    sprintf(fmt, pkg, cran, pkg) 
}

## ---- echo=FALSE, results="hide", message=FALSE, Loadpackages-----------------
library(ggplot2)
library(ggstar)

## ---- fig.width=5, fig.height=3, fig.align="center", starshapes---------------
p1 <- show_starshapes()
p1

## ---- fig.width=6, fig.height=5, fig.align="center", sizeshape----------------
library(ggplot2)
library(ggstar)
p2 <- ggplot(data=iris, aes(x=Sepal.Width,y=Sepal.Length)) + 
      geom_star(aes(starshape=Species, fill=Species), size=6.5) +
      scale_fill_manual(values=c("#E41A1C", "#377EB8", "#4DAF4A")) +
      theme(legend.spacing.y = unit(0.02, "cm"))
p2

## ---- fig.width=6, fig.height=5.2, fig.align="center", polarcoord-------------
p3 <- ggplot(data=mtcars, aes(x=wt, y=mpg)) +
      geom_star(aes(fill=cyl), size=6.5) +
      scale_fill_gradient(low="blue", high="red") +
      coord_polar() +
      theme(panel.border=element_blank(),
            legend.spacing.y = unit(0.02, "cm"))
p3

## ---- echo=FALSE--------------------------------------------------------------
sessionInfo()

