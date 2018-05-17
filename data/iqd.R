"iqd" <-
  structure(
            c(4L, 0L, 2L, 3L, 3L, 0L, 0L,
              1L, 1L, 1L, NA, NA, 4L, NA,
              1L, 2L, NA, 2L, NA, NA, 3L,
              1L, NA, 1L, 0L, 2L, NA, NA
              ),
            .Dim = c(7L, 4L),
            .Dimnames = structure(
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
            .Dim = c(3L, 3L),
            .Dimnames = structure(
              list(
                   operator = c("S1", "S2", "S3"),
                   machine  = c("A", "B", "C"   )
                   ),
              .Names = c("operator", "machine")
              )
            )
