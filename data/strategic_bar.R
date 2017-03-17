library(RColorBrewer)

args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv(file="survey_results.csv",head=TRUE,sep=",")

labeled <- factor(survey$strategic,
    levels = c(1:5),
    labels = c("Strongly\nDisagree", "Disagree\n", "Neutral\n", "Agree\n", "Strongly\nAgree"))

counts <- table(labeled)

rowcount <- sum(counts)
percentage <- counts / rowcount * 100

png(outFile)
barplot(percentage,
    ylab="Percentage",
    col=brewer.pal(5,"BrBG"),
   )
