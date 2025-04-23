
here::i_am(
  "code/render_report.R"
)

WHICH_CONFIG <- Sys.getenv("WHICH_CONFIG")

config_list <- config::get(
  config = WHICH_CONFIG
)

rmarkdown::render(
  here::here("report.Rmd"), params = config_list)