"iqd" <-
  structure(
            c(4L, 0L, 2L, 3L, 3L, 0L, 0L,
              1L, 1L, 1L, NA, NA, 4L, NA,
              1L, 2L, NA, 2L, NA, NA, 3L,
              1L, NA, 1L, 0L, 2L, NA, NA
              ),
            dim = c(7L, 4L),
            dimnames = structure(
              list(
                   c(" ", " ", " ", " ", " ", " ", " "),
                   machine = c("A", "B", "C", "D")
                   ),
              .Names = c("", "machine")
              )
            )

"shifts" <-
  structure(
            c(9L, 2L, 3L,
              1L, 3L, 3L,
              NA, 8L, 2L
              ),
            dim = c(3L, 3L),
            dimnames = structure(
              list(
                   operator = c("S1", "S2", "S3"),
                   machine  = c("A", "B", "C"   )
                   ),
              .Names = c("operator", "machine")
              )
            )
