chem <- read.table("E:/Dropbox/PMA6/PMA6_Shared/data6e/Chemical.txt", header=TRUE, sep = "\t")


library(glmnet)
x <- model.matrix(PE~., chem)[,-1]
y <- chem$PE


# Coefficient shrinkage
chem.lasso <- glmnet(x, y, alpha = 1)

pdf("Chapters/Chapter09/figures/chem_lasso_shrink.pdf", width=5, height=5)
  plot(chem.lasso, xvar = "lambda", col="grey20")
  mtext(side=3, "Number of Variables", line=2)
  text(-4, 9, "PAYOUTR1")
  text(-3, -2, "DE")
dev.off()

# Cross validation to find minimum lambda
set.seed(123) 
cv.lasso <- cv.glmnet(x, y, alpha = 1)

#pdf("Chapters/Chapter09/figures/chem_lasso_cv.pdf", width=5, height=5)
#  plot(cv.lasso, pch=15)
#dev.off()

# Fit the final model using the min lambda
model <- glmnet(x, y, alpha = 1, lambda = cv.lasso$lambda.min)
coef(model)

# standardize: Logical flag for x variable standardization, prior to 
# fitting the model sequence. The coefficients are always returned on the original scale. 
# Default is standardize=TRUE.

# OLS
#chem.std <- as.data.frame(scale(chem))
coef(lm(PE ~ DE + SALESGR5 + EPS5 + NPM1 + PAYOUTR1, data=chem))


