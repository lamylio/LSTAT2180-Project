#Dataset generation:
set.seed(1)
X <- rgeom(n=3000, prob=0.5)
table(X)
mean(X)
1/mean(X)
write.csv(X, "Geom_sample.csv")