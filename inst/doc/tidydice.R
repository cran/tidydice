## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE, warning=FALSE----------------------------------------
library(tidydice)
library(dplyr)
library(explore)

## ----fig.height=3, fig.width=6-------------------------------------------
set.seed(123)
roll_dice(times = 6, rounds = 3) %>% 
  plot_dice(fill_success = "lightgrey")

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice()

## ----echo=TRUE, fig.width=6, fig.height=1--------------------------------
set.seed(123)
roll_dice() %>% plot_dice()

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(success = c(2,6))

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(prob = c(0,0,0,0,0,1))

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(sides = 12)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 4)

## ----echo=TRUE, fig.width=6, fig.height=1--------------------------------
set.seed(123)
roll_dice(times = 4) %>% plot_dice()

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 4, rounds = 2)

## ----echo=TRUE, fig.width=6, fig.height=2--------------------------------
set.seed(123)
roll_dice(times = 4, rounds = 2) %>% plot_dice()

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 4, rounds = 2, agg = TRUE)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 4, rounds = 2) %>% 
  group_by(experiment, round) %>% 
  summarise(times = n(),
            success = sum(success))

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 100) %>% 
  explore(result, title = "Rolling a dice 100x")

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 10000) %>% 
  explore(result, title = "Rolling a dice 10000x")

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 100, rounds = 100, agg = TRUE) %>% 
  explore(success, 
          title = "Rolling a dice 100x",
          auto_scale = FALSE)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 100, rounds = 10000, agg = TRUE) %>% 
  explore(success, 
          title = "Rolling a dice 10000x",
          auto_scale = FALSE)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 100, rounds = 10000, agg = TRUE) %>% 
  mutate(check = ifelse(success < 5 | success > 30, 1, 0)) %>% 
  count(check)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 100, rounds = 10000, agg = TRUE) %>% 
  roll_dice(times = 110, rounds = 10000, agg = TRUE) %>% 
  explore(success, 
          target = experiment,
          title = "Rolling a dice 100/110x",
          auto_scale = FALSE)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
roll_dice(times = 100, rounds = 10000, agg = TRUE) %>% 
  roll_dice(times = 110, rounds = 10000, agg = TRUE) %>% 
  roll_dice(times = 150, rounds = 10000, agg = TRUE) %>% 
  explore(success, 
          target = experiment,
          title = "Rolling a dice 100/110/150x",
          auto_scale = FALSE)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
flip_coin(times = 10)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
flip_coin(times = 10) %>% 
  describe(success)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
flip_coin(times = 10, agg = TRUE)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
flip_coin(times = 10, rounds = 4, agg = TRUE)

## ----echo=TRUE-----------------------------------------------------------
set.seed(123)
flip_coin(times = 10, agg = TRUE) %>% 
  flip_coin(times = 15, agg = TRUE)

## ----fig.height=1, fig.width=6-------------------------------------------
set.seed(123)
roll_dice(times = 6) %>% 
  plot_dice()

## ----fig.height=1, fig.width=6-------------------------------------------
set.seed(123)
roll_dice(times = 6) %>% 
  plot_dice(fill = "black", line_color = "white", point_color = "white")

## ----fig.height=1, fig.width=6-------------------------------------------
set.seed(123)
roll_dice(times = 6) %>% 
  plot_dice(fill = "lightblue", fill_success = "darkblue")

## ----fig.height=1, fig.width=6-------------------------------------------
set.seed(123)
roll_dice(times = 6) %>% 
  plot_dice(fill = "darkgrey", 
            fill_success = "darkblue",
            line_color = "white",
            point_color = "white")

## ----fig.height=1, fig.width=6-------------------------------------------
set.seed(123)
roll_dice(times = 6) %>% 
  plot_dice(detailed = TRUE)

## ----fig.height=1, fig.width=6-------------------------------------------
set.seed(123)
roll_dice(times = 6) %>% 
  plot_dice(detailed = FALSE)

## ----fig.height=6, fig.width=6-------------------------------------------
set.seed(123)
roll_dice(times = 10, rounds = 10) %>% 
  plot_dice(detailed = FALSE, fill_success = "gold")

## ----fig.height=1, fig.width=6-------------------------------------------
force_dice(1:6) %>% 
  plot_dice()

## ----fig.height=1, fig.width=6-------------------------------------------
force_dice(rep(6, times = 6)) %>% 
  plot_dice()

## ----fig.height=1, fig.width=6-------------------------------------------
force_dice(rep(5, times = 3), round = 1) %>% 
  force_dice(rep(6, times = 3), round = 2)

## ----fig.height=1, fig.width=6-------------------------------------------
set.seed(123)
force_dice(rep(6, times = 3)) %>% 
  roll_dice(times = 3)

