here::i_am("code/01_table1.R")

data<-readRDS(
  file= here::here("output/cleandata.rds")
)

library(gtsummary)
library(cardx)
library(broom)

table1<- data |>
  select ("site", "agemons","sex","weight", "height", "muac", "milkfeed", "bfeeding", "caregiver",
  "hiv_results", "oedema", "diarrhoea","chronic_cough" ,"tb", "malaria", "sickle_cell", "heart_disease",
  "cerebral_palsy", "kwash", "ofillness", "sev_pneumonia", "shock", "arm") |>
  tbl_summary(by= arm) |>
  modify_spanning_header(c("stat_1","stat_2")~"**Treatment") |>
  add_overall() |>
  add_p()

saveRDS(
  table1, 
  file= here::here("output/table1.rds")
)