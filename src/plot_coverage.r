# This is an R script which will plot the output of the samtools depth command.
# The input coverage file needs to be named "coverage_new.txt".

# assign variable x:
x <- read.table("coverage_new.txt")

# plot data in x:
# write data into a PDF file format:
pdf("coverage_plot.pdf")
#plot(x)
plot(x, xlab = "genomic position", ylab = "coverage", type = "p", axes = TRUE)
dev.off()

# Exit R:
q()
