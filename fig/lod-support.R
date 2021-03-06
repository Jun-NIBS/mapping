library(qtl2)
iron <- read_cross2(file = system.file("extdata", "iron.zip", package="qtl2geno") )
map <- insert_pseudomarkers(map=iron$gmap, step=1)
pr <- calc_genoprob(cross=iron, map=map, error_prob=0.002)
Xcovar <- get_x_covar(iron)
out <- scan1(genoprobs = pr, pheno = iron$pheno, Xcovar=Xcovar)

png(filename = "lod-support.png", width = 600, height = 600)
plot_scan1(out, map = map, lodcolumn = "liver", chr = 16)
segments(x0 = 20.6, y0 = 6.18, x1 = 33.6, lty = 4, col = "red")
segments(x0 = 20.6, y0 = 0.5, x1 = 33.6, col = "red")
segments(x0 = 20.6, y0 = 0.25, y1 = 0.75, col = "red")
segments(x0 = 33.5, y0 = 0.25, y1 = 0.75, col = "red")
segments(x0 = 28.7, y0 = 7.68, y1 = 6.18, col = "red")
segments(x0 = 20.6, y0 = 6.18, y1 = 0.75, lty = 3, col = "pink4")
segments(x0 = 33.5, y0 = 6.18, y1 = 0.75, lty = 3, col = "pink4")
text(x = 27, y = 1, labels = "1.5 LOD\nsupport interval", cex = 0.9)
text(x = 27.5, y = 6.75, labels = "1.5\nLOD\ndrop", cex = 0.75)
text(x = 30.5, y = 7.7, labels = "7.68", cex = 0.75)
text(x = 30.5, y = 6.35, labels = "6.18", cex = 0.75)
dev.off()
