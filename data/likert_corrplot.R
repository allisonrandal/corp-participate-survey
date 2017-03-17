library(corrplot)

args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv("survey_results.csv",head=TRUE)

likertcols <- subset(survey,
        select = c('strategic','tracking','goals',
                   'mindelta','cop','reward')
    )

# Set NA to zero
#likertcols[is.na(likertcols)] <- 0

corrmatrix <- cor(likertcols, method="spearman", use = "complete.obs")
print(corrmatrix)
png(outFile)
corrplot(corrmatrix, type='upper', method='circle', order='FPC')

# See https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
# and also http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software
