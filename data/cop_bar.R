library(RColorBrewer)

args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv("survey_results.csv",head=TRUE)

labeled <- factor(survey$cop,
    levels = c(1:5),
    labels = c("Strongly\nDisagree", "Disagree\n", "Neutral\n", "Agree\n", "Strongly\nAgree"))

counts <- table(labeled)
print(counts)

rowcount <- sum(counts)
percentage <- counts / rowcount * 100

print(percentage)
png(outFile)
barplot(percentage,
    ylab="Percentage",
    col=brewer.pal(5,"BrBG")
   )
