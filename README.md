## Data550 Midterm Project

## Initial code description

`code/00_clean_data.R`

-   cleans data so it can be more easily analyzed
-   produces clean data in `output/cleandata.rds`

`code/01_table1.R`

-   produces table1 in `output/table1.rds`

`code/02_graph1.R`

-   produces graph1 in `output/graph1.png`

`code/03_graph2.R`

-   produces graph2 in `output/graph2.png`

`code/render_report.R`

-   renders `report.Rmd`

`report.Rmd`

-   compiles output from all of the code and creates `report.html`

------------------------------------------------------------------------

## How to render the report

### Github

1.  click `create fork` for the midterm repository to copy it to your own Github
2.  Using the terminal, `cd` into the directory that you want the project to be copied into
3.  run `git clone https://github.com/<username>/<forked_repo>` to copy the repo from Github to your local computer

### To Generate The Test Report

4.  Run `export WHICH_CONFIG="test"` in the terminal while in the project directory
5.  Run `make report.html` to generate the complete report
6.  Run `make clean` to remove contents of the output folder and `report.html`

### To Generate The Final Report

4.  Run `export WHICH_CONFIG="default"` if you would like to view the final report with no code
5.  Run `make report.html` in the terminal while in the project directory to generate the complete report
6.  Run `make clean` to remove contents of the output folder and `report.html`
