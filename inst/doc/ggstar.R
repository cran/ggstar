## ----echo=FALSE, results="asis", message=FALSE, KnitrSetUp--------------------
knitr::opts_chunk$set(tidy=FALSE,warning=FALSE,message=FALSE,dev="svg",eval=capabilities("cairo"))
Biocpkg <- function (pkg){
    sprintf("[%s](http://bioconductor.org/packages/%s)", pkg, pkg)
}

CRANpkg <- function(pkg){
    cran <- "https://CRAN.R-project.org/package" 
    fmt <- "[%s](%s=%s)"
    sprintf(fmt, pkg, cran, pkg) 
}

## ----echo=FALSE, results="hide", message=FALSE, Loadpackages------------------
library(ggplot2)
library(ggstar)

## ----fig.width=7, fig.height=6, fig.align="center", starshapes----------------
p1 <- show_starshapes()
p1

## ----fig.width=6, fig.height=5, fig.align="center", sizeshape-----------------
library(ggplot2)
library(ggstar)
p2 <- ggplot(data=iris, aes(x=Sepal.Width,y=Sepal.Length)) + 
      geom_star(aes(starshape=Species, fill=Species), size=2.5) +
      scale_fill_manual(values=c("#E41A1C", "#377EB8", "#4DAF4A")) +
      theme(legend.spacing.y = unit(0.02, "cm"))
p2

## ----fig.width=6, fig.height=5.2, fig.align="center", polarcoord--------------
p3 <- ggplot(data=mtcars, aes(x=wt, y=mpg)) +
      geom_star(aes(fill=cyl), size=2.5) +
      scale_fill_gradient(low="blue", high="red") +
      coord_polar() +
      theme(panel.border=element_blank(),
            legend.spacing.y = unit(0.02, "cm"))
p3

## ----fig.width=6, fig.height=5, fig.align="center", interactive---------------
library(ggiraph)
library(ggplot2)
library(ggstar)
mtcars$name <- rownames(mtcars)
p4 <- ggplot(
        data = mtcars, 
        mapping = aes(
          x = wt, 
          y = mpg, 
          fill = cyl,
          tooltip = paste0("name: ", name,"\nqsec: ", qsec,"\ndrat: ",drat), 
          data_id = name
        )
      ) +
      geom_star_interactive(size = 3.5) +
      scale_fill_viridis_c()
      
girafe(
  ggobj = p4,
  options = list(
    opts_hover(css = "fill:yellow;stroke:black;stroke-width:1.5px;"),
    opts_zoom = opts_zoom(min = .7, max = 4),
    opts_tooltip(use_fill = TRUE),
    opts_sizing(width = .7),
    opts_toolbar = opts_toolbar(saveaspng = FALSE, delay_mouseout = 5000)
  )
)

## ----echo=FALSE---------------------------------------------------------------
sessionInfo()

