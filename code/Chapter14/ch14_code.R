# Analysis of depression data set
library(ggplot2)
library(dplyr)

# Read in depression data
dep <- read.delim("../../data6e/Depress.txt", header=TRUE, sep="\t")

# Extract just the CESD component scores
cesd.scores <- dep[,9:28]

# use the correlation matrix to generate PC's
pc_dep <- princomp(cesd.scores, cor=TRUE)

# figure 14.5a

plot.data <- data.frame(eigen=(pc_dep$sdev)^2, pcnum=1:20)
plot.data<- plot.data %>% mutate(cum_var=cumsum(eigen)/sum(eigen)*100)

ggplot(plot.data, aes(x=pcnum, y=cum_var)) + geom_point() + 
  xlab("Principal Components Number") + ylab("Cumulative Percentage") + 
  scale_y_continuous(limits=c(0,100)) + 
  scale_x_continuous(breaks=seq(1,20,by=1), 
                     labels=c(rep("",4), 5, rep("",4), 10, rep("",4), 15, rep("",4), 20))+ 
  theme_classic() 

# figure 14.5b

ggplot(plot.data, aes(x=pcnum, y=eigen)) + geom_point() + 
  xlab("Eigenvalue") + ylab("Cumulative Percentage") + 
  scale_y_continuous(limits=c(0,8),  breaks=seq(1,8,by=1)) + 
  scale_x_continuous(breaks=seq(1,20,by=1), 
                     labels=c(rep("",4), 5, rep("",4), 10, rep("",4), 15, rep("",4), 20))+ 
  theme_classic() 


# Table 14.2
# Extract factor loadings
loadings <- data.frame(pc_dep$loadings[,1:5])
# Apply groupings to questions as showin on table 14.2
loadings$group <- c(rep("Negative",7), rep("Positive",4), rep("Somatic",7), rep("Interpersonal",2))
# Create a vector of Question numbers from row names
loadings$question <- paste0("C", 1:20)
loadings$q <- 1:20 # for plotting purposes

# Reshape to long for plotting purposes
load_long <- tidyr::gather(loadings, PC, loading, Comp.1:Comp.5)


ggplot(load_long, aes(x=PC, y=rev(q), fill=abs(loading))) + geom_tile() + 
  scale_fill_gradient(name = "Magnitude of \n Coefficient", 
                      low = "white", high = "black", 
                      breaks=seq(0,.6,by=.2), labels=seq(0,.6,by=.2)) + 
  ylab("Question number") + xlab("Principal Component") + 
  scale_x_discrete(labels=1:5)+ scale_y_continuous(breaks =1:20, labels=20:1)+
  theme_classic() 

ggsave("../../latex/Chapters/Chapter14/figures/pca_heatmap.pdf", width=6)


# Color version
ggplot(load_long, aes(x=PC, y=rev(q), fill=loading)) + geom_tile() + 
  scale_fill_distiller(name = "Mangnitude of \n Coefficient", 
                       guide="colorbar", type="div", palette="RdBu", 
                      breaks=seq(-1,1,by=.2), labels=seq(-1,1,by=.2)) + 
  ylab("Question number") + xlab("Principle Component") + 
  scale_x_discrete(labels=1:5)+ scale_y_continuous(breaks =1:20, labels=20:1)+
  theme_classic() 
