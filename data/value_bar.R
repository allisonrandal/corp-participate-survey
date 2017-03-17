library(RColorBrewer)

args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv("survey_results.csv",head=TRUE)

valuecols <- subset(survey,
        select = c('value.softint','value.hardint','value.support',
                   'value.service','value.xaas','value.improve',
                   'value.cadence','value.expert')
    )

counts <- table(as.matrix(valuecols))
percentage <- counts / 44 * 100

png(outFile, width=800)
barplot(percentage,
    ylab="Percentage of respondents",
    col=brewer.pal(9,"Spectral"),
    names.arg=c("Software\nintegration","Hardware\nintegration","Support\n",
                "Services\n","Software as\na Service","Improve\n",
                "Release\ntiming","Domain\nexpertise")
   )
