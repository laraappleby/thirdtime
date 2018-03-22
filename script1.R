#import data
setwd("~/Desktop/")
mydata <- read.csv("BLL.csv", stringsAsFactors = FALSE)
#head(mydata)

#store and remove full question text row
questions=mydata[1,]
mydata2 = mydata[-1, ]
#head(mydata2)

#remove import ID row
mydata3 = mydata2[-1, ]
head(mydata3)

#attach questions as attributes
attr(mydata3$Q13_1, "full.name") <- "When lab connects to a real world problem, I feel…Interested"
attr(mydata3$Q13_2, "full.name") <- "When lab connects to a real world problem, I feel…Frustrated"
attr(mydata3$Q13_3, "full.name") <- "When lab connects to a real world problem, I feel…Excited"
attr(mydata3$Q13_4, "full.name") <- "When lab connects to a real world problem, I feel…Challenged"
attr(mydata3$Q14_1, "full.name") <- "When I am responsible for choosing the research question, I feel…Interested"
attr(mydata3$Q14_2, "full.name") <- "When I am responsible for choosing the research question, I feel…Frustrated"
attr(mydata3$Q14_3, "full.name") <- "When I am responsible for choosing the research question, I feel…Excited"
attr(mydata3$Q14_4, "full.name") <- "When I am responsible for choosing the research question, I feel…Challenged"
attr(mydata3$Q15_1, "full.name") <- "When I work with live organisms in lab, I feel…Interested"
attr(mydata3$Q15_2, "full.name") <- "When I work with live organisms in lab, I feel…Frustrated"
attr(mydata3$Q15_3, "full.name") <- "When I work with live organisms in lab, I feel…Excited"
attr(mydata3$Q15_4, "full.name") <- "When I work with live organisms in lab, I feel…Challenged"
attr(mydata3$Q16_1, "full.name") <- "When my findings are unexpected, I feel…Interested"
attr(mydata3$Q16_2, "full.name") <- "When my findings are unexpected, I feel…Frustrated"
attr(mydata3$Q16_3, "full.name") <- "When my findings are unexpected, I feel…Excited"
attr(mydata3$Q16_4, "full.name") <- "When my findings are unexpected, I feel…Challenged"
attr(mydata3$Q17_1, "full.name") <- "When my experiment runs smoothly, I feel…Interested"
attr(mydata3$Q17_2, "full.name") <- "When my experiment runs smoothly, I feel…Frustrated"
attr(mydata3$Q17_3, "full.name") <- "When my experiment runs smoothly, I feel…Excited"
attr(mydata3$Q17_4, "full.name") <- "When my experiment runs smoothly, I feel…Challenged"
attr(mydata3$Q18_1, "full.name") <- "When my data are open to multiple interpretations, I feel…Interested"
attr(mydata3$Q18_2, "full.name") <- "When my data are open to multiple interpretations, I feel…Frustrated"
attr(mydata3$Q18_3, "full.name") <- "When my data are open to multiple interpretations, I feel…Excited"
attr(mydata3$Q18_4, "full.name") <- "When my data are open to multiple interpretations, I feel…Challenged"
attr(mydata3$Q19_1, "full.name") <- "When I design the experiment, I feel…Interested"
attr(mydata3$Q19_2, "full.name") <- "When I design the experiment, I feel…Frustrated"
attr(mydata3$Q19_3, "full.name") <- "When I design the experiment, I feel…Excited"
attr(mydata3$Q19_4, "full.name") <- "When I design the experiment, I feel…Challenged"
attr(mydata3$Q20, "full.name") <- "Which student do you agree with more? Alan/Bob"
attr(mydata3$Q21, "full.name") <- "Which student do you agree with more? Candice/Diana"
attr(mydata3$Q22, "full.name") <- "Which student do you agree with more? Ellen/Frank"
attr(mydata3$Q35, "full.name") <- "Which student do you agree with more? Gina/Harold"
attr(mydata3$Q27, "full.name") <- "What was the last biology course you took prior to Bio14?"
attr(mydata3$Q29, "full.name") <- "Which best describes your intended major?"
attr(mydata3$Q31, "full.name") <- "Which best describes your year in college?"
attr(mydata3$Q9, "full.name") <- "I expect that the data I analyze in lab will support a single conclusion."
attr(mydata3$Q12, "full.name") <- "A lab course might include computer simulations to teach computational skills."
attr(mydata3$Q8, "full.name") <- "I expect that the data I analyze in lab will reinforce concepts learned from lecture."
attr(mydata3$Q7, "full.name") <- "The primary purpose of collecting data in lab is to identify patterns to try to explain."
attr(mydata3$Q11, "full.name") <- "A lab course might include computer simulations because they can generate unanswered questions."
attr(mydata3$Q10, "full.name") <- "A lab course might include computer simulations because they are more reliable than experiments at teaching core concepts."
attr(mydata3$Q5, "full.name") <- "It is most important for me to learn how to write a lab report that demonstrates that I have learned the correct concepts."
attr(mydata3$Q3, "full.name") <- "It is most important for me to learn how to write a lab report in the correct scientific format."
attr(mydata3$Q4, "full.name") <- "It is most important for me to learn how to write a lab report that expresses my own scientific ideas."
attr(mydata3$Q6, "full.name") <- "The primary purpose of collecting data in lab is to practice proper laboratory techniques /skills."

#replace "" with NA
mydata3[mydata3 == ""] <- NA

#make duration numeric
mydata3$Duration..in.seconds.=as.numeric(mydata3$Duration..in.seconds.)

#summarize duration
summary(mydata3$Duration..in.seconds.)

#get total n
dim(mydata3)[1]

#filter out rows with duration less than 2 minutes (120 seconds)
mydata3=mydata3[which(mydata3$Duration..in.seconds.>120),]
dim(mydata3)[1]

#store question groupings as attributes of the data frame
attr(mydata3, "likert.groups") <- list(
  "Q13" = c("Q13_1","Q13_2","Q13_3","Q13_4"),
  "Q14" = c("Q14_1","Q14_2","Q14_3","Q14_4"),
  "Q15" = c("Q15_1","Q15_2","Q15_3","Q15_4"),
  "Q16" = c("Q16_1","Q16_2","Q16_3","Q16_4"),
  "Q17" = c("Q17_1","Q17_2","Q17_3","Q17_4"),
  "Q18" = c("Q18_1","Q18_2","Q18_3","Q18_4"),
  "Q19" = c("Q19_1","Q19_2","Q19_3","Q19_4"),
  "personalized" = c("Q20","Q21","Q22","Q35"),
  "background" = c("Q27","Q29","Q31"),
  "simple" = c("Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10","Q11","Q12"),
  "identifiers" = c("Q32_1","Q32_2","Q32_3"),
  "grouped" = c("Q13_1","Q13_2","Q13_3","Q13_4","Q14_1","Q14_2","Q14_3","Q14_4","Q15_1","Q15_2","Q15_3","Q15_4","Q16_1","Q16_2","Q16_3","Q16_4","Q17_1","Q17_2","Q17_3","Q17_4","Q18_1","Q18_2","Q18_3","Q18_4","Q19_1","Q19_2","Q19_3","Q19_4")
)

str(mydata3)

#convert data in likert columns to numbers
mydata3[,18:55]=sapply(mydata3[,18:55], function(x) as.integer(factor(as.character(x), levels=c("Strongly agree","Somewhat agree","Neither agree nor disagree","Somewhat disagree","Strongly disagree"),ordered=TRUE)))

#convert data in likert-like columns (columns 39 through 42) to numbers
mydata3[,56]=sapply(mydata3[,56], function(x) as.integer(factor(as.character(x), levels=c("I completely agree with Alan","I mostly agree with Alan","I agree equally with Alan and Bob","I mostly agree with Bob","I completely agree with Bob"),ordered=TRUE)))
mydata3[,57]=sapply(mydata3[,57], function(x) as.integer(factor(as.character(x), levels=c("I completely agree with Candice","I mostly agree with Candice","I agree equally with Candice and Diana","I mostly agree with Diana","I completely agree with Diana"),ordered=TRUE)))
mydata3[,58]=sapply(mydata3[,58], function(x) as.integer(factor(as.character(x), levels=c("I completely agree with Ellen","I mostly agree with Ellen","I agree equally with Ellen and Frank","I mostly agree with Frank","I completely agree with Frank"),ordered=TRUE)))
mydata3[,59]=sapply(mydata3[,59], function(x) as.integer(factor(as.character(x), levels=c("I completely agree with Gina","I mostly agree with Gina","I agree equally with Gina and Harold","I mostly agree with Harold","I completely agree with Harold"),ordered=TRUE)))

#convert the likert data from numeric to factors
for (i in 18:59){
  mydata3[,i] = factor(mydata3[,i],
                        levels = c("1", "2", "3", "4", "5"),
                        ordered = TRUE)
}

#Result = likert(mydata3[,18:56])
#plot(Result,type="bar")

#generate plots

png("Simple group.png")
Result = likert(mydata3[,18:27, drop=FALSE])
plot(Result,type="bar")
dev.off()

png("Alan and Bob.png")
Result = likert(mydata3[,56, drop=FALSE])
plot(Result,type="bar")
dev.off()

png("Candice and Diana.png")
Result = likert(mydata3[,57, drop=FALSE])
plot(Result,type="bar")
dev.off()

png("Ellen and Frank.png")
Result = likert(mydata3[,58, drop=FALSE])
plot(Result,type="bar")
dev.off()

png("Gina and Harold.png")
Result = likert(mydata3[,59, drop=FALSE])
plot(Result,type="bar")
dev.off()

png("Q13-When lab connects to a real world problem, I feel.png")
mydatatemp=NULL
mydatatemp=data.frame(apply(cbind(mydata3$Q13_1,mydata3$Q13_2,mydata3$Q13_3,mydata3$Q13_4),2,as.factor))
colnames(mydatatemp)=c("Interested","Frustrated","Excited","Challenged")
for (i in 1:4){
  mydatatemp[,i] = factor(mydatatemp[,i],
                          levels = c("1", "2", "3", "4", "5"),
                          ordered = TRUE)
}
Result = likert(mydatatemp)
plot(Result,type="bar")
dev.off()

png("Q14-When I am responsible for choosing the research question, I feel.png")
mydatatemp=NULL
mydatatemp=data.frame(apply(cbind(mydata3$Q14_1,mydata3$Q14_2,mydata3$Q14_3,mydata3$Q14_4),2,as.factor))
colnames(mydatatemp)=c("Interested","Frustrated","Excited","Challenged")
for (i in 1:4){
  mydatatemp[,i] = factor(mydatatemp[,i],
                          levels = c("1", "2", "3", "4", "5"),
                          ordered = TRUE)
}
Result = likert(mydatatemp)
plot(Result,type="bar")
dev.off()

png("Q15-When I work with live organisms in lab, I feel.png")
mydatatemp=NULL
mydatatemp=data.frame(apply(cbind(mydata3$Q15_1,mydata3$Q15_2,mydata3$Q15_3,mydata3$Q15_4),2,as.factor))
colnames(mydatatemp)=c("Interested","Frustrated","Excited","Challenged")
for (i in 1:4){
  mydatatemp[,i] = factor(mydatatemp[,i],
                          levels = c("1", "2", "3", "4", "5"),
                          ordered = TRUE)
}
Result = likert(mydatatemp)
plot(Result,type="bar")
dev.off()

png("Q16-When my findings are unexpected, I feel.png")
mydatatemp=NULL
mydatatemp=data.frame(apply(cbind(mydata3$Q16_1,mydata3$Q16_2,mydata3$Q16_3,mydata3$Q16_4),2,as.factor))
colnames(mydatatemp)=c("Interested","Frustrated","Excited","Challenged")
for (i in 1:4){
  mydatatemp[,i] = factor(mydatatemp[,i],
                          levels = c("1", "2", "3", "4", "5"),
                          ordered = TRUE)
}
Result = likert(mydatatemp)
plot(Result,type="bar")
dev.off()

png("Q17-When my experiment runs smoothly, I feel.png")
mydatatemp=NULL
mydatatemp=data.frame(apply(cbind(mydata3$Q17_1,mydata3$Q17_2,mydata3$Q17_3,mydata3$Q17_4),2,as.factor))
colnames(mydatatemp)=c("Interested","Frustrated","Excited","Challenged")
for (i in 1:4){
  mydatatemp[,i] = factor(mydatatemp[,i],
                          levels = c("1", "2", "3", "4", "5"),
                          ordered = TRUE)
}
Result = likert(mydatatemp)
plot(Result,type="bar")
dev.off()

png("Q18-When my data are open to multiple interpretations, I feel.png")
mydatatemp=NULL
mydatatemp=data.frame(apply(cbind(mydata3$Q18_1,mydata3$Q18_2,mydata3$Q18_3,mydata3$Q18_4),2,as.factor))
colnames(mydatatemp)=c("Interested","Frustrated","Excited","Challenged")
for (i in 1:4){
  mydatatemp[,i] = factor(mydatatemp[,i],
                          levels = c("1", "2", "3", "4", "5"),
                          ordered = TRUE)
}
Result = likert(mydatatemp)
plot(Result,type="bar")
dev.off()

png("Q19-When I design the experiment, I feel.png")
mydatatemp=NULL
mydatatemp=data.frame(apply(cbind(mydata3$Q19_1,mydata3$Q19_2,mydata3$Q19_3,mydata3$Q19_4),2,as.factor))
colnames(mydatatemp)=c("Interested","Frustrated","Excited","Challenged")
for (i in 1:4){
  mydatatemp[,i] = factor(mydatatemp[,i],
                          levels = c("1", "2", "3", "4", "5"),
                          ordered = TRUE)
}
Result = likert(mydatatemp)
plot(Result,type="bar")
dev.off()

#convert background data to factors
for (i in 63:65){
  mydata3[,i] = factor(mydata3[,i]
#                       , ordered = TRUE
)
}

#plot the background data
barplot(table(mydata3[,64]))
      #  ~ levels(mydata3[,64]))
