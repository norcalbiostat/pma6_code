raw <- read.table("../../data6e/Cluster.txt", header=TRUE, sep = "\t")

# Remove non-data columns
chem <- raw[,-c(1:3)]
set.seed(50)
results <- kmeans(chem, centers=3)

results$cluster


library(factoextra)

# grayscale for book
pdf("../../latex/Chapters/Chapter16/figures/kmeans.pdf", width=5, height=5)
fviz_cluster(results, data=chem) + theme_bw() + 
      scale_colour_grey() + scale_fill_grey()
dev.off()

# viridis
pdf("../../latex/Chapters/Chapter16/figures/kmeans_viridis.pdf", width=5, height=5)
fviz_cluster(results, data=chem) + theme_bw() +  ggtitle("") +
  scale_colour_viridis_d() + scale_fill_viridis_d()
dev.off()

# black and transparent copy for cover
pdf("../../latex/Chapters/Chapter16/figures/kmeans_clear.pdf", width=5, height=5)
fviz_cluster(results, data=chem) + theme_bw() + ggtitle("")+
  scale_colour_manual(values =rep("black",3)) + scale_fill_manual(values=rep(NA,3))
dev.off()
