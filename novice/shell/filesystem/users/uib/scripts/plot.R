args = commandArgs(trailingOnly = TRUE)

dat = read.delim(args[1], stringsAsFactors = FALSE)

pdfname = paste(args[1], ".pdf", sep ="")

pdf(file = pdfname)

xlimit = c(200, 12000)
ylimit = c(20, 85)

plot(lifeExp ~ gdpPercap, dat, log = "x", xlim = xlimit, ylim = ylimit)
fit = lm(lifeExp ~ log10(gdpPercap), dat)
abline(fit)

dev.off()

