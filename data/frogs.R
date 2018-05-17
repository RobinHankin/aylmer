require("aylmer",quietly=TRUE)

"frogs.matrix" <-
  matrix(c(
            NA, 10L,  8L,  7L,  6L,  7L,  4L,  5L,  3L,
           10L,  NA,  7L, 12L,  8L,  4L,  1L,  5L,  4L,
           12L, 13L,  NA,  8L, 10L,  6L,  8L,  8L,  2L,
           13L,  8L, 12L,  NA, 10L, 10L,  4L,  4L,  9L,
           14L, 12L, 10L, 10L,  NA, 15L, 10L,  8L,  2L,
           13L, 16L, 14L, 10L,  5L,  NA,  6L, 11L,  9L,
           16L, 19L, 12L, 16L, 10L, 14L,  NA,  5L,  8L,
           15L, 15L, 12L, 16L, 12L,  9L, 15L,  NA, 13L,
           17L, 16L, 18L, 11L, 18L, 11L, 12L,  7L,  NA
           ),9,9,byrow=TRUE)

rownames(frogs.matrix) <- 
c("Sc", "Sb", "Ob", "Oa", "Oc", "Sa", "Sd", "Od", "M")
colnames(frogs.matrix) <- rownames(frogs.matrix)

frogs <- as.pairwise(frogs.matrix)
