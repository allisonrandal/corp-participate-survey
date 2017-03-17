library(corrplot)

args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv("survey_results.csv",head=TRUE)

valuecols <- subset(survey,
        select = c('value.softint','value.hardint','value.support',
                   'value.service','value.xaas','value.improve',
                   'value.cadence','value.expert')
    )

# Change the column names
names(valuecols) <- c('Software','Hardware','Support','Services','XaaS','Improve','Release','Expertise')
# Set all values to TRUE
valuelogic <- (valuecols > 0)
# Set NA to FALSE
valuelogic[is.na(valuelogic)] <- FALSE

engagecols <- subset(survey,
        select = c('engage.inner','engage.use','engage.dist','engage.integrate',
                   'engage.solo','engage.soloext','engage.active','engage.contrib',
                   'engage.colead')
    )

# Change the column names
names(engagecols) <- c('InnerSource','Use','Deliver to Customers','Integrate Proprietary','No Community','Some Community','Active Community','Contribute','Co-lead')
# Set all values to TRUE
engagelogic <- (engagecols > 0)
# Set NA to FALSE
engagelogic[is.na(engagelogic)] <- FALSE

corrmatrix <- cor(engagelogic, valuelogic, method="kendall")
#corrmatrix <- cor(valuelogic, engagelogic)
print(corrmatrix)
png(outFile)
corrplot(corrmatrix, method='circle')

# See https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
# and also http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software
