args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv("survey_results.csv",head=TRUE)

png(outFile)
plot(survey$cop, survey$reward)
