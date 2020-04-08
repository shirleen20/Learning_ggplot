library(tidyverse)

gapminder <- read_csv("data/gapminder_data.csv")
gapminder_1977 <- filter(gapminder, year == 1977)

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour= continent, size = pop)
  )+
  geom_point()+
  scale_x_log10()

#ggplot(<DATA>, <AESTHETIC MAPPINGS>) + <GEOMETRY LAYER> + <GEOMETRY LAYER>


#Challenge 4
#1. 
ggplot(gapminder_1977, aes(x=gdpPercap, y=country, colour=continent, size=pop)
       )+
  geom_point()

#2.
ggplot(data=gapminder_1977,
       mapping=aes(x=lifeExp, y=gdpPercap, colour=continent, size=pop))+
  geom_point()


gapminder_1977 %>% 
  ggplot()+
  geom_point (mapping = aes(x = lifeExp, y = gdpPercap, colour= continent, size = pop))+
  geom_line(aes(x = lifeExp, y = gdpPercap))+
  scale_x_log10()

#Challenge 5
?geom_point

#Challenge 6
gapminder_1977 %>% 
  ggplot(mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
  geom_point(shape=21, colour="blue", fill="white", size=10, stroke=4)+
  scale_x_log10()
#Karensa's answer
gapminder_1977 %>% 
  ggplot(mapping=aes(x=gdpPercap, y=lifeExp, shape=continent, size=pop))+
  geom_point(alpha=0.4)+
  scale_x_log10()

#Challenge 7
gapminder%>% 
  ggplot(mapping=aes(x=year, y=lifeExp, colour = continent))+
  geom_point()

gapminder%>% 
  ggplot(mapping=aes(x=year, y=lifeExp, colour = continent, group = country))+
  geom_line()

#adding additional geometries
gapminder%>% 
  ggplot(aes(x=year, y=lifeExp, colour= continent, group = country))+
  geom_line()+
  geom_point(colour="black", alpha=0.3)

gapminder%>% 
  ggplot(aes(x=year, y=lifeExp, color= continent, group = country))+
  geom_point(colour="black", alpha=0.3)+
  geom_line()

gapminder%>% 
  ggplot(aes(x=year, y=lifeExp, color= continent, group = country))+
  geom_line(mapping=aes(colour=continent))
  geom_point(alpha=0.3)

#statistics
gapminder%>% 
  ggplot(aes(x=gdpPercap, y=lifeExp))+
  geom_point(alpha=0.5)+
  scale_x_log10()+
  geom_smooth(method = "lm", size = 2)

#Challenge 9
gapminder%>% 
  ggplot(aes(x=gdpPercap, y=lifeExp))+
  geom_point(alpha = 0.5, colour = "Purple")+ #apha has smaller dot points and transparent, using size puts dots on tops not too clear dot points
  scale_x_log10()+
  geom_smooth(method = "lm", size = 1.5)

#Challenge 10
gapminder%>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, colour = continent))+
  geom_point(size = 2, shape = 21)+
  scale_x_log10()+
  geom_smooth(method = "lm", size = 1.5)

gapminder%>% 
  ggplot(aes(x=gdpPercap, y=lifeExp))+
  geom_point(mapping= aes(colour= continent), size = 2)+
  scale_x_log10()+
  geom_smooth(mapping = aes( colour= continent), method = "lm", size = 2)+
  geom_smooth(method= "lm")# no colour by continent

#Scales
#we manually select specific colours to use rather then default colours set by ggplot
gapminder%>% 
  ggplot(aes(x = year, y=lifeExp, colour = continent))+
  geom_point()+
  scale_colour_manual(values = c("red", "green", "blue", "purple", "black"))

colours() # helps to choose from the different colour options
scale_color_brewer() # helps choose colour brewer

#Challege 11
gapminder%>% 
  ggplot(aes(x = year, y=lifeExp, colour = continent))+
  geom_point()+
  scale_x_log10()+
  scale_colour_brewer(palette = "Set1")
#Stephens answer 
gapminder%>% 
  ggplot(aes(x = year, y=lifeExp, colour = continent))+
  geom_point()+
  scale_colour_brewer(palette = "Dark2")

#Separating figures/plots
a_countries <- filter(gapminder, str_starts(country, "A"))

ggplot(a_countries, aes(x=year, y=lifeExp, colour=continent, group=country))+
  geom_line()+
  facet_wrap(~country)

#Challenge 12
gapminder%>% 
  ggplot(aes(x = year, y=lifeExp, colour = continent))+
  geom_point()+
  scale_x_log10()+
  scale_colour_brewer(palette = "Set1")+
  facet_wrap(~year)

#could also do:
gapminder%>% 
  ggplot(aes(x = gdpPercap, y=lifeExp, colour = continent, size=pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)

#ggplot(<DATA>,<AESTHETIC MAPPINGS>) + <GEOM>+ <GEOM> + <SCALES> + <FACETS>)

#Challenge 13
gapminder%>% 
  ggplot(aes(x = pop, fill = continent))+
  geom_density(alpha = 0.5)+
  scale_x_log10()+
  facet_wrap(~year)

#Challenge 14
install.packages("agridat")
library(agridat)
view(blackman.wheat)
#my answer
blackman.wheat %>% 
  ggplot(aes(x=yield, y=gen, group=loc, colour=nitro))+
  geom_point()+
  scale_x_log10()+
  geom_smooth(method = "lm", size = 1.5)+
  facet_wrap(~loc)

# Preparing plots for display
rough_plot <- ggplot(data = a_countries, aes(x=year, y=lifeExp, colour = continent))+
  geom_line()+
  facet_wrap(~country)
rough_plot +
  labs(title="Figure 1",
       x= "Year",
       y="Life Expectancy",
       colour= "Continent")
#Challege 1- changes title and caption
rough_plot <- ggplot(data = a_countries, aes(x=year, y=lifeExp, colour = continent))+
  geom_line()+
  facet_wrap(~country)
rough_plot

rough_plot +
  labs(title="Growth in Life Expectancy for 'A' countries",
       x= "Year",
       y="Life Expectancy",
       colour= "Continent",
       caption="Source: gapminder data")+
       theme_bw()+
       theme(
        panel.grid.minor = element_blank(), # element_ blank gets rids of things
        plot.title = element_text(face = "bold")
      )
#Challenge 2
rough_plot +
  labs(title="Growth in Life Expectancy for 'A' countries",
       x= "Year",                                       #x- axis title
       y="Life Expectancy",                             #y- axis title
       colour= "Continent",
       caption="Source: gapminder data")+               #add caption  
  theme_bw()+
  theme(
    panel.grid.minor = element_blank(),                   # element_ blank gets rids of things
    strip.background = element_blank(),                   # removes grey boxes
    panel.grid.major = element_line(size = 1),            #increase size of major grids
    axis.title = element_text(size = 10, colour = "blue"),# changes the axis title font size and colour
    legend.position = "bottom",                           #changes position of legend
    plot.title = element_text(face = "bold")              # makes plot title bold
  )
# save plots
lifeExp_plot <- rough_plot +
  labs(title="Growth in Life Expectancy for 'A' countries",
       x= "Year",                                       #x- axis title
       y="Life Expectancy",                             #y- axis title
       colour= "Continent",
       caption="Source: gapminder data")+               #add caption  
  theme_bw()+
  theme(
    panel.grid.minor = element_blank(),                   # element_ blank gets rids of things
    strip.background = element_blank(),                   # removes grey boxes
    panel.grid.major = element_line(size = 1),            #increase size of major grids
    axis.title = element_text(size = 10, colour = "blue"),# changes the axis title font size and colour
    legend.position = "bottom",                           #changes position of legend
    plot.title = element_text(face = "bold")              # makes plot title bold
  )

lifeExp_plot
ggsave(filename = "results/lifeExp.png", plot = lifeExp_plot,
       width = 12, height = 10, dpi = 300, units = "cm")

#can also change height and to jpg format
ggsave(filename = "results/lifeExp.jpg", plot = lifeExp_plot,
       width = 15, height = 12, dpi = 300, units = "cm")


# Multi-panel plots
install.packages("cowplot")
library(cowplot) 

plot1 <- ggplot(gapminder, aes(x=gdpPercap, y= lifeExp)) + geom_point()
plot2 <- ggplot(gapminder, aes(x=continent, y= lifeExp)) + geom_boxplot()
plot3 <- ggplot(gapminder, aes(x=gdpPercap, y= pop)) + geom_point()
plot4 <- ggplot(gapminder, aes(x=lifeExp, y= pop)) + geom_point()

plot_grid(plot1,plot2,plot3,plot4, rel_heights = c(1,3),
  rel_widths=c(4,1)) # specify heights and widths of our rows

plot_grid(plot1,plot2,plot3,plot4, labels = "AUTO") #can also use auto to label in lowercase

#Producing Reports with knitr/ R Markdown








