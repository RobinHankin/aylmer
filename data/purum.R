"purum" <- matrix(c(
                    NA,   5L, 17L,  NA,  6L, 
                    5L,   NA,  0L, 16L,  2L, 
                    NA,   2L,  NA, 10L, 11L, 
                    10L,  NA,  NA,  NA,  9L, 
                     6L, 20L,  8L,  0L,  1L
                    ),nrow=5,byrow=TRUE)
"khulen" <- matrix(c(
                     NA, 2L, NA, 0L, 0L,
                     1L, NA, 2L, NA, 4L,
                     4L, 0L, NA, NA, 1L, 
                     NA, 6L, 2L, NA, 0L,
                     1L, 0L, 2L, 5L, NA
                     ),nrow=5,byrow=TRUE)

jj <- c("Marrim" , "Makan" , "Parpa" , "Thao" , "Kheyang")
dimnames(purum) <- list(wife=jj , husband=jj)
dimnames(khulen) <- list(wife=jj , husband=jj)
rm(jj)
