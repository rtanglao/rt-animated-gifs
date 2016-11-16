library(plotrix)

printf <- function(...) {
  invisible(print(sprintf(...)))
}

args <- commandArgs(TRUE)

## Default setting when no arguments passed
if (length(args) < 1) {
  args <- c("--help")
}
if ("--help" %in% args) {
  cat(
    "
    Arguments:
    CSV file with 1 column of hex colours
    --help              - print this text
    Example:
    Rscript make-radial-one-colour-image flickr-roland-2004-12-avgcolour.txt \n\n"
  )
  q(save = "no")
}

colours = read.csv(args[1], header = TRUE, stringsAsFactors = F)

main <- function() {
    degree_index = 90
    for(row in 1:nrow(colours)) {
        filename = sprintf("%7.7d-%s", row, gsub("txt", "png", basename(args[1])))
        png(file=filename, width=1024, height=1024, res=72, bg = "transparent")
        plot(0, xlim=c(1,5), ylim=c(1,5), main="", xlab="", ylab="", type="n", axes=F)
        draw.radial.line(0,2,deg= degree_index, center=c(3,3), col= colours[row,], expand = FALSE, lwd = 30)
        dev.off()
        degree_index = degree_index - 1
        if (degree_index == -1) {
            degree_index == 359
        }
    }
}

sink("log.txt")

main()

sink()
