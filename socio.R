#plotting the sociolinguistic parameters

library(ggplot2)
library(ggrepel)
library(reshape)
library(tidyverse)
library(dplyr)

gen <- read.csv("dag_rus_with_socio.csv", stringsAsFactors=TRUE)

gen %>%
  count(speaker, year, gender, education, village, `position`) %>%
  spread(`position`, n, fill = 0) %>%
  mutate(total = left+right,
         ratio = left/total) %>%
  mutate(speaker = reorder(speaker, ratio)) %>%
  ggplot(aes(year, ratio, color  = gender, shape = education, label = paste0(village, " (", total, ")")))+
  geom_point()+
  scale_colour_manual(values = c("black", "grey50"))+
  ggrepel::geom_text_repel()+
  theme_bw()






