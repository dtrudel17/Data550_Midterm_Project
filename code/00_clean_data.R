here::i_am("code/00_clean_data.R")
here::here("f75_interim.csv")
absolute_file_location<-here::here("f75_interim.csv")
data<-read.csv(absolute_file_location, header=TRUE)
head(data)

library(labelled)
library(gtsummary)
var_label(data)<-list(
  subjid="ID",
  agemons="Age(months)",
  sex= "Sex",
  weight= "Weight at Baseline",
  height= "Height at Baseline",
  weight1= "Weight at Stabilization",
  muac1= "MUAC at Stabilization",
  muac= "MUAC at Baseline",
  arm= "Randomization Arm",
  milkfeed="F75 Given Prior to Enrollment",
  tb= "Known TB (treated)",
  chronic_cough= "Chronic cough",
  sickle_cell= "Sickle Cell Disease",
  heart_disease= "Heart Disease",
  cerebral_palsy= "Cerebral Palsy",
  kwash= "Kwashiorkor",
  ofillness= "Other Febrile Illness",
  malaria= "Malaria",
  sev_pneumonia= "Severe Pneumonia",
  site= "Study site",
  oedema= "Edema at Baseline",
  oedema1= "Edema at Stabilization",
  bfeeding= "Currently Breastfeeding",
  hiv_results= "HIV Antibody Test",
  caregiver= "Primary Caregiver",
  days_stable= "Days to Stabilization",
  shock= "Signs of Shock",
  iconsciousness= "Imparied Consciousness",
  diarrhoea= "Diarrhea"
)

#data$hgb_levels <- ifelse(data$hgb < 11, "< 11", ">= 11")

saveRDS(
  data, 
  file = here::here("output/cleandata.rds")
)