"glass.all" <-
  matrix(c(050, 045, 008, 018, 008,
           028, 174, 084, 154, 055,
           011, 078, 110, 223, 096,
           014, 150, 185, 714, 447,
           000, 042, 072, 320, 411
           ),nrow=5, byrow=TRUE)

dimnames(glass.all) <- list(father.status = 1:5 , son.status=1:5)

glass <- glass.all
diag(glass) <- NA

