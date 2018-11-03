a <- matrix(c(
    0, 4, 4, 6, 0,10, 0, 0, 0, 3, 
    7, 0, 0, 0, 6, 0, 4, 4, 7, 0, 
    9, 0, 0, 0, 5, 0, 7, 5, 9, 0, 
    5, 0, 0, 0, 6, 0,10, 8, 2, 0, 
    0, 7, 3, 5, 0, 6, 0, 0, 0, 6, 
    7, 0, 0, 0, 7, 0, 8, 4, 6, 0, 
    0, 4, 2, 4, 0, 6, 0, 0, 0, 8, 
    0, 6,12, 4, 0, 3, 0, 0, 0, 3, 
    0, 4, 3, 3, 0, 3, 0, 0, 0, 4, 
    0, 0, 0, 0, 4, 0, 2, 6, 6, 0
), 10, 10, byrow=TRUE)

rownames(a) <-
    c("NiKo","autimatic","tarik","Skadoodle","olofmeister", 
      "Stewie2k", "karrigan", "GuardiaN","rain","RUSH"      
      )
colnames(a) <- rownames(a)
                 
team1  <- c("autimatic","tarik", "Skadoodle","Stewie2k","RUSH")
team2 <- c("NiKo","olofmeister","karrigan","GuardiaN","rain")


dimnames(a) <- list(killer=rownames(a),victim=colnames(a))

jj <- c(
    2,3,4,6,10,   # team 1
    1,5,7,8,9     # team 2
)

a <- a[jj,jj]


jj <- as.matrix(expand.grid(1:5,1:5))
a[jj,jj] <- NA
a[jj+5,jj+5] <- NA
