library(corrplot)

args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv("survey_results.csv",head=TRUE)

engagecols <- subset(survey,
        select = c('engage.inner','engage.use','engage.dist','engage.integrate',
                   'engage.solo','engage.soloext','engage.active','engage.contrib',
                   'engage.colead')
    )

# Change the column names
names(engagecols) <- c('InnerSource','Use','Distribute','Integrate Proprietary','No Community','Some Community','Active Community','Contribute','Colead')
# Set all values to TRUE
engagelogic <- (engagecols > 0)
# Set NA to FALSE
engagelogic[is.na(engagelogic)] <- FALSE

corrmatrix <- cor(engagelogic, method="kendall")
#print(corrmatrix)
png(outFile)
corrplot(corrmatrix, type='upper', method='circle', order='FPC')

# See https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
# and also http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software
