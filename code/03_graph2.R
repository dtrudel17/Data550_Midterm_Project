here::i_am("code/03_graph2.R")

#loading in package
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(tidyselect)

#loading in data and formatting it for analysis
data<-readRDS(here::here("output/cleandata.rds"))
vars<-names(data)
weight_vars<-vars_select(vars,starts_with("weight"))
print(weight_vars)
data2<-data %>% pivot_longer(c(paste(weight_vars)), names_to="category_weight", values_to="value_weight")
data2$arm<-ifelse(data2$arm=="Modified F75 (intervention)", "Modified F75", "Standard F75")

#creating graph for weight by treatment arm
my_comparisons<-list(c("Modified F75", "Standard F75"))



graph<-ggplot(data2, aes(y=value_weight,x=arm, fill=arm))+geom_boxplot()+
  stat_compare_means(comparisons=my_comparisons, method="t.test")+facet_wrap(~category_weight)+
  labs(x="Treatment Group", y="Weight Measurement(kg)", title="Weight by Treatment Group")

saveRDS(graph, file=here::here("output/graph2.rds"))

