install.packages("shiny")
install.packages("plotly")
install.packages("json")
install.packages("ggplot")
install.packages("gganimate")
install.packages("dplyr")
install.packages("knitr")

# install.packages('devtools')
devtools::install_github('thomasp85/gganimate')

install.packages("gapminder")
install.packages('gifski')
install.packages('png')

library(gifski)
library(png)
library(gapminder)
library(ggplot2)
library(gganimate)

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')
