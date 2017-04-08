library(RColorBrewer)

args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv("survey_results.csv",head=TRUE)

engagecols <- subset(survey,
        select = c('engage.inner','engage.use','engage.dist','engage.integrate',
                   'engage.solo','engage.soloext','engage.active','engage.contrib',
                   'engage.colead')
    )

counts <- table(as.matrix(engagecols))
percentage <- counts / 44 * 100

png(outFile, width=800)
barplot(percentage,
    ylab="Percentage of respondents",
    ylim=c(0,100),
    col=brewer.pal(9,"Spectral"),
#    names.arg=c("InnerSource\n","Use\n","Deliver to\nCustomers","Integrate\nProprietary","No\nCommunity","Some\nCommunity","Active\nCommunity","Contribute\n","Co-lead\n")
    names.arg=c("engage.\ninner","engage.\nuse","engage.\ndist","engage.\nintegrate","engage.\nsolo","engage.\nsoloext","engage.\nactive","engage.\ncontrib","engage.\ncolead")
   )
