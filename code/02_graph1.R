here::i_am("code/02_graph1.R")

#loading in package
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(tidyselect)

#loading in data and formatting it for analysis
data<-readRDS(here::here("output/cleandata.rds"))
vars<-names(data)
muac_vars<-vars_select(vars,starts_with("muac"))
print(muac_vars)
data2<-data %>% pivot_longer(c(paste(muac_vars)), names_to="category_muac", values_to="value_muac")
data2$arm<-ifelse(data2$arm=="Modified F75 (intervention)", "Modified F75", "Standard F75")

#creating graph for muac by treatment arm
my_comparisons<-list(c("Modified F75", "Standard F75"))



graph<-ggplot(data2, aes(y=value_muac,x=arm, fill=arm))+geom_boxplot()+
  stat_compare_means(comparisons=my_comparisons, method="t.test")+facet_wrap(~category_muac)+
  labs(x="Treatment Group", y="MUAC (cm)", title="Mid-Upper Arm Circumference (MUAC) by Treatment Group")

saveRDS(graph, file=here::here("output/graph1.rds"))

