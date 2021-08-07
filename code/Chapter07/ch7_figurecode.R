data.in  <- "E:/Dropbox/PMA6/PMA6_Shared/data6e/"
plot.out <- "E:/Dropbox/PMA6/PMA6_Shared/latex/Chapters/Chapter07/figures/"
fev <- read.delim(paste0(data.in,"Lung.txt"), sep="\t", header=TRUE)
library(ggplot2)


# Fig 7.1
fev.model <- lm(FFEV1~FHEIGHT, data=fev)

ggplot(fev, aes(x=FHEIGHT, y=FFEV1)) + geom_point() + 
        geom_smooth(se=FALSE, method="lm", col="black") + 
        scale_x_continuous(limits = c(58, 78), breaks=seq(58, 78, by=4)) + 
        labs(title="Scatterplot (LUNG.STA 32v*150c)", subtitle=bquote("y = -4.087 + 0.118x"~ + epsilon)) + 
        theme_classic() + theme(plot.title = element_text(hjust = 0.5)) 

ggsave(paste0(plot.out, "fig7-1.pdf"), width=6, height=4)
