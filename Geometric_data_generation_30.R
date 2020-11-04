#Dataset generation:
set.seed(1)
X <- rgeom(n=30, prob=0.5)
write.csv(X, "Geom_sample.csv")