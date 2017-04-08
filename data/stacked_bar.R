# total nonsense

library(RColorBrewer)

args <- commandArgs(TRUE)
outFile = args[1]

survey <- read.csv("survey_results.csv",head=TRUE)

# factors make sure all 5 options are represented, even if a particular option
# was never chosen for a particular question
strategic <- table(factor(survey$strategic, levels = c(1:5)))
tracking <- table(factor(survey$tracking, levels = c(1:5)))
goals <- table(factor(survey$goals, levels = c(1:5)))
cop <- table(factor(survey$cop, levels = c(1:5)))
reward <- table(factor(survey$reward, levels = c(1:5)))
mindelta <- table(factor(survey$mindelta, levels = c(1:5)))

# convert counts to percentages
perstrategic <- strategic / sum(strategic) * 100
pertracking <- tracking / sum(tracking) * 100
pergoals <- goals / sum(goals) * 100
percop <- cop / sum(cop) * 100
perreward <- reward / sum(reward) * 100
permindelta <- mindelta / sum(mindelta) * 100


counts <- rbind(permindelta, perreward, percop, pergoals, pertracking, perstrategic)

tcounts <- t(counts)
rownames(tcounts) <- c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree")
#colnames(tcounts) <- c("Minimize\nDelta", "Reward\nIndividuals", "Apply\nKnowledge", "Share\nGoals", "Track\nTrends", "Strategic\nAdvantage")
colnames(tcounts) <- c("mindelta", "reward", "cop", "goals", "tracking", "strategic")

print(tcounts)
png(outFile, width=600)
barplot(tcounts,
    horiz=TRUE,
    xlab="Percentage of respondents",
    col=brewer.pal(5,"BrBG"),
    legend = rownames(tcounts),
    cex.names=0.8
   )
