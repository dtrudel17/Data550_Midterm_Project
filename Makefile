report.html: report.Rmd output code/render_report.R output/cleandata.rds output/table1.rds output/graph1.rds output/graph2.rds
	Rscript code/render_report.R
	
.PHONY: install
install:
	Rscript -e "renv::activate()"
	Rscript -e "renv::restore(prompt = FALSE)"

output: 
	mkdir output

output/cleandata.rds: output code/00_clean_data.R f75_interim.csv
	Rscript code/00_clean_data.R
	
output/table1.rds: output code/01_table1.R output/cleandata.rds
	Rscript code/01_table1.R
	
output/graph1.rds: output code/02_graph1.R output/cleandata.rds
	Rscript code/02_graph1.R
	
output/graph2.rds: output code/03_graph2.R output/cleandata.rds
	Rscript code/03_graph2.R

.PHONY: clean
clean:
	rm output/*.rds && rm report.html