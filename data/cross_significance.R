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
#names(valuecols) <- c('Software','Hardware','Support','Services','XaaS','Improve','Release','Expertise')
# Set NA to zero
valuecols[is.na(valuecols)] <- 0

engagecols <- subset(survey,
        select = c('engage.inner', 'engage.use','engage.dist','engage.integrate',
                   'engage.solo','engage.soloext','engage.active','engage.contrib',
                   'engage.colead')
    )

# Change the column names
#names(engagecols) <- c('InnerSource','Use','Deliver to Customers','Integrate Proprietary','No Community','Some Community','Active Community','Contribute','Co-lead')
# Set NA to FALSE
engagecols[is.na(engagecols)] <- 0

# Level 3 engagement focused on distribution, value proposition on software integration
signif <- cor.test(engagecols[,'engage.dist'], valuecols[,'value.softint'], method="kendal")
print(signif)

# Level 5 engagement focused on contribution, value proposition on support
signif <- cor.test(engagecols[,'engage.contrib'], valuecols[,'value.support'], method="kendal")
print(signif)

# Level 4 engagement with active community, value proposition on domain expertise
signif <- cor.test(engagecols[,'engage.active'], valuecols[,'value.expert'], method="kendal")
print(signif)

# Level 4 engagement with no community, value proposition on offering software as a service
signif <- cor.test(engagecols[,'engage.solo'], valuecols[,'value.xaas'], method="kendal")
print(signif)

# See https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
# and also http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software
